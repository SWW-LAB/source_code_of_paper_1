function OutImg = Normalize(InImg)  
    ymax=1;ymin=0;  
    xmax = max(max(InImg)); %求得InImg中的最大值  
    xmin = min(min(InImg)); %求得InImg中的最小值  
    OutImg = (ymax-ymin)*(InImg-xmin)/(xmax-xmin) + ymin; %归一化 
end
