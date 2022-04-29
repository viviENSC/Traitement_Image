function [ seg ] = GetFig3D( dim )
%   Revoie une figure 3D réalisée à partir de points à relier 2 à 2

seg=[%cadre bas
        1 1 1 ; 1 1 3 ; 
        dim(2) 1 1 ; dim(2) 1 3 ; 
        dim(2) dim(1) 1 ; dim(2) dim(1) 3 ; 
        1 dim(1) 1 ; 1 dim(1) 3
        %cadre haut
        1 1 3 ; dim(2) 1 3 ; 
        dim(2) 1 3 ; dim(2) dim(1) 3 ;
        dim(2) dim(1) 3 ; 1 dim(1) 3 ;
        1 dim(1) 3 ; 1 1 3;
    




]
    segments = [
        %cadre surélevé à 3 de hauteur
        1 1 3 ; dim(2) 1 3 ; 
        dim(2) 1 3 ; dim(2) dim(1) 3 ;
        dim(2) dim(1) 3 ; 1 dim(1) 3 ;
        1 dim(1) 3 ; 1 1 3;
        %pyramide
        1 1 3 ; dim(2)/2 dim(1)/2 10 ;
        dim(2) 1 3 ; dim(2)/2 dim(1)/2 10 ;
        dim(2) dim(1) 3 ; dim(2)/2 dim(1)/2 10 ;
        1 dim(1) 3 ; dim(2)/2 dim(1)/2 10 ; 
        %case en dessous
        1 1 1 ; 1 1 3 ; 
        dim(2) 1 1 ; dim(2) 1 3 ; 
        dim(2) dim(1) 1 ; dim(2) dim(1) 3 ; 
        1 dim(1) 1 ; 1 dim(1) 3
    ];
end


