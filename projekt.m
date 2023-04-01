% for i = 1:12
%     disp(['Próba: ' num2str(i)]);
%     disp(' ');
%     %% zad1
%     zad1 = StructInitializer(3, 40, 0.8, 0.1, 8, 30, 8, 18, 0, 20, 1);
%     
%     tic
%     result1 = GeneticAlgorithm(zad1);
%     toc
%     disp(' ');
%     %% zad2
%     zad2 = StructInitializer(3, 40, 0.8, 0.1, 8, 30, 8, 18, 0, 20, 2);
%     
%     tic
%     result2 = GeneticAlgorithm(zad2);
%     toc
%     disp(' ');
%     %% zad3
%     zad3 = StructInitializer(3, 40, 0.8, 0.1, 8, 30, 8, 18, 0, 20, 3);
%     
%     tic
%     result3 = GeneticAlgorithm(zad3);
%     toc
%     disp(' ');
%     %% zad4
%     zad4 = StructInitializer(3, 40, 0.8, 0.1, 8, 30, 8, 18, 0, 20, 4);
%     h = 0.0005;
%     tic
%     result4 = GeneticAlgorithm(zad4);
%     toc
%     disp(' ');
%     disp(' ');
%     %% zapisanie wyników
%     fmt = 'results/result%d_v%d.xml';
%     
%     writestruct(result1, sprintf(fmt, 1, i));
%     writestruct(result2, sprintf(fmt, 2, i));
%     writestruct(result3, sprintf(fmt, 3, i));
%     writestruct(result4, sprintf(fmt, 4, i));
% end
%% dogrywka dla zadania 3
% wybrano zakres od 0 do 1 - dla poprzednich prób dla tego
% zakresu otrzymano najlepsze wyniki

% for i = 1:8
%     disp(['Próba: ' num2str(i)]);
%     disp(' ');
%    %% zad3
%     zad3 = StructInitializer(3, 40, 0.8, 0.1, 8, 30, 8, 18, 0, 1, 3);
%     
%     tic
%     result3 = GeneticAlgorithm(zad3);
%     toc
%     disp(' ');
%     
%     %% zapisanie wyników
%     fmt = 'dogrywka/result%d_v%d.xml';
%         
%     writestruct(result3, sprintf(fmt, 3, i));
% end
%% wybranie wyników
zad1 = zeros(12, 4);
zad2 = zeros(12, 4);
zad3 = zeros(20, 4);
zad4 = zeros(12, 4);
fmt = 'results/result%d_v%d.xml';
for i=1:12
    zad1(i, 1:3) = readstruct(sprintf(fmt, 1, i)).solution_parameters;
    zad1(i, 4) = readstruct(sprintf(fmt, 1, i)).solution;

    zad2(i, 1:3) = readstruct(sprintf(fmt, 2, i)).solution_parameters;
    zad2(i, 4) = readstruct(sprintf(fmt, 2, i)).solution;

    zad3(i, 1:3) = readstruct(sprintf(fmt, 3, i)).solution_parameters;
    zad3(i, 4) = readstruct(sprintf(fmt, 3, i)).solution;

    zad4(i, 1:3) = readstruct(sprintf(fmt, 4, i)).solution_parameters;
    zad4(i, 4) = readstruct(sprintf(fmt, 4, i)).solution;
end
fmt = 'dogrywka/result%d_v%d.xml';
for i=1:8
    zad3(12 + i, 1:3) = readstruct(sprintf(fmt, 3, i)).solution_parameters;
    zad3(12 + i, 4) = readstruct(sprintf(fmt, 3, i)).solution;
end

[~, ind1] = min(zad1(:, 4));
[~, ind2] = min(zad2(:, 4));
[~, ind3] = min(zad3(:, 4));
[~, ind4] = min(zad4(:, 4));

% wypisanie parametrów
disp('Parametry zadanie 1');
disp(zad1(ind1, 1:3));

disp('Wartość wskaźnika zadanie 1');
disp(zad1(ind1, 4));

disp('Parametry zadanie 2');
disp(zad2(ind2, 1:3));

disp('Wartość wskaźnika zadanie 2');
disp(zad2(ind2, 4));

disp('Parametry zadanie 3');
disp(zad3(ind3, 1:3));

disp('Wartość wskaźnika zadanie 3');
disp(zad3(ind3, 4));

disp('Parametry zadanie 4');
disp(zad4(ind4, 1:3));

disp('Wartość wskaźnika zadanie 4');
disp(zad4(ind4, 4));

%% przeregulowanie
h = 0.0005;

nastawy = [zad1(ind1, 1:3);
           zad2(ind2, 1:3);
           zad3(ind3, 1:3);
           zad4(ind4, 1:3)];

p = zeros(4, 1);

for i=1:3
    x = nastawy(i, :);
    out = sim('Obiekt123.slx',[0 100]);
    p(i) = max(out.y.Data) - 0.5;
end

x = nastawy(4, :);
out = sim('Obiekt123_dyskretny.slx',[0 100]);
p(4) = max(out.y.Data) - 0.5;

