x = 0.001:0.001:0.012;
i_2 = 400./( (9.6+1.286*(1./x)).^2 + 18.43.^2 ).^0.5;
p = i_2.^2*3*1.286.*(1./x-1);
t = p./(2*pi*1500*(1.-x)/60);

act_output = [0,1450.7,1950.81,2318.07,2636.60,2844.51,3377.38];
act_torque = [0,9.392,12.716,15.172,17.34,18.785,22.397];

plot(p,t,act_output,act_torque,'.-.');

xlabel('Output Power');
ylabel('Torque');
legend('Predetermined','actual');
grid on;
 
