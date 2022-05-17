close all
clear all

load('C:\Users\user\Desktop\ES paper\outdoor_dark_1.mat');
% load('C:\Users\user\Desktop\ES paper\indoor.mat');
load('C:\Users\user\Desktop\ES paper\indoor_dark.mat')
A = vout(:,:,:,50);
ref = indoor_dark(:,:,:,10);

B = A;
C = ref;

x = 0:200;

for u = 1:100
    ref = indoor_dark(:,:,:,u);

    intercept1_ref = 314.5;
    intercept2_ref = 332.5;
    
    slope1_ref = -0.33;
    slope2_ref = -0.367;
    
    y1_ref = intercept1_ref + slope1_ref.*x;
    y2_ref = intercept2_ref + slope2_ref.*x;
    
    
    ref = rgb2hsv(ref);
    ref(:,:,1) = ref(:,:,1)*360;
    ref(:,:,2) = ref(:,:,2)*255;
    ref(:,:,3) = ref(:,:,3)*255;
    
    
    k = 1;
    for i = 1:10:201
        for j = 270:10:330
            if j>floor(y1_ref(1,i)) && j<floor(y2_ref(1,i))
                H_ref(k) = ref(j,i,1);
                S_ref(k) = ref(j,i,2);
                V_ref(k) = ref(j,i,3);
                k = k+1;
            end
        end
    end
    
    h1 = scatter3(H_ref, S_ref, V_ref, 8,'o','r',...
        'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1);
    hold on
    xlabel('H')
    ylabel('S')
    zlabel('V')
    xlim([150 400])
    ylim([0 150])
    zlim([50 250])
    title('Dark Condition')
  
    k = 1;
    for i = 1:10:201
        for j = 270:10:330
            if j<floor(y1_ref(1,i)) || j>floor(y2_ref(1,i))
                H_ref_1(k) = ref(j,i,1);
                S_ref_1(k) = ref(j,i,2);
                V_ref_1(k) = ref(j,i,3);
                k = k+1;
            end
        end
    end
    
    h2 = scatter3(H_ref_1, S_ref_1, V_ref_1, 8, 'o','b',...
        'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1);
    hold on
end

% x = 620:820;

for u = 100:200
    A = vout(:,:,:,u);
    intercept1 = 314;
    intercept2 = 332;
    
    slope1 = -0.316;
    slope2 = -0.36;
    
    y1 = intercept1 + slope1.*x;
    y2 = intercept2 + slope2.*x;
    
    A = rgb2hsv(A);
    A(:,:,1) = A(:,:,1)*360;
    A(:,:,2) = A(:,:,2)*255;
    A(:,:,3) = A(:,:,3)*255;
    
    
    k = 1;
    for i = 1:10:201
        for j = 270:10:330
            if j>floor(y1(1,i)) && j<floor(y2(1,i))
                H(k) = A(j,i,1);
                S(k) = A(j,i,2);
                V(k) = A(j,i,3);
                k = k+1;
            end
        end
    end
    
    h3 = scatter3(H, S, V, 8,'o','MarkerEdgeColor',[0.8500 0.3250 0.0980], ...
        'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1);
    hold on
    
    k = 1;
    for i = 1:10:201
        for j = 270:10:330
            if j<floor(y1(1,i)) || j>floor(y2(1,i))
                H_1(k) = A(j,i,1);
                S_1(k) = A(j,i,2);
                V_1(k) = A(j,i,3);
                k = k+1;
            end
        end
    end
   
    h4 = scatter3(H_1, S_1, V_1, 8, 'o','MarkerEdgeColor','c',...
        'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1);
    hold on
end


for i = 1:201
    B(y1(1,i):y2(1,i),i,:) = 0;
end

for i = 1:201
    C(y1_ref(1,i):y2_ref(1,i),i,:) = 0;
end

[~, hobj, ~, ~] = legend([h1, h2, h3, h4], 'Indoor Lane', 'Indoor Background', 'Outdoor Lane', ...
    'Outdoor Background', 'Location', 'northeast');
hl = findobj(hobj,'type','line');
set(hl,'LineWidth',8.5);

