u=mean(data1,1);%求data1中10个样本的均值
u11=u(1);u12=u(2);u13=u(3);%一维数据的均值的最大似然估计值
u21=u([1 2]);u22=u([2 3]);u23=u([end 1]) ;%二维数据的均值的最大似然估计值
u3=u;%三维数据的均值的最大似然估计值

%求data1中一维数据的方差的最大似然估计值
v1=zeros(1,3);
for i=1:3
        for k=1:10
            v1(1,i)=v1(1,i)+((data1(k,i)-u(i)).')*(data1(k,i)-u(i));
        end
        v1(1,i)=v1(1,i)/10;
end

%求data1中二维数据的协方差矩阵的最大似然估计值
v21=zeros(2,2);v22=zeros(2,2);v23=zeros(2,2);
for i=1:3
    for k=1:10
        if i==1
            v21=v21+((data1(k,[1 2])-u21).')*(data1(k,[1 2])-u21);
        elseif i==2
            v22=v22+((data1(k,[2 3])-u22).')*(data1(k,[2 3])-u22);
        else 
            v23=v23+((data1(k,[3 1])-u23).')*(data1(k,[3 1])-u23);
        end
    end
    v21=v21/10;
    v22=v22/10;
    v23=v23/10;
end

%求data1中三维数据的协方差矩阵的最大似然估计值
v3=zeros(3,3);
for k=1:10
    v3=v3+((data1(k,1:3)-u3).')*(data1(k,1:3)-u3);
end
v3=v3/10;

uu=mean(data2,1);%求data2中10个样本的均值
uu11=uu(1);uu12=uu(2);uu13=uu(3);%一维数据的均值的最大似然估计值
uu21=uu([1 2]);uu22=uu([2 3]);uu23=uu([end 1]) ;%二维数据的均值的最大似然估计值
uu3=uu;%三维数据的均值的最大似然估计值

%求data2中一维数据的方差的最大似然估计值,等于三维数据的协方差矩阵的最大似让估计值对应的对角线元素值
vv1=zeros(1,3);
vv=zeros(3,3);
for i=1:3
        for k=1:10
            vv1(1,i)=vv1(1,i)+((data2(k,i)-uu(i)).')*(data2(k,i)-uu(i));
        end
        vv1(1,i)=vv1(1,i)/10;
        vv(i,i)=vv1(1,i);
end


