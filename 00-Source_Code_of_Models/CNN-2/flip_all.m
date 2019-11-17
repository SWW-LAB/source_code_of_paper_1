function X=flip_all(X)
    for i=1:ndims(X)
        X = flip(X,i);
    end
end