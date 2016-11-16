x = 0.00001:0.001:0.012;
i2 = 400./(9.6+1.286.*(1./x-1)+18.43i);
i1 = 0.174 - 2.013i;
i_2 = abs(i2);
i = i1+i2;
pf_angle = -1*angle(i);
pf = cos(pf_angle);
input = 3*400.*abs(i).*pf;
r = 1.286*(1./x-1);

output = 3*i_2.^2.*r;
eff = (output./input).*100;

act_output = [0,1450.7,1950.81,2318.07,2636.60,2844.51,3377.38];
act_eff = [0,69.08,69.67,72.43,73.23,71.11,75.052];

plot(output,eff,act_output,act_eff,'.-.');
legend('predetermined','actual');
xlabel('Output Power');
ylabel('Efficiency');
grid on;