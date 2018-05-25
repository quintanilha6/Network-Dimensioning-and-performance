function visualize(AP,pos,L,plotar)
    N= size(pos,1);
    nAP= size(AP,1);
    plot(pos(1:N,1),pos(1:N,2),'o','MarkerEdgeColor','b','MarkerFaceColor','b')
    hold on
    plot(AP(1:nAP,1),AP(1:nAP,2),'s','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',10)
    if plotar==2
        for i=1:size(L,1)
            plot([pos(L(i,1),1) pos(L(i,2),1)],[pos(L(i,1),2) pos(L(i,2),2)])
        end
    end
    axis([0 300 0 200])
    grid on
    set(gca,'xtick',0:50:300)
    set(gca,'ytick',0:50:200)
    drawnow
    hold off
end