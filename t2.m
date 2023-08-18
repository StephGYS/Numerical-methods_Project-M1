%------------------------------Méthode de Newton-Raphson----------------------%
clear all
close all

p=1; % 1
f=@(x1,x2) (x1-1).^2+ p*(((x1).^2)-x2).^2 ;
%f=@(x,y) 3*(x+1).^2+ 2*(y-2).^2 -1;
xx=linspace(-2,2,20);
yy=linspace(-2,3,20);
[X,Y]=meshgrid(xx,yy);
T=f(X,Y);

%Visualisation  ligne de niveau
figure(3)
[C,H]=contour(X,Y,T,20,'ShowText','on','-'); %H  definit les proprietes apres avoir affiche le contour
clabel(C,H); %texte inseré dans chaque ligne
title('les iterees de la suite avec la methode de Newton p=1')
hold on

%-------------------------Algo de Newton-Raphson---------------------- %
%Initialisation 
gradf=@(x1,x2) [ 2.*(x1-1)+4*p*x1.*(((x1).^2)-x2); -2*p.*(((x1).^2)-x2)];
%gradf=@(x,y) [ 6*(x-1); 4*(y-2)];
Hessf=@(x1,x2) [2+4*p.*(3.*x1.-x2) -4*p.*x1;-4*p.*x1 2*p];
%Hessf=@(x1,x2) [6 0;0 4];
x0=[0.4;0.3]; %[0.4;0.3]
x=x0;
r=-gradf(x(1),x(2));
d=r;
k=0;
%test=norm(r,2);

seuil=1e-5; %1e-5
test=seuil+1;
kmax=100;

while (test>seuil && k<kmax)
  H=Hessf(x(1),x(2));
  d=H\r;
  x=x+d;
  r=-gradf(x(1),x(2));
  test=norm(r,2);
  plot(x(1),x(2),'*')
  text(1,1,'x*')
  k=k+1;
endwhile
iter2=k
x
%test


