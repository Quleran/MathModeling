clear; clc;

x0 = 1000000;
t = 0:0.1:15;
R = 0.5;

// Случай 1: x0 > k (начальная численность больше ёмкости)
k1 = 500000;
x1 = (k1 * x0 * exp(R * t)) ./ (k1 - x0 + x0 * exp(R * t));

// Случай 2: x0 < k (начальная численность меньше ёмкости)
k2 = 3000000;
x2 = (k2 * x0 * exp(R * t)) ./ (k2 - x0 + x0 * exp(R * t));

// Случай 3: x0 = k (начальная численность равна ёмкости)
k3 = 1000000;
x3 = k3 * ones(t);

// Отдельные графики
scf(0);
clf();
plot(t, x1, 'b-', 'LineWidth', 2);
xlabel('Время (t)', 'fontsize', 3);
ylabel('Численность популяции (x)', 'fontsize', 3);
title('Модель Ферхюльста: x₀ > k (x₀ = 1 млн, k = 0.5 млн)', 'fontsize', 4);

scf(1);
clf();
plot(t, x2, 'r-', 'LineWidth', 2);
xlabel('Время (t)', 'fontsize', 3);
ylabel('Численность популяции (x)', 'fontsize', 3);
title('Модель Ферхюльста: x₀ < k (x₀ = 1 млн, k = 3 млн)', 'fontsize', 4);

scf(2);
clf();
plot(t, x3, 'g-', 'LineWidth', 2);
xlabel('Время (t)', 'fontsize', 3);
ylabel('Численность популяции (x)', 'fontsize', 3);
title('Модель Ферхюльста: x₀ = k (x₀ = k = 1 млн)', 'fontsize', 4);

// Сводный график с ПРАВИЛЬНЫМИ переменными в легенде
scf(3);
clf();
plot(t, x1/1e6, 'b-', 'LineWidth', 2);
plot(t, x2/1e6, 'r-', 'LineWidth', 2);
plot(t, x3/1e6, 'g-', 'LineWidth', 2);

xlabel('Время (t, годы)', 'fontsize', 3);
ylabel('Численность популяции (миллионы)', 'fontsize', 3);
title('Модель Ферхюльста: Сравнение всех случаев', 'fontsize', 4);

// ИСПРАВЛЕННАЯ ЛЕГЕНДА - используем реальные переменные из кода
legend(['x₀ > k (x₀ = ' + string(x0/1e6) + ' млн, k = ' + string(k1/1e6) + ' млн)'; 
        'x₀ < k (x₀ = ' + string(x0/1e6) + ' млн, k = ' + string(k2/1e6) + ' млн)';
        'x₀ = k (x₀ = k = ' + string(k3/1e6) + ' млн)'], 4);

// Добавим линии для наглядности - предельные значения
plot(t, k1/1e6 * ones(t), 'b--', 'LineWidth', 1);
plot(t, k2/1e6 * ones(t), 'r--', 'LineWidth', 1);
plot(t, k3/1e6 * ones(t), 'g--', 'LineWidth', 1);
