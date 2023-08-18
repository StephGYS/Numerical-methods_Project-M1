%--------------------- Visualisation_Méthode de gradient ----------------------%
clear all
close all

p=1; 
f=@(x1,x2) (x1-1).^2+ p*(((x1).^2)-x2).^2 ;
xx=linspace(-2,2,20);
yy=linspace(-1,3,20);
[X,Y]=meshgrid(xx,yy);
T=f(X,Y);

%Visualisation  ligne de niveau
figure(2)
[C,H]=contour(X,Y,T,20,'ShowText','on','-'); 
title('les iterees de la suite avec la methode du gradient pas=1')
hold on

                      %Algo de la methode de gradient%
%Initialisation 
kmax=100; 
seuil=1e-5; 
gradf=@(x1,x2) [ 2.*(x1-1)+4*p*x1.*(((x1).^2)-x2); -2*p.*(((x1).^2)-x2)];
k=0;
x0=[0;0]; 
x=x0;
pas=0.1; 
test=seuil+1;
while( test>seuil && k<kmax)
d=-gradf(x(1),x(2));
x=x+pas*d;
test=norm(gradf(x(1),x(2)));
plot(x(1),x(2),'*')
text(1,1,'x*')
k=k+1;
endwhile
iter1=k
x %le min approché 