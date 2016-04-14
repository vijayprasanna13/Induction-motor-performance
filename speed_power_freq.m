function speed_power_freq(freq)
    x = 0.00001:0.001:0.012;
    speed = cell(0);
    output = cell(0);
    for f = [50,freq]
      x2 = 18.43i*f./50;
      i2 = 400./( 9.6+1.286.*(1./x-1) + x2);
      i_2 = abs(i2);
      r = 1.286*(1./x-1);
      n = 1500*f./50;
      output{end+1} = 3*i_2.^2.*r;
      speed{end+1} = n*(1.-x);
    end
    plot(output{1},speed{1},output{1},speed{2},'.-.');
    xlabel('Output power');
    ylabel('Speed');
    legend('50Hz',strcat(num2str(freq),'Hz'));
    grid on;
end