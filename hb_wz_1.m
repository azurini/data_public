%������ʮ�ֻ� ������Դ

%%�汾һ
%  donate = xlsread('HB_wz_1.xlsx');
%  colordata = categorical(donate.Kind);
% 
%  gb=geobubble(donate.Latitude,donate.Longitude,donate.Value,colordata);
%  geolimits([0 55],[-280 -230]); %�й���ͼ
%  %geolimits([29 33],[-254 -242]); %������ͼ
%  
%  gb.Title = '����ʡ��ʮ�ֻṫʾ--��һ��������Դ�ֲ����';
%  gb.Basemap = 'colorterrain';
%  %gb.Basemap = 'grayland';
%  %gb.Basemap = 'landcover';
%  %gb.Basemap = 'grayterrain';
%  %gb.Basemap = 'bluegreen';

%%�汾��
donate = readtable('HB_wz_1.xlsx');

[a,b] = size(donate);
S = table2struct(donate);

color={'#F58158','#81F558','#8158F5','#F55881','#58F581'};

for l=1:a
    fprintf('{"name": "%s" ,"value": [%f, %f, %f],"symbolSize": 4,"itemStyle": {"normal": {"color": "%s"}}}, \n',S(l).Donor,S(l).Longitude,S(l).Latitude,S(l).Value,color{S(l).Kinds})
end

for l=1:a
    fprintf('{"fromName": "%s","toName": "�人","coords": [[%f, %f],[114.305393, 30.593099]]},\n',S(l).Donor,S(l).Longitude,S(l).Latitude)
end