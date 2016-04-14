x = 0.0001:0.001:0.012;

volt = 400;

i_2 = volt./( (9.6+1.286*(1./x)).^2 + 18.43.^2 ).^0.5;
p = i_2.^2*3*1.286.*(1./x-1);
t = p./(2*pi*1500*(1.-x)/60);

%
x1 = p;
y1 = t.*(100/25);
%

x = 0.0001:0.0001:0.012;
i2 = volt./( 9.6+1.286.*(1./x-1) + 18.43i);
i1 = 0.187 - 2.1789i;
i_2 = abs(i2);
i = i2+i1;
pf_angle = -1*angle(i);
pf = cos(pf_angle);

input = 3*volt.*abs(i).*pf;
r = 1.286*(1./x-1);
output = 3*i_2.^2.*r;
eff = (output./input).*100;

%
x2 = output;
y2 = eff;
%


i2 = volt./( 9.6+1.286.*(1./x-1) + 18.43i);
i1 = 0.187 - 2.1789i;
i_2 = abs(i2);
i = i2+i1;
pf_angle = -1*angle(i);
pf = cos(pf_angle);
r = 1.286*(1./x-1);
output = 3*i_2.^2.*r;
%
x3 = output;
y3 = pf.*(100/1);
%


i2 = volt./( 9.6+1.286.*(1./x-1) + 18.43i);
i_2 = abs(i2);
r = 1.286*(1./x-1);
output = 3*i_2.^2.*r;

%
x4 = output;
y4 = x.*(100/0.13); 
%


i2 = volt./( 9.6+1.286.*(1./x-1) + 18.43i);
i_2 = abs(i2);
r = 1.286*(1./x-1);
output = 3*i_2.^2.*r;
speed = 1500*(1.-x);

%
x5 = output;
y5 = speed.*(100/1484);
%


i2 = volt./( 9.6+1.286.*(1./x-1) + 18.43i);
i1 = 0.187 - 2.1789i;
i = i2+i1;
i_2 = abs(i2);
i_l = abs(i);
r = 1.286*(1./x-1);
output = 3*i_2.^2.*r;

%
x6 = output;
y6 = i_l.*(100/5);

%{
y1 -> torque
y2 -> efficiency
y3 -> power factor
y4 -> slip
y5 -> speed
y6 -> line current
%}

plot(x1,y1,'r',x2,y2,'g',x3,y3,'b',x4,y4,'y',x5,y5,'m',x6,y6,'c');
legend('torque','efficiency','power factor','slip','speed','line current');
ylabel('torque,efficiency,power factor,slip,speed,line current');
xlabel('Output');
grid on;