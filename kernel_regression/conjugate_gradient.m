function [x] = conjugate_gradient (A, b, x0, tol, max_iter) 
	n = length(b);
	r = zeros(1, n + 1);
	v = zeros(1, n + 1);
	
	r = b - A * x0; % calculam reziduul initial
	v = r; 
	x = x0;
	tol = tol ^ 2;
	k = 1;

	while k < max_iter && r' * r > tol
		tk = (r' * r) / (v' * A * v);  % calculam pasul
		x = x + tk * v;  % actuaizam solutia
		rk = r - tk * A * v;  % calculam noul reziduu
		sk = (rk' * rk) / (r' * r);
		v = rk + sk * v;
    	r = rk;
		k = k + 1;
	endwhile
endfunction