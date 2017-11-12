function [solutions,info]=assign2(factor)

info.FirstName='Aklas';
info.LastName='Cheema';
info.UCID='XXXXXXXX';%without your correct UCID here you cannot get a mark



X0=[-100:100]; 
solutions(1).ans=question1(X0*factor);
R0=0.06;
X0 = [0.02:0.0001:0.06] ; 
solutions(2).ans=question2(R0*factor,X0);
R0=3800; C0=4000e-6;
solutions(3).ans=question3(R0*factor,C0);
solutions(4).ans=question4();
solutions(5).ans=question5();
solutions(6).ans=question6();
A0 = [ 1 -1 1 ; -1 1 -1 ; 1 -1 1 ]; B0= [ 10 2 0 ; 3 8 3 ; 1 3 12 ]; 
solutions(7).ans=question7(A0*factor,B0);
A0 = [ 1 -3 5 ; 2 2 4 ; -2 0 6 ]; B0 = [ 0 -2 1 ; 5 1 -6 ; 2 7 -1 ];
solutions(8).ans=question8(A0*factor,B0);
A0 = [ 1 -3 5 ; 2 2 4 ; -2 5 6 ]   ;
solutions(9).ans=question9(A0);
solutions(10).ans=question10();


    function [answer]=question1(X)
        Y = 0.2 * (X.*X.*X) + 10;
        answer= [X+Y ; X-Y; Y];
    end

    function [answer]=question2(R,X)
        top = X * (9604.5 * R);
        bottom = ((X.^2) + R*R).^(3/2);
        answer= [X; top./bottom];
    end

    function [answer]=question3(R,C)
        time = 0:2:20;
        voltage = 24 * (1 - exp(time/(-1*R*C)));
        current = (24/R) * exp(time/(-1*R*C));
        answer = [time; voltage; current];
    end

    function [answer]=question4()
        u = [-2, 2, 3];
        v = [3, 3, 2];
       answer=u*v';
    end
    
    function [answer]=question5()
        u = [-2, 2, 3];
        v = [3, 3, 2];
       answer=cross(u, v);
    end
    
    function [answer]=question6()
        recOne2Twenty = 1./(1:20);
        recOne2Hundred = 1./(1:100);
        recOne2Thousand = 1./(1:1000);
        a = (pi^2)/6;
       answer=[abs(recOne2Twenty*recOne2Twenty' - a), abs(recOne2Hundred*recOne2Hundred' - a), abs(recOne2Thousand*recOne2Thousand' - a)];
    end

    function [answer]=question7(A,B)
       answer=B'*B*A;
    end

    function [answer]=question8(A,B)
       answer=(B + B*A'*B)*inv(A);
    end

    function [answer]=question9(A)
        answer=A*(1./A);
    end

    function [answer]=question10()
         A = [-10, 44, 17, 0; 9, -28, 61, 6; 17, 16, -15, -9; 4, 0, -7, -17];
         b = [-5, 1, -11, -35]';
         answer=(A\b)';
    end

    
end
