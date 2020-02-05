 donate = readtable('wh2020data.xlsx');

 colordata = categorical(donate.Kind);

 gb=geobubble(donate.Latitude,donate.Longitude,donate.Value,colordata);
 geolimits([0 60],[-280 -230]); %�й���ͼ
 %geolimits([29 33],[-254 -242]); %������ͼ
 
 gb.Title = '����ʡ��ʮ�ֻ� ������Դ�ֲ����';
 gb.Basemap = 'colorterrain';
 %gb.Basemap = 'grayland';
 %gb.Basemap = 'landcover';
 %gb.Basemap = 'grayterrain';
 %gb.Basemap = 'bluegreen';