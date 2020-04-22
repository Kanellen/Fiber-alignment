%LHT
%24 Aug 2014
%program to analyze fibrin networks

clc
clear all
close all
format long g
format compact
iptsetpref('ImshowBorder','tight');
tic

%input image stack path
%image stack name:
img_stack_name = 'invivofcp6t4.3.tif';
if ismac == 1
    folder = strcat('/',fullfile('Users','kimberlynellenbach','Desktop',...
        '1.9.2020'));
else
   folder = strcat('C:\',fullfile('Users','ashleybrown','Documents',...
      'Neonatal Fibrin Image Analysis', 'Neonate Images', 'Patientsamples'));
end
path = fullfile(folder,img_stack_name);

%enter subroutine to analyze image data
[output] = analyze_microscope_img(path);

figure
plot(output.pfa,'b','LineWidth',1.5)
xlim([1 size(output.pfa,1)])
ylim([0 180])
title('Preferred Fiber Angle')
xlabel('Image No.')
ylabel('PFA (degrees)')

figure
plot(output.ai,'b','LineWidth',1.5)
xlim([1 size(output.ai,1)])
title('Alignment Index')
xlabel('Image No.')
ylabel('AI')

% figure
% plot(output.branches,'b','LineWidth',1.5)
% xlim([1 size(output.ai,1)])
% title('Branching')
% xlabel('Image No.')
% ylabel('No. of Branches')
% 
% figure
% plot(output.segments,'b','LineWidth',1.5)
% xlim([1 size(output.ai,1)])
% title('Segments')
% xlabel('Image No.')
% ylabel('No. of Segments')

%Output
pfa_matix = output.pfa;
ai_matrix = output.ai;
% seg_matrix = output.segments;
% branch_matrix = output.branches;

%Output
%average of ai matrix
av=mean(ai_matrix)
toc
