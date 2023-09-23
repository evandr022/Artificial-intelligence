% Dados das sementes boas e ruins
pea(1, 2, good).
pea(2, 3, good).
pea(2, 4, good).
pea(3, 4, good).
pea(3, 5, good).
pea(4, 5, good).
pea(4, 6, good).
pea(5, 6, good).
pea(6, 6, good).
pea(4, 2, bad).
pea(6, 2, bad).
pea(6, 3, bad).
pea(7, 3, bad).

% Contagem do total de sementes
total_peas(Total) :- 
    findall(1, pea(_, _, _), Pea), 
    length(Pea, Total).

% Contagem do total de sementes boas
total_good_peas(Total) :- 
    findall(1, pea(_, _, good), GoodPeas), 
    length(GoodPeas, Total).
    
% Contagem do total de sementes com Y > 3
total_peas_Y_greater_than_3(Total) :- 
    findall(1, (pea(_, Y, _), Y > 3), Pea_greater_than_3), 
    length(Pea_greater_than_3, Total).

% Contagem do total de sementes boas com Y > 3
total_good_peas_and_Y_greater_3(Total) :- 
    findall(1, (pea(_, Y, good), Y > 3), Pea_greater_than_3), 
    length(Pea_greater_than_3, Total).

% Probabilidade de semente boa ter Y > 3 
prob_pea_Y_greater_than_3_good(Result) :- 
    total_peas_Y_greater_than_3(Total_Y_greater_than_3),
    total_good_peas(Total_good),
    Result is Total_Y_greater_than_3 / Total_good.

% Probabilidade de semente ser boa
prob_pea_good(Result) :- 
    total_good_peas(Total_good),
    total_peas(Total_pea),
    Result is Total_good / Total_pea.

% Probabilidade de semente ter Y > 3
prob_pea_Y_greater_than_3(Result) :- 
    total_peas_Y_greater_than_3(Total_Y_greater_than_3),
    total_peas(Total_pea),
    Result is Total_Y_greater_than_3 / Total_pea.

% Probabilidade de classe ser boa dado y > 3
prob_pea_good_Y_greater_than_3(Result) :-
    prob_pea_Y_greater_than_3_good(Prob_Y_greater_than_3_good),
    prob_pea_good(Prob_good),
    prob_pea_Y_greater_than_3(Prob_Y_greater_than_3),
    Result is (Prob_Y_greater_than_3_good * Prob_good) / Prob_Y_greater_than_3.

% Contagem do total de sementes com Y <= 3
total_peas_Y_less_equal_3(Total) :- 
    findall(1, (pea(_, Y, _), Y =< 3), Pea_less_equal_to_3), 
    length(Pea_less_equal_to_3, Total).

% Contagem do total de sementes boas com Y > 3
total_good_peas_and_Y_less_equal_3(Total) :- 
    findall(1, (pea(_, Y, good), Y =< 3), Pea_less_equal_to_3), 
    length(Pea_less_equal_to_3, Total).

% Probabilidade de semente boa ter Y =< 3 
prob_pea_Y_less_equal_to_3_good(Result) :- 
    total_good_peas_and_Y_less_equal_3(Total_Y_less_equal_to_3_good),
    total_good_peas(Total_good),
    Result is Total_Y_less_equal_to_3_good / Total_good.

% Probabilidade de semente ter Y <= 3
prob_pea_Y_less_equal_to_3(Result) :- 
    total_peas_Y_less_equal_3(Total_Y_less_equal_to_3),
    total_peas(Total_pea),
    Result is Total_Y_less_equal_to_3 / Total_pea.

% Probabilidade de classe ser boa dado y <= 3
prob_pea_good_Y_less_equal_to_3(Result) :-
    prob_pea_Y_less_equal_to_3_good(Prob_Y_less_equal_to_3_good), 
    prob_pea_good(Prob_good),
    prob_pea_Y_less_equal_to_3(Prob_Y_less_equal_to_3),
    Result is (Prob_Y_less_equal_to_3_good * Prob_good) / Prob_Y_less_equal_to_3.
    
query(prob_pea_Y_less_equal_to_3(Result)).
query(prob_pea_good_Y_less_equal_to_3(Result)).
query(prob_pea_Y_less_equal_to_3_good(Result)).
query(prob_pea_good_Y_greater_than_3(Result)).
query(prob_pea_Y_greater_than_3_good(Result)).
query(prob_pea_Y_greater_than_3(Result)).
query(prob_pea_good(Result)).

query(total_good_peas_and_Y_greater_3(Total)).
query(total_good_peas_and_Y_less_equal_3(Total)).
query(total_peas_Y_greater_than_3(Total)).
query(total_peas_Y_less_equal_3(Total)).
query(total_peas(Total)).
query(total_good_peas(Total)).