function Xresample = myPFresampleM(X, w)
wsum = sum(w);
edges = cumsum(w/wsum);
M = length(w);

R = rand(1,M);
R = sort(R);
Ichosen = zeros(1,M);
i=1; j=1;
while (i <= M)
    if (R(i) < edges(j))
        Ichosen(i) = j;
        i = i + 1;
    else
        j = j + 1;
        if (j>M) 
            j=M;
        end
    end
end
Xresample = X(:,Ichosen);   
return