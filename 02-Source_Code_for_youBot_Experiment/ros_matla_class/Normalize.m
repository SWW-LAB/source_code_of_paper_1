function OutImg = Normalize(InImg)  
    ymax=1;ymin=0;  
    xmax = max(max(InImg)); %���InImg�е����ֵ  
    xmin = min(min(InImg)); %���InImg�е���Сֵ  
    OutImg = (ymax-ymin)*(InImg-xmin)/(xmax-xmin) + ymin; %��һ�� 
end
