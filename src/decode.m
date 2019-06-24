function [ m,a,ABC ] = decode( code,u,Categories)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
corr_vect=[];
for i=1:length(Categories.ElementA)
    vect_dilt=u_size(Categories.ElementA(i,:),u);
    corr_vect=[corr_vect sum(abs(code-vect_dilt))];
    
    vect_dilt=u_size(Categories.ElementB(i,:),u);
    corr_vect=[corr_vect sum(abs(code-vect_dilt))];
    
    vect_dilt=u_size(Categories.ElementC(i,:),u);
    corr_vect=[corr_vect sum(abs(code-vect_dilt))];
    


end
[m,i]=min(corr_vect);
a=floor((i-1)/3);
ABC=mod((i-1),3);%A=0,B=1,C=2


end

