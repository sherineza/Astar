%Generate the map
[map,goal,initial,grid]=GenerateMap;
% OR load already made map in order to test with inflation
%[map, goal, initial]=DejaMadeMap;
%A*
path = Astar(map,initial,goal);
VisualizePath(path,grid);


