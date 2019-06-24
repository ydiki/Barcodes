function [ cle,re,founded,decoded] =extract_code( I,A,B )


%% Extraction de la signature le long d'un rayon 

N=256;
r=sqrt(sum((A-B).^2));
Nb=floor(r);
[M,II]=ext_sign(I,A,B,Nb);

figure(2);
plot(II);

h=hist(II,N);
[i,I2]=Otsu(N,II);
figure(3);
plot(I2);

[m,big]=min(I2);
[m,ennd]=min(fliplr(I2));
ennd=length(I2)-(ennd-1);

%new_A=A;
%new_B=B;
new_A=floor(A+big/length(I2)*(B-A));
new_B=floor(A+ennd/length(I2)*(B-A));
dAB=floor(sqrt(sum((new_A-new_B).^2)));
u=floor(dAB/95)+1;
Nb=u*95;
[ M2,II2 ] =ext_sign(I,new_A,new_B,Nb);
figure(4);
plot(II2);
[ii,III2]=Otsu(N,II2);
ii
length(III2)
figure(5);
plot(III2);

%% Identification des chiffres 

Categories= struct('ElementA',[],'ElementB',[],'ElementC',[]);
Sequences= struct('Seq',[]);
%N=0,B=1
Categories.ElementA=[ [1 1 1 0 0 1 0];[1 1 0 0 1 1 0];[1 1 0 1 1 0 0];[1 0 0 0 0 1 0];[1 0 1 1 1 0 0];[1 0 0 1 1 1 0];[1 0 1 0 0 0 0];[1 0 0 0 1 0 0];[1 0 0 1 0 0 0];[1 1 1 0 1 0 0]];
Categories.ElementB=[[1 0 1 1 0 0 0];[1 0 0 1 1 0 0 ];[1 1 0 0 1 0 0];[1 0 1 1 1 1 0];[1 1 0 0 0 1 0];[1 0 0 0 1 1 0];[1 1 1 1 0 1 0];[1 1 0 1 1 1 0];[1 1 1 0 1 1 0];[1 1 0 1 0 0 0]];
Categories.ElementC=[[0 0 0 1 1 0 1];[0 0 1 1 0 0 1];[0 0 1 0 0 1 1];[0 1 1 1 1 0 1];[0 1 0 0 0 1 1];[0 1 1 0 0 0 1];[0 1 0 1 1 1 1];[0 1 1 1 0 1 1];[0 1 1 0 1 1 1];[0 0 0 1 0 1 1 ]];
%A=0,B=1,C=2
Sequences.Seq=[[1 1 1 1 1 1];[1 1 0 1 0 0];[1 1 0 0 1 0];[1 1 0 0 0 1];[1 0 1 1 0 0];[1 0 0 1 1 0];[1 0 0 0 1 1];[1 0 1 0 1 0];[1 0 1 0 0 1];[1 0 0 1 0 1]];
Sequences.Seq=1-Sequences.Seq;

[cle,re,founded,decoded]=decodeall(III2,u,Categories,Sequences);
re
end 
