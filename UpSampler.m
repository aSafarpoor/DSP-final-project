function y= upsampler(x,l)
    s = size(x);
    s = s(1);
    y = [];
    ll = zeros(1,l-1);
    for ii = 1:s-1
        y = [y , x(ii)];
        y = [y , ll ];
    end
    y = [y ,  x(s)] ;
    y = y' ; 
    
    %####define lowpass filter 
    lpfilter = fir1(10 , 1/ l, 'low');
    %plot(lpfilter)
    %title('lpfilter')
    
    %####use filter for interpolation
    y = filter(lpfilter,1,y);
    
end

    
