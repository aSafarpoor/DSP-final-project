function y= DownSampler(x,m)
    lpfilter = fir1(10 , 1/ m, 'low');
    x = filter(lpfilter,1,x);
    s = size(x);s= s(1);
    y = [];
    for ii= 1:m:s
        y= [y, x(ii)];
    end
    y = y' ;
end
