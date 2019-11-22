
% Alexander Dahlmann
% EE599 - Coding Project 2
%
clear, clc

tec = fopen('data.txt','r');
datr=fscanf(tec,'%f');
fclose(tec);
s=1;
rng('shuffle');
bootstrap1=999;
bootstrap2=100;

bs_test=(1:1:999);

dat=zeros(166,14);

for y_d =1:1:166
    for x_d=1:1:14
       dat(y_d,x_d)= datr(s);
       s=s+1;
    end
end

hold on
lambda = 0.44;
w=lambda+zeros(1,166);

x_ax=dat(1,1):1:dat(end,1);
y_vec = dat(:,14).';

s=1;
ne_iso=zeros[x_d y_d ;];
st=[1 1];
for y_d =1:1:166
    for x_d=1:1:14
    near_iso = @(y)(0.5*sum(dat(y_d,x_d)-y(1))^2)+lambda*sum(y(1)-y(2));
    ss = fminsearch(near_iso,st)
    ne_iso(x_d y_d 1) = ss(1);
    ne_iso(x_d y_d 2) = ss(2);
    end
end
for x=1:1:166
scatter(x_ax(x),y_vec(x),25,'r','filled')
end
