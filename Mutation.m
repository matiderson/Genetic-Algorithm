function population = Mutation(population, population_size, l, mutation_number)

% getting random gen to be mutated
x = randperm(population_size, mutation_number);
y = randperm(l, mutation_number);

for i = 1:mutation_number
    population(x(i), y(i)) = 1 - population(x(i), y(i));
end

end