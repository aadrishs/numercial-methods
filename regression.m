function main()
n=input('Enter the number of data points ');
x(1)=0;
y(1)=0;
for i=1:n
    x(i)=input(['Enter value of x' num2str(i) ' ']);
end
for i=1:n
    y(i)=input(['Enter value of y' num2str(i) ' ']);
end
order1(x,y,n);
order2(x,y,n);
order3(x,y,n);
order4(x,y,n);

function order1(x,y,n)
A=[n,sum(x);sum(x),sum(x.^2)];
B=[sum(y);sum(y.*x)];
ans=A\B;
e=y-ans(1)-(ans(2)*x);
sr=sum(e.^2);
st=sum((y-mean(y)).^2);
r=(st-sr)/st;
fprintf('\n1st order polynomial fit\n');
fprintf(['\na0 = ' num2str(ans(1))]);
fprintf(['\na1 = ' num2str(ans(2))]);
fprintf(['\nregression = ' num2str(r)]);
f1=figure;
figure(f1);
scatter(x,y);
hold on;
fn=@(x)ans(1)+(ans(2)*x);
x=x(1):0.1:x(n);
plot(x,fn(x));
xlabel('X - - - >');
ylabel('Y - - - >');

function order2(x,y,n)
A=[n,sum(x),sum(x.^2);sum(x),sum(x.^2),sum(x.^3);sum(x.^2),sum(x.^3),sum(x.^4)];
B=[sum(y);sum(y.*x);sum(y.*(x.^2))];
ans=A\B;
e=y-ans(1)-(ans(2)*x)-(ans(3)*(x.^2));
sr=sum(e.^2);
st=sum((y-mean(y)).^2);
r=(st-sr)/st;
fprintf('\n2nd order polynomial fit\n');
fprintf(['\na0 = ' num2str(ans(1))]);
fprintf(['\na1 = ' num2str(ans(2))]);
fprintf(['\na2 = ' num2str(ans(3))]);
fprintf(['\nregression = ' num2str(r)]);
f2=figure;
figure(f2);
scatter(x,y);
hold on;
fn=@(x)ans(1)+(ans(2)*x)+(ans(3)*(x.^2));
x=x(1):0.1:x(n);
plot(x,fn(x));
xlabel('X - - - >');
ylabel('Y - - - >');

function order3(x,y,n)
A=[n,sum(x),sum(x.^2),sum(x.^3);sum(x),sum(x.^2),sum(x.^3),sum(x.^4);sum(x.^2),sum(x.^3),sum(x.^4),sum(x.^5);sum(x.^3),sum(x.^4),sum(x.^5),sum(x.^6)];
B=[sum(y);sum(y.*x);sum(y.*(x.^2));sum(y.*(x.^3))];
ans=A\B;
e=y-ans(1)-(ans(2)*x)-(ans(3)*(x.^2))-(ans(4)*(x.^3));
sr=sum(e.^2);
st=sum((y-mean(y)).^2);
r=(st-sr)/st;
fprintf('\n3rd order polynomial fit\n');
fprintf(['\na0 = ' num2str(ans(1))]);
fprintf(['\na1 = ' num2str(ans(2))]);
fprintf(['\na2 = ' num2str(ans(3))]);
fprintf(['\na3 = ' num2str(ans(4))]);
fprintf(['\nregression = ' num2str(r)]);
f3=figure;
figure(f3);
scatter(x,y);
hold on;
fn=@(x)ans(1)+(ans(2)*x)+(ans(3)*(x.^2))+(ans(4)*(x.^3));
x=x(1):0.1:x(n);
plot(x,fn(x));
xlabel('X - - - >');
ylabel('Y - - - >');

function order4(x,y,n)
A=[n,sum(x),sum(x.^2),sum(x.^3),sum(x.^4);sum(x),sum(x.^2),sum(x.^3),sum(x.^4),sum(x.^5);sum(x.^2),sum(x.^3),sum(x.^4),sum(x.^5),sum(x.^6);sum(x.^3),sum(x.^4),sum(x.^5),sum(x.^6),sum(x.^7);sum(x.^4),sum(x.^5),sum(x.^6),sum(x.^7),sum(x.^8)];
B=[sum(y);sum(y.*x);sum(y.*(x.^2));sum(y.*(x.^3));sum(y.*(x.^4))];
ans=A\B;
e=y-ans(1)-(ans(2)*x)-(ans(3)*(x.^2))-(ans(4)*(x.^3))-(ans(5)*(x.^4));
sr=sum(e.^2);
st=sum((y-mean(y)).^2);
r=(st-sr)/st;
fprintf('\n4th order polynomial fit\n');
fprintf(['\na0 = ' num2str(ans(1))]);
fprintf(['\na1 = ' num2str(ans(2))]);
fprintf(['\na2 = ' num2str(ans(3))]);
fprintf(['\na3 = ' num2str(ans(4))]);
fprintf(['\na4 = ' num2str(ans(5))]);
fprintf(['\nregression = ' num2str(r)]);
f4=figure;
figure(f4);
scatter(x,y);
hold on;
fn=@(x)ans(1)+(ans(2)*x)+(ans(3)*(x.^2))+(ans(4)*(x.^3))+(ans(5)*(x.^4));
x=x(1):0.1:x(n);
plot(x,fn(x));
xlabel('X - - - >');
ylabel('Y - - - >');