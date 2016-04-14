function i_power_vf(vf)
    x = 0.00001:0.001:0.012;
    cat = strcat(num2str(vf{1}),'V,',num2str(vf{2}),'Hz');
    output = cell(0);
    i_l = cell(0);
    for vf = {{400,50},vf}
          xo = (vf{end}{2}./50)*198.688i;
          ro = 2303.16;
          zo = xo*ro/(ro+xo);
          i1 = vf{end}{1}./zo;
          x2 = 18.43*vf{end}{2}./50i;
          i2 = vf{end}{1}./( 9.6+1.286.*(1./x-1) + x2);
          i_2 = abs(i2);
          i = i2+i1;
          i_l{end+1} = 1.732.*abs(i);
          r = 1.286*(1./x-1);
          output{end+1} = 3*i_2.^2.*r; 
    end
    plot(output{1},i_l{1},output{2},i_l{2},'.-.');
    xlabel('Output power');
    ylabel('Line current');
    legend('400V,50Hz',cat);
    grid on;
end