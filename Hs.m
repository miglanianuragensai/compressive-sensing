function v = Hs(x,s)
[sortedValues,sortIndex] = sort(x,'descend');  
maxIndex = sortIndex(1:s); 
v = zeros(length(x),1);
v(maxIndex) = x(maxIndex);
end