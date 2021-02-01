function y= upsampler(x,l)
    s = size(x);
    s = s(1);
    y = [];
    l = 3;
    ll = zeros(1,l-1);
    for ii = 1:s-1
        y = [y , x(ii)];
        y = [y , ll ];
    end
    y = [y ,  x(s)] ;
    y = y' ; 
end

    