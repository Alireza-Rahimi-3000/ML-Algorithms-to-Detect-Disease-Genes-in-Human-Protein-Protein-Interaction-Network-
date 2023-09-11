clear;

Address = 'E:\bio\Bio_HW#3\Bio_HW#3\';
%FolderInfo = dir(Address);
conversion = cell(2,1);
Num_of_lines = 11094;
%Num_of_files = length(FolderInfo(not([FolderInfo.isdir])));
%for i = 3 : (Num_of_files+2)

s=strcat(Address,'HUMAN_PPI_AdjacentList_gene.txt');
%s=strcat(trainAddress,num2str(TrainFolderInfo(i).name));
fileID = fopen(s,'r');
data = textscan(fileID,'%s');
unique_data = unique(data{1});
adj_matrix = zeros(length(unique_data),length(unique_data));
num_words_data = zeros(Num_of_lines,1);

% fileID2 = fopen(s);
% for i = 1 : Num_of_lines %number of lines in text data
%     line = fgetl(fileID2);
%     num_words_data(i) = size(split(line),1);
% end

fileID2 = fopen(s);
for i = 1 : Num_of_lines %number of lines in text data
    i
    line = fgetl(fileID2);
    temp = split(line);
    num_words_data(i) = size(temp,1);
    [x1,y] = find(ismember(unique_data,temp{1}));
    for j=2 : num_words_data(i)
        [x2,y] = find(ismember(unique_data,temp{j}));
        adj_matrix(x1,x2) = 1;
        adj_matrix(x2,x1) = 1;
    end
end

%uniq = unique(data{1});
%conversion{1} = tdfread(s,'\t');

%size(conversion{1}.x1,2)

