function [ image ] = Replace3D( image, segments, H2 )
%    Remplace les pixels de l'image extraite de la vid�o d'origine par les
%    pixels correspondant � la structure en 3 dimensions

% --- Donn�es
dimVid = size(image);
dimSeg = size(segments);
segments2 = zeros(dimSeg(1), 2);

% --- Calcul des coordonn�es des points dans l'image gr�ce � l'homographie
for k = 1:dimSeg(1)
    X1 = [segments(k,1) ; segments(k,2) ; segments(k,3) ; 1];
    X2 = H2 *X1;
    s2 = X2(3);
    i2 = round(X2(1)/s2);
    j2 = round(X2(2)/s2);
    if i2>0 && i2<dimVid(2) && j2>0 && j2<dimVid(1)        
        segments2(k,1) = i2;
        segments2(k,2) = j2;
    end    
end

% --- Trace les segments en reliant 2 points cons�cutifs deux � deux
image = Trace(segments2, image);


return;
