%through the first five u and y and get the first theta
%then, 
load('SysID.mat')
u = data.u;
y = data.y;
N = data.N;
sigma = 0.3;
H = zeros(N,5);
theta = zeros(5,252);
for i = 1:5
  H(i:256,i) = u(1:256+1-i);
end

theta(:,5) = inv(H(1:5,:)'*H(1:5,:))*H(1:5,:)'*y(1:5);

for n = 5:255
    
    theta(:,n+1) = theta(:,n)+inv(H(1:n+1,:)'*H(1:n+1,:))*H(n+1,:)'*(y(n+1)-H(n+1,:)*theta(:,n));
end

t = 5:256;
for i  = 1:5
    figure(i)
    plot(t,theta(i,5:256))
    xlabel('samples')
    ylabel('theta value')
    str = sprintf('theta %d', i)
    title(str)
end
