classdef start_menu < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure  matlab.ui.Figure
        Panel     matlab.ui.container.Panel
        Image2    matlab.ui.control.Image
        Image     matlab.ui.control.Image
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Image clicked function: Image2
        function Image2Clicked(app, event)
            memoryGame;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create Panel
            app.Panel = uipanel(app.UIFigure);
            app.Panel.Title = 'Panel';
            app.Panel.Position = [1 1 640 480];

            % Create Image
            app.Image = uiimage(app.Panel);
            app.Image.Position = [0 0 640 480];
            app.Image.ImageSource = 'memgame_title.png';

            % Create Image2
            app.Image2 = uiimage(app.Panel);
            app.Image2.ImageClickedFcn = createCallbackFcn(app, @Image2Clicked, true);
            app.Image2.Position = [261 113 140 138];
            app.Image2.ImageSource = 'pixil-frame-0 5.png';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = start_menu

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end