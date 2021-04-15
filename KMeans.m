%  K-Means function to generate K clusters of an input image
%  Author Name: Ryan Mia
%Step 1
function [C, segmented_image] = KMeans(X,K,maxIter)
    X=double(X);

    C=zeros(K,3);
    for i=1:size(C,1)
        C(i,:)=randi([0 255],1,3);
    end
    
    count=0;
    err=1;
    while count<maxIter && err~=0
        dists=zeros(size(X,1),size(X,2))+100000;
        clusters=zeros(size(X,1),size(X,2));
        for i=1:size(X,1)
            for j=1:size(X,2)
                pix(1,:)=X(i,j,:);
                for c=1:size(C,1)
                    dist=norm(C(c,:)-pix,1);
                    if dist<dists(i,j)
                        dists(i,j)=dist;
                        clusters(i,j)=c;
                    end
                end
            end
        end
        newC=zeros(K,3);
        %%get avg of each center then repeat
        numCs=zeros(K,1);
        for i=1:size(X,1)
            for j=1:size(X,2)
                numCs(clusters(i,j))=numCs(clusters(i,j))+1;
                pix(1,:)=X(i,j,:);
                newC(clusters(i,j),:)=newC(clusters(i,j),:)+pix;
            end
        end
        newC=newC./numCs;
        errMat=abs(C-newC);
        if(sum(sum(errMat)))==0
            err=0;
        end
        C=newC;
        count=count+1;
        %count,sum(sum(errMat))
    end
    segmented_image=clusters;
end
