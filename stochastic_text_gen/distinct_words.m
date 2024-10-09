
function retval = distinct_words (tokens)
	% cautam cuvintele unice si le sortam
	retval = sort(unique(tokens));
endfunction
