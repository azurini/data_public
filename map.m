 donate = readtable('wh2020data.xlsx');

 colordata = categorical(donate.Kind);

 gb=geobubble(donate.Latitude,donate.Longitude,donate.Value,colordata);
 geolimits([0 60],[-280 -230]); %中国地图
 %geolimits([29 33],[-254 -242]); %湖北地图
 
 gb.Title = '湖北省红十字会 物资来源分布情况';
 gb.Basemap = 'colorterrain';
 %gb.Basemap = 'grayland';
 %gb.Basemap = 'landcover';
 %gb.Basemap = 'grayterrain';
 %gb.Basemap = 'bluegreen';