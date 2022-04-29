function [H] = calculhomo(x1,y1,z1,x2,y2) %recherche de la matrice H

A = [
    
	x1(1) y1(1) z1(1) 1 0 0 0 0 -x1(1)*x2(1) -y1(1)*x2(1) -z1(1)*x2(1);
    
    0 0 0 0 x1(1) y1(1) z1(1) 1 -x1(1)*y2(1) -y1(1)*y2(1) -z1(1)*y2(1);
    
	x1(2) y1(2) z1(2) 1 0 0 0 0 -x1(2)*x2(2) -y1(2)*x2(2) -z1(2)*x2(2);
    
	0 0 0 0 x1(2) y1(2) z1(2) 1 -x1(2)*y2(2) -y1(2)*y2(2) -z1(2)*y2(2); 
    
	x1(3) y1(3) z1(3) 1 0 0 0 0 -x1(3)*x2(3) -y1(3)*x2(3) -z1(3)*x2(3); 
    
	0 0 0 0 x1(3) y1(3) z1(3) 1 -x1(3)*y2(3) -y1(3)*y2(3) -z1(3)*y2(3);
    
	x1(4) y1(4) z1(4) 1 0 0 0 0 -x1(4)*x2(4) -y1(4)*x2(4) -z1(4)*x2(4);
    
	0 0 0 0 x1(4) y1(4) z1(4) 1 -x1(4)*y2(4) -y1(4)*y2(4) -z1(4)*y2(4);
    
    x1(5) y1(5) z1(5) 1 0 0 0 0 -x1(5)*x2(5) -y1(5)*x2(5) -z1(5)*x2(5);
    
	0 0 0 0 x1(5) y1(5) z1(5) 1 -x1(5)*y2(5) -y1(5)*y2(5) -z1(5)*y2(5);
    
    x1(6) y1(6) z1(6) 1 0 0 0 0 -x1(6)*x2(6) -y1(6)*x2(6) -z1(6)*x2(6);
    
	0 0 0 0 x1(6) y1(6) z1(6) 1 -x1(6)*y2(6) -y1(6)*y2(6) -z1(6)*y2(6);
    ];

c=[x2(1),y2(1),x2(2),y2(2),x2(3),y2(3),x2(4),y2(4),x2(5),y2(5),x2(6),y2(6)];
c=c';
h=A\c;

H=[ h(1) h(2) h(3) h(4);
    h(5) h(6) h(7) h(8);
    h(9) h(10) h(11) 1];
end