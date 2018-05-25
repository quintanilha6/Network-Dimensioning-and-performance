function [b o]= simulator1(lambda,C,M,R)
  
  %lambda = request arrival rate (in requests per hour)
  %C= Internet connection capacity (in Mbps)
  %M= throughput of each movie (in Mbps)
  %R= stop simulation on ARRIVAL no. R

  invlambda=60/lambda; %average time between requests (in minutes)
  invmiu= load('movies.txt'); %duration (in minutes) of each movie
  Nmovies= length(invmiu); % number of movies

  %Events definition:
  ARRIVAL= 0; %movie request
  DEPARTURE= 1; %termination of a movie transmission

  %State variables initialization:
  STATE= 0;

  %Statistical counters initialization:
  LOAD= 0;
  NARRIVALS= 0;
  BLOCKED= 0;

  %Simulation Clock and initial List of Events:
  Clock= 0;
  EventList= [ARRIVAL exprnd(invlambda)];

  while NARRIVALS < R
      
    event= EventList(1,1);
    Previous_Clock= Clock;
    Clock= EventList(1,2);
    EventList(1,:)= [];
    LOAD= LOAD + STATE*(Clock-Previous_Clock);  %actualiza 
    
    if event == ARRIVAL %para arrival
      EventList= [EventList; ARRIVAL Clock+exprnd(invlambda)];
      NARRIVALS= NARRIVALS+1;
      
      if STATE + M <= C
        STATE= STATE+M;
        EventList= [EventList; DEPARTURE Clock+invmiu(randi(Nmovies))];
      
      else
        BLOCKED= BLOCKED+1;
      end
      
    else   % para Departura
      STATE= STATE-M;
    end
    
    EventList= sortrows(EventList,2);
    
  end
  b= 100*BLOCKED/NARRIVALS; % blocking probability in %
  o= LOAD/Clock; % average connection occupation in Mbps
end