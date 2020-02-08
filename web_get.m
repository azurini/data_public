clear


%% 网页库

% 豆瓣鹅组  url{1} = 'https://www.douban.com/group/blabla/';
% for i=1:1:20
%     
%     url(i)=sprintf('https://www.douban.com/group/blabla/discussion?start=%d',50*i);
% 
% end


% github-2019ncovmemory  url{1} = 'https://github.com/2019ncovmemory/nCovMemory/';
URLs = readtable('new_nCovMemory.xlsx');

for i=1:1:392

    url(i)=URLs.url(i);

end

%
% disp(sourcefile); % 显示数据


%% 常用词库

c={'钟南山','医院','医疗','病人','医务工作者','治疗','医生','护士','确诊','疑似','治愈','患者','死亡','隔离',...
    '冠状病毒','肺炎','咳嗽','发烧','发热','感染',...
    '湖北','广州','大理','河南','武汉','浙江','四川','上海',...
    '社会','人民日报','辟谣','微博','军队','政府','华南海鲜市场','蝙蝠','病毒','运气','管理','中央','专利','求助','捐款','控制',...
    '公布','拐点','火神山','雷神山','红十字','协和','封城',...
    '加油','信任','良心','无奈','致敬',...
    '信息','热干面','丁香园','双黄连','口罩','救','药','中国','疫情'};

alphb={'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',...
       'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',...
       '1','2','3','4','5','6','7','8','9','10',...
       '{','}','[',']','(',')','.','#','%',':','-','+',';'};

numc=length(c);

count=zeros(1,numc);




%% 数据生成

for h=1:1:392

    sourcefile=webread(url{1,h}); % 获取所有数据

    sourcefile(isspace(sourcefile))=[]; % 去除空白字符（选用）
  
    for n=1:1:75

        sourcefile = replace(sourcefile,alphb{n},'');% 去除选定字符（不好用）

    end

    sourcefile = regexprep(sourcefile,'<.*?>',''); % 去除尖括号（慎用）
    
    N=length(sourcefile);

    for j=1:numc

        k=length(c{j});

        for i=1:N-k+1

            if(strcmp(sourcefile(i:i+k-1),c{j}))

                count(j)=count(j)+1;

            end

        end

    end
    
    fprintf('第 %d 个链接：%s \n',h,url{1,h})

end

    % expr='<atitle="(\w+)"href="';

    % [~, data]= regexp(sourcefile, expr, 'match', 'tokens'); % 检索

    % celldisp(data) % 显示结果

    
    
% for l=1:numc

%     fprintf('有%d个%s\n',count(l),c{l})

% end



for l=1:numc

    fprintf('{name: " %s,",value: %d},\n',c{l},count(l))

end

%得到的数据送Echarts 做成js

