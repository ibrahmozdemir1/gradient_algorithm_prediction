%datayý okutuyoruz
data = load("house_price.txt");

%datada bulunan deðerleri ayýrýyoruz.
x = data(1:40,1);
y = data(1:40,2);

m = length(y);

figure;
plot(x,y,'bx','MarkerSize',5);
xlabel(' x-->','fontsize',14);
ylabel('y  -->','fontsize',14);


%gradient descent algoritmasýnda kullanacaðýmýz x deðerlerini 
%doðru ve anlaþýlabilir þekilde kullanmak için x matrisini tekrardan oluþturuyoruz.
x=[ones(m,1),x];

%teta deðerlerimizi tutacak matrisimizi oluþturalým.
theta=zeros(2,1);

num_of_iterations = 1000;
alpha = 0,01;

J=zeros(num_of_iterations,1);

%h(teta), teta tahmin deðerleri ve Cost Function
% için kullanýlacak olan yinelemeli döngü.
for i=1:num_of_iterations

  h_of_x=(x*theta).-y;
 
  theta(1)=theta(1)-(alpha/m)*h_of_x'*x(:,1);
  theta(2)=theta(2)-(alpha/m)*h_of_x'*x(:,2);
 
  J(i)=1/(2*m)*sum(h_of_x.^2);
  
end

fprintf('?0 = %d ?1 = %d \n', theta(1), theta(2));

hold on;

%First plot x, the for y calculate y. 
%(100X2) * ( 2 X 1) =( 100 X 1 )
plot(x(:,2), x*theta, 'r-','linewidth',2);

hold off;

fprintf('Press any key to continue ...');
pause;

predict=[40606.195680000004,1058.114928,400.0,1274.924779];

hold on;

for i=predict

plot(i, [1, i]*theta, 'g*','MarkerSize',14);
legend('Training data', 'Linear regression','Prediction')

end

hold off;

fprintf('Press any key to continue ...');
pause;

thetaNormal = (pinv(x'*x))*x'*y;

hold on;

plot(x(:,2), x*thetaNormal, 'k-','linewidth',1);
hold off;

fprintf('Press any key to continue ...');
pause;

figure;
plot([1:num_of_iterations],J,'linewidth',2);
