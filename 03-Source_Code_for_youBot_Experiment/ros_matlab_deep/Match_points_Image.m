function [ output_args ] =Match_points_Image( input_args )
    long = 640;
    wide = 480;
    Deep_img = input_args(55:408,55:518,:);
    img_size = size(Deep_img);
    data = [[],[],[]];
    for i = 1:long
        for j = 1:wide
            x = round(j/wide*img_size(1));
            y = round(i/long*img_size(2));
            if x < 1
                x = 1;
            end
            if y < 1
                y = 1;
            end
            data(j,i,:) = Deep_img(x,y,:);
        end
    end
    output_args = data;
end

