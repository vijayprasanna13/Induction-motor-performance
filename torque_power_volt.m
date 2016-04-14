function torque_power_volt(volt)
    x = 0.001:0.001:0.012;
    p = cell(0);
    t = cell(0);
    for v = [400,volt]
      i_2 = v./( (9.6+1.286*(1./x)).^2 + 18.43.^2 ).^0.5; %absolute value of non-shunt current
      p{end+1} = i_2.^2*3*1.286.*(1./x-1); %value of output power
      t{end+1} = p{end}./(2*pi*1500*(1.-x)/60); %shaft torque
    end
    plot(p{1},t{1},p{2},t{2},'.-.');
    xlabel('Output power'); 
    ylabel('Torque');
    grid on;
    legend('400V',strcat(num2str(volt),'V'));
end