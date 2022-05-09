%Determine the shape of a rectangle that has been slanted a given
%amount. This will allow is to predict the expected shape distortion for a
%given change in binocular disparity. 
clear all;
close all;
%calculate the positions of four corners of a rectangle after it has
%been slanted a given amount. Then caluclate the ratio of the two sides of
%the rectangle.

%NOTE: y coordinate in the world won't change but the height changes after
%prospective projection of the rectangle

%define distance from cyclopian eye to the rectangle.
dist_m = 0.293;
%Define size of rectangle
RectH_dg = 16;
RectW_dg = 16;
RectHalfW_m   = (2*(dist_m )).*tand((RectW_dg./2)./2); %zdist is originally negative so you have to make it postive
RectHalfH_m  = (2*(dist_m )).*tand((RectW_dg./2)./2);

%Slant of the rectangle. 
slant = 9.8;
display(['Slant = ', num2str(slant), ' deg']);

%Define four corners of a rectangle
%order: bottomleft , topleft, topright, bottomright
x = [-RectHalfW_m,-RectHalfW_m,RectHalfW_m,RectHalfW_m];
y = [-RectHalfH_m,RectHalfH_m,RectHalfH_m,-RectHalfH_m];
z = [dist_m,dist_m ,dist_m ,dist_m];


%THINGS YOU NEED TO SPECIFY A PLANE
% to specify a plane you need a point on that plane and a surface normal
% vector. To adjust the slant of the plane, we will adjust the surface
% normal vector. These will be used to specify the texture and disparity planes.

% point on plane 
x0 = 0;
y0 = 0;
z0 = dist_m; %negative distance

% frontoparallel plane normal (surface normal vector)
a0 = 0;
b0 = 0; 
c0 = 1; %specifies the direction the vector is pointing. this must remain 1 for the calculations

%CALCULATE PLANE FOR A GIVEN SLANT
% adjust surface normal to specified slant (this changes the surface normal vector)
%a and c are the new x and z coordinates for the surface normal vector a the new slant
a = a0*cosd(slant) - c0*sind(slant); %x coordinate for surfance normal vector
b = b0; % y coordinate doesn't change because we are rotating around a vertical axis
c = a0*sind(slant) + c0*cosd(slant); %z coordinate for surface normal vector

% Equation for a plane
% solve for d (https://mathworld.wolfram.com/Plane.html)
d = -a*x0 - b*y0 - c*z0; 

%Identify the X POSITION OF THE DOTS
% before solving for z, we need to correct the x coordinates as appropriate
% for the slant angle that specifies slant. The x values must 
x_slanted = x*cosd(slant);

% solve for z position of the dots
z_slanted= (-d - a.*x_slanted - b.*y)./c; %all the z coordinates of texture specified slanted plane

%% plot the results to double check

    % PLOT THE DOTS
    %orthographic view of dots
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
    % manually calculate perspective projection of original grid and adjusted
    % grid. This is necessary because the MATLAB default is orthographic
    % projection.
    f = 1;
    xo = f*x(:)./z(:);
    yo = f*y(:)./z(:);
    
    xs = f*x_slanted(:)./z_slanted(:);
    ys = f*y(:)./z_slanted(:);
    
    figure(51); hold on;
    plot(xo,yo,'-ko'); %original
    plot(xs,ys,'-ro'); %slanted
    axis equal;

%% Identfiy the ratio of the right height to left height of the shape
%this is the caluclation we do in the paper to measure the shape distortion

%After calculating prospective projection the y values have changed
%approaprietly with the slanted plane
ratioPercieved = ys(4)./ ys(1); %half height of right side divided by the left side
display(ratioPercieved)

