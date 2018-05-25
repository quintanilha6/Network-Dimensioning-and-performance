function [pos,vel]= InitialRandom(N,S)
%Computes a matrix �pos� of N rows and 2 columns with the coordinates of nodes (see Section 3.1) and a matrix �vel� of N rows and 2 columns with the initial horizontal and vertical components of the speed vector of each mobile node (see Section 3.2).
pos= [50*randi([0 6],N/2,1) 200*rand(N/2,1)];
pos= [pos; 300*rand(N/2,1) 50*randi([0 4],N/2,1)];
vel_abs= S*rand(N,1);
vel_angle= pi*randi([0 1],N/2,1) - pi/2;
vel_angle= [vel_angle; pi*randi([0 1],N/2,1)];
vel= [vel_abs.*cos(vel_angle) vel_abs.*sin(vel_angle)];
end