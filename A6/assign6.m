function [solutions,info]=assign6(factor)

info.FirstName='Aklas';
info.LastName='Cheema';
info.UCID='XXXXXXXX';%without your correct UCID here you cannot get a mark

n=3*factor;
P0=ones(1,n);
solutions(1).ans=question1(P0);
h0 = [0         608        1520        2280        3040        6384        7904];
T0 = [100.00   98.8889   95.0000     92.2222     90.0000     81.1111      75.5556];
n=2;
solutions(2).ans=question2(h0,T0,n*factor);
t0 = 10:10:50;
N0 = [38000 60000 250000 500000 1000000];
solutions(3).ans=question3(t0*factor,N0);
b0=2;
solutions(4).ans=question4(b0*factor);
V0 = 20:20:160;
F0 = [10,50,109,180,300,420,565,771];
v=70;
solutions(5).ans=question5(V0,F0,v*factor);
R0=200; C0=160e-6; L0=45e-3;
solutions(6).ans=question6(R0*factor,L0,C0)
z0=0.01;
solutions(7).ans=question7(z0*factor)
 
    function [answer] = question1(p)
        y = [-0.001 0.051 0 3.8 -1.4];
        if length(p) >= length(y)
            vector = [(zeros(1, (length(p) - length(y)))) y];
            poly = p + vector;
        else
            vector = [(zeros(1, (length(y) - length(p)))) p];
            poly = vector + y;
        end
        answer = max(real(roots(poly)));
    end
    

    function [answer]=question2(h,T,n)
        linearEQ = polyfit(h, T, 1);
        nthPoly = polyfit(h, T, n);
        linearEQvalues = polyval(linearEQ, h);
        nthPolyvalues = polyval(nthPoly, h);
        linearError = sum(abs(linearEQvalues - T)) / length(h);
        nthPolyError = sum(abs(nthPolyvalues - T)) / length(h);
        answer = [linearError nthPolyError];
    end

    function [answer]=question3(t,N)
        N = log(N);
        eq = polyfit(t, N, 1);
       answer=[exp(eq(2))  eq(1)];
    end

    function [answer]=question4(b)
        h = @(x) sin(x) + b*log(x);
        answer=fzero(h, 5);
    end

    function [answer]=question5(V,F,v)
        answer=interp1(V, F, v, 'spline');
    end
    
    function [answer]=question6(R,L,C)
        I = @(omega) (-1)/sqrt((R^2) + (omega*L - (1/(omega*C)))^2);
        lowerRange = 0.5/sqrt(L*C);
        upperRange = 1.5/sqrt(L*C);
        answer = fminbnd(I, lowerRange, upperRange) / (2*pi);
    end

    function [answer]=question7(z)
        epsilon = 8.85 * 10^-12;
        sigma = 300 * 10^-6;
        R = 0.05;
        
        fun = @(r) 2.*r.*(z.^2 + r.^2).^(-3/2);
        output1 = quad(fun, 0, R);
        E1 = (sigma * z * output1)/(4 * epsilon);
        
        % I was able to calculate the first part but couldn't caluclute the
        % second part. I just didn't what to do.
        % NVM I got it!!!!!!
        
        tspan = [0 R];
        y0 = 0;
        [t,E] = ode45(@(r,E) ((sigma.*z)./(4.*epsilon)).*(2.*r.*(z.^2 + r.^2).^(-3/2)), tspan, y0);
        
        
        answer=abs(E(length(E)) - E1);
    end
   
    
end
