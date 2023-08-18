%------------------------------Méthode de quasi-Newton----------------------%
clear all
close all

p=1; %a varier
%f=@(x,y) 3*(x+1).^2+ 2*(y-2).^2 -1;
f=@(x1,x2) (x1-1).^2+ p*(((x1).^2)-x2).^2 ;
xx=linspace(-2,2,20);
yy=linspace(-2,3,20);
[X,Y]=meshgrid(xx,yy);
T=f(X,Y);

%Visualisation  ligne de niveau
figure(4)
[C,H]=contour(X,Y,T,20,'ShowText','on','-'); %H  definit les proprietes apres avoir affiche le contour
clabel(C,H); %texte inseré dans chaque ligne
title('les iterees de la suite avec la methode de quasi-Newton avec p=1')
hold on

% Algo de quasi-Newton %
%Initialisation
%gradf=@(x,y) [ 6*(x-1); 4*(y-2)];
gradf=@(x1,x2) [ 2.*(x1-1)+4*p*x1.*(((x1).^2)-x2); -2*p.*(((x1).^2)-x2)];
x0=[0.4;0.3]; %[0.4;0.3]
x=x0;
M=eye(2,2);
r=-gradf(x(1),x(2));
d=r; %d=-gradfp(x0)
pas=0.1; %pas fixe 0.1
%test=norm(r,2);
seuil=1e-5;
test=seuil+1;
kmax=100;

k=0;
while (test>seuil && k<kmax)
  x=x+pas*d;
  r=-gradf(x(1),x(2));
  d=M*r ; %d(k+1)=-M(k+1)*gradfp(x(k+1))
  % Calcul de M
  s=pas*d ; %s(k)=x(k+1)-x(k) 
  y=gradf(x(1),x(2))+r ; %y(k)=gradfp(x(k+1))-gradfp(x(k))
  S=eye(2,2)-((s*y')/dot(s,y)) ;
  M=S*M*S'+((s*s')/dot(s,y)) ;
  test=norm(r,2);
  % graphe
  plot(x(1),x(2),'*')
  text(1,1,'x*')
  k=k+1;
endwhile
iter3=k
x
% quasi(p=1, @(x1,x2)[ 2.*(x1-1)+4*1*x1.*(((x1).^2)-x2); -2*1.*(((x1).^2)-x2)], [0.4;0.3], 1e-5, 100, 0.1)