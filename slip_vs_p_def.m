x = 0.000001:0.001:0.012;
i2 = 400./( 9.6+1.286.*(1./x-1) + 18.43i);
i_2 = abs(i2);
r = 1.286*(1./x-1);
output = 3*i_2.^2.*r;

act_output = [0,1450.7,1950.81,2318.07,2636.60,2844.51,3377.38];
act_slip = [0.0033,0.0116,0.0234,0.0273,0.032,0.036,0.040];

plot(output,x,act_output,act_slip,'.-.');
legend('predetermined','actual');
xlabel('Output Power');
ylabel('Slip');
grid on;