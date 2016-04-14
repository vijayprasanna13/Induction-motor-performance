function speed_power_r(r2)
    x = 0.0001:0.001:0.013;
    cat = strcat(num2str(r2),'ohms');
    output = cell(0);
    speed = cell(0);
    for r2 = [1.286,r2]
      i2 = 400./(8.314+r2+r2.*(1./x-1) + 18.43i); % non-shunt branch current
      i_2 = abs(i2); %absolute value of the current for power calculation
      r = r2*(1./x-1); %load resistance
      output{end+1} = 3*i_2.^2.*r; %output power
      speed{end+1} = 1500*(1.-x);   %rotor speed
    end
    plot(output{1},speed{1},output{2},speed{2},'.-.');
    xlabel('Output power'); 
    ylabel('Speed');
    grid on;
    legend('1.286ohms',cat);
end