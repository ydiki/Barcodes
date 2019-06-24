close all;
clc;
clear all;


I=(imread('img_op8.jpg'));
D=filter_code(I,0.65);
figure,
imshow(D);
[X,Y]=size(D);
%% determiner les zones
% indx=[1:1:X]';
% indy=[1:1:Y];
% Matx=repmat(indx,1,Y);
% Maty=repmat(indy,X,1);
% xi=Matx(D==0);
% yi=Maty(D==0);
% M=[xi';yi'];
%% initialisation des variables
cle=1;
re=2;
i=1;
AA=[];
BB=[];
GG=[];
DD=[];
while(cle~=0 | re>1.7 | founded~=0 )
%% methode selection
% 
% [x,y]=ginput(2)
% A_rand=[floor(x(1)) floor(y(1))];
% B_rand=[floor(x(2)) floor(y(2))];

%% methode de bwlabel
CC = bwconncomp((1-D)*255);
nb=randi(CC.NumObjects);
%nb=1;
stats=regionprops(CC,'Centroid','Orientation');
G=floor(stats(nb).Centroid);
alpha=(pi/180)*stats(nb).Orientation;

blocks=CC.PixelIdxList{1,nb};
a=tan(alpha);
b=G(1)-a*G(2);
t=[1:1:100];
% figure,
% imshow(I)
% hold on
% plot(a*t+b);
%plot(G,[x_1,y_1])
%calcul de projection
u=[cos(alpha);sin(alpha)];
for k=1:length(blocks)
    xk=mod(blocks(k),X)+1;
    yk=floor(blocks(k)/X);
    scal(k)=getline(u,G,yk,xk);
end
scal_min=min(scal)-20;
scal_max=max(scal)+20;
A_rand=floor(G+scal_min*u');
B_rand=floor(G+scal_max*u');
%x_p=floor(x_p);
%y_p=floor(x_p);

% A_rand=[min(y_p) min(x_p)];
% B_rand=[max(y_p) max(x_p)];
%A_rand=[157 120];
%B_rand=[1020 260];
%% methode detection des zones 
% ran1=randi(length(xi));
% G=[yi(ran1) xi(ran1)];
% X_alph=min(abs(X-G(1)),G(1));
% Y_alph=min(abs(Y-G(2)),G(2));
% alpha_cr=atan(Y_alph/X_alph);
% alpha_rand=0;
% alpha_rand=pi*rand-alpha_cr;
% uni=(alpha_rand<alpha_cr);
% Dist_Max=floor(uni*X_alph*sqrt(1+tan(alpha_rand)^2)+(1-uni)*Y_alph*sqrt(1+tan(pi/2-alpha_rand)^2));
% A_rand=floor(G-(Dist_Max/2)*[sin(alpha_rand) cos(alpha_rand)]); 
% B_rand=floor(G+(Dist_Max/2)*([sin(alpha_rand) cos(alpha_rand)]));

%% methode aleatoire
% % 
% alpha_cr=atan(Y/X);
% alpha_rand=pi*rand-alpha_cr;
% alpha_rand=0;
% cos_nb=cos(alpha_rand);
% sin_nb=sin(alpha_rand);
% uni=(alpha_rand<alpha_cr);
% Dist_Max=floor(uni*X*sqrt(1+atan(alpha_rand)^2)+(1-uni)*Y*sqrt(1+atan(pi/2-alpha_rand)^2));
% Dist_rand=floor((Dist_Max-0.5*Dist_Max)*rand()+0.5*Dist_Max);
% 
% DD=[DD Dist_rand];
% G_xmin=floor(abs(cos(alpha_rand))*Dist_rand/2)+1;
% G_xmax=X-G_xmin;
% G_ymin=floor(abs(sin(alpha_rand))*Dist_rand/2+1);
% G_ymax=Y-G_ymin;
% G=floor([(G_xmax-G_xmin)*rand()+G_xmin (G_ymax-G_ymin)*rand()+G_ymin]);
% GG=[GG G'];
% A_rand=floor(G-(Dist_rand/2)*[cos(alpha_rand) sin(alpha_rand)])+1; 
% B_rand=floor(G+(Dist_rand/2)*([cos(alpha_rand) sin(alpha_rand)]))+1;
%% methode apres filtrage
 
%   A_rand=floor([(X/2-1)*rand()+1 (Y-1)*rand()+1]);
%   B_rand=floor([(X/2-1)*rand()+1+X/2  (Y-1)*rand()+1]);
% 
%    BB=[BB B_rand'];
%  AA=[AA A_rand'];


   [cle,re,founded,decoded]=extract_code( I,A_rand,B_rand);
i=i+1;
end