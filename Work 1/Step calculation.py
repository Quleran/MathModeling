import math

""" Численное решение """
def calculate_trajectory(dt, tk, x0, y0, V0, alpha, g):
    Vx = V0 * math.cos(alpha)
    Vy = V0 * math.sin(alpha)
    x, y = x0, y0

    t = 0
    while t < tk:
        x += Vx * dt
        y += Vy * dt
        Vy -= g * dt
        t += dt

    return x, y, Vy

"""
    Находит оптимальный шаг dt, при котором относительная погрешность
    координаты Y становится меньше target_error
"""
def find_optimal_step(tk, x0, y0, V0, alpha, g, xk, target_error):

    dt = 0.1
    x_old = xk
    print("Поиск оптимального шага dt:")
    print(f'Целевая погрешность: {target_error}%')
    print("-" * 60)

    while True:
        y_num, x_num, Vy_num = calculate_trajectory(dt, tk, x0, y0, V0, alpha, g)
        if abs(x_old - x_num) <= target_error:
            return dt * 2, abs(x_old - x_num), x_old, x_num
        else:
            x_old = x_num
            dt /= 2


def main():
    print("=== РАСЧЕТ ДВИЖЕНИЯ ТЕЛА, БРОШЕННОГО ПОД УГЛОМ К ГОРИЗОНТУ ===")
    x0 = int(input('Начальная координата x (м): '))
    y0 = int(input('Начальная координата y (м): '))
    xk = float(input('Координата корзины x (м): '))
    V0 = float(input('Начальная скорость V (м/с): '))
    alpha = int(input('Угол броска (градусы): '))
    tk = float(input('Время полета t (с): '))
    target_error = float(input('Погрешность: '))
    g = 9.8
    alpha = math.radians(alpha)
    tn = 0

    # Поиск оптимального шага
    optimal_dt,achieved_error, x_opt, x_new = find_optimal_step(tk, x0, y0, V0, alpha, g, xk, target_error)

    print("\n=== ОПТИМАЛЬНЫЙ ШАГ dt ===")
    print(f'Найденный шаг: dt = {optimal_dt} с')
    print(f'Достигнутая погрешность координаты X: {round(achieved_error,4)}')
    print()

    print("=== ЧИСЛЕННОЕ РЕШЕНИЕ С ОПТИМАЛЬНЫМ ШАГОМ ===")
    print(f'Координата X: {round(x_opt, 4)} м')
    print(f'Координата X c шагом {optimal_dt / 2}: {round(x_new, 4)} м')
    print()

if __name__ == "__main__":
    main()