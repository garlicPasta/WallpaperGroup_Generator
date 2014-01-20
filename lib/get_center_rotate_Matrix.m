
function cords = rotate (cords,alpha)
  M=[cos(alpha),-sin(alpha);sin(alpha),cos(alpha)]
  cords = M*cords'
  cords = cords'
end
