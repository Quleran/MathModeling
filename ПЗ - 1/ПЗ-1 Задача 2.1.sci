// Параметры системы
l = 10;          // длина маятника (м)
g = 9.8;         // ускорение свободного падения (м/с²)
b = 0.1;         // коэффициент трения (N·s/m)
m = 1;           // масса (кг)

omega0 = sqrt(g / l);
beta = b / (2 * m);

// Начальные условия: угол = 0.5 рад, скорость = 0
phi0 = 0.5;
dphi0 = 0;
initial = [phi0; dphi0];

// Время моделирования
t_start = 0;
t_step = 0.1;
t_end = 50;
t = t_start:t_step:t_end;

// Система дифференциальных уравнений
function dydt = pendulum_system(t, y)
    phi = y(1);
    omega = y(2);
    dphidt = omega;
    domegadt = -2 * beta * omega - omega0^2 * phi;
    dydt = [dphidt; domegadt];
endfunction

// Численное решение
y = ode(initial, t_start, t, pendulum_system);

// Построение графика
scf(0);
clf();
plot(t, y(1,:), 'b-', 'LineWidth', 2);
xlabel('Время t, с');
ylabel('Угол φ, рад');
title('Математический маятник с затуханием (l = 10 м)');
xgrid;
