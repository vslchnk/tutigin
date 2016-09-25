function [] = mygraph(N, K, Sa, Sab, f, y)
    i=1:K;
    figure 
    plot(i,Sa);
    title('Коэффициенты Sa');
    i=1:K;
    figure 
    %plot(i,Sab);
    stem(Sab(1:K)); %вывод графика  дискретной последовательности данных
    axis([1 8 -0.2 1.2]);%задание осей: [xmin xmax ymin ymax]
    title('Амплитуды частотных составляющих спектра');
    xlabel('Количество периодов')
    axis tight;
    i=1:N+1;
    figure
    plot(i,f);
    axis tight;
    hold on;
    plot(i,y,'r-')
    hold off;
end

