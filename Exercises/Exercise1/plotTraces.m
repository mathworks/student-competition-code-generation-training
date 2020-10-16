function plotTraces(t, y, x, xEnhanced)

subplot 121
plot(t,y,'r'), hold on;
plot(t,xEnhanced,'color',[0.4 0.4 0.4])
title('Noisy speech vs. enhanced speech'), xlabel('time [s]'), 
axis([0, t(end), -1.1, 1.1]), hold off;
legend({'noisy','enhanced'})
subplot 122
plot(t,x,'color',[.2 .7 .2]), hold on
plot(t,xEnhanced,'color', [0.4 0.4 0.4]) 
title('Enhanced speech vs. original speech'), xlabel('time [s]'),
axis([0, t(end), -1.1, 1.1]), hold off;
legend({'clean','enhanced'})

end

