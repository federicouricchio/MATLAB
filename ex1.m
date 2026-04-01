%% Punto 1 e 2
T = 1/(2*pi*50);
wc = 2*pi*50;
delta = 1/sqrt(2);
H1 = tf([1,0],[T,1]);
H2 = tf([wc^2,0],[1,2*delta*wc,wc^2]);
H = tf([1,0],1);
bode(H1,H2,H);
grid on;
%% Punto 3
A = 1;
w = 2*pi*0.5;
t = 0:0.001:4;
u = A*sin(w*t);
y1 = lsim(H1,u,t);
y2 = lsim(H2,u,t);
y3 = A*w*cos(w*t);

figure;
hold on;
plot(t,y1,'b--');
plot(t,y2,'g--');
plot(t,y3,'k--');
grid on;

%% Punto 4
w1 = 2*pi*20;
A = 1;
t = 0:0.001:4;
u = A*sin(w1*t);
y1_4 = lsim(H1,u,t);
y2_4 = lsim(H2,u,t);
y3_4 = A*w1*cos(w1*t);

figure;
hold on;
plot(t,y1_4,'b--');
plot(t,y2_4,'g--');
plot(t,y3_4,'k--');
grid on;

%% Punto 5
a = 0.001;
r = 25*t;
n = (2 * rand(size(t)) - 1) * a;
u1 = n + r;
y1_ = lsim(H1,u1,t);
y2_ = lsim(H2,u1,t);
figure;
hold on;
plot(t,y1_,'b--');
plot(t,y2_,'g--');
xlim([0,0.2]);

v1 = var(y1_(500:end) - r(500:end)');
v2 = var(y2_(500:end) - r(500:end)');
fprintf('Varianza H1: %f\nVarianza H2: %f\n', v1, v2);