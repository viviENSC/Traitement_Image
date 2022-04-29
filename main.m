maVideo=VideoReader('vid_in2.mp4');
%implay('vid_in2.mp4')
nbFrames=get(maVideo,'NumFrames');%On récupère le nombre d'image
% dans la vidéo
video=read(maVideo);
frame1=video(:,:,:,1);%On récupère la première image de la vidéo

%On a besoin de récupérer manuellement les 4 premiers points car le reste
%du code va en dépendre

%figure, imshow(frame1)
%[x,y]=ginput(4);
%ptHautGauche1=[x(1),y(1)];
%ptHautDroite1=[x(2),y(2)];
%ptBasDroite1=[x(3),y(3)];
%ptBasGauche1=[y(4),y(4)];
%ptHautGauche2=[x(1),y(1)];
%ptHautDroite2=[x(2),y(2)];
%ptBasDroite2=[x(3),y(3)];
%ptBasGauche2=[y(4),y(4)];
vpoints = [684 409; 1336 235; 1432 583; 628 767;760 539 ; 1024 362];
x2=[vpoints(1,1) vpoints(2,1) vpoints(3,1) vpoints(4,1)]; 
y2=[vpoints(1,2) vpoints(2,2) vpoints(3,2) vpoints(4,2)]; 
ptHautGauche1=[x2(1),y2(1)];ptHautDroite1=[x2(2),y2(2)];ptBasDroite1=[x2(3),y2(3)];ptBasGauche1=[x2(4),y2(4)];
ptHautGauche2=[x2(1),y2(1)];ptHautDroite2=[x2(2),y2(2)];ptBasDroite2=[x2(3),y2(3)];ptBasGauche2=[x2(4),y2(4)];

writer = VideoWriter('test');
writer.FrameRate = maVideo.FrameRate;
open(writer);

i = 1;
while i < nbFrames + 1

    frame = read(maVideo, i); 

    [ptHautGauche2, ptHautGauche1] = UnCoinSuivant(frame, ptHautGauche2, ptHautGauche1);
    [ptHautDroite2, ptHautDroite1] = UnCoinSuivant(frame, ptHautDroite2, ptHautDroite1);
    [ptBasDroite2, ptBasDroite1] = UnCoinSuivant(frame, ptBasDroite2, ptBasDroite1);
    [ptBasGauche2, ptBasGauche1] = UnCoinSuivant(frame, ptBasGauche2, ptBasGauche1);
    
    %fonction dessine croix

    coins=[ptHautGauche1;ptHautDroite1;ptBasDroite1;ptBasGauche1];
    newFrame=DessineCroix(frame,coins);
    
    writeVideo(writer, newFrame);
    
    i = i + 1;
    
end