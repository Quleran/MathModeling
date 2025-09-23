x0=0;y0=0;yk=0;xk=4.225;
V0=6.44;g=9.8;alpha=45*%pi/180;
deff('xm=x(t)','xm=x0+V0*cos(alpha)*t')
deff('ym=y(t)','ym=y0+V0*sin(alpha)*t-g*t.^2/2')
deff('Vym=Vy(t)','Vym=V0*sin(alpha)-g*t')
Vx=V0*cos(alpha);
t=0:0.01:1.5;
plot(t,x(t),'b-',t,y(t),'r-',t,Vy(t),'g-')
legend('x(t)','y(t)','Vy(t)');
deff('z=f(tk)','z=V0*sin(alpha)*tk-g*tk.^2/2-(yk-y0)')
tk=0:0.01:1.5;fk=f(tk);
t_kon=fsolve(1,f)
D=x(t_kon)-xk

x_kon=x(t_kon);
y_kon=y(t_kon);
plot([t_kon,t_kon],[min(Vy(t)),max([x_kon,y_kon])],'k--','LineWidth',1)
plot([0,t_kon],[x_kon,x_kon],'b--','LineWidth',1)
plot([0,t_kon],[y_kon,y_kon],'r--','LineWidth',1)
plot(t_kon,x_kon,'bo','MarkerSize',6)
plot(t_kon,y_kon,'ro','MarkerSize',6)

xstring(t_kon,max([x_kon,y_kon])+0.5,'t_kon='+string(round(t_kon*100)/100))
xstring(t_kon/2,x_kon+0.3,'x(t_kon)='+string(round(x_kon*100)/100))
xstring(t_kon/2,y_kon,'y(t_kon)='+string(round(y_kon*100)/100))
xlabel('Время,с')
ylabel('Координаты и скорость,м/с')
title('Зависимости x(t), y(t) и Vy(t)')

scf(1);
clf();
plot(x(t),y(t),'b-','LineWidth',2)
plot(x_kon,y_kon,'ro','MarkerSize',8,'MarkerFaceColor','red')
plot(xk,yk,'ks','MarkerSize',8,'MarkerFaceColor','black')
xgrid(1)
xlabel('x, м')
ylabel('y, м')
title('Траектория полета y(x)')
legend('Траектория y(x)','Конечная точка','Цель')

printf('Время полета: t_kon = %.3f с\n',t_kon)
printf('Промах: D = %.3f м\n',D)
