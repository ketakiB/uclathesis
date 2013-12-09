clear all
close all
clc

max_pitch = 25;
max_roll = 25;
max_yaw = 50;


fig_dir = '/Users/akee/School/UCLA/01 thesis/uclathesis/fig/';

load prbs_inputs_63.csv
u1 = prbs_inputs_63(:,1);
u2 = prbs_inputs_63(:,2);
u3 = prbs_inputs_63(:,3);
clear prbs_inputs_63

u_size = size(u1);
len = u_size(1);
x = 15:len;
u1 = u1(15:end).*max_pitch;
u2 = u2(15:end).*max_roll;
u3 = u3(15:end).*max_yaw;

h = figure(1);

subplot(3,1,1)
s1 = stairs(x,u1);
Ylabel = ylabel({'pitch, \theta';'(deg)'});
axis([15 len -1.2*max_pitch 1.2*max_pitch])
set( gca,...
    'box'         , 'off', ...
    'TickDir'     , 'out'     , ...
    'TickLength'  , [.015 .015] , ...
    'YTickLabel'  ,  {-1*max_pitch, ' ', max_pitch}, ...
    'FontName'    , 'AvantGarde', ...
    'FontSize'    , 9, ...
    'yGrid'       , 'on', ...
    'XColor'      , [.2 .2 .2], ...
    'YColor'      , [.2 .2 .2]);
set([Ylabel], ...
    'FontName'    , 'AvantGarde', ...
    'FontWeight'  , 'bold', ...
    'FontSize'    , 9);

subplot(3,1,2)
s2 = stairs(x,u2);
Ylabel = ylabel({'roll, \phi';'(deg)'});
axis([15 len -1.2*max_roll 1.2*max_roll])
set( gca,...
    'box'         , 'off', ...
    'TickDir'     , 'out'     , ...
    'TickLength'  , [.015 .015] , ...
    'YTickLabel'  ,  {-1*max_roll, ' ', max_roll}, ...
    'FontName'    , 'AvantGarde', ...
    'FontSize'    , 9, ...
    'yGrid'       , 'on', ...
    'XColor'      , [.2 .2 .2], ...
    'YColor'      , [.2 .2 .2]);
set([Ylabel], ...
    'FontName'    , 'AvantGarde', ...
    'FontWeight'  , 'bold', ...
    'FontSize'    , 9);

subplot(3,1,3)
s3 = stairs(x,u3);
Xlabel = xlabel('k');
Ylabel = ylabel({'yaw rate, \psi';'(deg/s)'});
axis([15 len -1.2*max_yaw 1.2*max_yaw])
set( gca,...
    'box'         , 'off', ...
    'TickDir'     , 'out'     , ...
    'TickLength'  , [.015 .015] , ...
    'YTickLabel'  ,  {-1*max_yaw, ' ', max_yaw}, ...
    'FontName'    , 'AvantGarde', ...
    'FontSize'    , 9, ...
    'yGrid'       , 'on', ...
    'XColor'      , [.2 .2 .2], ...
    'YColor'      , [.2 .2 .2]);
set([Xlabel Ylabel], ...
    'FontName'    , 'AvantGarde', ...
    'FontWeight'  , 'bold', ...
    'FontSize'    , 9);

set( [s1 s2 s3],...
    'LineWidth'   , 1.25, ...
    'color'       , [.1 .1 .1]);

cd(fig_dir);
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 4])
print(h, '-depsc2', 'test_prbs.eps', '-r100')
close(gcf);