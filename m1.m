A=imread('swim.jpg');
B=im2col(A,[10,10],'sliding');
disp(size(B));
k=size(B,1);
m=size(B,2);
S=sum(B,1);

K=S./k;


%disp(size(K));
for Y=1:k
    for X=1:m
        B(Y,X)= B(Y,X)-K(X);
    end
end

C=cov(double(B));

%fprintf('The Covariance Matrix\n');
disp(size(C));
%disp(C);
V=eig(C);
[EV,D]=eig(C);

 
V=sort(V,'descend');
% %k=find(V==0.0);
% %p=find(V==(-0.0));
% disp('is it a row');
% disp(isrow(V));
% %disp(k);
% %disp(p);
% i1=0;
% for i=1:length(V)
%     %disp(V(i));
%     %disp(class(V(i)));
%     if(V(i)==0)
%         disp('int');
%         disp(V(i));
%         i1=i;
%         break;
%     else
%         if(V(i)==0.0);
%             disp('real');
%             disp(V(i));
%             i1=i;
%             break;
%         end
%     end
% end
% 
%             disp('the value is ');
%             disp(i1);
%             disp(i);
%             disp(length(i));
%         
% FV=ones(20);
% for i =1:20
%     FV(i)=V(i);
% end
% disp(FV)
FV=V(1:20);
%disp(size(fv));
FV=transpose(FV);
B=transpose(B);
disp(size(B));
disp(size(FV));
B=double(B);
C=B(1:20,:);
fin=FV*C;
%fprintf('The Feature Matrix \n');
%disp(fin);
fprintf('\n');

[dist,label,N]=kmeans(fin,100);
BW = im2bw(A, graythresh(A));
CC = bwconncomp(BW);
L = labelmatrix(CC);
RGB = label2rgb(L);
imshow(RGB);
%disp(label);

%RGB = label2rgb(label,);
%imshow(RGB);

% disp('give input');
% x=input('enter the value');
%fin=B*N;
%disp(fin);


% k=find(V==0,1);
% fv=ones(1,k);
% for i = 1:k
%    fv(i)=V(i);
% end ;
% %disp();

