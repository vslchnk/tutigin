function [f, C0, C, Cab, y, SKO] = myfunc_comp ( N, M, T, kp)            
    C0=0;    
    for i=1:N+1 %��������� ��������� �������       
        t=2*pi*(i-1)/N;    
        f(i)=sin(2*pi*kp*(i-1)/N); % ������������� �������  
    end

    C0=C0*(2/N);
    for k=1:M
       C(k)=0; 
    end
    
    for i=1:N+1
        for k=1:M
        C(k)=C(k)+f(i)*exp(-j*2*pi*k*(i-1)/N);     
        end
    end
    
    for k=1:M
        C(k)=C(k)*(2/N);
    end 
    
    for k=1:M 
        Cab(k)=abs(C(k));%������������ Cab(k)- ����������� ����� ���� a+jb,     
    end
    
    %���������� � ����������� ������� �������� (�����) 
    for i=1:N+1
        y(i)=0;
        
        for k=1:M    
            y(i)=y(i)+C(k)*exp(j*2*pi*k*(i-1)/N);   
        end
        y(i)=C0/2+y(i);
    end

    
    for i=1:N+1
       DZ(i)=abs(f(i)-real(y(i)));    
    end
    
    DZ1=DZ/max(f)*100;
    SKO=std(DZ1)    
end
