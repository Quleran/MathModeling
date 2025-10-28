l1 = 20;
l2 = 40;
g = 9.8;         // ускорение свободного падения (м/с²)
b = 0.1;         // коэффициент трения (N·s/m)
m = 1;           // масса (кг)

// Вычисление собственных частот для разных длин
omega01 = sqrt(g / l1);
omega02 = sqrt(g / l2);
beta = b / (2 * m);

phi0 = 0.5;
dphi0 = 0;
initial = [phi0; dphi0];

t_start = 0;
t_step = 0.1;
t_end = 50;
t = t_start:t_step:t_end;

// Система дифференциальных уравнений для первого маятника
function dydt = pendulum_system1(t, y)
    phi = y(1);
    omega = y(2);
    dphidt = omega;
    domegadt = -2 * beta * omega - omega01^2 * sin(phi); // Исправлено на sin(phi)
    dydt = [dphidt; domegadt];
endfunction

// Система дифференциальных уравнений для второго маятника
function dydt = pendulum_system2(t, y)
    phi = y(1);
    omega = y(2);
    dphidt = omega;
    domegadt = -2 * beta * omega - omega02^2 * sin(phi); // Исправлено на sin(phi)
    dydt = [dphidt; domegadt];
endfunction

// Численное решение для обоих маятников
y1 = ode(initial, t_start, t, pendulum_system1);
y2 = ode(initial, t_start, t, pendulum_system2);

// Построение графиков
scf(1);
clf();
plot(t, y1(1,:), 'g-', 'LineWidth', 2); 
plot(t, y2(1,:), 'm-', 'LineWidth', 2); 
xlabel('Время t, с');
ylabel('Угол φ, рад');
title('Сравнение колебаний при разных длинах маятника');
legend(['l = ' + string(l1) + ' м', 'l = ' + string(l2) + ' м']);
xgrid;
