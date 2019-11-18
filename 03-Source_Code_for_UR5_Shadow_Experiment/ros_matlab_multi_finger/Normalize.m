function OutImg = Normalize(InImg)  
    ymax=1;ymin=0;  
    xmax = max(max(InImg(260:480,340:610))); %���InImg�е����ֵ  
    xmin = min(min(InImg(260:480,340:610))); %���InImg�е���Сֵ  
    OutImg = (ymax-ymin)*(InImg-xmin)/(xmax-xmin) + ymin; %��һ�� 
end
