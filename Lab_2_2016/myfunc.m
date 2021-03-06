function [ f, Sa, Sb, Sa0, Sab, y, CKO_proc] = myfunc( N, K, T, kp)        
    Sa = zeros(1,K);
    Sb = zeros(1,K);
    f=zeros(1,N+1);
    Sa0=0;

    for i=1:N+1        
        t=2*pi*(i-1)/N;
    
        f(i)=sin(kp * t);
        Sa0=Sa0+f(i);           
    end

    Sa0=Sa0/N; %����������� ����. a0/2
    %Saa0=pi^2/3 %%������������ ������������ ����. �0/2 ��� ������� t^2
    for i=1:N+1
        for j=1:K
            Sa(j) = (Sa(j)+f(i)*cos((j)*2*pi*(i-1-N/2)/N));
            Sb(j) = (Sb(j)+f(i)*sin((j)*2*pi*(i-1-N/2)/N));        
        end
   
    end
    
    for j=1:K
        Sa(j)=Sa(j)*(1/(N/2));
        Sb(j)=Sb(j)*(1/(N/2));
        % Saa(j)= 4*(-1)^j/(j^2);%������������ ������������ ����. �k ��� ������� t^2
    end
    
    for j=1:K 
        Sab(j)=sqrt(Sa(j)^2+Sb(j)^2);
    end
    
    y=zeros(1,N+1);
    for i=1:N+1
        for j=1:K
            y(i)= y(i)+Sa(j)*cos(j*2*pi*(i-1-N/2)/N)+Sb(j)*sin(j*2*pi*(i-1-N/2)/N);        
        end  
        y(i)=Sa0+y(i);
    end
    
    for i=1:N+1
        dy(i)=y(i)-f(i);%���������� ����������� ��������������
    end
    dy_proc=dy/max(f)*100;
    CKO=std(dy);
    CKO_proc=std(dy_proc)%��� � ���������    
end

