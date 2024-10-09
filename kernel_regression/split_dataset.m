function [X_train, y_train, X_pred, y_pred] = split_dataset (X, y, percentage)
	nr_total = size(X, 1);
	nr_columns = size(X, 2);
	% calculam dimensiunile
	nr_train_data = round(percentage * nr_total);
	nr_pred_data = round((1 - percentage) * nr_total);

	% initializam vectorii cu 0
	X_pred = zeros(nr_pred_data, nr_columns);
	y_pred = zeros(nr_pred_data, 1);
	X_train = zeros(nr_train_data, nr_columns);
	y_train = zeros(nr_train_data, 1);

	% copiem primele nr_train_data elemente in matrice / vector
	for i = 1:nr_train_data
		X_train(i, :) = X(i, :);
		y_train(i) = y(i);
	endfor

	% copiem restul elementelor in X_pred si y_pred
	for i = nr_train_data+1:nr_total
		X_pred(i-nr_train_data, :) = X(i, :);
		y_pred(i-nr_train_data) = y(i);
	endfor
endfunction
