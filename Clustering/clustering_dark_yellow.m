close all
clear all

load('C:\Users\user\Desktop\ES paper\outdoor_dark_2.mat');
% load('C:\Users\user\Desktop\ES paper\indoor.mat');
load('C:\Users\user\Desktop\ES paper\indoor_dark.mat')
A = vout(:,:,:,50);
ref = indoor_dark(:,:,:,10);

B = A;
C = ref;

x = 620:820;

for u = 1:1
    ref = indoor_dark(:,:,:,u);

    intercept1_ref = 302;
    intercept2_ref = 322;
    
    slope1_ref = 0.27;
    slope2_ref = 0.31;
    
    y1_ref = intercept1_ref + slope1_ref.*(x-820);
    y2_ref = intercept2_ref + slope2_ref.*(x-820);
    
    
    ref = rgb2hsv(ref);
    ref(:,:,1) = ref(:,:,1)*360;
    ref(:,:,2) = ref(:,:,2)*255;
    ref(:,:,3) = ref(:,:,3)*255;
    
    
    k = 1;
    for i = 1:201
        for j = 270:330
            if j>floor(y1_ref(1,i)) && j<floor(y2_ref(1,i))
                H_ref(k) = ref(j,x(1,i),1);
                S_ref(k) = ref(j,x(1,i),2);
                V_ref(k) = ref(j,x(1,i),3);
                k = k+1;
            end
        end
    end
    
    scatter3(H_ref, S_ref, V_ref, 1,'.','r')
    hold on
    xlabel('H')
    ylabel('S')
    zlabel('V')
    grid off
    
    k = 1;
    for i = 1:201
        for j = 270:330
            if j<floor(y1_ref(1,i)) || j>floor(y2_ref(1,i))
                H_ref_1(k) = ref(j,x(1,i),1);
                S_ref_1(k) = ref(j,x(1,i),2);
                V_ref_1(k) = ref(j,x(1,i),3);
                k = k+1;
            end
        end
    end
    
    scatter3(H_ref_1, S_ref_1, V_ref_1, 1, '.','g')
    hold on
end

x = 0:100;

for u = 100:100
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
    for i = 1:101
        for j = 300:330
            if j>floor(y1(1,i)) && j<floor(y2(1,i))
                H(k) = A(j,i,1);
                S(k) = A(j,i,2);
                V(k) = A(j,i,3);
                k = k+1;
            end
        end
    end
    
    scatter3(H, S, V, 1,'.','b')
    hold on
    
    k = 1;
    for i = 1:101
        for j = 300:330
            if j<floor(y1(1,i)) || j>floor(y2(1,i))
                H_1(k) = A(j,i,1);
                S_1(k) = A(j,i,2);
                V_1(k) = A(j,i,3);
                k = k+1;
            end
        end
    end
   
    scatter3(H_1, S_1, V_1, 1, '.','m')
    hold on
end


for i = 1:101
    B(y1(1,i):y2(1,i),i,:) = 0;
end

x = 620:820;

for i = 1:201
    C(y1_ref(1,i):y2_ref(1,i),x(1,i),:) = 0;
end
figure
image(C)
figure
image(B)

