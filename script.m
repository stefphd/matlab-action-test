
diary('diary.txt');
disp("=== MATLAB script started ===");

try
    % Generate and save a simple plot
    x = 0:0.1:10;
    y = sin(x);
    figure;
    plot(x, y, 'LineWidth', 2);
    title('Sine Wave');
    xlabel('x'); ylabel('sin(x)');
    saveas(gcf, 'plot.png');
    disp("Plot saved as plot.png");

    % Example computation
    s = sum(y.^2);
    disp(['Sum of squared sine values = ', num2str(s)]);

    disp("=== MATLAB script completed successfully ===");
catch ME
    disp("Error occurred:");
    disp(getReport(ME));
end

diary off;