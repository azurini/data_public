clear


%% ��ҳ��

% �������  url{1} = 'https://www.douban.com/group/blabla/';
% for i=1:1:20
%     
%     url(i)=sprintf('https://www.douban.com/group/blabla/discussion?start=%d',50*i);
% 
% end


% github-2019ncovmemory  url{1} = 'https://github.com/2019ncovmemory/nCovMemory/';
URLs = readtable('news/new_nCovMemory.xlsx');

for i=1:1:392

    url(i)=URLs.url(i);

end

%
% disp(sourcefile); % ��ʾ����


%% ���ôʿ�

c={'����ɽ','����','����','����','ҽ������','���','����','���','����','����','����','����','ר��','�㽭','����','����','���','�Ϻ�','����','����','����','����','�����ձ�','΢��','����','����','����','����','ҽ��','��ʿ','����','�յ�','����','����ɽ','����ɽ','Э��','�ȸ���','����԰','��Ϣ','˫����','��״����','����','�Ĵ�','ҽԺ','����','�人','����','��ҥ','��','ҩ','ҽ��','����','�й�','��ʮ��','����','ȷ��'};

alphb={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','[',']','(',')'};

numc=length(c);

count=zeros(1,numc);


%% ��������

for h=1:1:392

    sourcefile=webread(url{1,h}); % ��ȡ��������

    sourcefile(isspace(sourcefile))=[]; % ȥ���հ��ַ���ѡ�ã�
    
    for n=1:1:30
        sourcefile = replace(sourcefile,alphb{n},'');
    end
    
    sourcefile = regexprep(sourcefile,'<.*?>',''); % ȥ�������ţ����ã�

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
    
    fprintf('�� %d �����ӣ�%s \n',h,url{1,h})

end



% for l=1:numc

%     fprintf('��%d��%s\n',count(l),c{l})

% end



for l=1:numc

    fprintf('{name: " %s,",value: %d},\n',c{l},count(l))

end

%�õ���������Echarts ����js

