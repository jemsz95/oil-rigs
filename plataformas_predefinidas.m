main();

function main()
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

    p.cadIntAcep = 60;
    p.cadInt = 100;
    p.maxCad = 5;
    p.frecImp = 50;
    p.x0 = (randi(2,1,18) - 1 == 1)';
    p.FcnObj = @(s) objective(s, rigs, wells, a, d, rigsCost);
    p.FcnVec = @neighbor;
    p.Imp = @imprimir;
    p.variarC = 0;
    p.alfa = 0.9;
    p.beta = 1.05;
    p.minRazAcep = 0.95;
    p.min = 1;

    [x,prom,desv] = plotRecocido(p, 30, 2000);
    
    plot(x, prom);
    hold on;
    plot(x, prom + desv);
    plot(x, prom - desv);
    hold off;
    
%     % repeticiones de recocido
%     rep = 100;
%     % tamano de vector final
%     s = 150;
%     
%     res = zeros(rep, 2, s);
% 
%     for i = 1:rep
%         corrida = recocido(p, 2000);
%         n = size(corrida.intentos,1);
%         res(i,1,:) = padarray(corrida.intentos, s - n, 'replicate', 'post');
%         res(i,2,:) = padarray(corrida.f, s - n, 'replicate', 'post');
%     end
% 
%     stddev = reshape(std(res(:,2,:),1), [1,s]);
% 
%     y1 = reshape(mean(res(:,2,:), 1), [1,s]);
%     y2 = reshape(y1 + stddev,[1,s]);
%     y3 = reshape(y1 - stddev,[1,s]);
% 
%     x = reshape(res(1,1,:),[1,s]);
% 
%     plot(x, y1);
%     hold on
%     plot(x, y2);
%     plot(x, y3);
%     hold off
end