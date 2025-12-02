function sprite_demo()
% Simple demo for the Sprite class
%
% For a more elaborate example see https://github.com/urban-eriksson/RRT-star-u

delete(timerfind)
figure(1);
clf
hold on
axis([-200 200 -50 250])

[cdata1, ~, adata1] = imread('dronemini1f.png');
[cdata2, ~, adata2] = imread('dronemini3f.png');
sprite = Sprite('CData', cdata1, 'AlphaData', adata1, 'Offset',[-16.5 -36.5],'UserData',1);

image_toggler = timer('Period', 0.5, 'ExecutionMode', 'fixedRate');
image_toggler.TimerFcn = @(~,~) toggle_color_data(sprite, cdata1, adata1, cdata2, adata2);
start(image_toggler)

pause(1)

for j = 1:720
    
    theta = j*pi/180;
    sprite.Position = 100*[cos(theta-pi/2) sin(theta-pi/2)] + [0 100];
    sprite.Orientation = theta;
    pause(0.04)
end


stop(image_toggler)
delete(image_toggler)

function toggle_color_data(sprite,cdata1,adata1,cdata2,adata2)

image_number = get(sprite,'UserData');

if image_number == 1
    set(sprite,'UserData',2,'CData',cdata2,'AlphaData',adata2);
else
    set(sprite,'UserData',1,'CData',cdata1,'AlphaData',adata1);
end