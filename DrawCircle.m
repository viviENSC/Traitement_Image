function frame = DrawCircle(frame, x0, y0, r, n)
%% Cr�ation d'un cercle autour des 4 points d�finis par x0 et y0
    for i = 1:6;
        for j = 0:n; %n : nombre de pixels � mettre en rouge
            %% Calcul des coordonn�es du pixel � modifier
            theta = 2*pi*j*1/n; 
            x = x0(i) + round(r * cos(theta));
            y = y0(i) + round(r * sin(theta));
            %% Passage en rouge du pixel
            frame(x,y,1)=255;
            frame(x,y,2)=0;
            frame(x,y,3)=0;
        end
    end
end