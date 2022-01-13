close all;clear all; clc;

% Luetaan kuva
kuva0 = imread('peppers.png');
figure;imshow(kuva0);

figure; subplot(1,4,1); imshow(kuva0); title('Original (RGB)')
subplot(1,4,2); imshow(kuva0(:,:,1)); title('Red')
subplot(1,4,3); imshow(kuva0(:,:,2)); title('Green')
subplot(1,4,4); imshow(kuva0(:,:,3)); title('Blue')

% Kynnystys
redI = kuva0(:,:,1);
kynnkuva = redI > 180;
figure;imshow(kynnkuva);

% Kynnystys
redI = kuva0(:,:,1) - 2*kuva0(:,:,2);
figure;imshow(redI);
kynnkuva = redI > 30;
figure;imshow(kynnkuva);

% Eroosio
erkuva = imerode(kynnkuva,ones(3,3));
figure;imshow(erkuva);

% Dilaatio
dilkuva = imdilate(erkuva,ones(3,3));
figure;imshow(dilkuva);

% Luokittelu
[luokkuva,luokkienlkm] = bwlabel(dilkuva);
figure;imshow(label2rgb(luokkuva));

% Tunnistus
disp(['Kuvassa on ' num2str(luokkienlkm) ' kohdetta.']);

% Reunat
[r,c] = find(dilkuva-erkuva);
figure;imshow(kuva0); hold on;
plot(c,r,'.');

