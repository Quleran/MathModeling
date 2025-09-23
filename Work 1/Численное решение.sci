// ПЕРВЫЙ РАСЧЕТ (dt=0.02)
x0=0; y0=0; V0=6.44; g=9.8; alpha=%pi/4;
tn=0; tk=1; dt=0.02;

deff('x_an = x_a(t)', 'x_an = x0 + V0 * cos(alpha) * t')
deff('y_an = y_a(t)', 'y_an = y0 + V0 * sin(alpha) * t - (g * t^2)/2')
deff('Vy_an = Vy_a(t)', 'Vy_an = V0 * sin(alpha) - g * t')

// Вычисляем аналитические значения в конечный момент времени t=1с
x_an_end = x_a(tk);
y_an_end = y_a(tk);
Vy_an_end = Vy_a(tk);

x=x0; y=y0; Vx=V0*cos(alpha); Vy=V0*sin(alpha);
for t=tn+dt:dt:tk
    x=x+Vx*dt;
    y=y+Vy*dt;
    Vy=Vy-g*dt;
end
printf('\n=== РЕЗУЛЬТАТЫ ПРИ t=1с (dt=0.02) ===\n');
printf('Координата X: %8.6f м\n', x);
printf('Координата Y: %8.6f м\n', y);
printf('Скорость Vy:  %8.6f м/с\n', Vy);

// Для решения с шагом dt1=0.02
err_x_rel1 = abs(x - x_an_end) / abs(x_an_end) * 100;
err_y_rel1 = abs(y - y_an_end) / abs(y_an_end) * 100;
err_Vy_rel1 = abs(Vy - Vy_an_end) / abs(Vy_an_end) * 100;

x=x0; y=y0; Vx=V0*cos(alpha); Vy=V0*sin(alpha);
dt2 = dt / 2;
for t=tn+dt2:dt2:tk
    x=x+Vx*dt2;
    y=y+Vy*dt2;
    Vy=Vy-g*dt2;
end
printf('\n=== РЕЗУЛЬТАТЫ ПРИ t=1с (dt=0.01) ===\n');
printf('Координата X: %8.6f м\n', x);
printf('Координата Y: %8.6f м\n', y);
printf('Скорость Vy:  %8.6f м/с\n', Vy);


printf('\n=== РЕЗУЛЬТАТЫ АНАЛИТИЧЕСКОГО РЕШЕНИЯ t=1с ===\n');
printf('Координата X: %8.6f м\n', x_an_end);
printf('Координата Y: %8.6f м\n', y_an_end);
printf('Скорость Vy:  %8.6f м/с\n', Vy_an_end);

// РАСЧЕТ ОТНОСИТЕЛЬНЫХ ПОГРЕШНОСТЕЙ
// Для решения с шагом dt2=0.01
err_x_rel2 = abs(x - x_an_end) / abs(x_an_end) * 100;
err_y_rel2 = abs(y - y_an_end) / abs(y_an_end) * 100;
err_Vy_rel2 = abs(Vy - Vy_an_end) / abs(Vy_an_end) * 100;

// Вывод результатов погрешностей
printf('\n--- ОТНОСИТЕЛЬНЫЕ ПОГРЕШНОСТИ (в %%) ---\n');
printf('Для dt = 0.02с:\n');
printf('  Погрешность координаты X: %1.4f%%\n', err_x_rel1);
printf('  Погрешность координаты Y: %1.4f%%\n', err_y_rel1);
printf('  Погрешность скорости Vy:  %1.4f%%\n', err_Vy_rel1);

printf('\nДля dt = 0.01с:\n');
printf('  Погрешность координаты X: %1.4f%%\n', err_x_rel2);
printf('  Погрешность координаты Y: %1.4f%%\n', err_y_rel2);
printf('  Погрешность скорости Vy:  %1.4f%%\n', err_Vy_rel2);


