function [pos,vel]= UpdateCoordinates(pos,vel,delta)
%Updates the matrices �pos� and �vel� based on their input values and delta.

    for i = 1:size(pos,1)
      %Para movimento horizontal
      pos(i,1) = pos(i,1) + delta*vel(i,1);
      if pos(i,1) >= 300
        pos(i,1) = 300;
        vel(i,1) = -vel(i,1);
      elseif pos(i,1) <= 0
        pos(i,1) = 0;
        vel(i,1) = -vel(i,1);
      end
      
      %Para movimento Vertical
      pos(i,2) = pos(i,2) + delta*vel(i,2);
      if pos(i,2) > 200
        pos(i,2) = 200;
        vel(i,2) = -vel(i,2);
      elseif pos(i,2) <= 0
        pos(i,2) = 0;
        vel(i,2) = -vel(i,2);
      end
    end
    
end



