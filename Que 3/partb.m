%4 equations 
%ds/dt=k2(es)-k1(s)(e)
%de/dt=(k2+k3)(es)-k1(s)(e)
%des/dt=k1(s)(e)-(k3+k2)es
%d(e+p)/dt=k3(es)

%constants 
e=1;
s=10;
es=0;
p=0;
k1=100;
k2=600;
k3=150;

%define functions
f=@(t)[ 
    (k2)*(es)-k1*(s)*(e);
    (k2+k3)*(es)-k1*(s)*(e);
    k1*(s)*(e)-(k3+k2)*(es);
    k3*(es)];
%Initial conditions
t(1)=0;
y(:,1)=[20,5];

%Step size
h=0.001;
tfinal=50;
N=ceil(tfinal/h);

%Update loop
for i=1:N
    %Update time
    t(i+1)=t(i)+h;
    %Update for y
    K1=f(t(i));
    K2=f(t(i)+h/2,t(i)+h/2*K1);
    K3=f(t(i)+h/2,t(i)+h/2*K2);
    K4=f(t(i)+h,t(i)+h*K3);
    y(:,i+1)=t(i)+h/6*(K1+2*K2+2*K3+K4);
end

%plot
figure(1);clf(1)
plot(t,y(1,:))
hold on 
plot(t,y(2,:))
xlabel('time')
ylabel('population')
    
   
    
