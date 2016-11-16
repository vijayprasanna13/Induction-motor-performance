function eff_power_vf(vf)
     cat = strcat(num2str(vf{1}),'V,',num2str(vf{2}),'Hz');
     x = 0.00001:0.001:0.012;
     output = cell(0);
     eff = cell(0);

     for vf = {{400,50},vf}
          xo = (vf{end}{2}./50)*198.688i; %shunt reactance
          ro = 2303.16; %shunt resistance
          zo = xo*ro/(ro+xo); %total shunt impedance
          i1 = vf{end}{1}./zo; %shunt current
          x2 = 18.43i*(vf{end}{2}./50); %non-shunt reactance
          i2 = vf{end}{1}./( 9.6+1.286.*(1./x-1) + x2); %non-shunt current
          i_2 = abs(i2); %the absolute value of the current
          i = i2+i1; %total line current
          pf_angle = -1*angle(i); %power factor
          pf = cos(pf_angle); 
          input = 3*vf{end}{1}.*1.732.*abs(i).*pf; %input power
          r = 1.286*(1./x-1);
          output{end+1} = 3*i_2.^2.*r;
          eff{end+1} = (output{end}./input).*100;
     end
    plot(output{1},eff{1},output{2},eff{2},'.-.');
    xlabel('Output power');
    ylabel('Efficiency');
    legend('400V,50Hz',cat);
    grid on;
end