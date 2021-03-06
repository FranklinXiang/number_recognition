clc;
%clear all;
% 读取数据 图片数据都保存在img中 img中的每个元素为28*28的图像矩阵
root = './data';
img = readData(root);

%图像预处理 处理的结果保存在stdImg中
[stdImg, stdImg60] = imgProess(img);

%stdImg = load('stdImg.mat');

%特征提取
imgFeature1 = getFeature1(stdImg); %特征一 是统计3*3小格中 1的个数  
imgFeature2 = getFeature2(stdImg); %特征二 6,8,10,12  行列中 1的个数
imgFeature3 = getFeature3(stdImg); %特征三 综合一二

%构造测试集 
[inputTrain1, outputTrain1, inputTest1, outputTest1, outputLabel1] = getTrainData(imgFeature1);
[inputTrain2, outputTrain2, inputTest2, outputTest2, outputLabel2] = getTrainData(imgFeature2);
[inputTrain3, outputTrain3, inputTest3, outputTest3, outputLabel3] = getTrainData(imgFeature3);

%训练网络
% inNum = 28;
% midNum = 35;
% outNum = 10;
% [w1, b1, w2, b2] = networkTrain(midNum, inputTrain3, outputTrain3);
% 
% 
% %网络测试
% outputVector = networkTest(midNum, inputTest3, w1, b1, w2, b2);
