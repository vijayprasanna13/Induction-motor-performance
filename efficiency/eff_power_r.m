function eff_power_r(r2)
    x = 0.0001:0.0001:0.013;
    cat = strcat(num2str(r2),'ohms');
    output = cell(0);
    eff = cell(0);
    for r2 = [1.286,r2]
          i2 = 400./(8.314+r2+r2.*(1./x-1) + 18.43i); %non-shunt branch current
          i1 = 0.187 - 2.1789i; %shunt branch current
          i_2 = abs(i2); %absolute value of non-shunt branch current req for power calculation
          i = i2+i1; %total line current
          il = 1.732.*abs(i);
          pf_angle = -1*angle(i); %power factor calculation
          pf = cos(pf_angle);
          input = 3*400*il.*pf;
          r = r2*(1./x-1);
          output{end+1} = 3*i_2.^2.*r;
          eff{end+1} = (output{end}./input).*100;
    end
    plot(output{1},eff{1},output{2},eff{2},'.-.');
    xlabel('Output power');
    ylabel('Efficiency');
    legend('1.286ohms',cat);
    grid on;
end