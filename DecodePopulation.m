function decoded_population = DecodePopulation(population, k1, k2, N, variables_number, population_size)

decoded_population = zeros(population_size, variables_number);
for m = 1:population_size
    for i = 1:variables_number
        decoded_population(m, i) = Decode(population(m, (1 + (i - 1) * N:i * N)), k1, k2);
    end
end

end