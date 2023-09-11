clear;

load('adj_matrix.mat');
load('unique_data.mat');

% read positive genes
Address = 'E:\bio\Bio_HW#3\Bio_HW#3\';
s=strcat(Address,'PositiveGeneName.txt');
fileID = fopen(s,'r');
pos = textscan(fileID,'%s');
positive = unique(pos{1});

% features 1
Features = [sum(adj_matrix,2) , zeros(length(unique_data),1), zeros(length(unique_data),1)];
Features = [Features , zeros(length(unique_data),1)];

% features 2
for i = 1 : length(unique_data)
    i
    adjacents_i = unique_data(find(adj_matrix(:,i)));
    Features(i,2) = sum(ismember(positive,adjacents_i));
end
k_p = Features(:,2);
k = Features(:,1);
Features(:,2)= Features(:,2) ./ (Features(:,1)+1);

% features 3
for i = 1 : length(unique_data)
    i
    neighbors = find(adj_matrix(:,i));
    Features(i,3) = sum(k_p(neighbors)) / (sum(k(neighbors))+1);
end

% feature 4
Graph = graph(adj_matrix);
Dist = distances(Graph);
M=length(positive);
Dist(Dist == Inf) = 10000;

for i = 1 : length(unique_data)
    i
    [xx,y] = find(ismember(unique_data,positive));
    Features(i,4) = sum(Dist(i,xx)) / M;
end

% feature 5
Dist2 = Dist == 2;
Dist1 = Dist == 1;
% Dist( Dist ~= 2 ) = 0;
M_i = zeros(length(unique_data),1);
for i = 1 : length(unique_data)
    i
    indices = Dist2(i,:) .* ismember(unique_data,positive)' ; % ham deciese-gene hast ham sharing neighbor
    M_i(i) = sum(indices);%check kon indices chie va j
    ind = find(indices);
    Sigma = 0;
    for j = ind
        Cij = sum(Dist1(i,:) .* Dist1(:,j)');
        Sigma = Sigma + (Cij / (min(k(i),k(j))+1));
    end
    Features(i,5) = Sigma / (M_i(i)+1);
end

save('Features_Without_Nan.mat','Features');


