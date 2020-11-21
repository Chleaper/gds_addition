%This code is used for generate sin pattern 

%% define geometry
clear;
x=0:pi/50:2*pi;
y1=sin(x)+0.5;
y2=sin(x)-0.5;
n=length(x);
%% figure
plot(x,y1);
hold on;
plot(x,y2);
%% polygon coordinate
k=zeros(2*n,2);
    for i=1:n
        k(i,1)=x(1,i);
        k(i,2)=y1(1,i);
        k(n+i,1)=x(1,n+1-i);
        k(n+i,2)=y2(1,n+1-i);
    end

%% output element
ka=gds_element('boundary','xy',k,'layer',2);

%% creat a structure to hold element
sa=gds_structure('sine',ka);

%% output gds file
glib=gds_library('sine','uunit',1e-6,'dbunit',1e-9,sa);
write_gds_library(glib,'!sine.gds');
