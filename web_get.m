clear

%网页库
% for g=1:1:9
%     url(g,:)=sprintf('https://www.douban.com/group/blabla/discussion?start=%d',50*g);
% end
%url='https://www.douban.com/'; % 数据所在网址重点内容
%url='https://www.douban.com/gallery/topic/124862/?from=hot_topic_note';
%url='https://www.douban.com/group/blabla/';
%url='https://www.douban.com/group/blabla/discussion?start=50';
%sourcefile=webread(url);
%
%disp(sourcefile); % 显示数据

%常用词库
c={'钟南山','病毒','湖北','运气','医务工作者','封城','河南','社会','治愈','死亡','管理','中央','专利','浙江','疑似','求助','捐款','上海','控制','广州','咳嗽','发烧','人民日报','微博','军队','患者','肺炎','治疗','医生','护士','隔离','拐点','公布','火神山','雷神山','协和','热干面','丁香园','信息','双黄连','冠状病毒','加油','四川','医院','大理','武汉','口罩','辟谣','救','药','医疗','病人','中国','红十字','疫情','确诊'};
numc=length(c);
count=zeros(1,numc);

for h=1:1:20
    sourcefile=webread(sprintf('https://www.douban.com/group/blabla/discussion?start=%d',50*h)); % 获取所有数据
    sourcefile(isspace(sourcefile))=[]; % 去除空白字符（选用）

    % expr='<atitle="(\w+)"href="';
    % [~, data]= regexp(sourcefile, expr, 'match', 'tokens'); % 检索
    % celldisp(data) % 显示结果
    N=length(sourcefile);

    for j=1:numc
        k=length(c{j});
        for i=1:N-k+1
            if(strcmp(sourcefile(i:i+k-1),c{j}))
                count(j)=count(j)+1;
            end
        end
    end
end

% for l=1:numc
%     fprintf('有%d个%s\n',count(l),c{l})
% end

for l=1:numc
    fprintf('{name: " %s,",value: %d},\n',c{l},count(l))
end

%得到的数据送Echarts 做成js
