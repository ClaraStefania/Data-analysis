function B = k_secv (A, k)
	n = length(A);
	B = cell(n - k, 1);
	
	% parcurgem elementele din vectorul A si formam k-secventele
	for i = 1:(n - k)
		B{i, 1} = strjoin(A(i:(i + k - 1)));
	endfor
endfunction
