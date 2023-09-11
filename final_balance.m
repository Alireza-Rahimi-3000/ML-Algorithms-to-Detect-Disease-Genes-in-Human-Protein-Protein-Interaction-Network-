clear;

load('positive.mat');
load('adj_matrix.mat');
load('unique_data.mat');
load('Features_Without_Nan.mat');
Features = zscore(Features ,1);
%Features=reshape(zscore(Features(:)),size(Features,1),size(Features,2));

[ind_pos,~] = find(ismember(unique_data,positive));
ind_neg = [1:length(unique_data)]';
ind_neg(ind_pos) = [];

[A,B] = meshgrid(ind_neg,ind_pos);
temp=cat(2,A',B');
twos = reshape(temp,[],2);
twos = [twos , zeros(size(twos,1),1)];

% twos_combinations = (length(unique_data)*(length(unique_data)-1))/2;
% temp = [];
% for i = 1:length(unique_data)
%     i
%     temp =[temp , i * ones(1,length(unique_data))];
% end
% twos = [temp ; repmat([1:1:length(unique_data)],1,length(unique_data)) ; zeros(1,twos_combinations)];
remove_indxs = [];
twos(:,3) = sqrt(sum((Features(twos(:,1),:) - Features(twos(:,2),:)) .^2 , 2));
flag = 0;
count =1;
dists = pdist2(Features,Features);
dists = dists.';
dists = reshape(dists(eye(size(dists,1))'~=1),size(dists,1)-1,size(dists,1)).';

tic;
for i = 1 : size(twos,1)
    i
%     temp1 = ismember(twos(:,1),twos(i,1));
%     temp2 = ismember(twos(:,2),twos(i,2));
%     if(i> size(twos,1))
%         break;
%     end
%     temp1 = (i):(length(ind_neg)):size(twos,1);
%     temp2 = (flag2 * (length(ind_neg)))+1:1:((flag2 +1)*(length(ind_neg)));
%     
    %temp1 = (i-flag):(length(ind_neg)-flag):size(twos,1);
    %temp2 = (flag2 * (length(ind_neg)-flag))+1:1:((flag2 +1)*(length(ind_neg)-flag));
    
	%temp1 = (twos(:,1) == twos(i,1));
    %temp2 = (twos(:,2) == twos(i,2));
%     tempi = dists(twos(i,1),:)';
%     tempj = dists(twos(i,2),:)';
    if(min(dists(twos(i,1),:)) == twos(i,3))%if( all(twos(i,3) <= dists(twos(i,1),:)') )%min(dists(twos(i,1),:)') == twos(i,3)
        remove_indxs(count) = twos(i,1);
        count = count +1;
        %twos(temp1,:) = [];
        %removerows(twos,'ind',temp1);
        %flag = flag + 1;
    elseif(min(dists(twos(i,2),:)) == twos(i,3))%elseif( all(twos(i,3) <= dists(twos(i,2),:)') )
        remove_indxs(count) = twos(i,1);
        count = count +1;
        %twos(temp1,:) = [];
        %removerows(twos,'ind',temp1);
        %flag = flag + 1;   
    end
%     elseif(((twos(i,3) < twos(temp2,3)) ~= 0))
%         remove_indxs = [remove_indxs , twos(i,1)];
%         twos(temp1,:) = [];
%         flag = flag + 1;   
%     end
end

Features(unique(remove_indxs),:) = [];
toc;
% for i = 1: size(twos,1)
%     i
%     twos(i,3) = sqrt(sum((Features(twos(i,1),:) - Features(twos(i,2),:)) .^ 2));
% end
% D  = sqrt(sum((G - G2) .^ 2));

