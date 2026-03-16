#!/usr/bin/env python3
import argparse
import json
import math
import os
import re
import shutil
import subprocess
import sys
import unicodedata
from datetime import datetime, timezone
from itertools import combinations
from collections import defaultdict
from typing import List, Tuple


DEFAULT_STRENGTH_CAPTURE_PATH = (
    "information/original_API_requests/logs/2023_06_30_06_47_07_7/"
    "com.xyrality.goaltactics/TCP_51.116.154.224_re_443_lo_38888/sslCaptureData_0.txt"
)
DEFAULT_SQUAD_CAPTURE_PATH = DEFAULT_STRENGTH_CAPTURE_PATH
DEFAULT_MAIL_CAPTURE_PATH = (
    "information/original_API_requests/logs/2023_06_30_06_47_07_7/"
    "com.xyrality.goaltactics/TCP_51.116.154.224_re_443_lo_38768/sslCaptureData_0.txt"
)


def extract_response_json(raw: str) -> dict:
    marker = "Response Head:"
    marker_idx = raw.find(marker)
    if marker_idx == -1:
        raise ValueError("Could not find 'Response Head:' marker")

    body_idx = raw.find("Body:", marker_idx)
    if body_idx == -1:
        raise ValueError("Could not find response 'Body:' marker")

    start = raw.find("{", body_idx)
    if start == -1:
        raise ValueError("Could not find JSON start after response body marker")

    depth = 0
    in_str = False
    esc = False
    end = -1

    for i in range(start, len(raw)):
        ch = raw[i]
        if in_str:
            if esc:
                esc = False
            elif ch == "\\":
                esc = True
            elif ch == '"':
                in_str = False
            continue

        if ch == '"':
            in_str = True
        elif ch == "{":
            depth += 1
        elif ch == "}":
            depth -= 1
            if depth == 0:
                end = i + 1
                break

    if end == -1:
        raise ValueError("Could not determine JSON end in response body")

    return json.loads(raw[start:end])


def extract_response_body_text(raw: str) -> str:
    marker = "Response Head:"
    marker_idx = raw.find(marker)
    if marker_idx == -1:
        raise ValueError("Could not find 'Response Head:' marker")

    body_idx = raw.find("Body:", marker_idx)
    if body_idx == -1:
        raise ValueError("Could not find response 'Body:' marker")

    start = raw.find("{", body_idx)
    if start == -1:
        raise ValueError("Could not find JSON start after response body marker")

    return raw[start:]


def parse_partial_mail_objects(raw: str) -> Tuple[List[dict], bool]:
    body = extract_response_body_text(raw)
    anchor = body.find('"mails":[')
    if anchor == -1:
        return [], False

    arr = body[anchor + len('"mails":['):]
    dec = json.JSONDecoder()
    i = 0
    out = []
    truncated = False

    while i < len(arr):
        while i < len(arr) and arr[i] in " \r\n\t,":
            i += 1
        if i >= len(arr):
            break
        if arr[i] == "]":
            break

        try:
            obj, j = dec.raw_decode(arr, i)
        except json.JSONDecodeError:
            truncated = True
            break

        if isinstance(obj, dict):
            out.append(obj)
        i = j

    return out, truncated


def normalize_name(s: str) -> str:
    if not s:
        return ""
    s = unicodedata.normalize("NFKC", s)
    s = " ".join(s.split())
    return s.strip().lower()


def parse_training_rows_from_html(html: str) -> List[dict]:
    if not html:
        return []

    rows = []
    row_pattern = re.compile(r"<tr>(.*?)</tr>", re.IGNORECASE | re.DOTALL)
    cell_pattern = re.compile(r"<td[^>]*>(.*?)</td>", re.IGNORECASE | re.DOTALL)
    head_pattern = re.compile(r"([^<]+?)<br\s*/>\((Tor|Verteidigung|Mittelfeld|Angriff)\)", re.IGNORECASE)

    for rm in row_pattern.finditer(html):
        row_html = rm.group(1)
        cells = cell_pattern.findall(row_html)
        if len(cells) < 3:
            continue

        head_raw = cells[0]
        hm = head_pattern.search(head_raw)
        if not hm:
            continue

        player_name = " ".join(hm.group(1).split())
        position = hm.group(2).strip()
        skill_text = re.sub(r"<.*?>", "", cells[1]).strip()
        raw_value_text = re.sub(r"<.*?>", "", cells[2]).strip()

        gains = [float(g) for g in re.findall(r"([+-]\d+(?:\.\d+)?)", row_html)]
        trained_gain = gains[0] if gains else None
        strength_gain = gains[-1] if gains else None

        rows.append(
            {
                "player_name": player_name,
                "position": position,
                "trained_skill": skill_text,
                "raw_cell": raw_value_text,
                "gain": trained_gain,
                "trained_gain": trained_gain,
                "strength_gain": strength_gain,
            }
        )

    return rows


def build_training_overview(mail_capture_path: str, squad_players: List[dict]) -> dict:
    raw = open(mail_capture_path, "r", encoding="utf-8", errors="replace").read()
    mails, truncated = parse_partial_mail_objects(raw)

    # Keep financial mails out of the training detail section.
    training_mails = [m for m in mails if "trainingsreport" in str(m.get("subject", "")).lower()]

    squad_by_norm = {}
    for p in squad_players:
        nm = str(p.get("name") or "")
        if not nm:
            continue
        squad_by_norm[normalize_name(nm)] = p

    matched_names = set()
    unmatched_names = set()
    training_entries = []

    for m in training_mails:
        subject = str(m.get("subject", ""))
        date = str(m.get("date", ""))
        message = str(m.get("message", ""))
        rows = parse_training_rows_from_html(message)

        row_out = []
        for r in rows:
            nm = r["player_name"]
            norm = normalize_name(nm)
            matched_player = squad_by_norm.get(norm)
            if matched_player:
                matched_names.add(norm)
                row_out.append(
                    {
                        **r,
                        "matched": True,
                        "squad_name": matched_player.get("name"),
                        "squad_position": matched_player.get("position"),
                        "squad_id": matched_player.get("id"),
                    }
                )
            else:
                unmatched_names.add(nm)
                row_out.append({**r, "matched": False})

        training_entries.append(
            {
                "subject": subject,
                "date": date,
                "rows": row_out,
                "players_in_mail": sorted({r["player_name"] for r in row_out}),
            }
        )

    return {
        "mail_capture_path": mail_capture_path,
        "parsed_mail_count": len(mails),
        "is_truncated": truncated,
        "training_mail_count": len(training_mails),
        "training_entries": training_entries,
        "matched_unique_player_count": len(matched_names),
        "unmatched_unique_names": sorted(unmatched_names),
    }


def transpose(a: List[List[float]]) -> List[List[float]]:
    return list(map(list, zip(*a)))


def matmul(a: List[List[float]], b: List[List[float]]) -> List[List[float]]:
    rows = len(a)
    cols = len(b[0])
    mid = len(b)
    out = [[0.0 for _ in range(cols)] for _ in range(rows)]
    for i in range(rows):
        for k in range(mid):
            aik = a[i][k]
            for j in range(cols):
                out[i][j] += aik * b[k][j]
    return out


def solve_linear(a: List[List[float]], b: List[float]) -> List[float]:
    n = len(a)
    aug = [row[:] + [b[i]] for i, row in enumerate(a)]

    for col in range(n):
        pivot = col
        for r in range(col + 1, n):
            if abs(aug[r][col]) > abs(aug[pivot][col]):
                pivot = r
        if abs(aug[pivot][col]) < 1e-12:
            raise ValueError("Singular matrix while solving regression")

        aug[col], aug[pivot] = aug[pivot], aug[col]

        factor = aug[col][col]
        for c in range(col, n + 1):
            aug[col][c] /= factor

        for r in range(n):
            if r == col:
                continue
            f = aug[r][col]
            if abs(f) < 1e-18:
                continue
            for c in range(col, n + 1):
                aug[r][c] -= f * aug[col][c]

    return [aug[i][n] for i in range(n)]


def linear_regression(features: List[List[float]], y: List[float]) -> List[float]:
    # Add intercept
    x = [[1.0] + row for row in features]
    xt = transpose(x)
    xtx = matmul(xt, x)
    y_col = [[v] for v in y]
    xty_col = matmul(xt, y_col)
    xty = [r[0] for r in xty_col]
    return solve_linear(xtx, xty)


def predict(beta: List[float], feat: List[float]) -> float:
    return beta[0] + sum(beta[i + 1] * feat[i] for i in range(len(feat)))


def r2_score(y_true: List[float], y_pred: List[float]) -> float:
    mean_y = sum(y_true) / len(y_true)
    ss_tot = sum((v - mean_y) ** 2 for v in y_true)
    ss_res = sum((a - b) ** 2 for a, b in zip(y_true, y_pred))
    if ss_tot == 0:
        return 1.0
    return 1.0 - (ss_res / ss_tot)


def pearson(x: List[float], y: List[float]) -> float:
    mx = sum(x) / len(x)
    my = sum(y) / len(y)
    num = sum((a - mx) * (b - my) for a, b in zip(x, y))
    denx = math.sqrt(sum((a - mx) ** 2 for a in x))
    deny = math.sqrt(sum((b - my) ** 2 for b in y))
    if denx == 0 or deny == 0:
        return 0.0
    return num / (denx * deny)


def build_rows(players: List[dict]) -> Tuple[List[dict], List[float], List[dict]]:
    feats = []
    targets = []
    meta = []

    for p in players:
        skills = p.get("skills") or []
        if len(skills) < 14:
            continue

        main_idx = int(p.get("mainSkill", 0))
        if not (0 <= main_idx < len(skills)):
            continue

        # User rule: from the position-specific slots 0..3, only each player's own main skill counts.
        main_skill = float(skills[main_idx])
        off_position_sum = sum(float(skills[i]) for i in range(0, 4) if i != main_idx)

        raw_bonus = p.get("bonusSkills") or []
        bonus_ids = []
        seen = set()
        for i in raw_bonus:
            if not isinstance(i, (int, float)):
                continue
            idx = int(i)
            if idx < 0 or idx >= len(skills):
                continue
            if idx == main_idx:
                continue
            if idx in seen:
                continue
            seen.add(idx)
            bonus_ids.append(idx)

        bonus_vals = [float(skills[i]) for i in bonus_ids]
        bonus_avg = sum(bonus_vals) / len(bonus_vals) if bonus_vals else 0.0
        bonus_sum = sum(bonus_vals)

        # Keep only true sub-skills 4..13 for the "other" bucket.
        non_bonus_sub = [i for i in range(4, len(skills)) if i not in set(bonus_ids)]
        if main_idx in non_bonus_sub:
            non_bonus_sub.remove(main_idx)
        sub_other_avg = sum(float(skills[i]) for i in non_bonus_sub) / len(non_bonus_sub) if non_bonus_sub else 0.0

        exp = float(p.get("experience", 0.0))
        fit_raw = float(p.get("fitness", 0.0))
        fit_pct = fit_raw / 100.0
        age = float(p.get("age", 0.0))
        talent = float(p.get("talent", 0.0))
        feats.append(
            {
                "main": main_skill,
                "bonus_avg": bonus_avg,
                "bonus_sum": bonus_sum,
                "sub_other_avg": sub_other_avg,
                "exp": exp,
                "fit_raw": fit_raw,
                "fit_pct": fit_pct,
                "age": age,
                "talent": talent,
                "sum_core": main_skill + bonus_avg + sub_other_avg + exp,
                "sum_core_noexp": main_skill + bonus_avg + sub_other_avg,
                "main_x_bonus": main_skill * bonus_avg,
                "main_x_bonus_sum": main_skill * bonus_sum,
                "exp_x_fitpct": exp * fit_pct,
                "main_x_exp": main_skill * exp,
                "bonus_sum_x_exp": bonus_sum * exp,
                "main_x_fitpct": main_skill * fit_pct,
                "bonus_sum_x_fitpct": bonus_sum * fit_pct,
                "fit_x_main": fit_pct * main_skill,
                "fit_x_bonus_avg": fit_pct * bonus_avg,
                "fit_x_bonus_sum": fit_pct * bonus_sum,
                "fit_x_sub_other_avg": fit_pct * sub_other_avg,
                "fit_x_exp": fit_pct * exp,
                "fit_x_age": fit_pct * age,
                "fit_x_talent": fit_pct * talent,
                "fit_x_sum_core": fit_pct * (main_skill + bonus_avg + sub_other_avg + exp),
                "fit_x_sum_core_noexp": fit_pct * (main_skill + bonus_avg + sub_other_avg),
                "main_over_bonus1": main_skill / (1.0 + bonus_sum),
                "bonus_over_main1": bonus_sum / (1.0 + main_skill),
                "off_position_sum": off_position_sum,
            }
        )
        targets.append(float(p.get("strength", 0.0)))
        meta.append(
            {
                "main_idx": main_idx,
                "bonus_count": len(bonus_ids),
                "position": int(p.get("position", -1)),
                "name": str(p.get("name") or ""),
            }
        )

    return feats, targets, meta


def by_position(players: List[dict]) -> dict:
    grouped = defaultdict(list)
    for p in players:
        grouped[int(p.get("position", -1))].append(p)
    return grouped


def evaluate_model(feat_rows: List[dict], y: List[float], cols: List[str]):
    x = [[row[c] for c in cols] for row in feat_rows]
    beta = linear_regression(x, y)
    preds = [predict(beta, row) for row in x]
    r2 = r2_score(y, preds)
    n = len(y)
    p = len(cols)
    adj_r2 = 1.0 - (1.0 - r2) * (n - 1) / max(1, (n - p - 1))
    return beta, r2, adj_r2


def predict_no_intercept(beta: List[float], feat: List[float]) -> float:
    return sum(beta[i] * feat[i] for i in range(len(feat)))


def fit_nonnegative_no_intercept(features: List[List[float]], y: List[float], max_iter: int = 6000) -> List[float]:
    n = len(features)
    if n == 0:
        return []
    p = len(features[0])
    if p == 0:
        return []

    scales = []
    xn = [[0.0 for _ in range(p)] for _ in range(n)]
    for j in range(p):
        col_sq = sum(features[i][j] * features[i][j] for i in range(n))
        s = math.sqrt(col_sq / n) if col_sq > 0 else 1.0
        if s < 1e-12:
            s = 1.0
        scales.append(s)
        for i in range(n):
            xn[i][j] = features[i][j] / s

    xt = transpose(xn)
    xtx = matmul(xt, xn)
    xty = [sum(xt[j][i] * y[i] for i in range(n)) for j in range(p)]

    beta = [0.0 for _ in range(p)]

    # Upper-bound Lipschitz constant via infinity norm of Hessian.
    h_rowsum = 0.0
    for r in xtx:
        h_rowsum = max(h_rowsum, sum(abs(v) for v in r))
    lr = 1.0 / (2.0 * h_rowsum / max(1.0, n) + 1e-12)

    for _ in range(max_iter):
        grad = [0.0 for _ in range(p)]
        for j in range(p):
            dot = 0.0
            row = xtx[j]
            for k in range(p):
                dot += row[k] * beta[k]
            grad[j] = (2.0 / n) * (dot - xty[j])

        max_change = 0.0
        for j in range(p):
            new_b = beta[j] - lr * grad[j]
            if new_b < 0.0:
                new_b = 0.0
            max_change = max(max_change, abs(new_b - beta[j]))
            beta[j] = new_b

        if max_change < 1e-10:
            break

    return [beta[j] / scales[j] for j in range(p)]


def evaluate_model_nonnegative_no_intercept(feat_rows: List[dict], y: List[float], cols: List[str]):
    x = [[row[c] for c in cols] for row in feat_rows]
    beta = fit_nonnegative_no_intercept(x, y)
    preds = [predict_no_intercept(beta, row) for row in x]
    r2 = r2_score(y, preds)
    mae = sum(abs(a - b) for a, b in zip(y, preds)) / len(y)
    n = len(y)
    p = len(cols)
    adj_r2 = 1.0 - (1.0 - r2) * (n - 1) / max(1, (n - p))
    return beta, r2, adj_r2, mae


def format_formula_no_intercept(cols: List[str], beta: List[float]) -> str:
    parts = []
    for i, c in enumerate(cols):
        parts.append(f"({beta[i]:.4f} * {c})")
    return "strength ≈ " + " + ".join(parts)


def summarize_player_gain_latest_report(training_overview: dict) -> dict:
    entries = training_overview.get("training_entries") or []
    if not entries:
        return {}

    latest = sorted(entries, key=lambda e: e.get("date") or "", reverse=True)[0]
    per_player = defaultdict(list)
    for row in latest.get("rows") or []:
        if not row.get("matched"):
            continue
        sg = row.get("strength_gain")
        name = str(row.get("squad_name") or row.get("player_name") or "")
        if not name or sg is None:
            continue
        per_player[normalize_name(name)].append(float(sg))

    out = {}
    for k, vals in per_player.items():
        if vals:
            out[k] = sum(vals) / len(vals)
    return out


def compute_gain_validation_corr(feat_rows: List[dict], meta: List[dict], cols: List[str], beta: List[float], gain_by_player: dict) -> Tuple[float, int]:
    pred = []
    obs = []
    for row, m in zip(feat_rows, meta):
        nrm = normalize_name(str(m.get("name") or ""))
        if nrm not in gain_by_player:
            continue
        x = [row[c] for c in cols]
        pred.append(predict_no_intercept(beta, x))
        obs.append(gain_by_player[nrm])

    if len(pred) < 3:
        return 0.0, len(pred)
    return pearson(pred, obs), len(pred)


def format_formula(cols: List[str], beta: List[float]) -> str:
    parts = [f"{beta[0]:.4f}"]
    for i, c in enumerate(cols, start=1):
        parts.append(f"({beta[i]:+.4f} * {c})")
    return "strength ≈ " + " ".join(parts)


def latex_escape(s: str) -> str:
    repl = {
        "\\": r"\textbackslash{}",
        "_": r"\_",
        "{": r"\{",
        "}": r"\}",
        "%": r"\%",
        "&": r"\&",
        "#": r"\#",
        "$": r"\$",
    }
    out = []
    for ch in s:
        out.append(repl.get(ch, ch))
    return "".join(out)


def latex_var_name(name: str) -> str:
    mapping = {
        "main": "main",
        "bonus_avg": "bonus_{avg}",
        "bonus_sum": "bonus_{sum}",
        "sub_other_avg": "sub_{other,avg}",
        "exp": "exp",
        "fit_raw": "fit_{raw}",
        "fit_pct": "fit_{pct}",
        "age": "age",
        "talent": "talent",
        "main_x_bonus": "main\\cdot bonus_{avg}",
        "main_x_bonus_sum": "main\\cdot bonus_{sum}",
        "exp_x_fitpct": "exp\\cdot fit_{pct}",
        "main_x_exp": "main\\cdot exp",
        "bonus_sum_x_exp": "bonus_{sum}\\cdot exp",
        "main_x_fitpct": "main\\cdot fit_{pct}",
        "bonus_sum_x_fitpct": "bonus_{sum}\\cdot fit_{pct}",
        "fit_x_main": "fit_{pct}\\cdot main",
        "fit_x_bonus_avg": "fit_{pct}\\cdot bonus_{avg}",
        "fit_x_bonus_sum": "fit_{pct}\\cdot bonus_{sum}",
        "fit_x_sub_other_avg": "fit_{pct}\\cdot sub_{other,avg}",
        "fit_x_exp": "fit_{pct}\\cdot exp",
        "fit_x_age": "fit_{pct}\\cdot age",
        "fit_x_talent": "fit_{pct}\\cdot talent",
        "sum_core": "main+bonus_{avg}+sub_{other,avg}+exp",
        "sum_core_noexp": "main+bonus_{avg}+sub_{other,avg}",
        "fit_x_sum_core": "fit_{pct}\\cdot(main+bonus_{avg}+sub_{other,avg}+exp)",
        "fit_x_sum_core_noexp": "fit_{pct}\\cdot(main+bonus_{avg}+sub_{other,avg})",
        "main_over_bonus1": "\\frac{main}{1+bonus_{sum}}",
        "bonus_over_main1": "\\frac{bonus_{sum}}{1+main}",
        "off_position_sum": "off_{position,sum}",
    }
    return mapping.get(name, latex_escape(name))


def to_latex_formula(cols: List[str], beta: List[float]) -> str:
    terms = [f"{beta[0]:.4f}"]
    for i, c in enumerate(cols, start=1):
        sign = "+" if beta[i] >= 0 else "-"
        terms.append(f" {sign} {abs(beta[i]):.4f}\\,{latex_var_name(c)}")
    return r"\hat{strength} = " + "".join(terms)


def to_latex_formula_no_intercept(cols: List[str], beta: List[float]) -> str:
    terms = []
    for i, c in enumerate(cols):
        terms.append(f"{beta[i]:.4f}\\,{latex_var_name(c)}")
    return r"\hat{strength} = " + " + ".join(terms)


def write_latex_report(path: str, capture_path: str, players_count: int, results: List[Tuple[float, float, List[str], List[float]]], corr_rows, per_skill, position_rankings, aggregate, human_results=None, training_overview=None) -> None:
    ts = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M:%S UTC")

    top_overall = results[:8]
    aggregate_top = aggregate[:5]

    lines = []
    lines.append(r"\documentclass[a4paper,11pt]{article}")
    lines.append(r"\usepackage[utf8]{inputenc}")
    lines.append(r"\usepackage[T1]{fontenc}")
    lines.append(r"\usepackage{geometry}")
    lines.append(r"\usepackage{booktabs}")
    lines.append(r"\usepackage{longtable}")
    lines.append(r"\usepackage{amsmath}")
    lines.append(r"\usepackage{amssymb}")
    lines.append(r"\usepackage{array}")
    lines.append(r"\geometry{margin=1in}")
    lines.append(r"\begin{document}")
    lines.append(r"\title{GoalTactics Strength Formula Reverse Engineering Report}")
    lines.append(r"\author{analyze\_strength\_formula.py}")
    lines.append(r"\date{" + latex_escape(ts) + "}")
    lines.append(r"\maketitle")

    lines.append(r"\section*{Input and Scope}")
    lines.append(r"\begin{itemize}")
    lines.append(r"\item Capture file: \texttt{" + latex_escape(capture_path) + "}")
    lines.append(r"\item Players analyzed: " + str(players_count))
    lines.append(r"\item Constraints: only own \texttt{mainSkill} from slots 0..3; age and talent excluded.")
    lines.append(r"\item Model family: ordinary least squares on engineered linear and interaction terms.")
    lines.append(r"\end{itemize}")

    lines.append(r"\section*{How Formulas Are Obtained}")
    lines.append(r"For each candidate feature set, the script builds a design matrix $X$ and solves the normal equation")
    lines.append(r"$$\beta = (X^T X)^{-1} X^T y$$")
    lines.append(r"with Gaussian elimination on $X^TX$. Predictions are $\hat{y}=X\beta$. Models are ranked by adjusted $R^2$ (primary) and $R^2$ (secondary).")
    lines.append(r"Per-position ranking uses compact models (max 4 columns) to reduce overfitting and then aggregates ranks across positions.")

    lines.append(r"\section*{Top Overall Candidate Models}")
    lines.append(r"\begin{longtable}{p{0.05\linewidth}p{0.12\linewidth}p{0.12\linewidth}p{0.66\linewidth}}")
    lines.append(r"\toprule")
    lines.append(r"\# & adj.$R^2$ & $R^2$ & Formula \\")
    lines.append(r"\midrule")
    lines.append(r"\endhead")
    for idx, (adj_r2, r2, cols, beta) in enumerate(top_overall, start=1):
        lines.append(f"{idx} & {adj_r2:.6f} & {r2:.6f} & $" + to_latex_formula(cols, beta) + r"$ \\")
    lines.append(r"\bottomrule")
    lines.append(r"\end{longtable}")

    lines.append(r"\section*{Cross-Position Overall Ranking}")
    if aggregate_top:
        lines.append(r"\begin{longtable}{p{0.05\linewidth}p{0.20\linewidth}p{0.20\linewidth}p{0.55\linewidth}}")
        lines.append(r"\toprule")
        lines.append(r"\# & Avg position rank & Avg $R^2$ & Formula \\")
        lines.append(r"\midrule")
        lines.append(r"\endhead")
        for i, (avg_rank, neg_avg_r2, cols, beta) in enumerate(aggregate_top, start=1):
            lines.append(f"{i} & {avg_rank:.3f} & {-neg_avg_r2:.6f} & $" + to_latex_formula(cols, beta) + r"$ \\")
        lines.append(r"\bottomrule")
        lines.append(r"\end{longtable}")
    else:
        lines.append(r"No fully cross-position compact model met the coverage rule.")

    if human_results:
        lines.append(r"\section*{Human-Readable Constrained Models}")
        lines.append(r"Constraints: no intercept ($0$ baseline) and all coefficients constrained to be non-negative.")
        lines.append(r"\begin{longtable}{p{0.05\linewidth}p{0.12\linewidth}p{0.12\linewidth}p{0.12\linewidth}p{0.12\linewidth}p{0.40\linewidth}}")
        lines.append(r"\toprule")
        lines.append(r"\# & adj.$R^2$ & $R^2$ & MAE & gain-corr & Formula \\")
        lines.append(r"\midrule")
        lines.append(r"\endhead")
        for idx, h in enumerate(human_results[:8], start=1):
            lines.append(
                f"{idx} & {h['adj_r2']:.6f} & {h['r2']:.6f} & {h['mae']:.4f} & {h['gain_corr']:.4f} & $"
                + to_latex_formula_no_intercept(h["cols"], h["beta"]) + r"$ \\")
        lines.append(r"\bottomrule")
        lines.append(r"\end{longtable}")

    lines.append(r"\section*{Top Correlated Features}")
    lines.append(r"\begin{longtable}{p{0.45\linewidth}p{0.45\linewidth}}")
    lines.append(r"\toprule")
    lines.append(r"Feature & Pearson corr. with strength \\")
    lines.append(r"\midrule")
    lines.append(r"\endhead")
    for name, c in corr_rows[:12]:
        lines.append(latex_escape(name) + f" & {c:.6f} \\")
    lines.append(r"\bottomrule")
    lines.append(r"\end{longtable}")

    lines.append(r"\section*{Top Individual Skill Correlations}")
    lines.append(r"\begin{longtable}{p{0.45\linewidth}p{0.45\linewidth}}")
    lines.append(r"\toprule")
    lines.append(r"Skill index & Pearson corr. with strength \\")
    lines.append(r"\midrule")
    lines.append(r"\endhead")
    for idx, c in per_skill[:10]:
        lines.append(f"skill[{idx}] & {c:.6f} \\")
    lines.append(r"\bottomrule")
    lines.append(r"\end{longtable}")

    if training_overview is not None:
        lines.append(r"\section*{Training Reports Overview (Mail Capture)}")
        lines.append(r"\begin{itemize}")
        lines.append(r"\item Mail capture: \texttt{" + latex_escape(training_overview["mail_capture_path"]) + "}")
        lines.append(r"\item Parsed complete mails: " + str(training_overview["parsed_mail_count"]))
        lines.append(r"\item Parsed training mails: " + str(training_overview["training_mail_count"]))
        lines.append(r"\item Capture truncated at end: " + ("yes" if training_overview["is_truncated"] else "no"))
        lines.append(r"\item Unique matched player names: " + str(training_overview["matched_unique_player_count"]))
        lines.append(r"\item Unique unmatched names: " + str(len(training_overview["unmatched_unique_names"])))
        lines.append(r"\end{itemize}")

        if training_overview["unmatched_unique_names"]:
            lines.append(r"\textbf{Unmatched names (sample):} " + latex_escape(", ".join(training_overview["unmatched_unique_names"][:20])))

        lines.append(r"\subsection*{Per-Report Player Match Snapshot}")
        lines.append(r"\begin{longtable}{p{0.40\linewidth}p{0.17\linewidth}p{0.18\linewidth}p{0.18\linewidth}}")
        lines.append(r"\toprule")
        lines.append(r"Report & Parsed rows & Matched rows & Unique players \\")
        lines.append(r"\midrule")
        lines.append(r"\endhead")
        for e in training_overview["training_entries"]:
            total_rows = len(e["rows"])
            matched_rows = sum(1 for r in e["rows"] if r.get("matched"))
            unique_players = len(e["players_in_mail"])
            lines.append(
                latex_escape(e["subject"]) +
                f" & {total_rows} & {matched_rows} & {unique_players} \\")
        lines.append(r"\bottomrule")
        lines.append(r"\end{longtable}")

    lines.append(r"\section*{Notes}")
    lines.append(r"High in-sample $R^2$ does not guarantee out-of-sample generalization. Use this report as reverse-engineering evidence for this capture distribution, then validate on additional captures.")
    lines.append(r"\end{document}")

    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")


def compile_pdf_from_latex(tex_path: str, pdf_path: str) -> Tuple[bool, str]:
    pdflatex = shutil.which("pdflatex")
    work_dir = os.path.dirname(os.path.abspath(tex_path))
    tex_name = os.path.basename(tex_path)
    produced_pdf = os.path.join(work_dir, os.path.splitext(tex_name)[0] + ".pdf")

    if pdflatex:
        cmd = [pdflatex, "-interaction=nonstopmode", "-halt-on-error", tex_name]
        for _ in range(2):
            proc = subprocess.run(cmd, cwd=work_dir, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
            if proc.returncode != 0:
                return False, proc.stdout[-4000:]
    else:
        tectonic = shutil.which("tectonic")
        if not tectonic:
            return False, "No TeX engine found (install pdflatex or tectonic)"
        cmd = [tectonic, tex_name, "--outdir", work_dir]
        proc = subprocess.run(cmd, cwd=work_dir, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        if proc.returncode != 0:
            return False, proc.stdout[-4000:]
    if not os.path.exists(produced_pdf):
        return False, "pdflatex reported success but no PDF was produced"

    if os.path.abspath(produced_pdf) != os.path.abspath(pdf_path):
        shutil.copyfile(produced_pdf, pdf_path)

    return True, "ok"


def run(path: str, squad_capture_path: str = None, mail_capture_path: str = None, latex_out: str = None, pdf_out: str = None) -> None:
    raw = open(path, "r", encoding="utf-8", errors="replace").read()
    payload = extract_response_json(raw)
    players = payload.get("players") or []

    if squad_capture_path:
        squad_raw = open(squad_capture_path, "r", encoding="utf-8", errors="replace").read()
        squad_payload = extract_response_json(squad_raw)
        squad_players = squad_payload.get("players") or []
    else:
        squad_players = players

    feat_rows, y, meta = build_rows(players)
    if len(feat_rows) < 10:
        raise RuntimeError(f"Not enough players parsed: {len(feat_rows)}")

    print("=== Strength Formula Reverse Engineering (No age/talent) ===")
    print(f"players_analyzed={len(feat_rows)}")

    base_terms = ["bonus_sum", "bonus_avg", "sub_other_avg", "exp"]
    fit_terms = ["fit_raw", "fit_pct", "exp_x_fitpct"]
    interaction_terms = [
        "main_x_bonus",
        "main_x_bonus_sum",
        "main_x_exp",
        "bonus_sum_x_exp",
        "main_x_fitpct",
        "bonus_sum_x_fitpct",
        "main_over_bonus1",
        "bonus_over_main1",
    ]

    candidate_models = set()
    for fit in fit_terms:
        for base_k in range(1, min(4, len(base_terms)) + 1):
            for base_pick in combinations(base_terms, base_k):
                core = ["main", fit] + list(base_pick)
                candidate_models.add(tuple(core))
                for inter_k in range(1, 3):
                    for inter_pick in combinations(interaction_terms, inter_k):
                        cols = tuple(core + list(inter_pick))
                        if len(cols) <= 7:
                            candidate_models.add(cols)

    results = []
    for cols in sorted(candidate_models):
        try:
            beta, r2, adj_r2 = evaluate_model(feat_rows, y, list(cols))
            results.append((adj_r2, r2, list(cols), beta))
        except ValueError:
            continue

    if not results:
        raise RuntimeError("No candidate model could be solved")

    results.sort(key=lambda t: (t[0], t[1], -len(t[2])), reverse=True)

    print()
    print("Top overall candidate models:")
    for idx, (adj_r2, r2, cols, beta) in enumerate(results[:8], start=1):
        print(f"[{idx}] adj_r2={adj_r2:.6f} r2={r2:.6f} cols={cols}")
        print(f"    {format_formula(cols, beta)}")

    best_adj_r2, best_r2, best_cols, best_beta = results[0]

    print()
    print("Best model summary:")
    print(f"adj_r2={best_adj_r2:.6f} r2={best_r2:.6f}")
    print(f"strength ≈ {best_beta[0]:.4f} + Σ(coeff_i * feature_i)")

    print()
    print("Pearson correlations vs strength (mainSkill-aware features):")
    corr_keys = [
        "main",
        "bonus_sum",
        "bonus_avg",
        "sub_other_avg",
        "exp",
        "fit_raw",
        "fit_pct",
        "exp_x_fitpct",
        "main_x_bonus",
        "main_x_bonus_sum",
        "main_x_exp",
        "off_position_sum",
    ]
    corr_rows = []
    for k in corr_keys:
        vals = [row[k] for row in feat_rows]
        corr_rows.append((k, pearson(vals, y)))
    corr_rows.sort(key=lambda t: abs(t[1]), reverse=True)
    for n, c in corr_rows:
        print(f"{n:20s} corr = {c: .6f}")

    print()
    print("Individual skill index correlations vs strength:")
    per_skill = []
    for skill_idx in range(14):
        vals = [float(p.get("skills", [0.0] * 14)[skill_idx]) for p in players if len(p.get("skills", [])) >= 14]
        if len(vals) != len(y):
            continue
        per_skill.append((skill_idx, pearson(vals, y)))
    per_skill.sort(key=lambda t: abs(t[1]), reverse=True)
    for idx, c in per_skill:
        print(f"skill[{idx:>2d}] corr = {c: .6f}")

    print()
    print("By-position top formulas (complexity-limited to reduce overfit):")
    position_rankings = {}
    for pos, plist in sorted(by_position(players).items()):
        if len(plist) < 6:
            continue
        pf, py, _ = build_rows(plist)
        pos_results = []
        for _, _, cols, _ in results:
            # Small per-position sample sizes -> keep formulas compact.
            if len(cols) > 4:
                continue
            # Enforce that a bonus-signal term is present.
            if not any(c in cols for c in ["bonus_sum", "bonus_avg", "main_x_bonus", "main_x_bonus_sum", "bonus_sum_x_exp", "bonus_sum_x_fitpct"]):
                continue
            try:
                pb, pr2, padj = evaluate_model(pf, py, cols)
                pos_results.append((padj, pr2, cols, pb))
            except ValueError:
                continue

        if not pos_results:
            print(f"position={pos:>2d} n={len(plist):>3d} model=unresolved")
            continue

        pos_results.sort(key=lambda t: (t[0], t[1], -len(t[2])), reverse=True)
        position_rankings[pos] = pos_results
        print(f"position={pos:>2d} n={len(plist):>3d}")
        for rank, (padj, pr2, cols, pb) in enumerate(pos_results[:3], start=1):
            print(f"  #{rank} adj_r2={padj:.6f} r2={pr2:.6f} cols={cols}")
            print(f"     {format_formula(cols, pb)}")

    print()
    print("Overall ranking from per-position ranks:")
    aggregate = []
    for _, _, cols, beta in results:
        if len(cols) > 4:
            continue
        rank_sum = 0
        count = 0
        r2_sum = 0.0
        for pos, pos_results in position_rankings.items():
            for idx, (_, _, pcols, _) in enumerate(pos_results, start=1):
                if pcols == cols:
                    rank_sum += idx
                    count += 1
                    # capture actual position model quality for tie-breaks
                    r2_sum += pos_results[idx - 1][1]
                    break
        # require coverage across all ranked positions
        if count == len(position_rankings) and count > 0:
            aggregate.append((rank_sum / count, -(r2_sum / count), cols, beta))

    aggregate.sort(key=lambda t: (t[0], t[1], len(t[2])))
    for i, (avg_rank, neg_count, cols, beta) in enumerate(aggregate[:5], start=1):
        print(f"[{i}] avg_position_rank={avg_rank:.3f} avg_r2={-neg_count:.6f} cols={cols}")
        print(f"    {format_formula(cols, beta)}")

    print()
    print("Interpretation hints:")
    print("- Only each player's own mainSkill is included from slots 0..3.")
    print("- Age and talent are excluded from all tested formulas.")
    print("- Bonus skills (excluding mainSkill) are emphasized via bonus_sum and interaction terms.")
    print("- Fitness is tested as raw value, percent, and combined with experience.")

    training_overview = None
    if mail_capture_path:
        try:
            training_overview = build_training_overview(mail_capture_path, squad_players)
            print()
            print("Training mail overview:")
            print(f"mail_capture={mail_capture_path}")
            print(f"parsed_complete_mails={training_overview['parsed_mail_count']}")
            print(f"training_mails={training_overview['training_mail_count']}")
            print(f"capture_truncated={training_overview['is_truncated']}")
            print(f"unique_matched_player_names={training_overview['matched_unique_player_count']}")
            print(f"unique_unmatched_names={len(training_overview['unmatched_unique_names'])}")
            if training_overview["unmatched_unique_names"]:
                sample = training_overview["unmatched_unique_names"][:10]
                print(f"unmatched_sample={sample}")
        except Exception as ex:
            print()
            print(f"Training mail overview skipped due to parse error: {ex}")

    print()
    print("Human-readable constrained formulas (no intercept, non-negative coefficients):")
    human_models = []

    # Additive family (simple and interpretable), optionally with age/talent.
    additive_core = ["main", "bonus_avg", "sub_other_avg", "exp"]
    opt = ["fit_pct", "age", "talent"]
    for k in range(0, 3):
        for pick in combinations(opt, k):
            human_models.append(tuple(additive_core + list(pick)))

    # Fitness-as-factor family: fitness scales the additive terms.
    fit_scaled_core = ["fit_x_main", "fit_x_bonus_avg", "fit_x_sub_other_avg", "fit_x_exp"]
    human_models.append(tuple(fit_scaled_core))
    human_models.append(tuple(fit_scaled_core + ["fit_x_age"]))
    human_models.append(tuple(fit_scaled_core + ["fit_x_talent"]))
    human_models.append(tuple(fit_scaled_core + ["fit_x_age", "fit_x_talent"]))
    human_models.append(tuple(fit_scaled_core + ["bonus_avg"]))
    human_models.append(tuple(fit_scaled_core + ["bonus_sum"]))

    # Explicit "fitness times sum" families for human-style formulas.
    human_models.append(("fit_x_sum_core",))
    human_models.append(("fit_x_sum_core", "main"))
    human_models.append(("fit_x_sum_core", "bonus_avg"))
    human_models.append(("fit_x_sum_core", "sub_other_avg"))
    human_models.append(("fit_x_sum_core", "main", "bonus_avg", "sub_other_avg"))
    human_models.append(("fit_x_sum_core_noexp", "exp"))
    human_models.append(("fit_x_sum_core_noexp", "main", "exp"))
    human_models.append(("fit_x_sum_core", "age"))
    human_models.append(("fit_x_sum_core", "talent"))

    # Hybrid family that still keeps positive additive semantics.
    human_models.append(("main", "bonus_avg", "sub_other_avg", "exp_x_fitpct"))
    human_models.append(("main", "bonus_sum", "sub_other_avg", "exp_x_fitpct"))
    human_models.append(("fit_x_main", "fit_x_bonus_avg", "fit_x_sub_other_avg", "exp"))

    human_models = sorted(set(human_models), key=lambda c: (len(c), c))

    gain_by_player = {}
    if training_overview is not None:
        gain_by_player = summarize_player_gain_latest_report(training_overview)

    human_results = []
    for cols in human_models:
        try:
            beta, r2, adj_r2, mae = evaluate_model_nonnegative_no_intercept(feat_rows, y, list(cols))
        except ValueError:
            continue

        if any(b < -1e-9 for b in beta):
            continue

        gain_corr, gain_n = compute_gain_validation_corr(feat_rows, meta, list(cols), beta, gain_by_player)
        score = adj_r2 + 0.10 * max(0.0, gain_corr)
        human_results.append(
            {
                "score": score,
                "adj_r2": adj_r2,
                "r2": r2,
                "mae": mae,
                "gain_corr": gain_corr,
                "gain_n": gain_n,
                "cols": list(cols),
                "beta": beta,
            }
        )

    human_results.sort(key=lambda h: (h["score"], h["adj_r2"], h["gain_corr"], -len(h["cols"])), reverse=True)

    if human_results:
        print("Top constrained models:")
        for i, h in enumerate(human_results[:8], start=1):
            print(
                f"[{i}] adj_r2={h['adj_r2']:.6f} r2={h['r2']:.6f} mae={h['mae']:.4f} "
                f"gain_corr={h['gain_corr']:.4f} gain_n={h['gain_n']} cols={h['cols']}"
            )
            print(f"    {format_formula_no_intercept(h['cols'], h['beta'])}")

        # Prefer compact and sensible formulas; age/talent only if they truly help.
        best = min(
            human_results[:12],
            key=lambda h: (
                0 if ("age" not in h["cols"] and "talent" not in h["cols"] and "fit_x_age" not in h["cols"] and "fit_x_talent" not in h["cols"]) else 1,
                len(h["cols"]),
                -h["adj_r2"],
            ),
        )
        print()
        print("Recommended constrained formula (human-readable):")
        print(
            f"adj_r2={best['adj_r2']:.6f} r2={best['r2']:.6f} mae={best['mae']:.4f} "
            f"gain_corr={best['gain_corr']:.4f} gain_n={best['gain_n']}"
        )
        print(f"    {format_formula_no_intercept(best['cols'], best['beta'])}")
    else:
        print("No constrained model converged.")

    if latex_out is None:
        base = os.path.splitext(os.path.basename(path))[0]
        latex_out = os.path.abspath(base + "_strength_report.tex")
    if pdf_out is None:
        pdf_out = os.path.abspath(os.path.splitext(latex_out)[0] + ".pdf")

    write_latex_report(
        latex_out,
        capture_path=path,
        players_count=len(feat_rows),
        results=results,
        corr_rows=corr_rows,
        per_skill=per_skill,
        position_rankings=position_rankings,
        aggregate=aggregate,
        human_results=human_results,
        training_overview=training_overview,
    )
    print()
    print(f"LaTeX report written: {latex_out}")

    ok, msg = compile_pdf_from_latex(latex_out, pdf_out)
    if ok:
        print(f"PDF report written: {pdf_out}")
    else:
        print(f"PDF generation skipped/failed: {msg}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Reverse engineer GoalTactics strength formulas from capture data.")
    parser.add_argument("capture", nargs="?", default=DEFAULT_STRENGTH_CAPTURE_PATH, help="Path to strength/squad capture (default: script constant)")
    parser.add_argument("--squad-capture", dest="squad_capture", default=DEFAULT_SQUAD_CAPTURE_PATH, help="Path to squad capture for player-name matching (default: script constant)")
    parser.add_argument("--mail-capture", dest="mail_capture", default=DEFAULT_MAIL_CAPTURE_PATH, help="Path to GetMyMail capture with training reports (default: script constant)")
    parser.add_argument("--latex-out", dest="latex_out", default=None, help="Path to .tex output (default: <capture_basename>_strength_report.tex in cwd)")
    parser.add_argument("--pdf-out", dest="pdf_out", default=None, help="Path to .pdf output (default: same basename as latex output)")
    args = parser.parse_args()

    run(args.capture, squad_capture_path=args.squad_capture, mail_capture_path=args.mail_capture, latex_out=args.latex_out, pdf_out=args.pdf_out)
