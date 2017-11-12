function [solutions,info]=assign1(factor)

info.FirstName='Aklas';
info.LastName='Cheema';
info.UCID='XXXXXXXX'; %without your correct UCID here you cannot get a mark

x0=0.2;
solutions(1).ans=question1(x0*factor);
x0=0.2;
solutions(2).ans=question2(x0*factor);
x0=1.5; y0=0.5;
solutions(3).ans=question3(x0*factor,y0);
x0=8.3; y0=2.4;
solutions(4).ans=question4(x0*factor,y0);
x0=2.1;
solutions(5).ans=question5(x0*factor);
x0=2; y0=3;
solutions(6).ans=question6(x0*factor,y0);
R0=800; C0=1e-6; L0=1e-3;
solutions(7).ans=question7(R0*factor,C0,L0);
k0=2; n0=52;
solutions(8).ans=question8(k0*factor,n0);
V0=120; R0=240; L0=0.5; t0=0.003;
solutions(9).ans=question9(V0*factor,R0,L0,t0);
a0=4; N0=0.085;
solutions(10).ans=question10(a0*factor,N0);
x0=2;
solutions(11).ans=question11(x0*factor);
solutions(12).ans=question12();
x0=0.5 ; y0=1  ;
solutions(13).ans=question13();
solutions(14).ans=question14();
solutions(15).ans=question15();
solutions(16).ans=question16();
solutions(17).ans=question17();
solutions(18).ans=question18();
x0=ones(2,2);
y0=zeros(2,2);
solutions(19).ans=question19(x0*factor,y0);
solutions(20).ans=question20(x0*factor,y0);


    function [answer]=question1(x)
      %first answer has been done for you to give you the idea
      answer=2*sin(x^2)*exp(4);

      %note you can write more than one line of code, and make your own
      %variables:
      a=sin(x^2);
      b=exp(4);
      answer=2*a*b;
    end

    function [answer]=question2(x)
     answer=log(tan(x^2)) - (exp(1)^0.5);
       
    end

    function [answer]=question3(x,y)
      answer=sqrt(sin(x^(2*y)/(pi^2)));
    end

    function [answer]=question4(x,y)
       answer=(x^3) + (y^3) - ((x^3)/(y^3));
    end
    
    function [answer]=question5(x)
        answer=(x^3) + ((3*x)^3) - ((x^3)/((3*x)^3));
    end
    
    function [answer]=question6(x,y)
        A = (x^2)*y;
        B = x^3;
        answer=A*cos(B);
    end

    function [answer]=question7(R,C,L)
        A = L/(2*R);
        B = 1/(R*C);
        answer= -A + sqrt((A^2) - B);
    end

    function [answer]=question8(k,n)
        answer=factorial(n)/factorial(n-k);
    end

    function [answer]=question9(V,R,L,t)
        answer=(V/R)*(1-(exp(1))^((-R*t)/L));
    end

    function [answer]=question10(a,N)
        answer=(log(0.085)/log(4))*log10(0.085);
    end

    function [answer]=question11(x)
         answer=[(x^3)/x, cos(x/pi)^2, exp(1)^x]';
    end

    function [answer]=question12()
         answer=2:2:100;
    end

    function [answer]=question13()
         answer=diag(2:2:100);
    end

    function [answer]=question14()
        answer=eye(100);
    end

    function [answer]=question15()
         answer=[1:100 ; 2:101]';
    end

    function [answer]=question16()
        answer=[ones(1,100) ; zeros(1,100)];
    end

    function [answer]=question17()
        Q = [1:6;7:12;13:18];
        answer=Q(3,:);
    end

    function [answer]=question18()
         answer=[ones(1,4);zeros(1,4);zeros(1,4);ones(1,4)];
    end

    function [answer]=question19(x,y)
        X = [1 1; 1 1];
        Y = [0 0; 0 0];
         answer=[Y X];
    end

    function [answer]=question20(x,y)
        X = [1 1; 1 1];
        Y = [0 0; 0 0];
        answer=[X Y; Y X];
    end;
end
