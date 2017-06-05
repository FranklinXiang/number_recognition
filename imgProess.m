function [ stdImgList ] = imgProess( img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

num = length(img)
stdImgList = cell(0);
for i = 1:num
    bw = im2bw(img{i}, graythresh(img{i})); %ͼ���ֵ��
    [col, row] = size(bw);
    
    %ͼ��ɫ
    for ii = 1:col
        for jj = 1:row
            if bw(ii, jj) == 0
                bw(ii, jj) = 1;
            else 
                bw(ii, jj) =0;
            end
        end
    end
    
    [numCol, numRow] = find(bw == 1);
    colMin = min(numCol);
    colMax = max(numCol);
    rowMin = min(numRow);
    rowMax = max(numRow);
    
    %��ȡͼ���е����ֲ���
    bw2 = bw(colMin:colMax, rowMin:rowMax);
    rate = 18/max(size(bw2));
    bw2 = imresize(bw2, rate);
    [numCol, numRow] = size(bw2); %numCol = 18, numRow = 18
end 
end

end
