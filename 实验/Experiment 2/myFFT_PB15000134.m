function y = myFFT_PB15000134(x,N)
%x: �������У� ��������
%N: DFT ������
%X: ������У�����Ϊ N��������

nx = 0:N-1;
nx = nx';
j1 = N/2;
    for i1 = 1:N-1 
        if i1<j1
            temp = nx(j1+1);
            nx(j1+1) = nx(i1+1);
            nx(i1+1) = temp;
        end
        k = N/2;
        while(j1>=k)
            j1 = j1-k;
            k = k/2;
        end
        if j1<k
           j1 = j1+k;
        end
    end

y = x(nx+1);    %������������Ϊ�ĳ�ʼֵ

m = log2(N);
for mm = 1:m                    %��DFT��m�λ�2�ֽ⣬�����ң���ÿ�ηֽ���DFT����
    Nmr = 2^mm;
    u = 1;                      %��ת����u��ʼ��
    WN = exp(-1i*2*pi/Nmr);     %���ηֽ�Ļ���DFT����WN��exp(-i*2*pi/Nmr)
    for k1 = 1:Nmr/2            %���ο�Խ����ڵĸ��ε������㣬������1->2->4->8->...
        for kp1 = k1:Nmr:N      %���ε�������Ŀ�Խ���ΪNmr=2^mm 
            kp2 = kp1+Nmr/2;    %ȷ����������Ķ�Ӧ��Ԫ�±�
            t = y(kp2)*u;       %��������ĳ˻���
            y(kp2) = y(kp1)-t;  %��������ļӷ���
            y(kp1) = y(kp1)+t;  %�Ż�ԭ�����±�λ��
        end
        u = u*WN;               %�޸���ת���ӣ����һ������DFT����WN
    end
end

end