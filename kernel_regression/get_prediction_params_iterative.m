function [a] = get_prediction_params_iterative (K, y, lambda)
	m = size(K, 1);
	Im = eye(m); % initializam cu matricea identitate
	x = zeros(m, 1);
	a = conjugate_gradient(lambda * Im + K, y, x, 1e-6, 1000);
endfunction
