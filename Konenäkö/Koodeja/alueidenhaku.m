close all;clear all; clc;
pkg load image

% Luetaan kuva
kuva0 = imread('coins.png');
figure;imshow(kuva0);

figure;imhist(kuva0)

% Kynnystys
kynnkuva = kuva0 > 80;
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

##% Reunat
##[r,c] = find(dilkuva-erkuva);
##figure;imshow(kuva0); hold on;
##plot(c,r,'.');

aputalukko = [];
massakpt = [];
for i=1:luokkienlkm
    [r,c] = find(luokkuva == i);
    massakpt(i,1:2) = [mean(r) mean(c)];
    aputaulukko(i,1:2) = [i numel(r)];
end
aputaulukko
massakpt
    