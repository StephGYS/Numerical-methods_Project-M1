clear all
close all

#### PROJET 742: Minimisation d’une fonction de type “vallée large” ####
                 #deadline 06/12/2021
              % Etude mathématique de la fonction fp question 5 %
p=10;
f=@(x1,x2) (x1-1).^2+ p*(((x1).^2)-x2).^2 ;
xx=linspace(-50,50,50);
yy=linspace(-50,50,50);
%xx=linspace(-1,1,20);
%yy=linspace(-1,1,20);
[X,Y]=meshgrid(xx,yy);
T=f(X,Y);


figure(1)
%Visualisation graphe
subplot(121)
%mesh(X,Y,T)
%hold on
surf(X,Y,T)
xlabel('x1...')
ylabel('x2...')
zlabel('f(x1,x2)')
title('le graphe de fp avec p=10')

%Visualisation  ligne de niveau
subplot(122)
[C,H]=contour(X,Y,T,30,'ShowText','on','-'); %H  definit les proprietes apres avoir affiche le contour
clabel(C,H); %texte inseré dans chaque ligne
title('les lignes de niveau de fp avec p=10')
hold on
