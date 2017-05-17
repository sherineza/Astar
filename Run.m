% Shirine El Zaatari - Autonomous Mobile Robotics - A* path planning algorithm

%UNCOMMENT THIS SECTION in order to generate your own map
% Num_vertical_div = 20;
% Num_horizontal_div = 10;
%[map,goal,initial,grid]=GenerateMap(Num_vertical_div,Num_horizontal_div);

% OR UNCOMMENT THIS SECTION to randomize a load already made map
[grid,map, goal, initial]=DejaMadeMap;

%A* and outputing result as image
path = Astar(map,initial,goal);
VisualizePath(path,grid);


