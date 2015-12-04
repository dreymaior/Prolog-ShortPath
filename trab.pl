%Andrey Souto Maior - RA 78788
%Lucas Franco Bernardes - RA 80824

%TRABALHO 1 - PROLOG - Shortest Path


%Distancia em linha reta (Straight Line Distance) para Bucarest:
linhareta(arad,bucharest,366).
linhareta(bucharest,bucharest,0).
linhareta(craiova,bucharest,160).
linhareta(dobreta,bucharest,242).
linhareta(eforie,bucharest,161).
linhareta(fagaras,bucharest,176).
linhareta(giurgiu,bucharest,77).
linhareta(hirsova,bucharest,151).
linhareta(iasi,bucharest,226).
linhareta(lugoj,bucharest,244).
linhareta(mehadia,bucharest,241).
linhareta(neamt,bucharest,234).
linhareta(oradea,bucharest,380).
linhareta(pitesti,bucharest,10).
linhareta(vilcea,bucharest,193).
linhareta(sibiu,bucharest,253).
linhareta(timisoara,bucharest,329).
linhareta(urziceni,bucharest,80).
linhareta(vaslui,bucharest,199).
linhareta(zerind,bucharest,374).


%Arestas do grafo. Cidades que se ligam uma com a outra por uma estrada:
estrada(oradea,zerind,71).
estrada(oradea,sibiu,151).
estrada(zerind,arad,75).
estrada(zerind,oradea,71).
estrada(arad,zerind,75).
estrada(arad,sibiu,140).
estrada(arad,timisoara,118).
estrada(timisoara,arad,118).
estrada(timisoara,lugoj,111).
estrada(sibiu,arad,140).
estrada(sibiu,fagaras,99).
estrada(sibiu,vilcea,80).
estrada(vilcea,pitesti,97).
estrada(vilcea,sibiu,80).
estrada(vilcea,craiova,146).
estrada(pitesti,bucharest,101).
estrada(pitesti,vilcea,97).
estrada(pitesti,craiova,138).
estrada(fagaras,sibiu,99).
estrada(fagaras,bucharest,211).
estrada(bucharest,fagaras,211).
estrada(bucharest,pitesti,101).
estrada(bucharest,giurgiu,90).
estrada(bucharest,urziceni,85).
estrada(giurgiu,bucharest,90).
estrada(giurgiu,giurgiu,0).
estrada(lugoj,timisoara,111).
estrada(lugoj,mehadia,70).
estrada(mehadia,lugoj,70).
estrada(mehadia,dobreta,75).
estrada(dobreta,mehadia,75).
estrada(dobreta,craiova,120).
estrada(craiova,pitesti,138).
estrada(craiova,dobreta,120).
estrada(urziceni,bucharest,85).
estrada(urziceni,vaslui,142).
estrada(urziceni,hirsova,98).
estrada(hirsova,urziceni,98).
estrada(hirsova,eforie,86).
estrada(eforie,hirsova,86).
estrada(eforie,eforie,0).
estrada(vaslui,urziceni,142).
estrada(vaslui,iasi,92).
estrada(neamt,neamt,0).
estrada(neamt,iasi,87).
estrada(iasi,neamt,87).
estrada(iasi,vaslui,92).


%Pesquisa o caminho de uma cidade (Origem) até o destino (Bucharest):
pesquisa(romenia):-
	write('Digite sua cidade de origem: '),	read(Origem),
	write('Esta em: '),write(Origem),write('\n\n'),
	buscagulosa(Origem,bucharest). %inicia a busca da origem ate bucharest


%Busca Gulosa:
buscagulosa(Origem,Destino):-
	linhareta(Origem,Destino,L),
	L == 0, %significa que ja chegou em Bucharest
	!.

buscagulosa(Origem,Destino):-
	findall(X,estrada(Origem,X,_),L), %gera uma lista L com todas as cidades possiveis para ir estando em Origem
	min(L,Destino,Proximo), %verifica qual a cidade na lista L com o menor Straight Line Distance e a retorna como Proximo
	write('Operador: Vai de '),write(Origem),write(' para '),write(Proximo),
	write('\n'),write('Esta em: '),write(Proximo),write('\n'),
	pergunta(Proximo,Destino). %faz a pergunta antes da proxima iteracao da busca


%Pergunta se deseja continuar a cada iteracao da busca:
pergunta(Origem,Destino):-
	write('\nQuer continuar? '),read(X),
	X == 's',
	buscagulosa(Origem,Destino). %continua a busca caso a resposta seja Sim
pergunta(_,_):-!.


%Encontra a cidade com o menor straighline em uma lista:
min([X],_,X):-!.

min([X,Y|XS],Destino,M):-
	linhareta(X,Destino,A),
	linhareta(Y,Destino,B),
	A<B,
	min([X|XS],Destino,M).

min([X,Y|XS],Destino,M):-
	linhareta(X,Destino,A),
	linhareta(Y,Destino,B),
	A>=B,
	min([Y|XS],Destino,M).



















