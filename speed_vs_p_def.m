x = 0.0001:0.001:0.012;
i2 = 400./( 9.6+1.286.*(1./x-1) + 18.43i);
i_2 = abs(i2);
r = 1.286*(1./x-1);
output = 3*i_2.^2.*r;
speed = 1500*(1.-x);

act_output = [0,1450.7,1950.81,2318.07,2636.60,2844.51,3377.38];
act_speed = [1495,1475,1465,1459,1452,1446,1440];

plot(output,speed,act_output,act_speed,'.-.');
legend('predetermined','actual');
xlabel('Output Power');
ylabel('Speed');
grid on;