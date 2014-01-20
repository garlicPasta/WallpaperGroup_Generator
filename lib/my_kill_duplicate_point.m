function cleaned_list = my_kill_duplicate_point (points, precision)
  points_goedel = points(:,1)*10 + points(:,2);
  points_round = fix(points_goedel * 10**precision) / 10**precision;
  [i,j,k] = unique(points_round);
  cleaned_list = points(j', :);
  return 
end
