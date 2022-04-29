function point = MaximaLocal(D,encombrement) 
    %% Initialisation du max et de ses coordonn�es
    
    max = D(encombrement,encombrement); %Valeur du premier pixel du d�tecteur de Harris de la fen�tre de recherche
    point = [encombrement encombrement];
    
    %% Recherche de la valeur du max du d�tecteur de Harris et de ses coordonn�es dans la fen�tre
    
    for x=encombrement:size(D,1)-encombrement
        for y=encombrement:size(D,2)-encombrement
            if(D(y,x)>max) % Mise � jour du max
              max=D(y,x);
              point(:,1)=x; 
              point(:,2)=y; 
            end
        end
    end
end