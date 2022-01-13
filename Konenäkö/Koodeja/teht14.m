close all;clear all; clc;
pkg load image
format short g

% Luetaan kuva
##kuva0 = imread('.\Kuvat\Normaalit\kolikot_4.bmp');
apukuva = imread('.\Kuvat\Normaalit\opetuskuva_ylavalo.bmp');
figure;imshow(apukuva);
kuva0 = imread('.\Kuvat\Normaalit\opetuskuva_alavalo.bmp');
figure;imshow(kuva0);

% Kynnystys
kynnkuva = kuva0 < 80;
figure;imshow(kynnkuva);

% Luokittelu
[luokkuva,luokkienlkm] = bwlabel(kynnkuva);
figure;imshow(label2rgb(luokkuva));

% Tunnuslukujen määritys luokkakohtaisesti
disp(['Kuvassa on alunperin ' num2str(luokkienlkm) ' kohdetta.']);
laskuri = 0;
for i=1:luokkienlkm
    [r,c] = find(luokkuva == i);
    if (max(c)-min(c) < 500) && (numel(r) > 5000)
      laskuri = laskuri + 1
      tiedot(laskuri,1:4) = [i mean(r) mean(c) numel(r)];  
  end    
end
tiedot
figure(1);hold on; plot(tiedot(:,3),tiedot(:,2),'x')
disp(['Kolikoita on ' num2str(size(tiedot,1)) ' kpl.']);

% Kolikoiden tunnistus
s10c = sum(tiedot(:,4) < 6500);
s5c = sum(tiedot(:,4) > 6500 & tiedot(:,4) < 7500);
s20c = sum(tiedot(:,4) > 7500 & tiedot(:,4) < 8000);
s1e = sum(tiedot(:,4) > 8000 & tiedot(:,4) < 9000);
s50c = sum(tiedot(:,4) > 9000 & tiedot(:,4) < 10000);
s2e = sum(tiedot(:,4) > 10000);

rahaa = 0.05*s5c + 0.1*s10c + 0.2*s20c + 0.5*s50c + s1e + 2*s2e