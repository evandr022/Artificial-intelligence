% Dados
weather(clear,rising,dry, 0.4).
weather(clear,rising,raining, 0.07).
weather(clear,falling,dry, 0.08).
weather(clear,falling,raining, 0.1).
weather(cloudy,falling,dry, 0.09).
weather(cloudy,rising,raining, 0.11).
weather(cloudy,rising,dry, 0.03).
weather(cloudy,falling,raining, 0.12).

% Questap a) Total de eventos
p_counting(Total) :- 
    findall(1, weather(_,_,_,_), P),
    length(P,Total).

% Probabilidade de ceu Claro e barometro Subindo
p_clear_rising(Result) :- 
    weather(clear,rising,dry, X), 
    weather(clear,rising,raining, Y),
    Result is X + Y.

% Probabilidade de ceu Claro, barometro Subindo e precipitação Seco
p_dry_clear_rising(Result) :-
    weather(clear,rising,dry, X),
    Result = X.

% Questão b) Probabilidade de precipitação Seco dado ceu Claro e barometro Subindo
p_dry_given_clear_rising(Result) :-
    p_clear_rising(Prob1),
    p_dry_clear_rising(Prob2),
    Result is Prob2 / Prob1.


% Coluna que falta na tabela com valor de probabilidade 0.12
weather(cloudy,falling,raining,0.12).

% Probabilidade de ceu Nublado e precipitação Chuva
p_raining_cloudy(Result) :-
    weather(cloudy,rising,raining, X),
    weather(cloudy,falling,raining, Y),
    Result is X+Y.

% Probabilidade de ceu Nublado
p_cloudy(Result) :-
    weather(cloudy,falling,dry, X1),
    weather(cloudy,rising,raining, X2),
    weather(cloudy,rising,dry, X3),
    weather(cloudy,falling,raining, X4),
    Result is X1+X2+X3+X4.

% Questão c) Probabilidade de precipitação Chuva dado ceu Nublado
p_raining_given_cloudy(Result) :-
    p_cloudy(Prob1),
    p_raining_cloudy(Prob2),
    Result is Prob2 / Prob1.
    
query(p_counting(Total)).
query(p_clear_rising(Result)).
query(p_dry_clear_rising(Result)).
query(p_dry_given_clear_rising(Result)).
query(p_raining_cloudy(Result)).
query(p_cloudy(Result)).
query(p_raining_given_cloudy(Result)).