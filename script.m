disp('Running MATLAB script...');
x = 0:0.1:10;
y = sin(x);
plot(x, y);
saveas(gcf, 'plot.png');
disp('Done!');