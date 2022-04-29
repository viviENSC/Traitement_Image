function [Masque] = hand_masque(frame,x2,y2)


x = 1:size(frame,2);
y = 1:size(frame,1);
xbis=[x2(1),x2(2),x2(3),x2(4)];
ybis=[y2(1),y2(2),y2(3),y2(4)];
% afin d'appliquer le masque seulement sur l'endroit de la vidéo qui nous
% intéresse (la feuille), on trace comme un rectangle autour de la feuille
% (parce qu'on ne peut pas appliquer des conditions en diagonale) et on
% prend les x et les y qui sont seulement à l'intérieur de ce rectangle.
% ces x et y sont stockés dans la matrice pos
X = (x>100) .*  (x<1800);
Y = (y>100) .* (y<1000);

% on inverse le vecteur X pour faire la grille sinon c'est deux vecteurs
% verticaux.
pos = X.*Y';

Rouge = frame(:,:,1);
Vert = frame(:,:,2);
Bleu = frame(:,:,3);

% on utilise le Cr pour détecter la main car c'est ce qui rend la main la
% plus contrastée par rapport à la feuille en entier
Cr = 0.5*Rouge-0.4187*Vert - 0.0813*Bleu+128;

Masque = (Cr < 130);

%on applique le masque seulement à l'endroit d'intérêt, le rectangle que
%l'on a défini plus haut.
Masque = Masque.*pos;