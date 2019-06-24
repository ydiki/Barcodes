function [ M,II ] =ext_sign(I,A,B,Nb)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
M=[];
P=[];
II=zeros(1,Nb);
for k=0:Nb-1
    P=floor(A+(k/(Nb-1))*(B-A));
    M=[M P'];
    II(k+1)=I(P(2),P(1));
end

end

