function[R]=DetRobuste(img)

D1=Harris(img,3);
D2=Harris(img,5);

R=min(D1.*abs(D2),abs(D1).*D2);

end