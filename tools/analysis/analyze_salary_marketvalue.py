#!/usr/bin/env python3
import json
import math
import sys
from typing import List


def extract_response_json(raw: str) -> dict:
    marker_idx = raw.find("Response Head:")
    if marker_idx == -1:
        raise ValueError("Response Head marker not found")

    body_idx = raw.find("Body:", marker_idx)
    if body_idx == -1:
        raise ValueError("Response body marker not found")

    start = raw.find("{", body_idx)
    if start == -1:
        raise ValueError("JSON start not found")

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
        raise ValueError("JSON end not found")

    return json.loads(raw[start:end])


def transpose(a: List[List[float]]) -> List[List[float]]:
    return list(map(list, zip(*a)))


def matmul(a: List[List[float]], b: List[List[float]]) -> List[List[float]]:
    out = [[0.0 for _ in range(len(b[0]))] for _ in range(len(a))]
    for i in range(len(a)):
        for k in range(len(b)):
            for j in range(len(b[0])):
                out[i][j] += a[i][k] * b[k][j]
    return out


def solve_linear(a: List[List[float]], b: List[float]) -> List[float]:
    n = len(a)
    aug = [row[:] + [b[i]] for i, row in enumerate(a)]
    for c in range(n):
        piv = c
        for r in range(c + 1, n):
            if abs(aug[r][c]) > abs(aug[piv][c]):
                piv = r
        if abs(aug[piv][c]) < 1e-12:
            raise ValueError("Singular matrix")
        aug[c], aug[piv] = aug[piv], aug[c]

        div = aug[c][c]
        for k in range(c, n + 1):
            aug[c][k] /= div

        for r in range(n):
            if r == c:
                continue
            factor = aug[r][c]
            if abs(factor) < 1e-18:
                continue
            for k in range(c, n + 1):
                aug[r][k] -= factor * aug[c][k]

    return [aug[i][n] for i in range(n)]


def fit_linear(features: List[List[float]], y: List[float]) -> List[float]:
    x = [[1.0] + row for row in features]
    xt = transpose(x)
    xtx = matmul(xt, x)
    y_col = [[v] for v in y]
    xty = [row[0] for row in matmul(xt, y_col)]
    return solve_linear(xtx, xty)


def predict(beta: List[float], x: List[float]) -> float:
    return beta[0] + sum(beta[i + 1] * x[i] for i in range(len(x)))


def r2(y_true: List[float], y_pred: List[float]) -> float:
    m = sum(y_true) / len(y_true)
    ss_tot = sum((v - m) ** 2 for v in y_true)
    ss_res = sum((a - b) ** 2 for a, b in zip(y_true, y_pred))
    return 1.0 - ss_res / ss_tot if ss_tot else 1.0


def corr(x: List[float], y: List[float]) -> float:
    mx = sum(x) / len(x)
    my = sum(y) / len(y)
    num = sum((a - mx) * (b - my) for a, b in zip(x, y))
    den = math.sqrt(sum((a - mx) ** 2 for a in x) * sum((b - my) ** 2 for b in y))
    return num / den if den else 0.0


def run(path: str) -> None:
    raw = open(path, "r", encoding="utf-8", errors="replace").read()
    data = extract_response_json(raw)
    players = data.get("players") or []

    f = []
    salary = []
    market = []

    for p in players:
        strength = float(p.get("strength", 0.0))
        experience = float(p.get("experience", 0.0))
        fitness = float(p.get("fitness", 0.0))
        age = float(p.get("age", 0.0))
        talent = float(p.get("talent", 0.0))
        main_skill = int(p.get("mainSkill", 0))

        row = [strength, strength * strength, experience, fitness, age, talent, float(main_skill)]
        f.append(row)
        salary.append(float(p.get("salary", 0.0)))
        market.append(float(p.get("marketValue", 0.0)))

    names = ["strength", "strength_sq", "experience", "fitness", "age", "talent", "mainSkillIndex"]

    b_sal = fit_linear(f, salary)
    p_sal = [predict(b_sal, r) for r in f]

    b_mv = fit_linear(f, market)
    p_mv = [predict(b_mv, r) for r in f]

    print("=== Salary / Market Value Influence Analysis ===")
    print(f"players_analyzed={len(players)}")
    print()

    print("Salary model (approx):")
    print(f"r2={r2(salary, p_sal):.6f}")
    print(f"intercept={b_sal[0]:.6f}")
    for i, n in enumerate(names):
        print(f"{n:14s} coeff={b_sal[i + 1]: .6f}")

    print()
    print("MarketValue model (approx):")
    print(f"r2={r2(market, p_mv):.6f}")
    print(f"intercept={b_mv[0]:.6f}")
    for i, n in enumerate(names):
        print(f"{n:14s} coeff={b_mv[i + 1]: .6f}")

    print()
    print("Simple correlations:")
    cols = list(zip(*f))
    for n, col in zip(names, cols):
        print(f"{n:14s} corr_salary={corr(list(col), salary): .6f} corr_market={corr(list(col), market): .6f}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: analyze_salary_marketvalue.py <sslCaptureData_0.txt>")
        sys.exit(1)
    run(sys.argv[1])
