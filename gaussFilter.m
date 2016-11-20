%% Gaussian Filter by Abbigail Caballero
% Class: Computer Vision, CSCI 4830
% Instructor: Ioana Fleming
% Assignment 1

function [outImg] = gaussFilter(inImg, sigma)
 
% Compute kernel size and make kernel:
kern_size = 2*ceil(2*sigma)+1;
kern = zeros(kern_size);
% Start calculating initial kernel values: 
start = kern_size - ceil(kern_size/2);
start_x = start;
start_y = start;
chk_x = 1;
chk_y = 1;
% Make kernel: 
for row = 1:kern_size
    for col = 1:kern_size
        kern(row, col) = gauss_comp(start_x, start_y, sigma);
        if(chk_x == 0)
            start_x = start_x + 1;
        else
            start_x = start_x - 1;
        end
        if(start_x == 0)
            chk_x = 0;
        elseif(start_x == start)
            chk_x = 1;
        end%second if loop
    end%first for loop
    chk_x = 1;
    start_x = start;
    if(chk_y == 0)
        start_y = start_y + 1;
    else
        start_y = start_y - 1;
    end
    if(start_y == 0)
        chk_y = 0;
    elseif(start_y == start)
        chk_y = 1;
    end%end second if statement
end%end main for loop


% Modify original img to get padded img: 
kernel_size = kern_size;
numPix = (kernel_size - 1)/2;   %add this many pixels around the main pixel
[len, wid, r] = size(inImg);

% Image padding: 
lenCat = zeros(len+(numPix*2), numPix, r);
widCat = zeros(numPix, wid, r);

%Make a matrix with correct padding of zeros around original image
newMat1 = vertcat(widCat, inImg);
newMat2 = vertcat(newMat1, widCat);
newMat1 = horzcat(lenCat, newMat2);
newMat2 = horzcat(newMat1, lenCat);

outImg = zeros(len,wid,3);
outImg = uint8(outImg);

for r = 1:len
    for c = 1:wid
        % multiply selected pixels in picture with kernel:
        tmpImg1 = newMat2(r:r+kernel_size-1, c:c+kernel_size-1, 1);
        tmpImg1 = double(tmpImg1);
        multMat1 = tmpImg1.*kern;
        % Sum these for weighted average: 
        sumMat1 = sum(multMat1);
        sumMat1 = sum(sumMat1); %now have new pixel
        
        tmpImg2 = newMat2(r:r+kernel_size-1, c:c+kernel_size-1, 2);
        tmpImg2 = double(tmpImg2);
        multMat2 = tmpImg2.*kern;
        % Sum these for weighted average:
        sumMat2 = sum(multMat2);
        sumMat2 = sum(sumMat2); %now have new pixel
        
        tmpImg3 = newMat2(r:r+kernel_size-1, c:c+kernel_size-1, 3);
        tmpImg3 = double(tmpImg3);
        multMat3 = tmpImg3.*kern;
        % Sum these for weighted average:
        sumMat3 = sum(multMat3);
        sumMat3 = sum(sumMat3); %now have new pixel
        
        %place new pixel in new image:
        outImg(r, c, 1) = sumMat1;
        outImg(r, c, 2) = sumMat2;
        outImg(r, c, 3) = sumMat3;
        outImg = uint8(outImg);
    end 
end

end