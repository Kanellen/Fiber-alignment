function [o1,o2] = alignment_histogram(i1,i2,i3,i4,i5,i6)

%input 1: histogram bin size
%input 2: theta grid (degrees)
%input 3: r grid
%input 4: x coordinate of padded image
%input 5: y coordinate of padded image
%input 6: filtered image
%output 1: bin edges
%output 2: sum of pixel intensity values in each bin

%determine histogram parameters
no_bins = round(180/i1); %number of bins in histogram
o1= (0:180/no_bins:180)'; %left edge of bins

%loop through bins and sum pixel intensities within bin limits
o2 = zeros(no_bins,1);
for m = 1:no_bins

    %determine image indices within bin limits   
    [index] = find(((i2 >= o1(m)) & (i2 < o1(m+1))) | ...
        ((i2 >= (o1(m) + 180)) & (i2 < (o1(m+1) + 180))));
    
    %transform to Cartesian; original image is in Cartesian
    x_coord = round(i3(index).*cos(i2(index)*pi/180)) + i4;
    y_coord = round(i3(index).*sin(i2(index)*pi/180)) + i5;
    
    %sum total intensity of pixels in filtered frequency space within bin
    %limits
    index_coord = sub2ind(size(i6),x_coord,y_coord);
    o2(m) = sum(i6(index_coord));
    
    %to illustrate correct indices are selected; look at q
    % q = theta_deg;
    % q(index2) = 5000;
        
end