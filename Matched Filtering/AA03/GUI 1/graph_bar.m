function  graph_bar1(data) 
    
         h=bar3(data);
         shading interp
            for j = 1:length(h)
                zdata = get(h(j),'Zdata');
                set(h(j),'Cdata',zdata)
                set(h,'EdgeColor','k')
            end
            colormap(jet);
            view(-90,90);
            
end