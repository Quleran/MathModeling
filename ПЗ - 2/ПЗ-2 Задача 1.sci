clear; clc;

x0 = 1000000;
t = 0:0.1:15

// D = 0, R > 0
D1 = 0; R1 = 0.2; 
x1 = x0 * exp((R1 - D1)*t);

// D > R, R > 0
D2 = 0.4; R2 = 0.2; 
x2 = x0 * exp((R2 - D2)*t);

// D < R, R > 0
D3 = 0.1; R3 = 0.2; 
x3 = x0 * exp((R3 - D3)*t);

// D = R, R > 0
D4 = 0.2; R4 = 0.2; 
x4 = x0 * exp((R4 - D4)*t);


scf(0);
clf();
plot(t, x1, 'b-', 'LineWidth', 2);
xlabel('Время (t)', 'fontsize', 3);
ylabel('Численность популяции (x)', 'fontsize', 3);
title('Модель Мальтуса: Динамика численности популяции (D = 0, R > 0)', 'fontsize', 4);

scf(1);
clf();
plot(t, x2, 'b-', 'LineWidth', 2);
xlabel('Время (t)', 'fontsize', 3);
ylabel('Численность популяции (x)', 'fontsize', 3);
title('Модель Мальтуса: Динамика численности популяции (D > R, R > 0)', 'fontsize', 4);

scf(2);
clf();
plot(t, x3, 'b-', 'LineWidth', 2);
xlabel('Время (t)', 'fontsize', 3);
ylabel('Численность популяции (x)', 'fontsize', 3);
title('Модель Мальтуса: Динамика численности популяции (D < R, R > 0)', 'fontsize', 4);

scf(3);
clf();
plot(t, x4, 'b-', 'LineWidth', 2);
xlabel('Время (t)', 'fontsize', 3);
ylabel('Численность популяции (x)', 'fontsize', 3);
title('Модель Мальтуса: Динамика численности популяции (D = R, R > 0)', 'fontsize', 4);

scf(4);
clf();
plot(t, x1, 'b-', 'LineWidth', 2);
plot(t, x2, 'g-', 'LineWidth', 2);
plot(t, x3, 'r-', 'LineWidth', 2);
plot(t, x4, 'k-', 'LineWidth', 2);
xlabel('Время (t)', 'fontsize', 3);
ylabel('Численность популяции (x)', 'fontsize', 3);
title('Модель Мальтуса: Динамика численности популяции (D = 0, R > 0)', 'fontsize', 4);
legend(['D = 0, R > 0 (R = ' + string(R1) + ')'; 
        'D > R (R = ' + string(R2) + ', D = ' + string(D2) + ')';
        'D < R (R = ' + string(R3) + ', D = ' + string(D3) + ')';
        'D = R (R = ' + string(R4) + ', D = ' + string(D4) + ')'], 2);
