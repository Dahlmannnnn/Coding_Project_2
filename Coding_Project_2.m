
% Alexander Dahlmann
% EE599 - Coding Project 2
%
clear, clc, clear global

%% Open data and save in variables

tec = fopen('data.txt','r');
datr=fscanf(tec,'%f');
fclose(tec);
s=1;
dat=zeros(166,14);
for y_d =1:1:166
    for x_d=1:1:14
       dat(y_d,x_d)= datr(s);
       s=s+1;
    end
end
global y

%% Define Misc. Variables

x_ax=dat(1,1):1:dat(end,1);
y_vec = dat(:,14).';
m=length(dat(:,14));
beta=ones(1,m);
beta2=ones(1,m);

%% Near-Iso Calculations

for a=1:1:m-1

y = y_vec(a);
start=[beta(a) beta(a+1)];
out= fminsearch(@minimization_ISO,start);
beta(a)=out(1);
beta(a+1)=out(2);

end

%% Near-Convex Calculations

for a=1:1:m-2
    
y = y_vec(a);
start=[beta2(a) beta2(a+1) beta2(a+2)];
out= fminsearch(@minimization_Conv,start);
beta2(a)=out(1);
beta2(a+1)=out(2);

end

%% Plots
subplot(2,1,1)
hold on
for x=1:1:166
scatter(x_ax(x),y_vec(x),25,'r','filled')
end
plot(x_ax,beta,'b')
ylim([-0.6 0.9])
hold off

subplot(2,1,2)
hold on
for x=1:1:166
scatter(x_ax(x),y_vec(x),25,'r','filled')
end
plot(x_ax,beta2,'b')
ylim([-0.6 0.9])
hold off

%% Additional Functions 

function obj=minimization_ISO(start)
global y
obj =0.5*((y-start(1))^2)+0.44*(abs(start(1)-start(2)));
end

function obj=minimization_Conv(start)
global y
obj =0.5*((y-start(1))^2)+0.44*(abs(start(1)-2*start(2)+start(3)));
end