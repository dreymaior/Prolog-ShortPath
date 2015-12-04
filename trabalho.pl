%Andrey Souto Maior - RA 78788
%Lucas Franco Bernardes - 80824

%Trabalho PROLOG - Shortest Path

%Arestas do grafo
edge(maringa, marialva, 17).
edge(maringa, santoInacio, 91).
edge(maringa, paranavai, 74).
edge(maringa, cidadeGaucha, 146).
edge(maringa, campoMourao, 91).
edge(portoRico, santoInacio, 208).
edge(portoRico, paranavai, 102).
edge(portoRico, cidadeGaucha, 95).
edge(portoRico, umuarama, 140).
edge(paranavai, maringa, 74).
edge(paranavai, santoInacio, 115).
edge(paranavai, portoRico, 102).
edge(paranavai, cidadeGaucha, 79).
edge(cidadeGaucha, maringa, 146).
edge(cidadeGaucha, paranavai, 79).
edge(cidadeGaucha, portoRico, 95).
edge(cidadeGaucha, umuarama, 70).
edge(cidadeGaucha, cruzeiroDoOeste, 76).
edge(cruzeiroDoOeste, cidadeGaucha, 76).
edge(cruzeiroDoOeste, umuarama, 29).
edge(cruzeiroDoOeste, assisChateubriand, 112).
edge(cruzeiroDoOeste, campoMourao, 88).
edge(umuarama, portoRico, 140).
edge(umuarama, cidadeGaucha, 70).
edge(umuarama, cruzeiroDoOeste, 29).
edge(umuarama, guaira, 115).
edge(assisChateubriand, cruzeiroDoOeste, 112).
edge(assisChateubriand, guaira, 114).
edge(assisChateubriand, campoMourao, 144).
edge(assisChateubriand, cascavel, 179).
edge(guaira, umuarama, 115).
edge(guaira, assisChateubriand, 114).
edge(guaira, fozDoIguacu, 223).
edge(campoMourao, maringa, 91).
edge(campoMourao, cruzeiroDoOeste, 88).
edge(campoMourao, assisChateubriand, 144).
edge(campoMourao, manoelRibas, 117).
edge(campoMourao, lunardeli, 100).
edge(cascavel, assisChateubriand, 179).
edge(cascavel, fozDoIguacu, 139).
edge(cascavel, guarapuava, 248).
edge(cascavel, boaVistaDaAparecida, 73).
edge(fozDoIguacu, guaira, 223).
edge(fozDoIguacu, cascavel, 139).
edge(fozDoIguacu, fransciscoBeltrao, 283).
edge(fozDoIguacu, boaVistaDaAparecida, 206).
edge(franciscoBeltrao, fozDoIguacu, 283).
edge(franciscoBeltrao, patoBranco, 55).
edge(franciscoBeltrao, boaVistaDaAparecida, 123).
edge(franciscoBeltrao, chopinzinho, 88).
edge(patoBranco, franciscoBeltrao, 55).
edge(patoBranco, uniaoDaVitoria, 218).
edge(patoBranco, chopinzinho, 59).
edge(guarapuava, cascavel, 248).
edge(guarapuava, uniaoDaVitoria, 203).
edge(guarapuava, irati, 104).
edge(guarapuava, manoelRibas, 122).
edge(guarapuava, chopinzinho, 152).
edge(uniaoDaVitoria, patoBranco, 218).
edge(uniaoDaVitoria, guarapuava, 203).
edge(uniaoDaVitoria, irati, 122).
edge(uniaoDaVitoria, curitiba, 235).
edge(irati, guarapuava, 104).
edge(irati, uniaoDaVitoria, 122).
edge(irati, pontaGrossa, 84).
edge(irati, curitba, 156).
edge(pontaGrossa, irati, 84).
edge(pontaGrossa, manoelRibas, 223).
edge(pontaGrossa, curitiba, 114).
edge(pontaGrossa, jaguariaiva, 125).
edge(pontaGrossa, imbau, 112).
edge(manoelRibas, campoMourao, 117).
edge(manoelRibas, guarapuava, 122).
edge(manoelRibas, pontaGrossa, 223).
edge(manoelRibas, imbau, 138).
edge(manoelRibas, lunardeli, 66).
edge(curitiba, uniaoDaVitoria, 235).
edge(curitiba, irati, 156).
edge(curitiba, pontaGrossa, 114).
edge(curitiba, paranagua, 90).
edge(curitiba, cerroAzul, 86).
edge(paranagua, curitiba, 90).
edge(cerroAzul, curitiba, 86).
edge(cerroAzul, jaguariaiva, 104).
edge(jaguariaiva, pontaGrossa, 125).
edge(jaguariaiva, cerroAzul, 104).
edge(jaguariaiva, ibaiti, 115).
edge(jaguariaiva, imbau, 168).
edge(ibaiti, jaguariaiva, 115).
edge(ibaiti, jacarezinho, 88).
edge(ibaiti, cornelioProcopio, 108).
edge(ibaiti, imabau, 126).
edge(jacarezinho, ibaiti, 88).
edge(jacarezinho, cornelioProcopio, 89).
edge(cornelioProcopio, ibaiti, 108).
edge(cornelioProcopio, jacarezinho, 88).
edge(cornelioProcopio, londrina, 67).
edge(cornelioProcopio, sertanopolis, 69).
edge(londrina, cornelioProcopio, 67).
edge(londrina, sertanopolis, 44).
edge(londrina, santoInacio, 117).
edge(londrina, apucarana, 54).
edge(londrina, mauaDaSerra, 83).
edge(londrina, marialva, 80).
edge(sertanopolis, cornelioProcopio, 69).
edge(sertanopolis, londrina, 44).
edge(sertanopolis, santoInacio, 113).
edge(santoInacio, maringa, 91).
edge(santoInacio, portoRico, 208).
edge(santoInacio, paranavai, 115).
edge(santoInacio, londrina, 117).
edge(santoInacio, sertanopolis, 113).
edge(apucarana, londrina, 54).
edge(apucarana, mauaDaSerra, 52).
edge(apucarana, marialva, 45).
edge(mauaDaSerra, londrina, 83).
edge(mauaDaSerra, apucarana, 52).
edge(mauaDaSerra, imbau, 96).
edge(mauaDaSerra, lunardeli, 90).
edge(imbau, pontaGrossa, 112).
edge(imbau, manoelRibas, 138).
edge(imbau, jaguariaiva, 168).
edge(imbau, ibaiti, 126).
edge(imbau, mauaDaSerra, 96).
edge(marialva, maringa, 17).
edge(marialva, londrina, 79).
edge(marialva, apucarana, 45).
edge(marialva, lunardeli, 97).
edge(lunardeli, campoMourao, 100).
edge(lunardeli, manoelRibas, 66).
edge(lunardeli, mauaDaSeera, 90).
edge(lunardeli, marialva, 97).
edge(boaVistaDaAparecida, cascavel, 73).
edge(boaVistaDaAparecida, fozDoIguacu, 206).
edge(boaVistaDaAparecida, franciscoBeltrao, 123).
edge(boaVistaDaAparecida, chopinzinho, 167).
edge(chopinzinho, franciscoBeltrao, 88).
edge(chopinzinho, patoBranco, 59).
edge(chopinzinho, guarapuava, 152).
edge(chopinzinho, boaVistaDaAparecida, 167).

%init
start :-
    write('Digite a cidade de origem: '), read(Source),
    write('Digite a cidade de destino: '), read(Destine),
    path(Source, Destine, Length, List),
    %Esse write eh debug por enquanto
    write(List),
    write(Length).

path(Source, Destine, Length, List) :-
    Source == Destine, 
    Length is 0, !.

path(Source, Destine, Length, List) :-
    edge(Source, Destine, L),
    Length is L, !.

path(Source, Destine, Length, List) :-
    findall([X, Len], edge(Source, X, Len), List),
    min(List, Next, Short),
    path(Next, Destine, Length0, List),
    Length is Length0 + Short.

min([[X, Y]], X, Y) :- !.

min([[X1, Y1], [X2, Y2]|Xs], Next, Short) :-
    ( Y1 > Y2 ->
        min([[X2, Y2]|Xs], Next, Short)
    ;
        min([[X1, Y1]|Xs], Next, Short)
    ).
