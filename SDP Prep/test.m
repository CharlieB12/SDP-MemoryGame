framerate = 30; % frames per second
rtg_scene = simpleGameEngine('retro_simple_dice.png',16,16,10,[0,0,0]);
drawScene(rtg_scene,[8]) % draw the scene
while 1 % main game loop
    tic
    rtg_scene.my_figure.KeyPressFcn = @(src,event)guidata(src,event.Key);
    rtg_scene.my_figure.KeyReleaseFcn = @(src,event)guidata(src,'0');
    % Captureskey press and release events, storing the pressed key or 0
    key_down = guidata(rtg_scene.my_figure) % key or 0 stored to a variable

    % Use key_down to determine a sprite ID
    if key_down
        sprite = str2double(key_down);
    else
        sprite = 0;
    end
    
    % if it is a valid sprite ID (between 1 and 6), display it
    if sprite >= 1 && sprite <= 6
        drawScene(rtg_scene,[sprite])
    else
        drawScene(rtg_scene,[8])
    end
    pause(1/framerate-toc); % wait for next frame
end