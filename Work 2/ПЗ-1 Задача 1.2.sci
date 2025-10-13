l1 = 20;  // Первая длина маятника
l2 = 40;  // Вторая длина маятника
g = 9.81;
theta0 = 10;
theta0 = theta0 * %pi / 180;
t_max = 50;

// Собственные частоты для двух длин
omega1 = sqrt(g / l1);
omega2 = sqrt(g / l2);
t = 0 : 0.1 : t_max;

// Аналитические решения для двух маятников
theta1 = theta0 * cos(omega1 * t);
theta2 = theta0 * cos(omega2 * t);

scf(0);
clf();
plot(t, theta1 * 180 / %pi, 'b-', 'LineWidth', 2);
plot(t, theta2 * 180 / %pi, 'r-', 'LineWidth', 2);
xgrid(1, 1, 3);
xlabel('Время t, с', 'fontsize', 3);
ylabel('Угол отклонения θ, градусы', 'fontsize', 3);
title('Сравнение движения математических маятников разной длины', 'fontsize', 4);
legend(['L = 20 м'; 'L = 40 м'], 2);

// Вывод периодов колебаний для справки
T1 = 2*%pi/omega1;
T2 = 2*%pi/omega2;
printf("Период колебаний для L = 20 м: T1 = %.2f с\n", T1);
printf("Период колебаний для L = 40 м: T2 = %.2f с\n", T2);
printf("Отношение периодов T2/T1 = %.2f\n", T2/T1);
