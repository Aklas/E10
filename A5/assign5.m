function [solutions,info]=assign5(factor)

info.FirstName='Aklas';
info.LastName='cheema';
info.UCID='XXXXXXXX';%without your correct UCID here you cannot get a mark

n0=5;
solutions(1).ans=question1(n0*factor);
n0=30;
solutions(2).ans=question2(n0*factor);
X0=0.5;
s0(1).operation='invert';
s0(2).operation='root2';
s0(3).operation='none'; 
solutions(3).ans=question3(X0*factor,s0);
solutions(4).ans=question4();
V0=0.1; R0=600; L0=0.14;
solutions(5).ans=question5(V0*factor,R0,L0);
x0=1.1*2*pi;
solutions(6).ans=question6(x0*factor)
P0=5;
solutions(7).ans=question7(P0*factor)
f= @(x) x^2*exp(x);
x0=0.25;
solutions(8).ans=question8(f,x0*factor)

    function [answer]=question1(n)
      A = zeros(3, n);
      for row = 1:3
          for column = 1:n
              A(row, column) = (row^column)/(row + column);
          end
      end
      answer=A;
    end

    function [answer]=question2(n)
      A=1:n;
      B=1:n
      A(2) = 1;
      for a = 3:n
          A(a) = A(a-1) + A(a-2);
      end
      for a = 1:n
          sum = 0;
          for b = 1:a
              sum = sum + 1/(A(b));
          end
          B(a) = sum;
      end
      answer = B;
    end
    
    function [answer]=question3(x,s)
        answer = 1:length(s);
        for n=1:length(s)
            term = s(n).operation;
            switch term
                case 'invert'
                    answer(n) = 1/x;
                case 'root2'
                    answer(n) = 1/sqrt(2);
                otherwise
                    answer(n) = 0;
            end
        end
    end

    function [answer]=question4()
      n=20;
      answer=zeros(10,3);
      inc = 1;
      for a = 1:n-1
          for b = 1:n-1
              k = a^2 + b^2;
              c = sqrt(k);
              if c == floor(c) & inc <= 10 & c < n
                  answer(inc, 1) = a;
                  answer(inc, 2) = b;
                  answer(inc, 3) = c;
                  inc = inc + 1;
              end
          end
      end
    end

    function [answer]=question5(Vratio,R,L)
        answer = sqrt(((1/Vratio)^2) - 1) * (R/L);
    end
    
    function [answer]=question6(x)
        x = mod(x, 2*pi);
        Sum1less = 1;
        Sum = term(x, 1) + Sum1less;
        n = 2;
        while (abs((Sum - Sum1less)/Sum1less) > 0.000001)
            Sum1less = Sum;
            Sum = Sum1less + term(x, n);
            n = n + 1;
        end
        answer=[Sum n - 1];
    end

    function [answer] = term(angle, n)
        top = ((-1)^n) * (angle^(2*n));
        bottom = factorial(2*n);
        answer = top/bottom;
    end

    function [answer]=question7(P)
        firstTerm = P;
        nextTerm = firstTerm - ((firstTerm^5)-P)/(5*(firstTerm^4));
        i = 1;
        while abs((nextTerm - firstTerm)/firstTerm) > 0.00001
            firstTerm = nextTerm;
            nextTerm = firstTerm - ((firstTerm^5)-P)/(5*(firstTerm^4));
            i = i + 1;
        end
        answer= [nextTerm i];
    end
     
    function [answer]=question8(f,x)
        h = x/10;
        Term1 = x - 2*h;
        Term2 = x - h;
        Term3 = x + h;
        Term4 = x + 2*h;
        Term1 = f(Term1);
        Term2 = f(Term2)*-1;
        Term3 = f(Term3);
        Term4 = f(Term4)*-1;
        num = (Term1 + Term2 + Term3 + Term4);
        den = 12*h;
        answer= [num den num/den];
    end
end
