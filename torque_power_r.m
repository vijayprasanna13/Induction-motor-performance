function torque_power_r(r2)
    x = 0.001:0.001:0.012;
    cat = strcat(num2str(r2),'ohms');
    p = cell(0);
    t = cell(0);
    for r2 = [1.286,r2]
      i_2 = 400./( (8.314+r2+r2*(1./x)).^2 + 18.43.^2 ).^0.5; %absolute value of non-shunt current
      p{end+1} = i_2.^2*3*r2.*(1./x-1); %value of output power
      t{end+1} = p{end}./(2*pi*1500*(1.-x)/60); %shaft torque
    end
    plot(p{1},t{1},p{2},t{2},'.-.');
    xlabel('Output power'); 
    ylabel('Torque');
    grid on;
    legend('1.286ohms',cat);
end