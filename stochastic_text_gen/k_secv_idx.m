function retval = k_secv_idx (distinct_k_sec)
	n = length(distinct_k_sec);
	% asociem fiecarei secvente un indice
	retval = containers.Map(distinct_k_sec, 1:n);
endfunction