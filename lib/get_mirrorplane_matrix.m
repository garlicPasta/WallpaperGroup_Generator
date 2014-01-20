
function M_mirror = get_rotate_3d_Matrix(axis)
  if axis == 'x'
    M_mirror = [-1, 0, 0;
              0, 1, 0;
              0, 0, 1]
  end

  if axis == 'y'
    M_mirror = [ 1, 0, 0;
              0, -1, 0;
              0, 0, 1]
  end

  if axis == 'z'
    M_mirror = [ 1, 0, 0;
              0, 1, 0;
              0, 0, -1]
  end
  return 
end
