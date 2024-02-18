function h = figT(figureName)
    % figT: Create a figure with specified properties
    %
    % Example: Create a figure with the name 'MyFigure'
    % figT('MyFigure');

    % Create a new figure
    h = figure('Name', figureName, 'NumberTitle', 'off', ...
               'units', 'normalized', 'outerposition', [0 0 1 1]);
    
    % Set the title to the figureName
    title(strrep(figureName, '_', '\_'));
end
