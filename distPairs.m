function d = distPairs(V)
    [~,nc] = size(V);
    d = ones(nc,nc); % will get one in diagonal to avoid /0
    for i = 1:nc
        for j = (i+1):nc
            d(i,j) = norm(V(:,i)-V(:,j)).^2;
            d(j,i) = d(i,j);
        end
    end
end