function [ cle,ressem,founded,decoded ] = decodeall( vector,u,Categories,Sequences)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
vect1=vector(3*u+1:45*u);
vect2=vector(50*u+1:92*u);
decode1=[];
decoderABC1=[];
decoderressemblance=[];
decode2=[];
for i=1:6
    [m,a,ABC]=decode(vect1(7*(i-1)*u+1:7*(i)*u),u,Categories);
    decode1=[decode1 a];
    decoderABC1=[decoderABC1 ABC];
    decoderressemblance=[decoderressemblance m];
    [m,a,~]=decode(vect2(7*(i-1)*u+1:7*(i)*u),u,Categories);
    decode2=[decode2 a];
    decoderressemblance=[decoderressemblance m];
end
    decoded=[decode1 decode2];
    matseq=abs(Sequences.Seq-ones(10,1)*decoderABC1);
    mat=sum(matseq')';
    [founded,indc]=min(mat);
    indc=indc-1;
    test=[1:1:12];
    decoded=[indc decoded];
   % ressem=prod(decoderressemblance).^(1/12)
    ressem=mean(decoderressemblance)/u;
    cle=mod(decoded(13)+(sum(decoded)-decoded(13)+2*sum(decoded(mod(test,2)==0))),10);
    %decoded=[decoded mod(indc+sum(decoded)+2*sum(decoded(mod(test,2)==1)),10)];
    end

