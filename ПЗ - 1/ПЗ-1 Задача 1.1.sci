l = 10;
g = 9.81;
theta0 = 10;
theta0 = theta0 * %pi / 180;
t_max = 50;

omega0 = sqrt(g / l);
t = 0 : 0.1 : t_max;

// Аналитическое решение: угловое смещение
theta = theta0 * cos(omega0 * t);

scf(0);
clf();
plot(t, theta * 180 / %pi, 'b-', 'LineWidth', 2);
xgrid(1, 1, 3);
xlabel('Время t, с', 'fontsize', 3);
ylabel('Угол отклонения θ, градусы', 'fontsize', 3);
title('Закон движения математического маятника (малые колебания)', 'fontsize', 4);
