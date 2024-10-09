function retval = polynomial_kernel (x, y, d)
	% aplicam formula pentru kernelul polinomial
	retval = (1 + x * y') ^ d;
endfunction
