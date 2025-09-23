import math

""" Численное решение """
def calculate_trajectory(dt, tk, x0, y0, V0, alpha, g):
    """Вычисляет траекторию методом Эйлера с заданным шагом dt"""
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


"""Аналитическое решение"""
def analytical_solution(t, x0, y0, V0, alpha, g):
    x_an = x0 + V0 * math.cos(alpha) * t
    y_an = y0 + V0 * math.sin(alpha) * t - (g * t ** 2) / 2
    Vy_an = V0 * math.sin(alpha) - g * t
    return x_an, y_an, Vy_an

"""
    Находит оптимальный шаг dt, при котором относительная погрешность
    координаты Y становится меньше target_error%
"""
def find_optimal_step(tk, x0, y0, V0, alpha, g, target_error=0.1, max_iterations=20):
    # Аналитическое решение в конечный момент времени
    x_an, y_an, Vy_an = analytical_solution(tk, x0, y0, V0, alpha, g)

    # Начальные значения
    dt = 0.1  # начальный шаг
    best_dt = dt
    min_error = float('inf')

    print("Поиск оптимального шага dt:")
    print(f'Целевая погрешность: {target_error}%')
    print("-" * 60)

    for iteration in range(max_iterations):
        # Численное решение
        x_num, y_num, Vy_num = calculate_trajectory(dt, tk, x0, y0, V0, alpha, g)

        # Относительные погрешности
        err_x = abs(x_num - x_an) / abs(x_an) * 100 if abs(x_an) > 1e-10 else 0
        err_y = abs(y_num - y_an) / abs(y_an) * 100 if abs(y_an) > 1e-10 else 0
        err_Vy = abs(Vy_num - Vy_an) / abs(Vy_an) * 100 if abs(Vy_an) > 1e-10 else 0

        # Основной критерий - погрешность координаты Y
        current_error = err_y

        print(f'Итерация {iteration + 1}: dt = {dt}, погрешность Y = {current_error}%')

        # Сохраняем лучший результат
        if current_error < min_error:
            min_error = current_error
            best_dt = dt

        # Проверяем условие достижения целевой погрешности
        if current_error <= target_error:
            print("\nЦелевая погрешность достигнута!")
            return dt, current_error, x_num, y_num, Vy_num

        # Уменьшаем шаг для следующей итерации
        dt /= 2

    print("\nДостигнута максимальная погрешность: {:.4f}%".format(min_error))
    return best_dt, min_error, *calculate_trajectory(best_dt, tk, x0, y0, V0, alpha, g)


def main():
    print("=== РАСЧЕТ ДВИЖЕНИЯ ТЕЛА, БРОШЕННОГО ПОД УГЛОМ К ГОРИЗОНТУ ===")
    x0 = int(input('Начальная координата x (м): '))
    y0 = int(input('Начальная координата y (м): '))
    V0 = float(input('Начальная скорость V (м/с): '))
    alpha = int(input('Угол броска (градусы): '))
    tk = float(input('Время полета t (с): '))
    g = 9.8
    alpha = math.radians(alpha)
    tn = 0

    # Целевая относительная погрешность (%)
    target_error = 0.1

    # Аналитическое решение
    x_an, y_an, Vy_an = analytical_solution(tk, x0, y0, V0, alpha, g)

    print("\n=== АНАЛИТИЧЕСКОЕ РЕШЕНИЕ ===")
    print(f'Координата X: {x_an} м')
    print(f'Координата Y: {y_an} м')
    print(f'Скорость Vy:  {Vy_an}')
    print()

    # Поиск оптимального шага
    optimal_dt, achieved_error, x_opt, y_opt, Vy_opt = find_optimal_step(
        tk, x0, y0, V0, alpha, g, target_error)

    print("\n=== ОПТИМАЛЬНЫЙ ШАГ dt ===")
    print(f'Найденный шаг: dt = {optimal_dt} с')
    print(f'Достигнутая погрешность координаты Y: {achieved_error}%')
    print()

    print("=== ЧИСЛЕННОЕ РЕШЕНИЕ С ОПТИМАЛЬНЫМ ШАГОМ ===")
    print(f'Координата X: {x_opt} м')
    print(f'Координата Y: {y_opt} м')
    print(f'Скорость Vy:  {Vy_opt} м/с')
    print()

    # Сравнение с аналитическим решением
    err_x = abs(x_opt - x_an) / abs(x_an) * 100
    err_y = abs(y_opt - y_an) / abs(y_an) * 100
    err_Vy = abs(Vy_opt - Vy_an) / abs(Vy_an) * 100

    print("=== ОТНОСИТЕЛЬНЫЕ ПОГРЕШНОСТИ ===")
    print(f'Погрешность координаты X: {err_x}%')
    print(f'Погрешность координаты Y: {err_y}%')
    print(f'Погрешность скорости Vy:  {err_Vy}%')
    print()

if __name__ == "__main__":
    main()