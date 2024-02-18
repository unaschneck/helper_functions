function print_fig(outputPath, savePath)
    % print_fig: Save all open figures as .pdf files and close them
    % 
    % Example: Save all open figures in the specified path without a prefix
    % print_fig(pwd, fullfile('..', '..', 'c_figures'));
    
    % Check if outputPath is provided, otherwise use the current directory
    if nargin < 1 || isempty(outputPath)
        outputPath = pwd;
    end
    
    % Check if savePath is provided, otherwise use the current directory
    if nargin < 2 || isempty(savePath)
        savePath = pwd;
    end
    
    currentDir = pwd;

    % Change to the specified directory
    cd(savePath);

    % Get handles of all open figures
    figHandles = findobj('Type', 'figure');
    
    % Save each figure as a .pdf file and close it
    for i = 1:numel(figHandles)
        
        figure(figHandles(i));
        
        % Set the PaperPosition property to adjust the output size
        set(figHandles(i), 'PaperPosition', [0 0 8.5 11]); % Adjust these values as needed
        
        % Extract the figure name specified in figure('Name', figureName)
        figName = get(figHandles(i), 'Name');
        
        % If the figure name is empty, use a default name
        if isempty(figName)
            figName = sprintf('Figure_%d', i);
        end
        
        % Construct the filename based on the figure name
        filename = sprintf('%s.pdf', figName);
        % Save the figure as a .pdf file in the specified path
        saveas(figHandles(i), filename, 'pdf');
        % Save as .svg, .pdf, .pdf_latex
        vector_filename = figName;
        Plot2LaTeX(figHandles(i), vector_filename) % https://github.com/Don-Chris/Plot2LaTeX
        fprintf('Saved %s\n', figName);
        close(figHandles(i));
    end
    
    
    fprintf('All open figures saved as .pdf & .svg files in %s and closed.\n', savePath);

    % Change back to the original directory
    cd(currentDir);
end
