clear;

// Функция для решения системы дифференциальных уравнений
function dydt = predator_prey_system(t, y, R, P1, P2, D)
    x = y(1); // жертвы
    y_pred = y(2); // хищники
    
    dxdt = R * x - P1 * x * y_pred;
    dydt_pred = P2 * x * y_pred - D * y_pred;
    
    dydt = [dxdt; dydt_pred];
endfunction

// Общие параметры
t_final = 50;
t = 0:0.1:t_final;

// Случай 1: Балансированная система
scf(0);
clf(0);
R = 0.8; P1 = 0.02; P2 = 0.01; D = 0.4;
x0 = 100; y0 = 30;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(predator_prey_system, R, P1, P2, D));

plot(t, y(1,:), 'g-', 'LineWidth', 2); // жертвы - зеленый
plot(t, y(2,:), 'r-', 'LineWidth', 2); // хищники - красный
title('Случай 1: Балансированная система');
xlabel('Время');
ylabel('Численность');
legend('Жертвы', 'Хищники', 2);
xgrid;
params = msprintf('R=%.2f, P1=%.3f, P2=%.3f, D=%.2f', R, P1, P2, D);
xtitle(params);

// Случай 2: Быстрое размножение жертв
scf(1);
clf(1);
R = 1.2; P1 = 0.015; P2 = 0.012; D = 0.5;
x0 = 80; y0 = 25;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(predator_prey_system, R, P1, P2, D));

plot(t, y(1,:), 'g-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 2: Быстрое размножение жертв');
xlabel('Время');
ylabel('Численность');
legend('Жертвы', 'Хищники', 2);
xgrid;
params = msprintf('R=%.2f, P1=%.3f, P2=%.3f, D=%.2f', R, P1, P2, D);
xtitle(params);

// Случай 3: Высокая смертность хищников
scf(2);
clf(2);
R = 0.7; P1 = 0.025; P2 = 0.008; D = 0.8;
x0 = 60; y0 = 40;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(predator_prey_system, R, P1, P2, D));

plot(t, y(1,:), 'g-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 3: Высокая смертность хищников');
xlabel('Время');
ylabel('Численность');
legend('Жертвы', 'Хищники', 2);
xgrid;
params = msprintf('R=%.2f, P1=%.3f, P2=%.3f, D=%.2f', R, P1, P2, D);
xtitle(params);

// Случай 4: Эффективные хищники
scf(3);
clf(3);
R = 0.6; P1 = 0.04; P2 = 0.02; D = 0.3;
x0 = 120; y0 = 20;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(predator_prey_system, R, P1, P2, D));

plot(t, y(1,:), 'g-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 4: Эффективные хищники');
xlabel('Время');
ylabel('Численность');
legend('Жертвы', 'Хищники', 2);
xgrid;
params = msprintf('R=%.2f, P1=%.3f, P2=%.3f, D=%.2f', R, P1, P2, D);
xtitle(params);

// Случай 5: Устойчивые колебания
scf(4);
clf(4);
R = 1.0; P1 = 0.03; P2 = 0.015; D = 0.6;
x0 = 50; y0 = 15;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(predator_prey_system, R, P1, P2, D));

plot(t, y(1,:), 'g-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 5: Устойчивые колебания');
xlabel('Время');
ylabel('Численность');
legend('Жертвы', 'Хищники', 2);
xgrid;
params = msprintf('R=%.2f, P1=%.3f, P2=%.3f, D=%.2f', R, P1, P2, D);
xtitle(params);

// Случай 6: Фазовый портрет для случая 1
scf(5);
clf(5);
R = 0.8; P1 = 0.02; P2 = 0.01; D = 0.4;
x0 = 100; y0 = 30;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(predator_prey_system, R, P1, P2, D));

plot(y(1,:), y(2,:), 'b-', 'LineWidth', 2);
plot(y(1,1), y(2,1), 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g'); // начальная точка
plot(y(1,$), y(2,$), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); // конечная точка
title('Фазовый портрет (Случай 1)');
xlabel('Жертвы');
ylabel('Хищники');
legend('Траектория', 'Начало', 'Конец', 1);
xgrid;

// Случай 7: Мало хищников
scf(6);
clf(6);
R = 0.9; P1 = 0.01; P2 = 0.005; D = 0.2;
x0 = 30; y0 = 5;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(predator_prey_system, R, P1, P2, D));

plot(t, y(1,:), 'g-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 7: Мало хищников');
xlabel('Время');
ylabel('Численность');
legend('Жертвы', 'Хищники', 2);
xgrid;
params = msprintf('R=%.2f, P1=%.3f, P2=%.3f, D=%.2f', R, P1, P2, D);
xtitle(params);

// Случай 8: Вымирание хищников
scf(7);
clf(7);
R = 0.4; P1 = 0.005; P2 = 0.002; D = 0.7;
x0 = 20; y0 = 10;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(predator_prey_system, R, P1, P2, D));

plot(t, y(1,:), 'g-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 8: Вымирание хищников');
xlabel('Время');
ylabel('Численность');
legend('Жертвы', 'Хищники', 2);
xgrid;
params = msprintf('R=%.2f, P1=%.3f, P2=%.3f, D=%.2f', R, P1, P2, D);
xtitle(params);

// Случай 9: Резкие колебания
scf(8);
clf(8);
R = 1.5; P1 = 0.05; P2 = 0.025; D = 0.9;
x0 = 200; y0 = 50;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(predator_prey_system, R, P1, P2, D));

plot(t, y(1,:), 'g-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 9: Резкие колебания');
xlabel('Время');
ylabel('Численность');
legend('Жертвы', 'Хищники', 2);
xgrid;
params = msprintf('R=%.2f, P1=%.3f, P2=%.3f, D=%.2f', R, P1, P2, D);
xtitle(params);

// Случай 10: Стабильное равновесие
scf(9);
clf(9);
R = 0.5; P1 = 0.015; P2 = 0.01; D = 0.3;
x0 = 80; y0 = 25;

y0_vec = [x0; y0];
y = ode(y0_vec, 0, t, list(predator_prey_system, R, P1, P2, D));

plot(t, y(1,:), 'g-', 'LineWidth', 2);
plot(t, y(2,:), 'r-', 'LineWidth', 2);
title('Случай 10: Стабильное равновесие');
xlabel('Время');
ylabel('Численность');
legend('Жертвы', 'Хищники', 2);
xgrid;
params = msprintf('R=%.2f, P1=%.3f, P2=%.3f, D=%.2f', R, P1, P2, D);
xtitle(params);

disp("Модель ""хищник-жертва"" выполнена успешно!");
disp("Построено 10 графиков в различных окнах (0-9)");
disp("Зеленый цвет - жертвы, красный цвет - хищники");
