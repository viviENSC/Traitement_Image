%video d'entrée
video=VideoReader("signal.mp4");
image=imread('image.jpg');
n=video.NumFrames;

%vidéo de sortie
Newvideo = VideoWriter('Newvideo.avi');
Newvideo.FrameRate = video.FrameRate;
open(Newvideo);

%initialisation des points
longX=size(image,1);
longY=size(image,2);
x1=[1 longY longY 1];
y1=[1 1 longX longX];
x13D=[1 longY longY 1 round(0.125*longY) round(0.5*longY)];
y13D=[1 1 longX longX round(0.875*longX) round(0.5*longX)];
z13D=[1 1 1 1 round(0.2*longX) round(0.3*longX)];
%pour la 3D
vpoints = [684 409; 1336 235; 1432 583; 628 767;760 539 ; 1024 362];
x2=[vpoints(1,1) vpoints(2,1) vpoints(3,1) vpoints(4,1)]; 
y2=[vpoints(1,2) vpoints(2,2) vpoints(3,2) vpoints(4,2)]; 
ptHautGauche1=[x2(1),y2(1)];ptHautDroite1=[x2(2),y2(2)];ptBasDroite1=[x2(3),y2(3)];ptBasGauche1=[x2(4),y2(4)];
ptHautGauche2=[x2(1),y2(1)];ptHautDroite2=[x2(2),y2(2)];ptBasDroite2=[x2(3),y2(3)];ptBasGauche2=[x2(4),y2(4)];
vpoints0 = vpoints;

%création de la nouvelle vidéo
for i=1:n
    frame = readFrame(video);
    %on affiche l'avancement de la création de la nouvelle vidéo
    m = round(i/n*100);
    disp(strcat('[',repmat('/', 1, m),repmat('_', 1,100-m),']'))
    
    %détection des points
    %Détermination des coins de la nouvelle image
    %[ptHautGauche2, ptHautGauche1] = UnCoinSuivant(frame, ptHautGauche2, ptHautGauche1);
    %[ptHautDroite2, ptHautDroite1] = UnCoinSuivant(frame, ptHautDroite2, ptHautDroite1);
    %[ptBasDroite2, ptBasDroite1] = UnCoinSuivant(frame, ptBasDroite2, ptBasDroite1);
    %[ptBasGauche2, ptBasGauche1] = UnCoinSuivant(frame, ptBasGauche2, ptBasGauche1);
    %vpoints=[ptHautGauche1(1) ptHautGauche1(2);ptHautDroite1(1) ptHautDroite1(2);ptBasDroite1(1) ptBasDroite1(2);ptBasGauche1(1) ptBasGauche1(2)];

    frame2 = double(frame); % Conversion en double pour pouvoir faire la moyenne des trois composantes couleur
    gray_frame = round((frame2(:,:,1)+frame2(:,:,2)+frame2(:,:,3))/3); %
    %On la met en gris (image en couleurs indexées)
    pointsTemp = vpoints; % On stocke les coins de la précédente image
    vpoints = GetCorners(gray_frame, vpoints0, vpoints, 17); % On trouve les nouveaux points
    vpoints0 = pointsTemp;

    x23D=[vpoints(1,1) vpoints(2,1) vpoints(3,1) vpoints(4,1) vpoints(4,1)+round(abs((vpoints(3,1)-vpoints(4,1))*0.15)) round(abs(vpoints(1,1)+vpoints(4,1))/2)+round(abs((vpoints(1,1)-vpoints(2,1))*0.55))];
    y23D=[vpoints(1,2) vpoints(2,2) vpoints(3,2) vpoints(4,2) vpoints(1,2)+round(abs((vpoints(1,2)-vpoints(4,2))*0.8)) round(abs(vpoints(1,2)+vpoints(2,2))/2)+round(abs((vpoints(1,2)-vpoints(4,2))*0.4))];
    
    %x23D=[vpoints(1,1) vpoints(2,1) vpoints(3,1) vpoints(4,1) vpoints(5,1) vpoints(6,1)]; 
    %y23D=[vpoints(1,2) vpoints(2,2) vpoints(3,2) vpoints(4,2) vpoints(5,1) vpoints(6,1)]; 

    masque = hand_masque(frame,x2,y2);
    %application d'un filtre moyenneur circulaire pour flouter les bords du
    %masque
    Filtre = fspecial('disk',10);
    masque = imfilter(masque,Filtre,'replicate');
    
    frame=remplaceimage(x1,y1,x23D,y23D,frame,image,masque);
    %Remplacement des pixels de la vidéo par la figure 3D
    segments=Segment3D(longY,longX);
    H3D=calculhomo3D(x13D,y13D,z13D,x23D,y23D);
    frame = Replace3D(frame, segments, H3D);
    %frame = DrawCircle(frame,y23D,x23D,10,200);
    writeVideo(Newvideo,frame);
end
close(Newvideo);