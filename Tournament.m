function [winner, ind] = Tournament(population, fit_vector, population_size, tournament_size)

% we cannot have more tournament participants than population size
if tournament_size > population_size
    tournament_size = population_size;
end

% getting random tournament participants
tournament_members = zeros(tournament_size, 2);
tournament_members(:, 1) = randperm(population_size, tournament_size);

for i = 1:tournament_size
    tournament_members(i, 2) = fit_vector(tournament_members(i, 1));
end

% choosing winner of the tournament
[~, index] = min(tournament_members(:, 2));
ind = tournament_members(index, 1);

winner = population(ind, :);

end