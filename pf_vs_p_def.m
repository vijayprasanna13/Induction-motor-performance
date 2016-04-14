x = 0.00001:0.001:0.012;
i2 = 400./( 9.6+1.286.*(1./x-1) + 18.43i);
i1 = 0.174 - 2.013i;
i_2 = abs(i2);
i = i2+i1;
pf_angle = -1*angle(i);
pf = cos(pf_angle);
r = 1.286.*(1./x-1);
output = 3*i_2.^2.*r;

act_output = [0,1450.7,1950.81,2318.07,2636.60,2844.51,3377.38];
act_pf = [0.1170,0.6735,0.734,0.769,0.7994,0.824,0.866];

plot(output,pf,act_output,act_pf,'.-.');
legend('predetermined','actual');
xlabel('Output Power');
ylabel('Power factor');
grid on;