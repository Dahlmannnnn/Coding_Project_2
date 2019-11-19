
% Alexander Dahlmann
% EE599 - Coding Project 2
%
%function [] = Temp_Dat(~)
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

x_ax=dat(1,1):1:dat(end,1);
y_vec = dat(:,14).';

% bs_dat1 = zeros(bootstrap1);
% for d=1:1:bootstrap1
%    random = rand(1,2);
%    random(1) = round(random(1)*166);
%    random(2) = round(random(2)*14);
%    bs_dat1(d)= dat(random(2),random(1));
%    
% end
% 
% for x=1:1:bootstrap1
% scatter(bs_test(x),bs_dat1(x),25,'r','filled')
% end

for x=1:1:166
scatter(x_ax(x),y_vec(x),25,'r','filled')
end
%end