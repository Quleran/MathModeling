import random

def binom(N):
    p_theoretical = 0.5
    results = []
    for i in range(N):
        if random.random() < p_theoretical:
            results.append(1)  # орёл
        else:
            results.append(0)  # решка

    heads_count = sum(results)
    tails_count = N - heads_count
    p_experimental = heads_count / N

    expected_heads = N * p_theoretical
    expected_tails = N * (1 - p_theoretical)

    # Расчёт хи-квадрат
    chi_square = ((heads_count - expected_heads) ** 2 / expected_heads +
                  (tails_count - expected_tails) ** 2 / expected_tails)

    k = 2
    r = 0
    df = k - 1 - r
    critical_value = 3.841


    print(f"Количество бросков: {N}")
    print(f"Орлов выпало: {heads_count}")
    print(f"Решек выпало: {tails_count}")
    print(f"Теоретическая вероятность орла: {p_theoretical}")
    print(f"Экспериментальная вероятность орла: {p_experimental:.4f}")
    print(f"Разница: {abs(p_theoretical - p_experimental):.4f}")
    print(f"Критерий Хи-квадрата: {chi_square:.4f}")
    if chi_square <= critical_value:
        print(f'Одобрение')
    else:
        print(f'Неодобрение')
    print()


N = [100, 1000, 1000000]
for i in N:
    binom(i)
