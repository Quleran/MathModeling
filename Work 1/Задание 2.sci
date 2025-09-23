x0 = 0; y0 = 0; yk = -0.5; xk = 4.23;
D =0.02;
g = 9.8; alpha = 45 * %pi / 180;

deff('z = f_tk(tk, V0)', 'z = V0 * sin(alpha) * tk - g * tk.^2 / 2 - (yk - y0)')

deff('D_calc = f_D(V0)', ...
     ['t_kon = fsolve(1, list(f_tk, V0));', ...
      'D_calc = (x0 + V0 * cos(alpha) * t_kon - xk)'])

deff('error = target_function(V0)', 'error = f_D(V0) - D')

V0_guess = 7.2;
V0_solution = fsolve(V0_guess, target_function)

t_kon = fsolve(1, list(f_tk, V0_solution))
D_calculated = f_D(V0_solution)

printf('Начальная скорость: V0 = %.3f м/с\n', V0_solution)
printf('Время полета: t_kon = %.3f с\n', t_kon)
printf('Расчетный промах: D = %.3f м\n', D_calculated)
