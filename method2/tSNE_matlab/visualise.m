% train_data1=pardata;
clearvars -except train_data1
no_dims = 2;
initial_dims = 50;
perplexity = 10;
mappedX = tsne(train_data1(:,2:51), train_data1(:,1), no_dims, initial_dims, perplexity);
gscatter(mappedX(:,1), mappedX(:,2), train_data1(:,1), 'rgbmyc');

% http://lvdmaaten.github.io/tsne/