%This code is used for generating sin pattern 
%unit:um
%% define geometry 
clear;
m=10; %m is shrink factor in sin(x/m)
p=1;%p is period of sine
w=1;%width of sine
ph=pi/2;%phase shift
%% get geometry
x=0:m*pi/50:m*pi*2*p;
y1=sin(x/m+ph)+w/2;
y2=sin(x/m+ph)-w/2;
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

%% geometry feather
X=['width of sine is ',num2str(w)];
disp(X);
X=['length of sine is ',num2str(x(end))];
disp(X);
X=['ratio of length and width is ',num2str(x(end)/w)];
disp(X);
