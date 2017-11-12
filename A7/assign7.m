function [solutions,info]=assign7(factor,x,y,current)

info.FirstName='Aklas';
info.LastName='Cheema';
info.UCID='XXXXXXXX';%without your correct UCID here you cannot get a mark


z0=0.01;
solutions(1).ans=question1(z0*factor);
R0=200; C0=160e-6; L0=45e-3;
solutions(2).ans=question2(R0*factor,L0,C0)
X0=-0.1;
solutions(3).ans=question3(X0*factor,x,y);
L0=3;R0=10;C0=80e-6;
solutions(4).ans=question4(L0*factor,R0,C0,current);
 
    function [answer] = question1(z)
        epsilon = 8.85*(10^(-12));
        sigma = 300*(10^(-6));
        R = 0.05;
        
        top = sigma * z;
        bottom = 4 * epsilon;
        term = top/bottom;
        
        eqn = sym('((r^2 + z^2)^(-3/2))*2*r');
        sum = int(term*eqn, 'r', 0, R);
        sum = subs(sum, 'z', z);
        answer = vpa(sum);
    end
    
    function [answer] = question2(R,L,C)
        eqn = sym('(1)/sqrt((R^2) + (omega*L - (1/(omega*C)))^2)');
        eqn = subs(eqn, 'R', R);
        eqn = subs(eqn, 'L', L);
        eqn = subs(eqn, 'C', C);
        d1 = diff(eqn, 'omega');
        criticalPoints = vpa(solve(d1 == 0, 'omega'))';
        
        validCriticalPoints = [];
        index = 1;
        for omega = criticalPoints
            if (0.5/sqrt(L*C)<omega) & (omega < 1.5/sqrt(L*C))
                validPoints(1, index) = omega;
                validPoints(2, index) = vpa(subs(eqn, 'omega', omega));
                index =  index + 1;
            end
        end
        [value index] = max(validPoints(2,:));
        maxOmega = validPoints(1, index);
        answer=maxOmega/(2*pi);
    end

    function [answer]=question3(X,x,y)
        eqn = sym('((x+2)/2)^2 + ((y-5)/4)^2 = 1');
        topbottomeqn = solve(eqn,'y');
        
        equation = topbottomeqn(2);
        derivative = diff(equation, 'x');
        
        slope = subs(derivative, 'x', X);
        
        yValue = subs(equation, 'x', X);
        
        eqn = sym('y = slope * x + b');
        eqn = subs(eqn, 'slope', slope);
        eqn = subs(eqn, 'y', yValue);
        eqn = subs(eqn, 'x', X);
        b = solve(eqn, 'b');
        
        eqn = sym('slope * x + b');
        eqn = subs(eqn, 'slope', slope);
        eqn = subs(eqn, 'b', b);
        
        answer = eqn;
    end

    function [answer]=question4(L,R,C,current)
        %use current instead of i
        % DID DO IT. 75% is good enough and the assignments took long
        % enough as is
        
        % UPDATE: Man this sucks... I have to come back and do this question
        % UPDATE: WOW! This was much easier then I anticipated
        
        answer=subs(dsolve('L*D2current + R*Dcurrent + current*(1/C) = 0', 'current(0) = 0', 'Dcurrent(0) = 8'));
    end
    
end
