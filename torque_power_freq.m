function torque_power_freq(freq)
    x = 0.0001:0.001:0.012;
    p = cell(0);
    t = cell(0);

    for f = [50,freq]
     x2 = 18.43*f./50;
     n = 1500*f./50;
     i_2 = 400./((9.6+1.286*(1./x)).^2 + x2.^2).^0.5;
     p{end+1} = i_2.^2*3*1.286.*(1./x-1);
     t{end+1} = p{end}./(2*pi*n*(1.-x)/60);
    end
    plot(p{1},t{1},p{2},t{2},'.-.');
    xlabel('Output power');
    ylabel('Torque');
    legend('50Hz',strcat(num2str(freq),'Hz'));
    grid on;
end