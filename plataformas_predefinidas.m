wells = [
    1 1; 2 1; 3 1;
    2 2; 3 2;
    3 3; 4 3;
    4 4; 6 4;
    4 5; 9 5;
    6 6;
    4 7; 8 7;
    5 8; 6 8; 10 8;
    6 9; 8 9; 10 9
];

rigs = [
    1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 1 0 0
    0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1
    0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 1 1 0 0 0
    1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
]' == 1;

rigsCost = [10 19 27 34 40 45 49 52 54 90];

a = 1;
d = 0.5;

p.cadIntAcep = 40;
p.cadInt = 80;
p.maxCad = 3;
p.frecImp = 40;
p.x0 = (randi(2,1,18) - 1 == 1)';
p.FcnObj = @(s) objective(s, rigs, wells, a, d, rigsCost);
p.FcnVec = @neighbor;
p.Imp = @imprimir;
p.variarC = 0;
p.alfa = 0.85;
p.beta = 1.05;
p.minRazAcep = 0.95;
p.min = 1;

[x,prom,desv] = plotRecocido(p,40, 2000);

% res = zeros(40, 2, 70);
% 
% for i = 1:40
%     corrida = recocido(p, 2000);
%     n = size(corrida.intentos,1);
%     res(i,1,:) = padarray(corrida.intentos, 70 - n, 'replicate', 'post');
%     res(i,2,:) = padarray(corrida.f, 70 - n, 'replicate', 'post');
% end
% 
% 
% stddev = std(res(:,2,:),1);
% 
% y1 = mean(res(:,2,:), 1);
% y2 = y1 + stddev;
% y3 = y1 - stddev;

%x = res(:,1,:);

plot(prom);
hold on
plot(prom + desv);
plot(prom - desv);
hold off
%hold on
%plot(x(1,:),y3(:));
%hold off