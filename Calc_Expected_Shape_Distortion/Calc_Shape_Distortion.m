% This script was used to determine the location of the red arrow in figure 8.
% The red arrow represents the expected shape distortion given the expected
% slant distortion (e.g. change in binocular disparity). This script 
% caluclates the ratio of the two sides of the rectangle.

clear all;
close all;

% distance from cyclopian eye to the rectangle.
dist_m = 0.293;

% size of rectangle
RectH_dg = 16;
RectW_dg = 16;
RectHalfW_m   = (2*(dist_m )).*tand((RectW_dg./2)./2); 
RectHalfH_m  = (2*(dist_m )).*tand((RectW_dg./2)./2);

%Slant of the rectangle. 
slant = 9.8; % expected slant distortion at the stimulus distance. positive slants=slant away from right eye
display(['Slant = ', num2str(slant), ' deg']);
slant = slant.*-1; %reverse the sign of the slant to correct sign conversion issues later

% Corners of a rectangle
x = [-RectHalfW_m,-RectHalfW_m,RectHalfW_m,RectHalfW_m]; % bottomleft , topleft, topright, bottomright
y = [-RectHalfH_m,RectHalfH_m,RectHalfH_m,-RectHalfH_m];
z = [dist_m,dist_m ,dist_m ,dist_m];


% SPECIFY THE PLANE
% point on plane 
x0 = 0;
y0 = 0;
z0 = dist_m; %negative distance

% frontoparallel plane normal (surface normal vector)
a0 = 0;
b0 = 0; 
c0 = 1; 

% CALCULATE PLANE FOR A GIVEN SLANT
% adjust surface normal to specified slant
a = a0*cosd(slant) - c0*sind(slant); % x coordinate for surfance normal vector
b = b0;                              % y coordinate doesn't change because we are rotating around a vertical axis
c = a0*sind(slant) + c0*cosd(slant); % z coordinate for surface normal vector

% Equation for a plane
d = -a*x0 - b*y0 - c*z0; 

% Identify the xposition of the corners given the slant 
x_slanted = x*cosd(slant);

% solve for z 
z_slanted= (-d - a.*x_slanted - b.*y)./c; 

%% plot the results to double check

    % PLOT ORTHOGRAPHIC VIEW OF THE RECTANGLE'S CORNERS
    figure(50); hold on; % note that this orthographic projection does not show what the stimulus would actually look like on screen
    subplot(1,2,1); hold on; title('cyclopean frontal view');
    s = plot3(x_slanted(:),y(:),z_slanted(:),'-ro'); %slanted
    or = plot3(x(:),y(:),z(:),'-ko'); %oritinal dots
    view([0 90]); %side view
    xlabel('x'); ylabel('y');
    legend([s or],'slanted','original');
    
    subplot(1,2,2); hold on; title('top down view');
    plot3(x_slanted(:),y(:),z_slanted(:),'-ro'); %plots the dots from a top view
    plot3(x(:),y(:),z(:),'-ko'); %oritinal dots
    view([0 0]); %top view
    xlabel('x'); ylabel('z');
    
    
    %PLOT USING PERSPECTIVE PROJECTION
    f = 1;
    xo = f*x(:)./z(:);
    yo = f*y(:)./z(:);
    
    xs = f*x_slanted(:)./z_slanted(:);
    ys = f*y(:)./z_slanted(:);
    
    figure(51); hold on;
    plot(xo,yo,'-ko'); %original
    plot(xs,ys,'-ro'); %slanted
    axis equal;


%% Identfiy the ratio of right height / left height of the shape
%this is the caluclation we do in the paper to measure the shape distortion

ratioPercieved = ys(4)./ ys(1); %half height of right side divided by the left side
display(ratioPercieved)

ratioAdjusted = ys(1) ./ ys(4); % expected adjusted ratio which is the inverse of the percieved because they are nulling the distortion
display(ratioAdjusted);

%this is the value that the red arrow signifies in figure 8 which is a
%difference in ratios between the start minus pre measurement
expectedDiff = ratioAdjusted - 1;
disp(['expected difference in start-pre measurement =', num2str(expectedDiff)]);


