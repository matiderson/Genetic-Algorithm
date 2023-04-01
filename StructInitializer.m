function out = StructInitializer(variables_number, ...
    population_size, crossover_rate, mutation_rate, tournament_size, ...
    max_generation, max_stall_iterations, N, a, b, task_number)

out.variables_number = variables_number;
out.population_size = population_size;

% crossover and mutation parameters
out.crossover_rate = crossover_rate;
out.mutation_rate = mutation_rate;
out.tournament_size = tournament_size;

% stop conditions parameters
out.max_generation = max_generation;
out.max_stall_iterations = max_stall_iterations;

% decoding information
out.N = N;
out.a = a;
out.b = b;

% generating initial population
rng('shuffle');

out.task_number = task_number;

out.current_population = randi([0 1], out.population_size, out.variables_number * out.N);

end