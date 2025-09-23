import math
import numpy as np
from scipy.optimize import minimize_scalar

""" Аналитическое решение """


def analytical_solution(t, x0, y0, V0, alpha, g):
    x_kon = round(x0 + V0 * math.cos(alpha) * t, 4)
    y_kon = round(y0 + V0 * math.sin(alpha) * t - (g * t ** 2) / 2, 4)
    V_kon = round(V0 * math.sin(alpha) - g * t, 4)
    return x_kon, y_kon, V_kon


""" Численное решение для заданного шага dt """


def numerical_solution(dt, x0, y0, V0, alpha, g, t):
    Vx = V0 * math.cos(alpha)
    Vy = V0 * math.sin(alpha)
    x, y = x0, y0

    t_values = np.arange(dt, t + dt, dt)
    for t_current in t_values:
        x = x + Vx * dt
        y = y + Vy * dt
        Vy = Vy - g * dt

    return x, y, Vy


"""Относительная погрешность между аналитическим и численным решением"""


def relative_error(dt, x0, y0, V0, alpha, g, t):
    x_num, y_num, Vy_num = numerical_solution(dt, x0, y0, V0, alpha, g, t)

    # Исправлено: передаем параметр t в аналитическое решение
    x_anal, y_anal, Vy_anal = analytical_solution(t, x0, y0, V0, alpha, g)

    error_x = abs(x_num - x_anal) / abs(x_anal) if x_anal != 0 else abs(x_num - x_anal)
    error_y = abs(y_num - y_anal) / abs(y_anal) if y_anal != 0 else abs(y_num - y_anal)
    error_Vy = abs(Vy_num - Vy_anal) / abs(Vy_anal) if Vy_anal != 0 else abs(Vy_num - Vy_anal)

    # Суммарная относительная погрешность
    total_error = error_x + error_y + error_Vy
    return total_error


print(f'=== Введите начальные данные: ===')
x0 = int(input('Начальная координата x (м): '))
y0 = int(input('Начальная координата y (м): '))
V0 = float(input('Начальная скорость V (м/с): '))
alpha = int(input('Угол броска (градусы): '))
t = float(input('Время полета t (с): '))
print(f'=================================')

g = 9.8
alpha = math.radians(alpha)
dt_min = 1e-4
dt_max = 0.1

x_kon, y_kon, V_kon = analytical_solution(t, x0, y0, V0, alpha, g)
print()
print(f'=== Результаты аналитического решения: ===')
print(f'Координата x: {x_kon}')
print(f'Координата y: {y_kon}')
print(f'Скорость по y: {V_kon}')
print(f'==========================================')
print()


def error_function(dt):
    return relative_error(dt, x0, y0, V0, alpha, g, t)


# Исправлено: убраны лишние скобки после error_function
result = minimize_scalar(error_function, bounds=(dt_min, dt_max), method='bounded')

if result.success:
    optimal_dt = result.x
    min_error = result.fun
    print(f"Оптимальный шаг dt = {optimal_dt:.6f}")
    print(f"Минимальная относительная погрешность = {min_error:.6f}")
else:
    print("Оптимизация не удалась")