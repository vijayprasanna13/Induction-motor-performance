function i_power_r(r2)
    
    x = 0.00001:0.001:0.013;
    cat = strcat(num2str(r2),'ohms');
    i_l = cell(0);
    output = cell(0);

    for r2 = [1.286,r2]
      i2 = 400./(8.314+r2+r2.*(1./x-1)+18.43i); %current in the non-shunt branch
      i1 = 0.187 - 2.1789i; %current in the shunt branch
      i = i2+i1; %total line current
      i_2 = abs(i2); %power calculation
      i_l{end+1} = 1.732.*abs(i); %line current
      r = r2*(1./x-1);
      output{end+1} = 3*i_2.^2.*r; %output power
    end
    plot(output{1},i_l{1},output{2},i_l{2},'.-.');
    xlabel('Output power');
    ylabel('Line current');
    grid on;
    legend('1.286ohms',cat);
end