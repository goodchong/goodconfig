#!/usr/bin/env python3
"""
计算在“每上涨 x% 即补仓回 n 倍杠杆”策略下，
资金规模随调整次数 m 的变动。
"""

def leveraged_growth(initial_capital: float,
                     leverage_n: float,
                     rise_percent: float,
                     m: int,
                     return_path: bool = False):
    """
    Parameters
    ----------
    initial_capital : 初始资金（E₀）
    leverage_n      : 杠杆倍数 n
    rise_percent    : 每次上涨百分比（例如 5 表示 5%）
    m               : 调整次数
    return_path     : 若为 True，返回每一步资金列表

    Returns
    -------
    float 或 list
        - return_path=False → 仅返回最终资金规模 E_m
        - return_path=True  → 返回长度 m+1 的资金路径
    """
    x = rise_percent / 100.0         # 转成小数
    growth_factor = 1 + leverage_n * x

    if return_path:
        capitals = [initial_capital]
        for _ in range(m):
            capitals.append(capitals[-1] * growth_factor)
        return capitals
    else:
        return initial_capital * (growth_factor ** m)


if __name__ == "__main__":
    # --------演示用参数，可自行修改------------
    E0  = 100000      # 初始资金 1 万
    n   = 5          # 3 倍杠杆
    xpc = 5          # 每涨 5%
    m   = 20         # 补仓 10 次
    # ------------------------------------------

    final_capital = leveraged_growth(E0, n, xpc, m)
    print(f"初始资金：{E0:,.2f} 元")
    print(f"每次上涨 {xpc}%，补仓 {n} 倍杠杆")
    print(f"经历 {m} 次补仓后，资金规模约为：{final_capital:,.2f} 元")

    # 若想看逐步资金变化，把 return_path=True
    path = leveraged_growth(E0, n, xpc, m, return_path=True)
    print(f"资金变化率：{final_capital / E0:.2f}")

    for i, cap in enumerate(path):
        print(f"{i}\t{cap:.2f}")
    for i, cap in enumerate(path):
        print(f"第 {i} 次补仓后，资金规模为：{cap:,.2f} 元, 变化率：{cap / E0:.2f}")

