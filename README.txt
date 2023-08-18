Les détails de tous nos codes :


--> visual: la visualisation du graphe et des lignes de niveau de fp.


--> grad: le script de la méthode du gradient à pas fixe.
    Les paramètres d'entrées :
        p=le paramètre de la fonction fp
        gradf= le gradient de fp
        x0=l'initialisation des itérées
        seuil: le seuil de la condition de la boucle "while"
        kmax= le maximum d'itération
        pas= le pas fixe (la vitesse de convergence de la méthode)
     Les paramètres de sorties :
         x: la dernière itération du minimum approché
         iter1: le nombre d'itération pour le gradient à pas fixe.

--> newton : le script de la méthode de Newton-Raphson
     Les paramètres d'entrées :
         p=le paramètre de la fonction fp
         gradf= le gradient de fp
         Hessf= la matrice Hessienne de fp
         x0=l'initialisation des itérées
         seuil: le seuil de la condition de la boucle "while"
         kmax= le maximum d'itération
      Les paramètres de sorties :
         x: la dernière itération du minimum approché
         iter2: le nombre d'itération pour Newton-Raphson.


--> quasi : le script de la méthode de quasi-Newton.
    Les paramètres d'entrées :
        p=le paramètre de la fonction fp
        gradf= le gradient de fp
        x0=l'initialisation des itérées
        seuil: le seuil de la condition de la boucle "while"
        kmax= le maximum d'itération
        pas= le pas fixe (la vitesse de convergence de la méthode)
    Les paramètres de sorties :
        x: la dernière itération du minimum approché
        iter3: le nombre d'itération pour quasi-Newton.

J'ai préféré faire des script à part des fonctions pour pouvoir visualiser les itérées de chaque méthode.
--> t1: script de visualisation pour la méthode de gradient à pas fixe
--> t2: script de visualisation pour la méthode de Newton-Raphson
--> t3: script de visualisation pour la méthode de quasi-newton
Vous pourrez aussi remarquer qu'après "plot(x(1),x(2),'*')", j'affiche aussi le minimum réel x* sur
 le graphe par "text(1,1,'x*')" afin de m'aider à vérifier la convergence des itérées vers x*(1,1).