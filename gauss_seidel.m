function m()
n=input('Enter the total number of variables: ');
q=zeros(n,n);
r=zeros(1,n);
for i=1:n
    r(i)=input(['Value of constant: ' str2(i)]);
end
for i=1:n
    str=input(['Enter row ' str2(i) ' of the coefficient matrix'],'s');
    q(i,:)=str2num(str);
end
x{1}=0;
for i=1:n
    x{i}=input(['Enter guess value of variable:  ' str2(i)]);
end
es=input('Approx relative error limit: ');
re=input('Enter the relaxation number: ');
it=input('Max iterations');
val1=isdiagdom(q,n);
if val1==0
    fprintf('The coefficient matrix is not diagonally dominant\n');
    [q,r]=diagonal(q,r,n);
else
    fprintf('The coefficient matrix is diagonally dominant\n');
end
val2=isdiagdom(q,n);
if val2==0
  fprintf('This matrix will not converge\n');
end
[X,er]=gs(n,q,r,x,re,it,es);
for i=1:n
    fprintf(['X' str2(i) ' = ' str2(X(i))]);
end
itr=1:it;
fig(1)=1;
for i=1:n
    fig(i)=figure;
    figure(fig(i));
    plot(itr,er(i,:));
    ylabel(['approx relative error in X' str2(i)]);
    xlabel(['number of iterations']);
end

function [X,er]=gs(n,q,r,x,re,imax,es)
X(1)=0;
ret=zeros(1,imax);
ret=ret+1;
fn{1}='';
er=zeros(n,imax);
for i=1:n
    fn{i}=str2(r(i));
    for j=1:n
        if j==i
           continue;
        end
        fn{i}=strcat(fn{i},['-(' str2(q(i,j)) '*x' str2(j) ')']);
    end
    fn{i}=strcat('(',fn{i},')',['/' str2(q(i,i))]);
end
for i=1:imax
    for j=1:n
        str=inline(fn{j});
        if(j==1)
            X(1)=str(x{2:n});
            X(1)=r*X(1)+(1-r)*x{1};
            er(1,i)=abs((X(1)-x{1})/X(1));
            x{1}=X(1);
            continue;
        end
        if(j==n)
            X(n)=str(x{1:n-1});
            X(n)=r*X(n)+(1-r)*x{n};
            er(n,i)=abs((X(n)-x{n})/X(n));
            x{n}=X(n);
            continue;
        end
        X(j)=str(x{[1:j-1 j+1:n]});
        X(j)=r*X(j)+(1-r)*x{j};
        er(j,i)=abs((X(j)-x{j})/X(j));
        x{j}=X(j);
    end
    for j=1:n
        if er(j,i)<es
            ret(j)=0;
        end
    end
    if any(ret)==0
        break;
    end
end

function val=isdiagdom(q,n)
val=0;
sum=0;
check=zeros(1,n);
check=check+1;
for i=1:n
    for j=1:n
        if j==i
            continue;
        end
        sum=sum+abs(q(i,j));
    end
    if abs(q(i,i))>sum || abs(q(i,i))==sum
        check(i)=0;
    end
    sum=0;
end
if any(check)==0
    val=1;
end

function [c,d]=diagonal(q,r,n)
max=zeros(1,n);
p=zeros(1,n);
c=zeros(n,n);
d=zeros(1,n);
for i=1:n
    max(i)=abs(q(i,1));
    p(i)=1;
    for j=2:n
        if abs(q(i,j))>max(i)
            max(i)=abs(q(i,j));
            p(i)=j;
        end
    end
end
for i=1:n
    c(p(i),:)=q(i,:);
    d(p(i))=r(i);
end