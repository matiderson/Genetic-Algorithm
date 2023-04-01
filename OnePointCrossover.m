function [child1, child2] = OnePointCrossover(parent1, parent2, l)

point = randi([1 l]);

child1 = zeros(l, 1);
child2 = zeros(l, 1);

child1(1:point) = parent1(1:point);
child1(point + 1:end) = parent2(point + 1:end);
 
child2(1:point) = parent2(1:point);
child2(point + 1:end) = parent1(point + 1:end);

end