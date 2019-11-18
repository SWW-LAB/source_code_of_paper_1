function [ output_img ] = deep_draw_frame(img, x, y, f_long, f_wide, r)
%img:ͼ�� x,y���������ꣻf_long����ĳ���f_wide���?r�������б�Ƕ�
%�����ܣ���ͼ�������⻭��

half_L=round(f_long/2);
half_W=round(f_wide/2);

Trans_L = round([-half_W*sin(r) half_W*cos(r)]);%ƽ������
Trans_W = round([half_L*cos(r) half_L*sin(r)]);

L=zeros(half_L*2+1,2);%�������洢
W=zeros(half_W*2+1,2);

for L_i = -half_L:half_L
    L(L_i+half_L+1,1)=round(L_i*cos(r));
    L(L_i+half_L+1,2)=round(L_i*sin(r));
end
for W_i = -half_W:half_W
    W(W_i+half_W+1,1)=round(-W_i*sin(r));
    W(W_i+half_W+1,2)=round(W_i*cos(r));
end
%����:����������
for L_i = 1:half_L*2+1
    img(L(L_i,1)+x+Trans_L(1),L(L_i,2)+y+Trans_L(2))=250;

    
    img(L(L_i,1)+x-Trans_L(1),L(L_i,2)+y-Trans_L(2))=250;

end
%����:���������
for W_i = 1:half_W*2+1
    img(W(W_i,1)+x+Trans_W(1),W(W_i,2)+y+Trans_W(2))=0;

    img(W(W_i,1)+x-Trans_W(1),W(W_i,2)+y-Trans_W(2))=0;
end
output_img = img;
end

