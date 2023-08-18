function  [x, iter3] = quasi(p,  gradf, x0, seuil, kmax, pas)
        % initialisation %
  x =x0;
  M = eye(2);
  r=-gradf(x(1),x(2));
  d=r; %d=-gradfp(x0)
  test = seuil+1;
        % les iterations de quasi Newton %
  k=0;
  while  (test>seuil && k< kmax)
    x = x + pas*d ;
    r=-gradf(x(1),x(2));
    d=M*r;          %d(k+1)=-M(k+1)*gradfp(x(k+1))
    % Calcul de M
    s=pas*d ;        %s(k)=x(k+1)-x(k) 
    y=gradf(x(1),x(2))+r ;      %y(k)=gradfp(x(k+1))-gradfp(x(k))
    S=eye(2,2)-((s*y')/dot(s,y)) ;
    M=S*M*S'+((s*s')/dot(s,y)) ;
    test=norm(r,2);
    k=k+1;
  endwhile
  %printf('le nombre d_itértions est:')
  iter3=k;
  printf ('le minimum_quasi est :')
  x;
endfunction

%test
%quasi(p=1, @(x1,x2)[ 2.*(x1-1)+4*1*x1.*(((x1).^2)-x2); -2*1.*(((x1).^2)-x2)], [0.4;0.3], 1e-5, 100, 0.1)