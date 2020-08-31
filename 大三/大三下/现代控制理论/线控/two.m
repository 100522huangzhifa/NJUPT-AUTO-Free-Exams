clear, clc;
% ��������
syms x1 x2;
x=[x1;x2];
A=[0,1;0,0];
B=[0;1];
C=[1,0];
D=0;
Q=[2 0;0 0];R=2;
 
n = size(A);
r = rank(ctrb(A,B));   % �жϿɿ���
s = rank(obsv(A,C));   % �жϿɹ۲���
if  n == r
    display("controllable")
end
if  n == s
    display("observable")
end
% 
[K,P,E]=lqr(A,B,Q,R);
u=-inv(R)*B'*P*x;
Ac=A-B*K;
Bc=B;
Cc=C;
Dc=D;
figure(1);
step(Ac,Bc,Cc,Dc)
 
X0 = [1;2];
sys1=ss(Ac,Bc,Cc,Dc);        % ״̬����ϵͳ
t=0:0.01:10;
[y,t,x]=initial(sys1,X0,t);  % ������״̬�����
figure(2);
plot(t,x(:,1:2))
title('���ſ������µ�ϵͳ״̬��Ӧ����');
xlabel('Time(s)');
ylabel('x');
