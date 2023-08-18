function  [x, iter2] = newton(p,  gradf, Hessf, x0, seuil, kmax)
        % initialisation %
  x =x0;
  r=-gradf(x(1),x(2));
  d=r; 
  test = seuil+1;
        % les iterations de Newton_Raphson %
  k=0;
  while  (test>seuil && k< kmax)
    H=Hessf(x(1),x(2));
    d=H\r;
    x=x+d;
    r=-gradf(x(1),x(2));
    test=norm(r,2);
    k=k+1;
  endwhile
  %printf('le nombre d_itértions est:')
  iter2=k;
  printf ('le minimum_Newton est :')
  x;
endfunction

%test
%newton(p=1, @(x1,x2)[ 2.*(x1-1)+4*1*x1.*(((x1).^2)-x2); -2*1.*(((x1).^2)-x2)],@(x1,x2) [2+4*p.*(3.*x1.-x2) -4*p.*x1;-4*p.*x1 2*p], [0.4;0.3], 1e-5, 100)