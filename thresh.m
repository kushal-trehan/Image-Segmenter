function [ imageO ] = thresh(imageI , t)
% Threshold an Image

[height, width] = size(imageI);

imageO = zeros(height,width);

for m = 1:height
    for n = 1:width
        if imageI(m,n)>t
            imageO(m,n) = 255;
        else
            imageO(m,n) = 0;
        end
    end
end

end

