
% Alexander Dahlmann
% EE599 - Coding Project 2
%

a = readtable('data.txt');
dat = (table2array((a(:,:))));
hold on

x_ax=dat(1,1):1:dat(end,1);
y_vec = dat(:,14).';

for x=1:1:166
scatter(x_ax(x),y_vec(x),25,'r','filled')
end
