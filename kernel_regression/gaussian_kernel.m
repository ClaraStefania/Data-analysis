function retval = gaussian_kernel (x, y, sigma)
	% aplicam formula pentru kernelul gaussian
	sum = sum((x - y) .^ 2);
	retval = exp(-sum / (2 * (sigma ^ 2)));
endfunction
