import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import chi2


def norm(n):
    print(f'Объем выборки: {n}')
    uniform_data = np.random.uniform(0, 1, n)

    # Исправление: преобразование в целое число и проверка
    k = 1 + int(np.log(n))
    if k < 2:  # минимальное количество интервалов
        k = 2

    bins = np.linspace(0, 1, k + 1)
    observed, _ = np.histogram(uniform_data, bins=bins)
    expected = np.full(k, len(uniform_data) / k)
    chi2_stat = np.sum((observed - expected) ** 2 / expected)

    df = k - 1
    critical_value = chi2.ppf(0.95, df)
    if chi2_stat < critical_value:
        print("Распределение РАВНОМЕРНОЕ (критерий хи-квадрат пройден)")
    else:
        print("Распределение НЕ РАВНОМЕРНОЕ (критерий хи-квадрат не пройден)")

    # Генерация нормального распределения методом Бокса-Мюллера
    if n % 2 != 0:
        uniform_data = uniform_data[:-1]
        n = len(uniform_data)

    u1 = uniform_data[:n // 2]
    u2 = uniform_data[n // 2:]

    z0 = np.sqrt(-2 * np.log(u1)) * np.cos(2 * np.pi * u2)
    z1 = np.sqrt(-2 * np.log(u1)) * np.sin(2 * np.pi * u2)

    normal_data = np.concatenate([z0, z1])
    return normal_data


# Основная программа
N = [100, 1000]
for i in N:
    data = norm(i)

    plt.figure(figsize=(10, 6))

    # Построение гистограммы
    plt.hist(data, bins=30, density=True, alpha=0.7, color='skyblue', edgecolor='black')

    # Добавление теоретической кривой нормального распределения
    x = np.linspace(-4, 4, 100)
    y = (1 / np.sqrt(2 * np.pi)) * np.exp(-x ** 2 / 2)
    plt.plot(x, y, 'r-', linewidth=2, label='Теоретическая N(0,1)')

    # Исправление: используем правильную переменную для заголовка
    plt.title(f'Гистограмма нормального распределения\n(Объем выборки: {i})')
    plt.xlabel('Значение')
    plt.ylabel('Плотность вероятности')
    plt.grid(True, alpha=0.3)
    plt.legend()
    plt.show()
