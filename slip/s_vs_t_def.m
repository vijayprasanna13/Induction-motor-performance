 s = 0.00001:0.001:0.04;
 i = 400./( (9.6+1.286*(1./s-1)).^2 + 18.43.^2 ).^0.5;
 p = i.^2*3*1.286.*(1./s-1);
 t = p./(2*pi*1500*(1.-s)/60);
 
 act_slip = [0.0033,0.0116,0.0234,0.0273,0.032,0.036,0.040];
 act_torque = [0,9.392,12.716,15.172,17.34,18.785,22.397];

 plot(s,t,act_slip,act_torque,'.-.');
 legend('predetermined','actual');
 xlabel('Slip');
 ylabel('Torque (Nm)');
 grid on;