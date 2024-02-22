function limit_num_figs(maxFigures)
% Prevents MATLAB from trying to make too many figures and crashing if plotting is done in loop on accident

    set(0, 'DefaultFigureCreateFcn', @(src, event) customFigureCreateFcn(maxFigures));

    function customFigureCreateFcn(maxFigures)
        % Get the current number of open figures
        figHandles = findall(0, 'Type', 'figure');
        numFigures = length(figHandles);

        % Check if the limit is exceeded
        if numFigures > maxFigures
            error('limit_num_figs -- Whoops, this will create more than %i figures wbich could make MATLAB crash.', maxFigures);
        end
    end
end