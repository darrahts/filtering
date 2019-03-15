function z = myPFsensorfunction(x, y, theta)
DMAX = 5;
HUGE = 1e8;

thetaoffsets = [-pi/3 -pi/6 0 pi/6 pi/3]';
sensorangles = theta + thetaoffsets;
slopes = tan(sensorangles);
%slopes(1), slopes(2), slopes(3), slopes(4), slopes(5)
bints = y - slopes*x;
unitvecs = [cos(sensorangles')
    sin(sensorangles')];

z = ones(size(thetaoffsets))*DMAX;

%y=0
%disp('y=0')
ytmp = 0;
for i=1:length(z)
   if (slopes(i) ~= 0) && ( abs(slopes(i)) < HUGE)
       xtmp = (ytmp-bints(i))/slopes(i);
   elseif (slopes(i) == 0)
       xtmp = HUGE;
   else 
       xtmp = x;
   end
   
   if (xtmp >= 0) && (xtmp <= 30)
       vec = [xtmp ; ytmp] - [x ; y];
       range = vec'*unitvecs(:,i);
       if (range >= 0) && (range < z(i))
           z(i) = range;
       end
   end    
     
end    

%x = 30
%disp('x=30')
xtmp = 30;
for i=1:length(z)   
    if (slopes(i) ~= 0) && ( abs(slopes(i)) < HUGE)
       ytmp = slopes(i)*xtmp + bints(i);
    elseif (slopes(i) == 0)
       ytmp = y;
    else
        ytmp = HUGE;
    end
    
    if (ytmp >= 0) && (ytmp <= 10)
       vec = [xtmp ; ytmp] - [x ; y];
       range = vec'*unitvecs(:,i);
       if (range >= 0) && (range < z(i))
           z(i) = range;
       end
    end
end

%y = 10 (right)
%disp('y=10 right')
ytmp = 10;
for i=1:length(z)
   if (slopes(i) ~= 0) && ( abs(slopes(i)) < HUGE)
       xtmp = (ytmp-bints(i))/slopes(i);
   elseif (slopes(i) == 0)
       xtmp = HUGE;
   else 
       xtmp = x;
   end
   
   if (xtmp >= 20) && (xtmp <= 30)
       vec = [xtmp ; ytmp] - [x ; y];
       range = vec'*unitvecs(:,i);
       if (range >= 0) && (range < z(i))
           z(i) = range;
       end
   end    
     
end        

%x = 20 
%disp('x=20')
xtmp = 20;
for i=1:length(z)   
    if (slopes(i) ~= 0) && ( abs(slopes(i)) < HUGE)
       ytmp = slopes(i)*xtmp + bints(i);
    elseif (slopes(i) == 0)
       ytmp = y;
    else
        ytmp = HUGE;
    end
    
    if (ytmp >= 10) && (ytmp <= 20)
       vec = [xtmp ; ytmp] - [x ; y];
       range = vec'*unitvecs(:,i);
       if (range >= 0) && (range < z(i))
           z(i) = range;
       end
    end
end


%y = 20
%disp('y=20')
ytmp = 20;
for i=1:length(z)
   if (slopes(i) ~= 0) && ( abs(slopes(i)) < HUGE)
       xtmp = (ytmp-bints(i))/slopes(i);
   elseif (slopes(i) == 0)
       xtmp = HUGE;
   else 
       xtmp = x;
   end
   
   if (xtmp >= 10) && (xtmp <= 20)
       vec = [xtmp ; ytmp] - [x ; y];
       range = vec'*unitvecs(:,i);
       if (range >= 0) && (range < z(i))
           z(i) = range;
       end
   end    
     
end    


%x = 10
%disp('x=10')
xtmp = 10;
for i=1:length(z)   
    if (slopes(i) ~= 0) && ( abs(slopes(i)) < HUGE)
       ytmp = slopes(i)*xtmp + bints(i);
    elseif (slopes(i) == 0)
       ytmp = y;
    else
        ytmp = HUGE;
    end
    
    if (ytmp >= 10) && (ytmp <= 20)
       vec = [xtmp ; ytmp] - [x ; y];
       range = vec'*unitvecs(:,i);
       if (range >= 0) && (range < z(i))
           z(i) = range;
       end
    end
end


%y = 10 (left)
%disp('y=10 left')
ytmp = 10;
for i=1:length(z)
   if (slopes(i) ~= 0) && ( abs(slopes(i)) < HUGE)
       xtmp = (ytmp-bints(i))/slopes(i);
   elseif (slopes(i) == 0)
       xtmp = HUGE;
   else 
       xtmp = x;
   end
   
   if (xtmp >= 0) && (xtmp <= 10)
       vec = [xtmp ; ytmp] - [x ; y];
       range = vec'*unitvecs(:,i);
       if (range >= 0) && (range < z(i))
           z(i) = range;
       end
   end    
     
end      


%x = 0
%disp('x=0')
xtmp = 0;
for i=1:length(z)   
    if (slopes(i) ~= 0) && ( abs(slopes(i)) < HUGE)
       ytmp = slopes(i)*xtmp + bints(i);
    elseif (slopes(i) == 0)
       ytmp = y;
    else
        ytmp = HUGE;
    end
    
    if (ytmp >= 0) && (ytmp <= 10)
       vec = [xtmp ; ytmp] - [x ; y];
       range = vec'*unitvecs(:,i);
       if (range >= 0) && (range < z(i))
           z(i) = range;
       end
    end
end

%z = [z 
%    theta];

