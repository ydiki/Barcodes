%TP TS225
%DIKI Youssef
%ATIA Abdessamad
function [DD] = filter_code(img,par)


%%
%%%%%%%%%%%%%%%%%%%
%%% 1ère partie %%%
%%%%%%%%%%%%%%%%%%%

%% Visualisation
G=rgb2gray(img);
[h,w]=size(G);
%% Gradient matlab

% la fonction gradient retourne les gradient (un opérateur de dérivation
% spatiale) d'une matrice suivant les differents directions
% afin de detecter les contours 

%gradient sous filtrage
H1=[1 -1];
H2=H1';
G1=conv2(G,H1,'same');
G2=conv2(G,H2,'same');
G0=(G1.^2+G2.^2).^(0.5);

%% Norme du gradient
sigma_t = 17;
%sigma_t = floor((h+w)/(2*300));
[X,Y] = meshgrid(-3*sigma_t:3*sigma_t);
W = exp(-(X.^2+Y.^2)/(2*sigma_t^2))/(2*pi*sigma_t^2);
%sigma_g = floor((h+w)/(3*1));
sigma_g = 1;
[X,Y] = meshgrid(-3*sigma_g:3*sigma_g);
Gx = -X.*exp(-(X.^2+Y.^2)/(2*sigma_g^2))/(2*pi*sigma_g^4);
Gy = -Y.*exp(-(X.^2+Y.^2)/(2*sigma_g^2))/(2*pi*sigma_g^4);
Gcann1_x=conv2(G,Gx,'same');
Gcann1_y=conv2(G,Gy,'same');
Gcann_x=Gcann1_x./sqrt(Gcann1_x.^2+Gcann1_y.^2);
Gcann_y=Gcann1_y./sqrt(Gcann1_x.^2+Gcann1_y.^2);

Txy=conv2(Gcann_x.*Gcann_y,W,'same');
Tyy=conv2(Gcann_y.*Gcann_y,W,'same');
Txx=conv2(Gcann_x.*Gcann_x,W,'same');

D=sqrt((Txx-Tyy).^2+4*Txy.^2)./(Txx+Tyy);
figure,
imshow(D);
DD=D;

DD(D<par)=1;
DD(D>par)=0;

end
