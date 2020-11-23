%This code is used for generating taper pattern
%unit:um
clear;
%% define geometry
ler=100;         %longer side
ser=50;          %shoter side
length=1000;    %taper length 
%% get geometry
k=zeros(6,2);
k(1,1)=0;
k(1,2)=-ser/2;
k(2,1)=length/2;
k(2,2)=-ler/2;
k(3,1)=length/2;
k(3,2)=ler/2;
k(4,1)=0;
k(4,2)=ser/2;
k(5,1)=-length/2;
k(5,2)=ler/2;
k(6,1)=-length/2;
k(6,2)=-ler/2;
%% output element
ka=gds_element('boundary','xy',k,'layer',2);
%% creat a structure to hold element
sa=gds_structure('taper',ka);
%% output gds file
glib=gds_library('taper','uunit',1e-6,'dbunit',1e-9,sa);
write_gds_library(glib,'!taper.gds');
