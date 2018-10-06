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

    a = 1;
    x0 = [
        2 1 3
        2.5 2 2
        3.5 3 2
        5 4 2
        5 5.5 2
        9 5 1
        5 7.5 3
        9 7.5 2
        7 9 2
        10 8.5 2
    ]';

    p.cadIntAcep = 100;
    p.cadInt = 150;
    p.maxCad = 40;
    p.frecImp = 100;
    p.x0 = x0;
    p.FcnObj = @(s) objectiveFree(s, a, wells);
    p.FcnVec = @neighborFree;
    p.Imp = @imprimirFree;
    p.variarC = 0;
    p.alfa = 0.9;
    p.beta = 1.05;
    p.minRazAcep = 0.95;
    p.min = 1;
    
    [x,prom,desv] = plotRecocido(p, 20, 1);
    
    plot(x, prom);
    hold on;
    plot(x, prom + desv);
    plot(x, prom - desv);
    hold off;
end