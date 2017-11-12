clear all;


factor=1;  %leave as 1 for your graphs to match
[myGraphs,info]=assign4(factor)


scrsz = get(0,'ScreenSize'); % get screen size

for i=1:length(myGraphs)
    
     switch i
        case 1
            open question1.fig;
        case 2
            open question2.fig;
        case 3
            open question3.fig;
        case 4
            open question4.fig;
        case 5
             open question5.fig;       
        case 6
             open question6.fig;
         case 7
             open question7.fig;
         case 8 
             open question8.fig;
    end
   if i==5
      t=myGraphs(i).t;
      u=myGraphs(i).u;
      v=myGraphs(i).v;
    end
    if i==3
      r=myGraphs(i).r;
      theta=myGraphs(i).theta;
    end;
    if i~=5 && i~=3
      x=myGraphs(i).x;
      y=myGraphs(i).y;
      z=myGraphs(i).z;
    end;
    
    figure('Position',[0,scrsz(4)/3,500,400]); 
   
    clf;
    eval(myGraphs(i).graph);
   
    fprintf('Question %d:',i);
    in=input(' hit return to continue\n');
    close all
end;