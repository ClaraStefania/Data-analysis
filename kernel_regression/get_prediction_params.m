function [a] = get_prediction_params (K, y, lambda)
	[m m] = size(K);
  	Im = eye(m); % initializam cu matricea identitate

	L = cholesky(lambda * Im + K);
	inv_L = get_lower_inverse(L);
	a = lambda * inv_L' * inv_L * y;
endfunction
