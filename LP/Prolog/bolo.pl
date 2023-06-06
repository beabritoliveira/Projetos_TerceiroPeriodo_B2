% A frase final que aparecerá quando o usuário preencher com todas as informações
existe(M, S, X, C) :-
   write('Bolo '), 
   write(M), 
   write(' de '), 
   write(S),
   write(' com recheio de '), 
   write(X), 
   write(' e cobertura de '), 
   write(C).

% A frase que ocorrerá caso o usuário preencha com informações não presentes no catálogo, permitindo-o tentar preencher novamente caso ocorra.
existe(M, S, X, C) :-
   M = nao_existe ; S = nao_existe;  X = nao_existe;  C = nao_existe, 
   write('Não foi possivel achar um bolo ideal para você dentro do nosso catálogo'), nl, nl,
   write('Deseja tentar novamente? (sim/nao)'), nl,
   read(O), nl,
   opcao(O).

% Caso o usuário queira repreencher as informações, o main é chamado, permitindo preencher novamente.
opcao(O) :-
	O = sim,
	main.

% Caso não queira, o programa é encerrado.
opcao(O) :-
	O = nao.

% Regras
% Esta é a primeira informação chamada para o preenchimento de "rech()"
sabor(S) :-
   write('Qual caracteristica de recheio você prefere? '), nl, nl,
   write('frutado: com alguma fruta como seu principal componente'), nl,
   write('classicos: os recheios mais tradicionais e queridos pelos brasileiros'), nl,
   write('nozes_castanhas: utiliza de alguma noz em sua composição'), nl,
   write('internacionais: recheios queridinhos pelos extrangeiros, mesmo que não muito consumidos no nosso país'), nl,
   read(Resposta), nl,
   Resposta = S.

% Esta é a segunda informação chamada para o preenchimento de "rech()"
der_leite(Dl) :-
   write('Pode haver derivados do leite? (sim, nao)'),
   read(Resposta), nl, 
   Resposta = Dl.

% Estas são as terceiras informações chamadas para o preenchimento de "rech()", elas são baseadas na opção selecionada em "sabor" e em "derivados de leite"
% Tipos frutados
tipo(frutado, T, _) :-
   write('Qual tipo de recheio você prefere?'), nl,
   write('Essas são as nossas ofertas:'), nl,   
   write('morango, abacaxi, limão, laranja, frutas_vermelhas, maracuja, ameixa'), nl,
   read(Resposta), nl,
   Resposta = T.

% Tipos classicos que podem ter variados do leite
tipo(classicos, T, sim) :-
   write('Qual tipo de recheio você prefere?'), nl,
   write('Essas são as nossas ofertas:'), nl,   
   write('brigadeiro, mousse, doce de leite, quatro_leites, coco_queimado'), nl,
   read(Resposta), nl,
   Resposta = T.

% Tipos classicos que não podem ter variados do leite
tipo(classicos, T, nao) :-
   write('Qual tipo de recheio você prefere?'), nl,
   write('Essas são as nossas ofertas:'), nl,   
   write('coco_queimado'), nl,
   read(Resposta), nl,
   Resposta = T.

% Tipos nozes_castanhas que podem ter variados do leite
tipo(nozes_castanhas, T, sim) :-
   write('Qual tipo de recheio você prefere?'), nl,
   write('Essas são as nossas ofertas:'), nl,   
   write('avelã, nozes, amendoas, pistache'), nl,
   read(Resposta), nl,
   Resposta = T.

% Tipos nozes_castanhas que não podem ter variados do leite
tipo(nozes_castanhas, T, nao) :-
   write('Qual tipo de recheio você prefere?'), nl,
   write('Essas são as nossas ofertas:'), nl,   
   write('avelã, amendoas, pistache'), nl,
   read(Resposta), nl,
   Resposta = T.

% Tipos internacionais que podem ter variados do leite
tipo(internacional, T, sim) :-
   write('Qual tipo de recheio você prefere?'), nl,
   write('Essas são as nossas ofertas:'), nl,   
   write('buttercream, mascarpone, cream chesse, pasta_de_amendoim'), nl,
   read(Resposta), nl,
   Resposta = T.

% Tipos internacionais que não podem ter variados do leite
tipo(internacional, T, nao) :-
   write('Qual tipo de recheio você prefere?'), nl,
   write('Essas são as nossas ofertas:'), nl,   
   write('pasta_de_amendoim'), nl,
   read(Resposta), nl,
   Resposta = T.

% Base de conhecimento 
% Informações quanto aos recheios
% Recheios frutados
recheio(morango, frutado, _, citrico).
recheio(maracuja, frutado,  _, adocicado).
recheio(limao, frutado, _, citrico).
recheio(abacaxi, frutado, _, doce_citrico).
recheio(laranja, frutado, _, adocicado).
recheio(frutas_vermelhas, frutado, _, citrico).
recheio(ameixa, frutado, _, amargo).

% Recheios classicos
recheio(brigadeiro, classicos, sim, adocicado). 
recheio(mousse, classicos, sim, aveludado). 
recheio(doce_de_leite, classicos, sim, caramelizado).
recheio(quatro_leites, classicos, sim, cremoso).
recheio(coco_queimado, classicos, _, cremoso).

% Recheios nozes_castanhas
recheio(pistache, nozes_castanhas, _, crocante). 
recheio(avelã, nozes_castanhas, _, creme_avela_pedaçudo). 
recheio(nozes, nozes_castanhas, sim, cremoso).    
recheio(amendoas, nozes_castanhas, _, laminado).

% Recheios internacionais
recheio(buttercream, internacional, sim, amanteigado).
recheio(mascarpone, internacional, sim, queijo_cremoso).
recheio(cream_chesse, internacional, sim, queijo_acucarado).
recheio(pasta_de_amendoim, internacional, _, pacoca).

recheio(nao_existe, _, _, _).

% Informações quanto aos tipos de massas
massa(cremoso, amanteigada, estruturada).
massa(espumosos, aerada, clara_em_neve).
massa(adicao, caseira, liquidos_secos).
massa(_, nao_existe, _).

% Informações quanto aos sabores das massas
saborMassa(baunilha).
saborMassa(laranja).
saborMassa(chocolate).
saborMassa(red_velvet).
saborMassa(nao_existe).

% Informações quanto as coberturas
cobertura(ganache).
cobertura(pasta_americana).
cobertura(naked).
cobertura(chantininho).
cobertura(buttercream).
cobertura(nao_existe).


% Predicado principal
% O chamado sobre as massas, é o primeiro a ocorrer
mas(M, S) :- 
   write('Qual tipo de massa você prefere?'), nl,
   write('Essas são as nossas opções:'), nl,   
   write('amanteigada, aerada ou caseira'), nl,
   read(M), nl,nl,
   massa(_, M, _),
    
   write('Qual sabor de massa você prefere?'), nl,
   write('baunilha, laranja, red_velvet, ou chocolate'), nl,
   read(S), nl, nl,
   saborMassa(S).

% O chamado sobre os recheios, por ser maior que os demais, sua chamada é feita em várias partes mais a cima do código.
rech(X) :-
   sabor(W),
   der_leite(Y),
   tipo(W, X, Y),
   recheio(X, W, Y, _).

% O chamado sobre as coberturas, é o terceiro e último a ocorrer
cob(C) :-
   write('Qual tipo de cobertura / decoração você prefere?'), nl,
   write('As alternativas no nosso cardapio são:'), nl,   
   write('ganache, pasta_americana, naked, chantininho ou buttercream'), nl,
   read(C), nl, nl,
   cobertura(C).

% O processo que inicializará o programa
main :- 
   write('Venha encontrar o bolo ideal para o seu aniversário'), nl,
   write('Você nunca mais vai ter duvida do que escolher'), nl, nl,
   mas(M, S),
   rech(X),    
   cob(C),
   existe(M, S, X, C).
    
