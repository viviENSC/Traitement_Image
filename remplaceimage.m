function [frame]= remplaceimage(x1,y1,x2,y2,frame,image,masque)
H=calculhomo(x1,y1,x2,y2);
iH=inv(H);  %on inverse la matrice
[X, Y] = meshgrid(1:1920, 1:1080);
N1=[X(:)';Y(:)';X(:)'*0+1];  %on crée un vecteur [X,Y,1] (coordonnées homogènes) 
N2=iH*N1; %pour pouvoir appliquer la matrice de taille 3/3

Xnew=round(N2(1,:)./N2(3,:));   %coordonnées de chaque pixel de l'image après application de l'homographie
Ynew=round(N2(2,:)./N2(3,:));
%création du masque
masque = reshape(masque,1,numel(masque));
% on moyenne pour que le filtre soit lissé autour de la main
masque = masque > 0.7;
A = ( Xnew > 0 ) .* (Xnew < size(image,2)) .* (Ynew > 0) .* (Ynew<size(image,1));
%création du détourage de la main puis application de la fonction
%on enlève les points hors de l'image
A = A .* masque;
coordA=find(A);% on garde que les indices différents de 0
Xnew=Xnew(coordA);
Ynew=Ynew(coordA);
X=X(coordA);
Y=Y(coordA);

frame(Y + (X -1) .* size(frame, 1)) = image(Ynew + (Xnew -1).*size(image,1));
frame(Y + (X -1) .* size(frame, 1) + size(frame,1)*size(frame,2)) = image(Ynew + (Xnew -1).*size(image,1)+ size(image,1)*size(image,2));
frame(Y + (X -1) .* size(frame, 1) + size(frame,1)*size(frame,2)*2) = image(Ynew + (Xnew -1).*size(image,1)+ size(image,1)*size(image,2)*2);
end