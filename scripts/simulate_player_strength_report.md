# Strength Formula Deep Evaluation Report

Goal: evaluate at least 20 approaches for 500@30 direction; training schedule unchanged.


| Approach | Player | Age30 | Age32 | Description | Training mode | formula |

|---|---|---|---|---|---|---|

| A1_rotating_default | weak_youth | 106.20 | 107.67 | rotating training, default formula | rotating | main=0.55,bonus=0.25,overall=0.2,str*= 1.0 |
| A1_rotating_default | good_youth | 121.50 | 123.70 | rotating training, default formula | rotating | main=0.55,bonus=0.25,overall=0.2,str*= 1.0 |
| A1_rotating_default | elite_youth | 125.46 | 128.27 | rotating training, default formula | rotating | main=0.55,bonus=0.25,overall=0.2,str*= 1.0 |
| A2_fixed_default | weak_youth | 347.25 | 362.63 | fixed main strategy, default formula | fixed | main=0.55,bonus=0.25,overall=0.2,str*= 1.0 |
| A2_fixed_default | good_youth | 410.65 | 416.10 | fixed main strategy, default formula | fixed | main=0.55,bonus=0.25,overall=0.2,str*= 1.0 |
| A2_fixed_default | elite_youth | 428.43 | 439.68 | fixed main strategy, default formula | fixed | main=0.55,bonus=0.25,overall=0.2,str*= 1.0 |
| A3_fixed_1.2 | weak_youth | 416.70 | 435.16 | fixed main + 20% strength boost | fixed | main=0.55,bonus=0.25,overall=0.2,str*= 1.2 |
| A3_fixed_1.2 | good_youth | 492.78 | 499.32 | fixed main + 20% strength boost | fixed | main=0.55,bonus=0.25,overall=0.2,str*= 1.2 |
| A3_fixed_1.2 | elite_youth | 514.12 | 527.62 | fixed main + 20% strength boost | fixed | main=0.55,bonus=0.25,overall=0.2,str*= 1.2 |
| A4_fixed_1.4 | weak_youth | 486.15 | 507.68 | fixed main + 40% strength boost | fixed | main=0.55,bonus=0.25,overall=0.2,str*= 1.4 |
| A4_fixed_1.4 | good_youth | 574.90 | 582.54 | fixed main + 40% strength boost | fixed | main=0.55,bonus=0.25,overall=0.2,str*= 1.4 |
| A4_fixed_1.4 | elite_youth | 599.80 | 615.56 | fixed main + 40% strength boost | fixed | main=0.55,bonus=0.25,overall=0.2,str*= 1.4 |
| A5_fixed_high_main | weak_youth | 423.83 | 443.27 | fixed main, strong main weight | fixed | main=0.7,bonus=0.2,overall=0.1,str*= 1.0 |
| A5_fixed_high_main | good_youth | 501.98 | 508.98 | fixed main, strong main weight | fixed | main=0.7,bonus=0.2,overall=0.1,str*= 1.0 |
| A5_fixed_high_main | elite_youth | 517.54 | 531.19 | fixed main, strong main weight | fixed | main=0.7,bonus=0.2,overall=0.1,str*= 1.0 |
| A6_fixed_high_main_1.2 | weak_youth | 508.59 | 531.92 | fixed main high main + 20% strength | fixed | main=0.7,bonus=0.2,overall=0.1,str*= 1.2 |
| A6_fixed_high_main_1.2 | good_youth | 602.38 | 610.77 | fixed main high main + 20% strength | fixed | main=0.7,bonus=0.2,overall=0.1,str*= 1.2 |
| A6_fixed_high_main_1.2 | elite_youth | 621.04 | 637.43 | fixed main high main + 20% strength | fixed | main=0.7,bonus=0.2,overall=0.1,str*= 1.2 |
| A7_fixed_high_main_1.4 | weak_youth | 593.36 | 620.57 | fixed main high main + 40% strength | fixed | main=0.7,bonus=0.2,overall=0.1,str*= 1.4 |
| A7_fixed_high_main_1.4 | good_youth | 700.00 | 700.00 | fixed main high main + 40% strength | fixed | main=0.7,bonus=0.2,overall=0.1,str*= 1.4 |
| A7_fixed_high_main_1.4 | elite_youth | 700.00 | 700.00 | fixed main high main + 40% strength | fixed | main=0.7,bonus=0.2,overall=0.1,str*= 1.4 |
| A8_rotating_soft | weak_youth | 122.04 | 123.91 | rotating, softened main+higher overall | rotating | main=0.45,bonus=0.2,overall=0.35,str*= 1.2 |
| A8_rotating_soft | good_youth | 139.89 | 142.63 | rotating, softened main+higher overall | rotating | main=0.45,bonus=0.2,overall=0.35,str*= 1.2 |
| A8_rotating_soft | elite_youth | 144.25 | 147.89 | rotating, softened main+higher overall | rotating | main=0.45,bonus=0.2,overall=0.35,str*= 1.2 |
| A9_rotating_bonus_focus | weak_youth | 114.87 | 116.42 | rotating with bonus emphasis | rotating | main=0.45,bonus=0.4,overall=0.15,str*= 1.1 |
| A9_rotating_bonus_focus | good_youth | 131.50 | 133.84 | rotating with bonus emphasis | rotating | main=0.45,bonus=0.4,overall=0.15,str*= 1.1 |
| A9_rotating_bonus_focus | elite_youth | 135.83 | 138.96 | rotating with bonus emphasis | rotating | main=0.45,bonus=0.4,overall=0.15,str*= 1.1 |
| A10_fixed_all_high | weak_youth | 384.66 | 401.36 | fixed main, equal high weights (0.5,0.3,0.2) | fixed | main=0.5,bonus=0.3,overall=0.2,str*= 1.2 |
| A10_fixed_all_high | good_youth | 454.48 | 460.31 | fixed main, equal high weights (0.5,0.3,0.2) | fixed | main=0.5,bonus=0.3,overall=0.2,str*= 1.2 |
| A10_fixed_all_high | elite_youth | 478.91 | 491.52 | fixed main, equal high weights (0.5,0.3,0.2) | fixed | main=0.5,bonus=0.3,overall=0.2,str*= 1.2 |
| A11_fixed_minimal_overlap | weak_youth | 502.17 | 525.84 | fixed main, minimal overall emphasis | fixed | main=0.85,bonus=0.1,overall=0.05,str*= 1.0 |
| A11_fixed_minimal_overlap | good_youth | 595.52 | 604.17 | fixed main, minimal overall emphasis | fixed | main=0.85,bonus=0.1,overall=0.05,str*= 1.0 |
| A11_fixed_minimal_overlap | elite_youth | 606.10 | 622.07 | fixed main, minimal overall emphasis | fixed | main=0.85,bonus=0.1,overall=0.05,str*= 1.0 |
| A12_fixed_low_main | weak_youth | 270.68 | 281.99 | fixed main low weight to test low growth | fixed | main=0.4,bonus=0.3,overall=0.3,str*= 1.0 |
| A12_fixed_low_main | good_youth | 319.31 | 323.22 | fixed main low weight to test low growth | fixed | main=0.4,bonus=0.3,overall=0.3,str*= 1.0 |
| A12_fixed_low_main | elite_youth | 339.32 | 348.18 | fixed main low weight to test low growth | fixed | main=0.4,bonus=0.3,overall=0.3,str*= 1.0 |
| A13_rotating_reward | weak_youth | 148.68 | 150.74 | rotating, normalized + 1.4 strength multiplier | rotating | main=0.55,bonus=0.25,overall=0.2,str*= 1.4 |
| A13_rotating_reward | good_youth | 170.10 | 173.18 | rotating, normalized + 1.4 strength multiplier | rotating | main=0.55,bonus=0.25,overall=0.2,str*= 1.4 |
| A13_rotating_reward | elite_youth | 175.65 | 179.57 | rotating, normalized + 1.4 strength multiplier | rotating | main=0.55,bonus=0.25,overall=0.2,str*= 1.4 |
| A14_rotating_premium | weak_youth | 166.87 | 169.02 | rotating, strong mult, strong main for premium investor | rotating | main=0.7,bonus=0.2,overall=0.1,str*= 1.5 |
| A14_rotating_premium | good_youth | 190.53 | 193.80 | rotating, strong mult, strong main for premium investor | rotating | main=0.7,bonus=0.2,overall=0.1,str*= 1.5 |
| A14_rotating_premium | elite_youth | 196.95 | 200.82 | rotating, strong mult, strong main for premium investor | rotating | main=0.7,bonus=0.2,overall=0.1,str*= 1.5 |
| A15_fixed_capped | weak_youth | 429.51 | 449.64 | fixed, heavy main, low total gain | fixed | main=0.8,bonus=0.1,overall=0.1,str*= 0.9 |
| A15_fixed_capped | good_youth | 509.23 | 516.59 | fixed, heavy main, low total gain | fixed | main=0.8,bonus=0.1,overall=0.1,str*= 0.9 |
| A15_fixed_capped | elite_youth | 518.59 | 532.22 | fixed, heavy main, low total gain | fixed | main=0.8,bonus=0.1,overall=0.1,str*= 0.9 |
| A16_fixed_nonlinear | weak_youth | 438.78 | 458.74 | fixed, nonlinear (separate scenario post-sim) | fixed | main=0.65,bonus=0.2,overall=0.15,str*= 1.1 |
| A16_fixed_nonlinear | good_youth | 519.50 | 526.67 | fixed, nonlinear (separate scenario post-sim) | fixed | main=0.65,bonus=0.2,overall=0.15,str*= 1.1 |
| A16_fixed_nonlinear | elite_youth | 536.42 | 550.53 | fixed, nonlinear (separate scenario post-sim) | fixed | main=0.65,bonus=0.2,overall=0.15,str*= 1.1 |
| A17_rotating_strengthonly | weak_youth | 212.40 | 215.35 | only strength multiplier (2.0) on rotating training | rotating | main=0.55,bonus=0.25,overall=0.2,str*= 2.0 |
| A17_rotating_strengthonly | good_youth | 243.00 | 247.39 | only strength multiplier (2.0) on rotating training | rotating | main=0.55,bonus=0.25,overall=0.2,str*= 2.0 |
| A17_rotating_strengthonly | elite_youth | 250.93 | 256.53 | only strength multiplier (2.0) on rotating training | rotating | main=0.55,bonus=0.25,overall=0.2,str*= 2.0 |
| A18_fixed_extreme | weak_youth | 700.00 | 700.00 | fixed, extreme main weight, high strength 2.0 | fixed | main=0.85,bonus=0.1,overall=0.05,str*= 2.0 |
| A18_fixed_extreme | good_youth | 700.00 | 700.00 | fixed, extreme main weight, high strength 2.0 | fixed | main=0.85,bonus=0.1,overall=0.05,str*= 2.0 |
| A18_fixed_extreme | elite_youth | 700.00 | 700.00 | fixed, extreme main weight, high strength 2.0 | fixed | main=0.85,bonus=0.1,overall=0.05,str*= 2.0 |
| A19_fixed_medium | weak_youth | 598.34 | 625.55 | fixed main, medium weight, medium multiplier | fixed | main=0.65,bonus=0.2,overall=0.15,str*= 1.5 |
| A19_fixed_medium | good_youth | 700.00 | 700.00 | fixed main, medium weight, medium multiplier | fixed | main=0.65,bonus=0.2,overall=0.15,str*= 1.5 |
| A19_fixed_medium | elite_youth | 700.00 | 700.00 | fixed main, medium weight, medium multiplier | fixed | main=0.65,bonus=0.2,overall=0.15,str*= 1.5 |
| A20_rotating_small | weak_youth | 139.66 | 141.59 | rotating with small final multiplier to check concavity | rotating | main=0.6,bonus=0.2,overall=0.2,str*= 1.3 |
| A20_rotating_small | good_youth | 159.70 | 162.58 | rotating with small final multiplier to check concavity | rotating | main=0.6,bonus=0.2,overall=0.2,str*= 1.3 |
| A20_rotating_small | elite_youth | 164.92 | 168.51 | rotating with small final multiplier to check concavity | rotating | main=0.6,bonus=0.2,overall=0.2,str*= 1.3 |