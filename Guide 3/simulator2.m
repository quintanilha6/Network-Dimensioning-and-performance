function [bHD,b4K]= simulator2(lambda,S,W,p,Mhd,M4k,R)
  
  %lambda = request arrival rate (in requests per hour)
  %C= Internet connection capacity (in Mbps)
  C = 100*S; %Mbps
  %M= throughput of each movie (in Mbps)
  %R= stop simulation on ARRIVAL no. R
  p = p/100;   % para ser %
  invlambdaHD=60/(lambda *(1 - p));    %average time between requests (in minutes)
  invlambda4K=60/(lambda * p);        % FOR 4k
  invmiu= load('movies.txt'); %duration (in minutes) of each movie
  Nmovies= length(invmiu);    % number of movies

  %Events definition:
  ARRIVAL_HD = 0; % HD movie request
  ARRIVAL_4K = 1; % 4K movie request
  
  %{
  for i=1:S
    DEPARTURE_HD(i) = 2; %termination of an HD movie transmission
    DEPARTURE_4K(i) = 3; %termination of a 4K movie transmission
  end
  %}
  
   DEPARTURE_HD = 2; %termination of an HD movie transmission
   DEPARTURE_4K = 3; %termination of a 4K movie transmission
  
  %State variables initialization:
  STATE= zeros(1,S);  
  STATE_HD = 0;   %total throughput of HD movies in transmission

  %Statistical counters initialization:
  
  NARRIVALS = 0;    %total number of movie requests
  NARRIVALS_HD = 0; %number of HD movie requests
  NARRIVALS_4K = 0; %number of 4K movie requests
  BLOCKED_HD = 0;   %number of blocked HD movie requests
  BLOCKED_4K = 0;   %number of blocked 4K movie requests

  %Simulation Clock and initial List of Events:
  Clock = 0;
  EventList= [ARRIVAL_HD exprnd(invlambdaHD) 0
              ARRIVAL_4K exprnd(invlambda4K) 0];
  EventList = sortrows(EventList,2);


  while NARRIVALS < R
      %EventList(1,1)
      
    event= EventList(1,1);
    Clock= EventList(1,2);
    server = EventList(1,3);
    EventList(1,:)= [];
    
    if event == ARRIVAL_HD %arrival of HD movie
       %"Arrival HD"
      %find server with lowest load
      server = find(STATE==min(STATE));
      server = server(1);
      
      EventList = [EventList; ARRIVAL_HD Clock+exprnd(invlambdaHD) 0];
      NARRIVALS_HD = NARRIVALS_HD+1;
      NARRIVALS = NARRIVALS +1;
      
      if STATE(server) + Mhd <= 100 && STATE_HD + Mhd <= C - W
          STATE(server) = STATE(server) + Mhd;
          STATE_HD = STATE_HD + Mhd;
          
          EventList= [EventList; DEPARTURE_HD Clock+invmiu(randi(Nmovies)) server];
            
      else
        BLOCKED_HD= BLOCKED_HD+1;
      end
      
    elseif event == ARRIVAL_4K %arrival of 4K movie 
      %"ARRIVAL 4K"
      %find server with lowest load
      server = find(STATE==min(STATE));
      server = server(1);
      
      EventList = [EventList; ARRIVAL_4K Clock+exprnd(invlambda4K) 0];
      NARRIVALS_4K= NARRIVALS_4K+1;
      NARRIVALS = NARRIVALS +1;
      
      if STATE(server) + M4k <= 100
        STATE(server) = STATE(server) + M4k;
        EventList = [EventList; DEPARTURE_4K Clock+invmiu(randi(Nmovies)) server];
      else
        BLOCKED_4K= BLOCKED_4K+1;
      end
      
    elseif event == DEPARTURE_HD %departure of HD movie 
        %"DEPARTURE HD"
      STATE(server) = STATE(server) - Mhd;
      STATE_HD = STATE_HD - Mhd;
      
    elseif event == DEPARTURE_4K %departure of 4K movie
        %"DEPARTURE 4K"
      STATE(server) = STATE(server) - M4k;
    end
    
    EventList= sortrows(EventList,2);
    
  end
  bHD= 100*BLOCKED_HD/NARRIVALS_HD; % HD blocking probability in %
  b4K= 100*BLOCKED_4K/NARRIVALS_4K; % 4K blocking probability in %
end