function M_rot = get_rotate_3d_Matrix(axis, alpha)
  if axis == 'x'
    M_rot = [1,0,0;
             0,cos(alpha), -sin(alpha);
             0,sin(alpha), cos(alpha)]
  end

  if axis == 'y'
    M_rot = [cos(alpha), 0, sin(alpha);
             0, 1, 0;
             -sin(alpha), 0, cos(alpha)]
  end

  if axis == 'z'
    M_rot = [cos(alpha), -sin(alpha) ,0;
             sin(alpha), cos(alpha), 0;
             0, 0, 1]
  end
  return 
end
