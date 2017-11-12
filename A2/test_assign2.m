clear all;

showanswers=1; %change to 0 if you don't want to see the answers

factor=1;%don't change this if you want your answers to match
%factor will be set to a random number by the auto-correct algorithm

[myAnswers,info]=assign2(factor); %assumes there is a file assign1.m with function name 'assign1'
%change your working directory if MATLAB fails to find assign1.m

load assign2_solutions.mat
%contains the answers with factor=1

format long

tol=1e-6;
for i=1:length(myAnswers)
    fprintf('Question %d \n',i);
    diff=myAnswers(i).ans-chrisAnswers(i).ans;
    if sum(sum(abs(diff)))<tol
       fprintf('Your answer matches \n');
       if showanswers==1
           if length(myAnswers(i).ans)>4
               fprintf('showing only first four columns:\n');
               theAnswer=myAnswers(i).ans(:,1:4)
           else
               theAnswer=myAnswers(i).ans
           end;
       end;
    else
       fprintf('Your answer does NOT match \n');
       if showanswers==1
         if length(myAnswers(i).ans)>4
            fprintf('showing only first four columns:\n');
            yourAnswer=myAnswers(i).ans(:,1:4)  
         else
             yourAnswer=myAnswers(i).ans    
         end
         if length(chrisAnswers(i).ans)>4 
            fprintf('showing only first four columns:\n');
            chrisAnswer=chrisAnswers(i).ans(:,1:4)  
         else
            chrisAnswer=chrisAnswers(i).ans
         end
       end;
    end;
end;