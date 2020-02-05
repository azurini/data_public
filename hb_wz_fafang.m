%%

s = [1 1 1 1 1];
t = [2 3 4 5 6];
G = digraph(s,t);

G.Nodes.Name = {'First' 'Second' 'Third' 'Fourth' 'Tird' 'Forth'}';
G.Edges.Weight = [60 20 60 60 60]';
G.Edges.Power = {'莲花清瘟胶囊（24粒装）13.5万盒' '聚维酮碘消毒液1400瓶60箱' 'on' 'off' 'off'}';
G.Nodes.Size = ['武汉红十字会' 20 10 30 10 30]';

p = plot(G,'EdgeLabel',G.Edges.Power,'NodeLabel',G.Nodes.Size);
