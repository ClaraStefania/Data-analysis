function pred = eval_value(x, X, f, f_param, a)
	[m, n] = size(X);
	pred = 0;

	% calculam estimarea valorii vectorului x
	for i = 1:m
		pred += a(i) * f(X(i, :), x, f_param);
   	endfor
endfunction