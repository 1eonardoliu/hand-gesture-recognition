function N=count3(x,y)
n=length(x);
x0=x(1);
y0=y(1);
N=0;
idx0=[1:length(x)];
for j=1:7
    x0=x(idx0(1));
    y0=y(idx0(1));
    idx=[];
    for i=1:length(idx0)
        d=sqrt((y(i)-y0)^2+(x(i)-x0)^2);
        if(d<=50)
        else
            idx=[idx,i];
        end
    end
    if(length(idx)>0)
        N=N+1;
        idx0=idx;
    else
        disp('numberoffingers£º')
       num= j-2
        break;
    end
end
end

    
