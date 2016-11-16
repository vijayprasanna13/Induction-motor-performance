function slip_power_volt(volt)
    x = 0.0001:0.001:0.013;
    output = cell(0);

    for v = [400,volt]
      i2 = v./(9.6+1.286.*(1./x-1)+18.43i);
      i_2 = abs(i2);
      r = 1.286*(1./x-1);
      output{end+1} = 3*i_2.^2.*r;
    end

    plot(output{1},x,output{2},x,'.-.');
    xlabel('Output power');
    ylabel('Slip');
    grid on;
    legend('400V',strcat(num2str(volt),'V'));
end