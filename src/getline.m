function [ scal] = getline(u,G,xi,yi)
%AH=(abs(y_de_noire-a*x_de_noire-b)/sqrt(1+a.^2));
%[h,w]=size(I);
% alpha=atan(-1/a);
% a1=-1/a;
% b1=(1/a)*xi+yi;
% xh=(b1-b)/(a+(1/a));
% yh=(b+a*a*b1)/(1+a*a);
P=[xi yi];
scal=(P-G)*u;

%distance



%dist=abs(yi-a*xi-b)/sqrt(1+(a.^2));
   
% xh = dist*cos(alpha) + xi;
% yh = dist*sin(alpha) + yi;
% if(yh>=h & xh>=w) 
%     xh=[];
%     yh=[];
% end
% [w,h] = size(I);
% dist=1;
% x=G(2);
% y=G(1);
%     while(x<=w & y<=h)
%         x = dist*cos(alpha) + G(2);
%         y = dist*sin(alpha) + G(1);
%         dist=dist+1;
%     end
end