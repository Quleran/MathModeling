// Программа для моделирования системы двух конкурирующих популяций
// 10 графиков в разных окнах

clear;

// Функция для решения системы дифференциальных уравнений
function dydt = population_system(t, y, R1, R2, k1, k2, alpha, beta)
    x = y(1);
    y_pop = y(2);
    
    dxdt = R1 * x * (k1 - x - alpha * y_pop) / k1;
    dydt_pop = R2 * y_pop * (k2 - y_pop - beta * x) / k2;
    
    dydt = [dxdt; dydt_pop];
endfunction

// Общие параметры
t_final = 50;
t = 0:0.1:t_final;

// Случай 1: Балансированная конкуренция
scf(0);
clf(0);
R1 = 0.4; R2 = 0.4;
k1 = 1000; k2 = 1000;
alpha = 0.3; beta = 0.3;
x0 = 200; y0 = 150;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(population_system, R1, R2, k1, k2, alpha, beta));

plot(t, y(1,:), 'b-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 1: Балансированная конкуренция');
xlabel('Время');
ylabel('Численность');
legend('Популяция x', 'Популяция y', 2);
xgrid;
// Вывод параметров в заголовок
params = msprintf('R1=%.1f, R2=%.1f, k1=%.0f, k2=%.0f, α=%.1f, β=%.1f', R1, R2, k1, k2, alpha, beta);
xtitle(params);

// Случай 2: Первый вид доминирует
scf(1);
clf(1);
R1 = 0.6; R2 = 0.2;
k1 = 1000; k2 = 800;
alpha = 0.2; beta = 0.8;
x0 = 150; y0 = 100;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(population_system, R1, R2, k1, k2, alpha, beta));

plot(t, y(1,:), 'b-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 2: Первый вид доминирует');
xlabel('Время');
ylabel('Численность');
legend('Популяция x', 'Популяция y', 2);
xgrid;
params = msprintf('R1=%.1f, R2=%.1f, k1=%.0f, k2=%.0f, α=%.1f, β=%.1f', R1, R2, k1, k2, alpha, beta);
xtitle(params);

// Случай 3: Второй вид доминирует
scf(2);
clf(2);
R1 = 0.2; R2 = 0.6;
k1 = 800; k2 = 1000;
alpha = 0.8; beta = 0.2;
x0 = 100; y0 = 150;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(population_system, R1, R2, k1, k2, alpha, beta));

plot(t, y(1,:), 'b-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 3: Второй вид доминирует');
xlabel('Время');
ylabel('Численность');
legend('Популяция x', 'Популяция y', 2);
xgrid;
params = msprintf('R1=%.1f, R2=%.1f, k1=%.0f, k2=%.0f, α=%.1f, β=%.1f', R1, R2, k1, k2, alpha, beta);
xtitle(params);

// Случай 4: Сильная конкуренция
scf(3);
clf(3);
R1 = 0.5; R2 = 0.5;
k1 = 1000; k2 = 1000;
alpha = 0.9; beta = 0.9;
x0 = 300; y0 = 250;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(population_system, R1, R2, k1, k2, alpha, beta));

plot(t, y(1,:), 'b-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 4: Сильная конкуренция');
xlabel('Время');
ylabel('Численность');
legend('Популяция x', 'Популяция y', 2);
xgrid;
params = msprintf('R1=%.1f, R2=%.1f, k1=%.0f, k2=%.0f, α=%.1f, β=%.1f', R1, R2, k1, k2, alpha, beta);
xtitle(params);

// Случай 5: Слабая конкуренция
scf(4);
clf(4);
R1 = 0.4; R2 = 0.4;
k1 = 1000; k2 = 1000;
alpha = 0.1; beta = 0.1;
x0 = 200; y0 = 150;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(population_system, R1, R2, k1, k2, alpha, beta));

plot(t, y(1,:), 'b-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 5: Слабая конкуренция');
xlabel('Время');
ylabel('Численность');
legend('Популяция x', 'Популяция y', 2);
xgrid;
params = msprintf('R1=%.1f, R2=%.1f, k1=%.0f, k2=%.0f, α=%.1f, β=%.1f', R1, R2, k1, k2, alpha, beta);
xtitle(params);

// Случай 6: Коэкзистенция
scf(5);
clf(5);
R1 = 0.3; R2 = 0.3;
k1 = 1200; k2 = 1200;
alpha = 0.4; beta = 0.4;
x0 = 100; y0 = 100;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(population_system, R1, R2, k1, k2, alpha, beta));

plot(t, y(1,:), 'b-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 6: Коэкзистенция');
xlabel('Время');
ylabel('Численность');
legend('Популяция x', 'Популяция y', 2);
xgrid;
params = msprintf('R1=%.1f, R2=%.1f, k1=%.0f, k2=%.0f, α=%.1f, β=%.1f', R1, R2, k1, k2, alpha, beta);
xtitle(params);

// Случай 7: Вытеснение второго вида
scf(6);
clf(6);
R1 = 0.7; R2 = 0.2;
k1 = 1000; k2 = 600;
alpha = 0.1; beta = 1.2;
x0 = 50; y0 = 200;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(population_system, R1, R2, k1, k2, alpha, beta));

plot(t, y(1,:), 'b-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 7: Вытеснение второго вида');
xlabel('Время');
ylabel('Численность');
legend('Популяция x', 'Популяция y', 2);
xgrid;
params = msprintf('R1=%.1f, R2=%.1f, k1=%.0f, k2=%.0f, α=%.1f, β=%.1f', R1, R2, k1, k2, alpha, beta);
xtitle(params);

// Случай 8: Вытеснение первого вида
scf(7);
clf(7);
R1 = 0.2; R2 = 0.7;
k1 = 600; k2 = 1000;
alpha = 1.2; beta = 0.1;
x0 = 200; y0 = 50;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(population_system, R1, R2, k1, k2, alpha, beta));

plot(t, y(1,:), 'b-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 8: Вытеснение первого вида');
xlabel('Время');
ylabel('Численность');
legend('Популяция x', 'Популяция y', 2);
xgrid;
params = msprintf('R1=%.1f, R2=%.1f, k1=%.0f, k2=%.0f, α=%.1f, β=%.1f', R1, R2, k1, k2, alpha, beta);
xtitle(params);

// Случай 9: Быстрый рост с последующей стабилизацией
scf(8);
clf(8);
R1 = 0.8; R2 = 0.8;
k1 = 800; k2 = 800;
alpha = 0.5; beta = 0.5;
x0 = 10; y0 = 10;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(population_system, R1, R2, k1, k2, alpha, beta));

plot(t, y(1,:), 'b-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 9: Быстрый рост');
xlabel('Время');
ylabel('Численность');
legend('Популяция x', 'Популяция y', 2);
xgrid;
params = msprintf('R1=%.1f, R2=%.1f, k1=%.0f, k2=%.0f, α=%.1f, β=%.1f', R1, R2, k1, k2, alpha, beta);
xtitle(params);

// Случай 10: Колебания популяций
scf(9);
clf(9);
R1 = 0.5; R2 = 0.5;
k1 = 1000; k2 = 1000;
alpha = 0.7; beta = 0.7;
x0 = 400; y0 = 100;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(population_system, R1, R2, k1, k2, alpha, beta));

plot(t, y(1,:), 'b-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 10: Колебания популяций');
xlabel('Время');
ylabel('Численность');
legend('Популяция x', 'Популяция y', 2);
xgrid;
params = msprintf('R1=%.1f, R2=%.1f, k1=%.0f, k2=%.0f, α=%.1f, β=%.1f', R1, R2, k1, k2, alpha, beta);
xtitle(params);

// Сообщение о завершении
disp("Графики построены в 10 различных окнах");
disp("Окна пронумерованы от 0 до 9");
disp("Для переключения между окнами используйте scf(номер_окна)");
