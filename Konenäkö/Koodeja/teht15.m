close all;clear all; clc;
pkg load image

% Luetaan kuva
kuva0 = imread('.\Kuvat\Normaalit\kolikot_2.bmp');
kuva0 = imread('.\Kuvat\Normaalit\opetuskuva_alavalo.bmp');
figure;imshow(kuva0);

% Reunan haku
reunakuva = edge(kuva0,'sobel');
figure;imshow(reunakuva);

% Luokittelu
[luokkuva,luokkienlkm] = bwlabel(reunakuva);
figure;imshow(label2rgb(reunakuva));

% Tunnuslukujen m‰‰ritys luokkakohtaisesti
disp(['Kuvassa on alunperin ' num2str(luokkienlkm) ' kohdetta.']);
laskuri = 0;
for i=1:luokkienlkm
    [r,c] = find(luokkuva == i);
    numel(r)
    if (max(c)-min(c) < 500) && (numel(r) > 100) && (numel(r) < 350)
      laskuri = laskuri + 1
      tiedot(laskuri,1:4) = [i mean(r) mean(c) numel(r)];  
  end    
end
tiedot
figure(1);hold on; plot(tiedot(:,3),tiedot(:,2),'x')
disp(['Kolikoita on ' num2str(size(tiedot,1)) ' kpl.']);

% Kolikoiden tunnistus
s10c = sum(tiedot(:,4) < 265);
s5c = sum(tiedot(:,4) > 265 & tiedot(:,4) < 285);
s20c = sum(tiedot(:,4) > 285 & tiedot(:,4) < 298);
s1e = sum(tiedot(:,4) > 298 & tiedot(:,4) < 310);
s50c = sum(tiedot(:,4) > 310 & tiedot(:,4) < 325);
s2e = sum(tiedot(:,4) > 325);

rahaa = 0.05*s5c + 0.1*s10c + 0.2*s20c + 0.5*s50c + s1e + 2*s2e