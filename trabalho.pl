%Andrey Souto Maior - RA 78788
%Lucas Franco Bernardes - RA 80824

:- use_module(library(pio)).
:- use_module(library(plunit)).
:- use_module(library(tty)).
:- set_prolog_stack(global, limit(100 000 000 000)).

%Trabalho PROLOG - Shortest Path

%init
start :-
    
    tty_clear,
    write('\t\t\t\t\n'),
    write('\t##############################\t\n'),
    write('\t#  Prolog - Caminho mínimo   #\t\n'),
    write('\t##############################\t\n'),


    write('\n\tImportar no arquivo?(S/N) '),
    read(O),
    (
        O == 's', abrirArq
        ;
        O == 'n'
    ),

    write('\n\tCriterios:\n'),
    write('\t\t1. Menor distancia percorrida;\n'),
    write('\t\t2. Menor duracao prevista;\n'),
    write('\t\t3. Menor custo;\n'),
    write('\t\t4. Sair.\n'),
    write('\tInforme sua escolha (1, 2, 3, 4): '),

    read(Opcao),
    (
        Opcao == 1, menorDistancia, !
        ;
        Opcao == 2, menorDuracao, !
        ;
        Opcao == 3, menorCusto, !
        ;
        Opcao == 4, halt, !
        ;
        restart
    ).

restart :-
    write('\n\tImportar novo arquivo? (S/N) '),
    read(O),
    (
        O == 's', abrirArq
        ;
        O == 'n'
    ),

    write('\n\tCriterios:\n'),
    write('\t\t1. Menor distancia percorrida;\n'),
    write('\t\t2. Menor duracao prevista;\n'),
    write('\t\t3. Menor custo;\n'),
    write('\t\t4. Sair.\n'),
    write('\tInforme sua escolha (1, 2, 3, 4): '),

    read(Opcao),
    (
        Opcao == 1, menorDistancia, !
        ;
        Opcao == 2, menorDuracao, !
        ;
        Opcao == 3, menorCusto, !
        ;
        Opcao == 4, halt,!
        ;
        restart
    ).

abrirArq :-
    write('\n\tInforme o arquivo de dados: '),
    read(Arquivo),
    consult(Arquivo).

leitura(Origem, Destino, Piso) :-
    write('\t\tOrigem: '), read(Origem),
    write('\t\tDestino: '), read(Destino),
    write('\t\tQualidade minima do piso (1~5): '), read(Piso).

% -- Opcoes

menorDistancia :-
    leitura(Origem, Destino, Piso),
    findall([P, L], path(Origem, Destino, Piso, [], [Origem], L, P), List),
    minimum(List, [Path, Length]),
    write('\t- Distancia: '), write(Length), write('\n'),
    write('\t- Rota:\n'), write('\t'), write([Origem | Path]), write('\n\n').

menorDuracao :-
	leitura(Origem, Destino, Piso),
    findall([P, L], pathDuracao(Origem, Destino, Piso, [], [Origem], L, P), List),
    minimum(List, [Path, Length]),
    write('\t- Duracao: '), write(Length), write('\n'),
    write('\t- Rota:\n'), write('\t'), write([Origem | Path]), write('\n\n').

menorCusto :-
	leitura(Origem, Destino, Piso),
	write('\t\tConsumo médio do veículo: '), read(Consumo),
    findall([P, L], pathCusto(Origem, Destino, Piso, Consumo, [], [Origem], L, P), List),
    minimum(List, [Path, Length]),
    write('\t- Custo: '), write(Length), write('\n'),
    write('\t- Rota:\n'), write('\t'), write([Origem | Path]), write('\n\n').

% -- Caminho minimo distancia--

path(A, A, _, [_], 0, [A]) :- !.

path(A, B, Piso, P, V, L, Path) :-
    edge(Id, A, B, L, settings(X, Y, Z)),
    X >= Piso,
    Path = [B], !
    ;
    edge(Id, B, A, L, settings(X, Y, Z)),
    X >= Piso,
    Path = [B], !.


path(A, B, Piso, P, V, L, Path) :-
    edge(Id, A, N, Len, settings(X, Y, Z)),
    X >= Piso,
    \+ member(N, V),
    path(N, B, Piso, P, [N | V], L0, Path0),
    Path = [N | Path0],
    L is L0 + Len
    ;
    edge(Id, N, A, Len, settings(X, Y, Z)),
    X >= Piso,
    \+ member(N, V),
    path(N, B, Piso, P, [N | V], L0, Path0),
    Path = [N | Path0],
    L is L0 + Len.

% -- Caminho minimo duracao --

duracao(L, V, D) :- D is L/V.

pathDuracao(A, A, _, [_], 0, [A]) :- !.

pathDuracao(A, B, Piso, P, V, L, Path) :-
    edge(Id, A, B, Len, settings(X, Y, Z)),
    X >= Piso,
	duracao(Len, Z, L), 
    Path = [B], !
    ;
    edge(Id, B, A, Len, settings(X, Y, Z)),
    X >= Piso,
	duracao(Len, Z, L),
    Path = [B], !.


pathDuracao(A, B, Piso, P, V, L, Path) :-
    edge(Id, A, N, Len, settings(X, Y, Z)),
    X >= Piso,
    \+ member(N, V),
	duracao(Len, Z, D),
    pathDuracao(N, B, Piso, P, [N | V], D0, Path0),
    Path = [N | Path0],
    L is D0 + D
    ;
    edge(Id, N, A, Len, settings(X, Y, Z)),
    X >= Piso,
    \+ member(N, V),
	duracao(Len, Z, D),
    pathDuracao(N, B, Piso, P, [N | V], D0, Path0),
    Path = [N | Path0],
    L is D0 + D.

% -- Caminho minimo custo --

custo(A, B, C, E, F) :-
	duracao(A, C, D),
	F is (C/E*D*3.7+B).

pathCusto(A, A, _, _, [_], 0, [A]) :- !.

pathCusto(A, B, Piso, Consumo, P, V, L, Path) :-
    edge(Id, A, B, Len, settings(X, Y, Z)),
    X >= Piso,
	custo(Len, Y, Z, Consumo, L), 
    Path = [B], !
    ;
    edge(Id, B, A, Len, settings(X, Y, Z)),
    X >= Piso,
	custo(Len, Y, Z, Consumo, L),
    Path = [B], !.

pathCusto(A, B, Piso, Consumo, P, V, L, Path) :-
    edge(Id, A, N, Len, settings(X, Y, Z)),
    X >= Piso,
    \+ member(N, V),
	custo(Len, Y, Z, Consumo, C),
    pathCusto(N, B, Piso, Consumo, P, [N | V], C0, Path0),
    Path = [N | Path0],
    L is C0 + C
    ;
    edge(Id, N, A, Len, settings(X, Y, Z)),
    X >= Piso,
    \+ member(N, V),
	custo(Len, Y, Z, Consumo, C),
    pathCusto(N, B, Piso, Consumo, P, [N | V], C0, Path0),
    Path = [N | Path0],
    L is C0 + C.


minimum([[X, Y]], [X, Y]) :- !.

minimum([[X1, Y1], [X2, Y2] | Tail], [X, Y]) :-
    ( Y1 > Y2 ->
        minimum([[X2, Y2] | Tail], [X, Y])
    ;
        minimum([[X1, Y1] | Tail], [X, Y])
    ).
