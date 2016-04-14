function slip_power_r(r2)
    x = 0.0001:0.001:0.013;
    cat = strcat(num2str(r2),'ohms');
    output = cell(0);

    for r2 = [1.286,r2]
      i2 = 400./(8.314+r2+r2.*(1./x-1)+18.43i);
      i_2 = abs(i2);
      r = r2*(1./x-1);
      output{end+1} = 3*i_2.^2.*r;
    end

    plot(output{1},x,output{2},x,'.-.');
    xlabel('Output power');
    ylabel('Slip');
    grid on;
    legend('1.286ohms',cat);
end