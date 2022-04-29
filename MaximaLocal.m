function point = MaximaLocal(D,encombrement) 
    %% Initialisation du max et de ses coordonnées
    
    max = D(encombrement,encombrement); %Valeur du premier pixel du détecteur de Harris de la fenêtre de recherche
    point = [encombrement encombrement];
    
    %% Recherche de la valeur du max du détecteur de Harris et de ses coordonnées dans la fenêtre
    
    for x=encombrement:size(D,1)-encombrement
        for y=encombrement:size(D,2)-encombrement
            if(D(y,x)>max) % Mise à jour du max
              max=D(y,x);
              point(:,1)=x; 
              point(:,2)=y; 
            end
        end
    end
end