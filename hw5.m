%below is first question
for j = 5:256
    [a,b] = plot_for_n(j);
    theta_plot(:,j)=a;
    theta_cov_plot(:,:,j)=b;
end
n = 1:256;
for k = 1:5
    figure(k)
    plot(n,theta_plot(k,:));
    hold on
    add_ = reshape(theta_plot(k,:),[1,256])+reshape(theta_cov_plot(k,k,:),[1,256]);
  
    plot(n,add_)
    hold on 
    minus_ = reshape(theta_plot(k,:),[1,256])-reshape(theta_cov_plot(k,k,:),[1,256]);
   
    plot(n,minus_)
    xlabel('samples')
    ylabel('theta value')
    legend('theta','theta+sig','theta-sig','location','southeast')
    str = sprintf('theta %d', k)
    title(str)
end


function [theta,theta_cov] = plot_for_n(n)

load('SysID.mat')
u = data.u;
y = data.y;
sigma = 0.3;
H = zeros(n,5);

for i = 1:5
  H(i:n,i) = u(1:n+1-i);
end

theta = inv(H'*H)*H'*y(1:n);
theta_cov = sigma^2*inv(H'*H);
%below is the second question
end