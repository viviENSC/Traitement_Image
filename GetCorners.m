function points = GetCorners(frame, points0, points, window)
    %% Initialisation des paramètres
    
    %Pour les gaussiennes
    sigma1 = 2.1;
    sigma21 = 3.1;
    sigma22 = 5.1;
    
    %Calcul de l'encombrement créé par la convolution des filtres
    encombrement = max(round(3*sigma1+1) + round(3*sigma21+1), round(3*sigma1+1) + round(3*sigma22+1));

    %% Prédiction de la position des coins
    
    deplacement=round((points-points0)/2);
    
    %% Définition des fenêtres de recherche
    
    window = window + encombrement;
    gauche=(points(:,1)-window)+deplacement(:,1);
    bas=(points(:,2)+window)+deplacement(:,2);
    droite=(points(:,1)+window)+deplacement(:,1);
    haut=(points(:,2)-window)+deplacement(:,2);
    
    %% Application du détecteur de Harris sur les 4 zones
    
    for i = 1:4
        frameHarris = frame(haut(i):bas(i), gauche(i):droite(i));
        D1 = HarrisDetector(frameHarris,sigma1,sigma21);
        D2 = HarrisDetector(frameHarris,sigma1,sigma22);
        D = min(D1 .* abs(D2), D2 .* abs(D1));
        points(i,:) = MaximaLocal(D,encombrement)+[gauche(i) haut(i)];
    end
end