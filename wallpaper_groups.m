addpath('lib/')
pkg load geometry
clear

rot_angles = [2,3,4,6]
points = []
% Setup Axis

% Init my Rotation Matrixes

for i = 1 : length(rot_angles)
  rot_mats{i} = get_rotate_2d_Matrix(2*pi / rot_angles(i));
end

points = [1.2, 5.8]
iteration_steps = 4 
% For Rectangular patterns
grid_size = 2
[x_rec_grid,y_rec_grid] = meshgrid(1 : grid_size, 1 : grid_size) 
% Make it hexagonal
for y_collum = 1 : length(y_rec_grid)
    x_rec_grid(y_collum, :) = x_rec_grid(y_collum, :) + y_collum * 0.5
  end
y_rec_grid = y_rec_grid * cos(30 * pi/180);

% Point Group p6 

% generate_base_points
for i = 1: iteration_steps
  p_len = size(points,1)
  for y_collum = 1 : length(y_rec_grid)
    for x_row = 1 : length(x_rec_grid)
      %apply transformation for inefficent points
      for p = 1 : p_len
        delta = [x_rec_grid(y_collum,x_row) - points(p,1), \
               y_rec_grid(y_collum,x_row) - points(p,2)];
               delta = delta';
               goto_center = delta;
               for r = 1 : 6
                 delta = rot_mats{4} * delta;
                 new_point = [delta(1) + points(p,1) + goto_center(1), delta(2) + points(p, 2) + goto_center(2)];
                 if new_point(1)> -1.5 && new_point(1)<8.5  && new_point(2)>-1.5 && new_point(2)<8.5 
                    points = [points;new_point];
                  end
               end
        points = my_kill_duplicate_point(points, 6);
      end
    end
  end
end
points
axis([0 3 0 3], "square")
% scatter(x_rec_grid,y_rec_grid,[],'r' )
% hold on 
% scatter(points(:,1), points(:,2))
voronoi(points(:,1)', points(:,2)')
hold off
print -dpsc p6m_1p2_5p8.jpg
