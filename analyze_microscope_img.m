function [output] = analyze_microscope_img(img_path)

%determine number of images in stack
no_img = numel(imfinfo(img_path));

%initialize data matrices
pfa = zeros(no_img,1);
ai = zeros(no_img,1);
seg_no = zeros(no_img,1);
branch_no = zeros(no_img,1);

%loop through images to perform analysis
h = waitbar(0,'Analyzing image stack...');
for k = 1:no_img
    
    %read image
    img = imread(img_path,k);

    %determine preferred fiber angle and alignment index
    [img_pfa,img_ai] = sub_fiber_angle(img,4);
    
    %quantify fiber length, branch points
%     [segments,branches] = sub_fiber_morph(img);
        
    %determine pore characteristics
%     [output] = sub_pore_morph(img);

    %populate data matrices
    pfa(k) = img_pfa;
    ai(k) = img_ai;
%     seg_no(k) = segments;
%     branch_no(k) = branches;
    
    waitbar(k/no_img,h)
    
end

%output structure
output = struct('pfa',pfa,'ai',ai);
close(h)