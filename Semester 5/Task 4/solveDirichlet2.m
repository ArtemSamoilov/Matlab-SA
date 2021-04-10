function unum = solveDirichlet2(fHandle,xiHandle,etaHandle,mu,N,M)
    deltax = 1/N;
    deltay = 1/M;
    x = linspace(0,1-deltax,N);
    y = linspace(0,1-deltay,M);
    [X,Y] = meshgrid(y,x);

    f = fHandle(X,Y);

    f(1:N,1)=0;
    f(1,1:M)=0;

    xi(1:M) = xiHandle(y(1:M));

    eta(1:N) = etaHandle(x(1:N));

    alpha = ifft(xi);
    beta = ifft(eta);
    C = zeros(N,M);
    for p=1:N
        C(p,1:M) = -4*(sin(pi*(p-1)/N)).^2/(deltax.^2)-4*(sin(pi*((1:M)-1)/M)).^2/(deltay.^2)-mu;
    end
    mainmatrix = zeros(N+M-1,N+M-1);
    mainvector = zeros(1,N+M-1);
    %��������� �������� N �������
    Dmat = ifft2(f);
    for p=1:N
        % �������� �������� ������ �����
        DD = (1./C(p,1:M)).*Dmat(p,1:M);
        D = sum(DD);
        mainvector(p) = beta(p)-D;

        Cdivided(1:M)=1./C(p,1:M);

        A = ifft(Cdivided)/N;
        % ������ ������� ��������� ��������
        mainmatrix(p,2:M)=A(2:M);
        % ��������� ������ M ��������� p-��� �������

        mainmatrix(p,1) = mainmatrix(p,1)+sum(Cdivided)./(M*N);
        % ������ ������� ��������� ��������

        mainmatrix(p,(2:N)+M-1) = (sum(Cdivided)./(M*N))*exp((2*pi*1j*((2:N)-1)*(p-1))/N);
        %��������� M+1 ...N+M-1 ����� �������

        % ��������� (p,1) ��������� ���������
    end

    %��������� ������ ����� �������
    for q = 2:M
        DD = (1./C(1:N,q)).*Dmat(1:N,q);
        D = sum(DD);
        mainvector(q+N-1) = alpha(q)-D;
        % ��������� ������ �����

        Cdivided(1:N)=1./C(1:N,q);

        %�������� ��������������� ��������

        mainmatrix(q+N-1,1) = mainmatrix(q+N-1,1)+sum(Cdivided)./(M*N);
        % ��������� � 0(1) �������

        mainmatrix(q+N-1,2:M) = (sum(Cdivided)./(M*N))*exp((2*pi*1j*((2:M)-1)*(q-1))/M);
        % ��������� ������ M ���������

        B = ifft(Cdivided)/M;

        %��������� � 0(1) ��������
        mainmatrix(q+N-1,M+(2:N)-1)=B(2:N);
    end
    %fNM = bicg(mainmatrix,mainvector',1e-7,1000);
    %fNM = gmres(mainmatrix,mainvector',[],1e-7,1000);
    %fNM = lsqr(mainmatrix,mainvector',1e-7,1000);
    %fNM = qmr(mainmatrix,mainvector',1e-7,1000);
    fNM = cgs(mainmatrix,mainvector',1e-7,1000);
    % ������ �������
    f(1,1:M) = fNM(1:M);
    f(2:N,1) = fNM(M+(2:N)-1);
    % ��������� ������� f ������������ ����������
    bpq = ifft2(f);

    apq = zeros (N,M);
    apq = bpq./C;
    unum = real(fft2 (apq));
end
