function f = randi(sz)
    %%%assert(fp ~= -1, ['Could not open ', filename, '']);
    %%%noting that the two items of sz are the border values which is used for randomly select an integer between sz(1) and sz(2). 
    f= sz(1)+ ceil(rand*(sz(2)-sz(1)));