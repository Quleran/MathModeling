x0 = 0; y0 = 0; yk = 0; xk = 6.25;
V0_values = 7.6:0.1:8.1;
g = 9.8; alpha = 45 * %pi / 180;


t_kon_results = zeros(V0_values);
D_results = zeros(V0_values);

for i = 1:length(V0_values)
    V0 = V0_values(i);
   
    deff('xm = x(t)', 'xm = x0 + V0 * cos(alpha) * t')
    deff('ym = y(t)', 'ym = y0 + V0 * sin(alpha) * t - g * t.^2 / 2')
    deff('Vym = Vy(t)', 'Vym = V0 * sin(alpha) - g * t')
    deff('z = f(tk)', 'z = V0 * sin(alpha) * tk - g * tk.^2 / 2 - (yk - y0)')

    tk = 0:0.01:1.5;
    t_kon = fsolve(1, f);
    D = x(t_kon) - xk;
    

    t_kon_results(i) = t_kon;
    D_results(i) = D;
    
    printf('Для V0 = %.1f м/с:\n', V0);
    printf('  Время полета: t_kon = %.3f с\n', t_kon);
    printf('  Промах: D = %.3f м\n', D);
    printf('\n');
end

