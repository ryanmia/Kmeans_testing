clear all;close all;

elephant=imread("elephant.jpg");
eiffel=imread("eiffel.jpg");

%Step 2
figure;
subplot(1,4,1);
imagesc(elephant);
title("Original");
[centroid_coord,segmented_image]=KMeans(elephant,2,100);
subplot(1,4,2);
imagesc(segmented_image);
title("K=2");
[centroid_coord,segmented_image]=KMeans(elephant,5,100);
subplot(1,4,3);
imagesc(segmented_image);
title("K=5");
[centroid_coord,segmented_image]=KMeans(elephant,10,100);
subplot(1,4,4);
imagesc(segmented_image);
title("K=10");

figure;
subplot(1,4,1);
imagesc(eiffel);
title("Original");
[centroid_coord,segmented_image]=KMeans(eiffel,2,100);
subplot(1,4,2);
imagesc(segmented_image);
title("K=2");
[centroid_coord,segmented_image]=KMeans(eiffel,5,100);
subplot(1,4,3);
imagesc(segmented_image);
title("K=5");
[centroid_coord,segmented_image]=KMeans(eiffel,10,100);
subplot(1,4,4);
imagesc(segmented_image);
title("K=10");

%Step 3
figure;
subplot(1,3,1);
imagesc(elephant);
title("Original");
subplot(1,3,2);
[centroid_coord,segmented_image]=KMeans(elephant,5,100);
imagesc(segmented_image);
title("My Kmeans Function");
subplot(1,3,3);
segmented_image=imsegkmeans((elephant),5);
imagesc(segmented_image);
title("MATLAB Kmeans Function");

