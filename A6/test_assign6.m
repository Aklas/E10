clear all;

showanswers=0; %change to 0 if you don't want to see the answers

showFigures=1; %change to 0 if you don't want to see what question 2 and 3 look like
%note that you are not supposed to do the figures yourself

factor=1;%don't change this if you want your answers to match
%factor will be set to a random number by the auto-correct algorithm

[myAnswers,info]=assign6(factor); %assumes there is a file assign5.m with function name 'assign1'
%change your working directory if MATLAB fails to find assign5.m

load assign6_solutions.mat
%contains the answers with factor=1

format longg

if showFigures==1
 open question2assign6.fig
 open question3assign6.fig
end

tol=1e-2;
for i=1:length(myAnswers)
    fprintf('Question %d \n',i);
    diff=myAnswers(i).ans-chrisAnswers(i).ans;
    if sum(sum(abs(diff)))<tol
       fprintf('Your answer matches \n');
       if showanswers==1
           
               theAnswer=myAnswers(i).ans
               
       end;
    else
       fprintf('Your answer does NOT match \n');
       if showanswers==1
        
            yourAnswer=myAnswers(i).ans    
                
            chrisAnswer=chrisAnswers(i).ans
         
       end;
    end;
end;