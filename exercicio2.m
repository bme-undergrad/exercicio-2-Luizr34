function [blendA, blendB] = exercicio2(NG)

% NG: numero do grupo

% nao alterar: inicio
es = 1;
imax = 20;
pkg load optim
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

#f = @(x)(10*x(1) + 10*x(2) + 10*x(3) + 10*x(4) + 16*x(5) + 16*x(6) + 16*x(7) + 16*x(8));
f = [10, 10, 10, 10, 16, 16, 16, 16]';

##x = [x11, x12, x13, x14, x21, x22, x23, x24]
x0 = [1, 1, 1, 1, 1, 1, 1, 1]';

## Ax <= b
A = [1, 1, 1, 1, 0, 0, 0, 0;
     0, 0, 0, 0, 1, 1, 1, 1;
     -1, 0, 0, 0, -1, 0, 0, 0;
     0, -1, 0, 0, 0, -1, 0, 0;
     0, 0, -1, 0, 0, 0, -1, 0];
b = [20;
     50;
     -15;
     -10;
     -12];

## Aeq*x=beq
Aeq = [-0.7, 0.3, 0.3, 0.3, 0, 0, 0, 0;
       0.2, -0.8, 0.2, 0.2, 0, 0, 0, 0;
       0.25, 0.25, -0.75, 0.25, 0, 0, 0, 0;
       0.25, 0.25, 0.25, -0.75, 0, 0, 0, 0;
       0, 0, 0, 0, -0.8, 0.2, 0.2, 0.2;
       0, 0, 0, 0, 0.25, -0.75, 0.25, 0.25;
       0, 0, 0, 0, 0.3, 0.3, -0.7, 0.3;
       0, 0, 0, 0, 0.25, 0.25, 0.25, -0.75];
beq = zeros(8,1);

x_min_valores = zeros(8,1);
x_max_valores = 100000*ones(8,1);

[x_star, fval_star] = linprog(f, A, b, Aeq, beq, lb=x_min_valores, ub=x_max_valores);

x = [( sum(x_star(1:4)) ), ( sum(x_star(5:8)) )];

% mantenha essas duas linhas finais

blendA = x(1);
blendB = x(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction
