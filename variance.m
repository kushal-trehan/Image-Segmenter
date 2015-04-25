function [ W,B ] = variance( pdf,t )
%Implements Algorithm: Minimizing within group variance
%   

q1=0;
for i = 1:t
    q1=pdf(i)+q1;
end
q2=0;
for i = t+1:256
    q2=pdf(i)+q2;
end

X1 = 0;
for i = 1:t
    X1=(((i-1)*pdf(i))/q1)+X1;
end

X2 = 0;
for i = t+1:256
    X2=(((i-1)*pdf(i))/q2)+X2;
end

Y1 = 0;
for i = 1:t
    Y1=((((i-1)-X1)^2)*(pdf(i)/q1))+Y1;
end

Y2 = 0;
for i = t+1:256
    Y2=((((i-1)-X2)^2)*(pdf(i)/q2))+Y2;
end


W = q1*Y1+q2*Y2;

X = 0;
for i = 1:t
    X=((i-1)*pdf(i))+X;
end

Y = 0;
for i = 1:256
    Y=((((i-1)-X)^2)*pdf(i))+Y;
end

B = q1*(1-q1)*(X1-X2)^2;


end

