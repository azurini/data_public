clear

%��ҳ��
% for g=1:1:9
%     url(g,:)=sprintf('https://www.douban.com/group/blabla/discussion?start=%d',50*g);
% end
%url='https://www.douban.com/'; % ����������ַ�ص�����
%url='https://www.douban.com/gallery/topic/124862/?from=hot_topic_note';
%url='https://www.douban.com/group/blabla/';
%url='https://www.douban.com/group/blabla/discussion?start=50';
%sourcefile=webread(url);
%
%disp(sourcefile); % ��ʾ����

%���ôʿ�
c={'����ɽ','����','����','����','ҽ������','���','����','���','����','����','����','����','ר��','�㽭','����','����','���','�Ϻ�','����','����','����','����','�����ձ�','΢��','����','����','����','����','ҽ��','��ʿ','����','�յ�','����','����ɽ','����ɽ','Э��','�ȸ���','����԰','��Ϣ','˫����','��״����','����','�Ĵ�','ҽԺ','����','�人','����','��ҥ','��','ҩ','ҽ��','����','�й�','��ʮ��','����','ȷ��'};
numc=length(c);
count=zeros(1,numc);

for h=1:1:20
    sourcefile=webread(sprintf('https://www.douban.com/group/blabla/discussion?start=%d',50*h)); % ��ȡ��������
    sourcefile(isspace(sourcefile))=[]; % ȥ���հ��ַ���ѡ�ã�

    % expr='<atitle="(\w+)"href="';
    % [~, data]= regexp(sourcefile, expr, 'match', 'tokens'); % ����
    % celldisp(data) % ��ʾ���
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
%     fprintf('��%d��%s\n',count(l),c{l})
% end

for l=1:numc
    fprintf('{name: " %s,",value: %d},\n',c{l},count(l))
end

%�õ���������Echarts ����js
