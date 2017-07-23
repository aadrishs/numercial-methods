X=input('Enter the value of x at which y is to be calculated: ');
h=input('Enter the step size: ');
choice=input('Enter 1 for Euler Method Enter 2 for Predictor Corrector model Enter 3 for 4th order RK Method :');
x0=0;
y0=2;
z0=4;
f=inline('4*z-4*y+3*exp(x)+2*x','x','y','z');
g=inline('3.5*x*exp(2*x)-1.5*exp(2*x)+0.5*x+3*exp(x)+0.5','x');

%% Euler's Method
if choice==1
  while(x0~=X)
      y=y0+z0*h;
      z=z0+f(x0,y0,z0)*h;
      y0=y;
      z0=z;
      x0=x0+h;
  end
  fprintf('%f %f',y0);
  error=abs((g(X)-y0)/g(X))*100

%%Predictor Corrector model
elseif choice == 2
rel_error=input('Enter value of approximate relative error for predictor corrector: ');
  while(x0~=X)
      y1=y0+g(z0)*h;
      z1=z0+f(x0,y0,z0)*h;
      y=y0+(h/2)*(z0+z1);
      z=z0+(h/2)*(f(x0,y0,z0)+f(x0+h,y1,z1));
      x0=x0+h;
      y0=y;
      z0=z;
      error=abs((g(X)-y0)/g(X))*100;
        if error <= rel_error
          break;
        end
  end
fprintf('%f \n %f',y0,error);
%%4th order RK method
elseif choice == 3
  while(x0~=X)
      k12=z0;
      k11=f(x0,y0,z0);
      k22=z0+((h/2)*k11);
      k21=f(x0+(h/2),y0+(h/2)*k12,z0+(h/2)*k11);
      k32=z0+((h/2)*k21);
      k31=f(x0+(h/2),y0+((h/2)*k22),z0+((h/2)*k21));
      k42=z0+(h*k31);
      k41=f(x0+h,y0+(h*k32),z0+(h*k31));
      y=y0+(h/6)*(k12+(2*k22)+(2*k32)+k42);
      z=z0+(h/6)*(k11+(2*k21)+(2*k31)+k41);
      y0=y;
      z0=z;
      x0=x0+h;
   end
   error=abs((g(X)-y0)/g(X))*100;
  fprintf('%f\n%f',y0,error);
  
else
  fprintf('enter a valid choice ');
end