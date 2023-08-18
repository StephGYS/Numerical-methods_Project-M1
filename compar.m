#-------------- la comparaison des méthodes ---------------#
clear all
close all
%pour t_compar p= 1 %kmax= 100 %seuil=1e-5 %x0=[0.5,0.3] %pas=0.1

%     les parametres  
p=1;
f=@(x1,x2) (x1-1).^2+ p*(((x1).^2)-x2).^2 ;
gradf=@(x1,x2) [ 2.*(x1-1)+4*p*x1.*(((x1).^2)-x2); -2*p.*(((x1).^2)-x2)];
Hessf=@(x1,x2) [2+4*p.*(3.*x1.-x2) -4*p.*x1;-4*p.*x1 2*p];

kmax=100; 
seuil=1e-5; 
x0=[0.4;0.3]; 
M=eye(2,2);
pas=0.1; 
x_min=[1;1]; %x*

%---------------Pour Algo de la methode de gradient----------% 
tic
[x_gradient,iter_gradient]=grad(p,  gradf, x0, seuil, kmax, pas)
T1=toc;
printf("Erreur_gradient:")
error1=abs(x_gradient-x_min)
printf("Temps_gradient :")
T1

%---------------     Algo de Newton-Raphson        ----------%
tic
[x_newton, iter_newton] = newton(p,  gradf, Hessf, x0, seuil, kmax)
T2=toc;
printf("Erreur_Newton :")
error2=abs(x_newton-x_min)
printf("Temps_Newton :")
T2

%---------------Algo de quasi-Newton       ----------%
tic
[x_quasi, iter_quasi] = quasi(p,  gradf, x0, seuil, kmax, pas)
T2=toc;
printf("Erreur_quasi-Newton :")
error3=abs(x_quasi-x_min)
printf("Temps_quasi-Newton :")
T2


