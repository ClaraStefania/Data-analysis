function [K] = build_kernel (X, f, f_param)
	[m, n] = size(X);
	K = zeros(m, m);

	% construim matricea kernel-urilor, apeland functia de kernel data
	for i = 1:m
		for j = 1:m
			K(i, j) = f(X(i, :), X(j, :), f_param);
		endfor
	endfor
endfunction
