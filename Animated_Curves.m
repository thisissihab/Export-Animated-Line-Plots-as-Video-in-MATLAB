
clear all;
clc;
x = linspace(0,4*pi,500);
y1 = sin(x);
y2 = sin(x-pi/3);
y3 = sin(x+pi/3);


signal_1 = animatedline('Color', 'b', 'LineStyle', '-', 'LineWidth', 1) ;
signal_2 = animatedline('Color', 'r', 'LineStyle', '-', 'LineWidth', 1) ;
signal_3 = animatedline('Color', 'g', 'LineStyle', '-', 'LineWidth', 1) ;

set(gca, 'XLim', [0 4*pi]);
box on
frames = cell(length(x),1) ;
for i = 1 : length(x)
    addpoints(signal_1, x(i), y1(i));
    addpoints(signal_2, x(i), y2(i));
    addpoints(signal_3, x(i), y3(i));
    drawnow
    frames{i} = getframe(gcf) ;
end

obj = VideoWriter('Signals.avi');
obj.Quality = 100;
obj.FrameRate = 40;
open(obj);
for i = 1:length(x)
    writeVideo(obj, frames{i}) ;
end
obj.close();
