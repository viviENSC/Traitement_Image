function D = HarrisDetector(frame, sigma1, sigma2)
    %% Création des filtres dérivés gaussiens de paramètre sigma1
    
    %On crée une matrice au moins trois fois plus grande que sigma1
    [X,Y] = meshgrid(-round(3*sigma1+1):round(3*sigma1+1)); 
    
    %Calcul des dérivées selon X et Y des gaussiennes
    Gx1 = -(1/((sigma1^3)*(2*pi)^0.5))*X.*exp(-(X.^2+Y.^2)/(2*sigma1^2));
    Gy1 = -(1/((sigma1^3)*(2*pi)^0.5))*Y.*exp(-(X.^2+Y.^2)/(2*sigma1^2));
    
    %% Convolution de l'image avec les filtres gaussiens
    
    Ix = conv2(double(frame),double(Gx1),'same');
    Iy = conv2(double(frame),double(Gy1),'same');
    
    %% Création du filtre gaussien de paramètre sigma2
    
    [X,Y] = meshgrid(-round(3*sigma2+1):round(3*sigma2+1));
    G2 = (1/(sigma2*(2*pi)^0.5))*exp(-(X.^2+Y.^2)/(2*sigma2^2));
    
    %% Calcul de la matrice de covariance
    % | A  B |
    % | B  C |
    
    A = conv2(double(Ix.^2),double(G2),'same');
    C = conv2(double(Iy.^2),double(G2),'same');
    B = conv2(double(Ix.*Iy),double(G2),'same');
    
    %% Calcul du détecteur de Harris
    
    D = A.*C - B.^2 - 0.05*(A+C).^2;
end