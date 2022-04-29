function [vid] = Trace(segments, vid)
%   Trace les segements entre les points renseignés dans la matrice segements

k = 1;
dimSeg = size(segments);
dimVid = size(vid);
R = 0;
G = 255;
B = 0;

while k < dimSeg(1)
    a = segments(k,:);
    b = segments(k+1,:);
    coef = (b(2)-a(2)) / (b(1) - a(1));
    ord = a(2) - a(1)*coef;
    nx = abs(a(1)-b(1));
    ny = abs(a(2)-b(2));
    if( nx >= ny )
        n = nx;
        x = round(linspace(a(1),b(1),n));
        y = round(x*coef + ord);
    else
        n = ny;
        y = round(linspace(a(2),b(2),n));
        x = round((y - ord)/coef);
    end
     
    
    for i = 1:n
        if x(i)>0 && x(i)<dimVid(2) && y(i)>0 && y(i)<dimVid(1) 
            vid(y(i),x(i),1) = R;
            vid(y(i),x(i),2) = G;
            vid(y(i),x(i),3) = B;

            if y(i)<dimVid(1)
                vid(y(i)+1,x(i),1) = R;
                vid(y(i)+1,x(i),2) = G;
                vid(y(i)+1,x(i),3) = B;
            end

            if(y(i)>1)
                vid(y(i)-1,x(i),1) = R;
                vid(y(i)-1,x(i),2) = G;
                vid(y(i)-1,x(i),3) = B;                
            end
            
            if(y(i)>2)
                vid(y(i)-2,x(i),1) = R;
                vid(y(i)-2,x(i),2) = G;
                vid(y(i)-2,x(i),3) = B;                
            end
            
            if(y(i)<dimVid(1)-2)
                vid(y(i)+2,x(i),1) = R;
                vid(y(i)+2,x(i),2) = G;
                vid(y(i)+2,x(i),3) = B;                
            end
        end
    end
    k = k+2;
end
return
end