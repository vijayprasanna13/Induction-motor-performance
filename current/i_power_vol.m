function i_power_vol(volt)
    
    x = 0.00001:0.001:0.013;

    i_l = cell(0);
    output = cell(0);

    for v = [400,volt]
      i2 = v./(9.6+1.286.*(1./x-1)+18.43i); %current in the non-shunt branch
      i1 = 0.187 - 2.1789i; %current in the shunt branch
      i = i2+i1; %total line current
      i_2 = abs(i2); %power calculation
      i_l{end+1} = 1.732.*abs(i); %line current
      r = 1.286*(1./x-1);
      output{end+1} = 3*i_2.^2.*r; %output power
    end
    plot(output{1},i_l{1},output{2},i_l{2},'.-.');
    xlabel('Output power');
    ylabel('Line current');
    grid on;
    legend('400V',strcat(num2str(volt),'V'));
end