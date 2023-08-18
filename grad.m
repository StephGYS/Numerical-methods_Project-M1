function  [x, iter1] = grad(p,  gradf, x0, seuil, kmax, pas)
        % initialisation %
  x =x0;
  test = seuil+1;
        % les iterations de gradient a pas fixe %
  k=0;
  while  (test>seuil && k< kmax)
    d=-gradf(x(1),x(2));
    x=x+pas*d;
    test=norm(gradf(x(1),x(2)));
    k=k+1;
  endwhile
  %printf('le nombre d_itértions est:')
  iter1=k;
  printf ('le minimum_gradient est :')
  x;
endfunction

%%test
%grad(p=1, @(x1,x2)[ 2.*(x1-1)+4*1*x1.*(((x1).^2)-x2); -2*1.*(((x1).^2)-x2)],[0.4;0.3], 1e-5, 100, 0.1)