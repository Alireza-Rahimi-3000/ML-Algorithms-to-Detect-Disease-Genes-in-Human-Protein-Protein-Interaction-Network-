
clear;
load('positive.mat');
load('unique_data.mat');
load('myOrgData.mat');

y = myOrgData(:,end);
x = myOrgData(:,1:end-1);

CVO = cvpartition(y,'k',10); % Stratified cross-validation
for i = 1:CVO.NumTestSets
    i
    trIdx = CVO.training(i);
    teIdx = CVO.test(i);
    mdl = TreeBagger(60,x(trIdx,:),y(trIdx,:),'Method','classification');
    ypred = predict(mdl , x(teIdx,:));
    ytest = y(teIdx);
    
    acc(i)=(length(ytest) - sum(ytest ~= str2num(cell2mat(ypred))) ) / length(ytest) 

    ind1 = 1 == str2num(cell2mat(ypred));
    ind0 = 0 == str2num(cell2mat(ypred));
    
    tp = sum(ytest(ind1) == str2num(cell2mat(ypred(ind1))));
    tn = sum(ytest(ind0) == str2num(cell2mat(ypred(ind0))));
    fp = sum(ytest(ind1) ~= str2num(cell2mat(ypred(ind1))));
    fn = sum(ytest(ind0) ~= str2num(cell2mat(ypred(ind0))));
    % tp = sum(ytest(ind1) == ypred(ind1));
    % tn = sum(ytest(ind0) == ypred(ind0));
    % fp = sum(ytest(ind1) ~= ypred(ind1));
    % fn = sum(ytest(ind0) ~= ypred(ind0));
    precision(i) = (tp)/(tp+fp)
    recall(i) = (tp)/(tp+fn)
    Fmeasure(i) = 2*((precision(i)*recall(i))/(precision(i)+recall(i)))
end

mean(Fmeasure)
std(Fmeasure)

figure
plot(acc,'-o')
title('10 Fold Accuracy ')
xlabel('Folds')
ylabel('Accuracy')

figure
plot(precision,'-o')
title('10 Fold Precision ')
xlabel('Folds')
ylabel('Precision')

figure
plot(recall,'-o')
title('10 Fold Recall ')
xlabel('Folds')
ylabel('Recall')

figure
plot(Fmeasure,'-o')
title('10 Fold Fmeasure ')
xlabel('Folds')
ylabel('Fmeasure')

