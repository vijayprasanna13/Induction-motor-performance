function speed_power_volt(volt)
    x = 0.0001:0.001:0.013;

    output = cell(0);
    speed = cell(0);

    for v = [400,volt]
      i2 = v./(9.6+1.286.*(1./x-1) + 18.43i); % non-shunt branch current
      i_2 = abs(i2); %absolute value of the current for power calculation
      r = 1.286*(1./x-1); %load resistance
      output{end+1} = 3*i_2.^2.*r; %output power
      speed{end+1} = 1500*(1.-x);   %rotor speed
    end

    plot(output{1},speed{1},output{2},speed{2},'.-.');
    xlabel('Output power'); 
    ylabel('Speed');
    grid on;
    legend('400V',strcat(num2str(volt),'V'));
end