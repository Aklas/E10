clear all;

showanswers=0; %change to 0 if you don't want to see the answers

showFigures=1; %change to 0 if you don't want to see what question 2 and 3 look like

factor=1;%don't change this if you want your answers to match
%factor will be set to a random number by the auto-correct algorithm

syms x y current
[myAnswers,info]=assign7(factor,x,y,current); %assumes there is a file assign7.m with function name 'assign1'
%change your working directory if MATLAB fails to find assign7.m

load assign7_solutions.mat
%contains the answers with factor=1


tol=1e-8;
for i=1:length(myAnswers)
    fprintf('Question %d \n',i);
    
    myAns=subs(myAnswers(i).ans,0.1);
    chrisAns=subs(chrisAnswers(i).ans,0.1);
    diff=vpa(myAns)-vpa(chrisAns);
    if sum(sum(abs(diff)))<tol
       fprintf('Your answer matches \n');
       if showanswers==1
           
               theAnswer=vpa(myAnswers(i).ans)
               
       end;
    else
       fprintf('Your answer does NOT match \n');
       if showanswers==1
        
            yourAnswer=vpa(myAnswers(i).ans)    
                
            chrisAnswer=vpa(chrisAnswers(i).ans)
         
       end;
    end;
end;