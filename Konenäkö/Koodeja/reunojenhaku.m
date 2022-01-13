close all;clear all; clc;

% Luetaan kuva
kuva0 = imread('coins.png'); 
reunat = edge(kuva0,'sobel');
figure;imshow(kuva0);
figure;imshow(reunat);

% Luokittelu
[luokkuva,luokkienlkm] = bwlabel(reunat);
figure;imshow(label2rgb(luokkuva));

% Valitaan vain riittävän suuret reunapistejoukot
aputalukko = [];
massakpt = [];
laskuri = 0
figure;imshow(kuva0); hold on;
for i=1:luokkienlkm
    [r,c] = find(luokkuva == i);
    if numel(r) > 100
      laskuri = laskuri + 1
      massakpt(laskuri,1:2) = [mean(r) mean(c)];
      aputaulukko(laskuri,1:2) = [laskuri numel(r)];
      plot(c,r,'.','markersize',22);
    end
end

% Tunnistus
disp(['Kuvassa on ' num2str(laskuri) ' kohdetta.']);
aputaulukko
massakpt     

plot(massakpt(:,2),massakpt(:,1),'x', 'markersize',22)

% Oma reunojen haku kahdella Prewitt -maskilla
mask = [-1 -1 -1;0 0 0; 1 1 1];
J = imfilter(double(kuva0),mask);
max(J(:)),min(J(:))
figure;imshow((J),[])
figure;imshow(J>200)
figure;imshow(J<-200)

J2 = imfilter(double(kuva0),mask');
figure;imshow((J2),[])
% Tästä pitäisi sitten jatkaa valisemalla jotenkin reunapisteet
% ja linkittämällä järkeviksi reunaviivoiksi ja laskemalla tunnuslukuja ...