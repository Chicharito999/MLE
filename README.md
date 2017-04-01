# MLE
:point_up:正态概率密度的最大似然估计<br>
__________________________________________________________________________________________
Author:赵明福                                        Student ID：201400301087                            E-mail:1109646702@qq.com<br>
## 题目介绍
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片9.png)<br>
## 题目分析
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片10.png)<br>
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片11.png)
## 编程实现及注释
```matlab
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
vv3=zeros(3,3);
for i=1:3
        for k=1:10
            vv1(1,i)=vv1(1,i)+((data2(k,i)-uu(i)).')*(data2(k,i)-uu(i));
        end
        vv1(1,i)=vv1(1,i)/10;
        vv3(i,i)=vv1(1,i);
end
```
## 结果分析
从运行结果中，可以看出，多个特征组合的多维数据的均值的最大似然估计值等于每个特征的单维数据的均值的最大似然估计值组合得到的行向量。多个特征组合的多维数据通过最大似然估计得到的协方差矩阵的对角线元素等于对应特征的单维数据的方差的最大似然估计值。其原因在题目分析中作了解释。
