close all;clear all; clc;
pkg load image

% Luetaan kuva
kuva0 = imread('peppers.png');
figure;imshow(kuva0);

% Osakuvat
figure; subplot(2,2,1); imshow(kuva0); title('Original (RGB)')
subplot(2,2,2); imshow(kuva0(:,:,1)); title('Red')
subplot(2,2,3); imshow(kuva0(:,:,2)); title('Green')
subplot(2,2,4); imshow(kuva0(:,:,3)); title('Blue')

% Harmaasävykuva
hskuva = rgb2gray(kuva0);
figure;imshow(hskuva);
title('Harmaasävykuva')

% Kynnystys ("pienempi kuin")
kynnkuva = hskuva < 100;
figure;imshow(kynnkuva); title('Alle 100')
% Kynnystys ("suurempi kuin")
kynnkuva = hskuva > 200; 
figure;imshow(kynnkuva); title('Yli 200')
% Kynnystys ("välissä")
kynnkuva = hskuva > 100 & hskuva < 200;
figure;imshow(kynnkuva); title('Yli 100 ja alle 200')

% Eroosio
erkuva = imerode(kynnkuva,ones(3,3));

% Reunat
reunakuva = kynnkuva-erkuva;
figure;imshow(reunakuva); title('Reunapikselit')