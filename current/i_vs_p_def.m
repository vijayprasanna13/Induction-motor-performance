x = 0.0001:0.001:0.013;
i2 = 400./( 9.6+1.286.*(1./x-1) + 18.43i);
i1 = 0.174 - 2.013i;
i = i2+i1;
i_2 = abs(i2);
i_l = 1.732.*abs(i);
r = 1.286*(1./x-1);
output = 3*i_2.^2.*r;  

act_output = [0,1450.7,1950.81,2318.07,2636.60,2844.51,3377.38];
act_i_l = [3.7,4.5,5.5,6,6.5,7,7.5]; 

plot(output,i_l,act_output,act_i_l,'.-.');

xlabel('Output Power');
ylabel('Line current');
legend('predetermined','actual');
grid on;