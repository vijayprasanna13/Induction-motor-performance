function pf_power_volt(volt)
    x = 0.00001:0.001:0.012;
    output = cell(0);
    pf = cell(0);
    for v = [400,volt]
      i2 = v./( 9.6+1.286.*(1./x-1) + 18.43i); %non-shunt branch current
      i1 = 0.187 - 2.1789i; %shunt branch current
      i_2 = abs(i2); %absolute value of shunt branch current
      i = i2+i1; %total line current
      pf_angle = -1*angle(i);
      pf{end+1} = cos(pf_angle);
      r = 1.286*(1./x-1);
      output{end+1} = 3*i_2.^2.*r;
    end
    plot(output{1},pf{1},output{2},pf{2},'.-.');
    xlabel('Output power');
    ylabel('Power factor');
    grid on;
    legend('400V',strcat(num2str(volt),'V'));
end