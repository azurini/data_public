%%

s = [1 1 1 1 1];
t = [2 3 4 5 6];
G = digraph(s,t);

G.Nodes.Name = {'First' 'Second' 'Third' 'Fourth' 'Tird' 'Forth'}';
G.Edges.Weight = [60 20 60 60 60]';
G.Edges.Power = {'�����������ң�24��װ��13.5���' '��άͪ������Һ1400ƿ60��' 'on' 'off' 'off'}';
G.Nodes.Size = ['�人��ʮ�ֻ�' 20 10 30 10 30]';

p = plot(G,'EdgeLabel',G.Edges.Power,'NodeLabel',G.Nodes.Size);
