existe(M, S, X, C) :-
   write('Bolo '), 
   write(M), 
   write(' de '), 
   write(S),
   write(' com recheio de '), 
   write(X), 
   write(' e cobertura de '), 
   write(C).

existe(M, S, X, C) :-
   M = nao_existe ; S = nao_existe;  X = nao_existe;  C = nao_existe, 
   write('Não foi possivel achar um bolo ideal para você dentro do nosso catálogo'), nl, nl,
   write('Deseja tentar novamente? (sim/nao)'), nl,
   read(O), nl,
   opcao(O).

opcao(O) :-
	O = sim,
	main.

opcao(O) :-
	O = nao.

% Regras
sabor(S) :-
   write('Qual caracteristica de recheio você prefere? '), nl, nl,
   write('frutado: com alguma fruta como seu principal componente'), nl,
   write('classicos: os recheios mais tradicionais e queridos pelos brasileiros'), nl,
   write('nozes_castanhas: utiliza de alguma noz em sua composição'), nl,
   write('internacionais: recheios queridinhos pelos extrangeiros, mesmo que não muito consumidos no nosso país'), nl,
   read(Resposta), nl,
   Resposta = S.

der_leite(Dl) :-
   write('Pode haver derivados do leite? (sim, nao)'),
   read(Resposta), nl, 
   Resposta = Dl.

tipo(frutado, T) :-
   write('Qual tipo de recheio você prefere?'), nl,
   write('Essas são as nossas ofertas:'), nl,   
   write('morango, abacaxi, limão, laranja, frutas_vermelhas, maracuja, ameixa'), nl,
   read(Resposta), nl,
   Resposta = T.

tipo(classicos, T) :-
   write('Qual tipo de recheio você prefere?'), nl,
   write('Essas são as nossas ofertas:'), nl,   
   write('brigadeiro, mousse, doce de leite'), nl,
   read(Resposta), nl,
   Resposta = T.

tipo(nozes_castanhas, T) :-
   write('Qual tipo de recheio você prefere?'), nl,
   write('Essas são as nossas ofertas:'), nl,   
   write('avelã, nozes, amendoas, pistache'), nl,
   read(Resposta), nl,
   Resposta = T.

tipo(internacional, T) :-
   write('Qual tipo de recheio você prefere?'), nl,
   write('Essas são as nossas ofertas:'), nl,   
   write('buttercream, mascarpone, cream chesse'), nl,
   read(Resposta), nl,
   Resposta = T.

% Base de conhecimento 
recheio(morango, frutado, _, citrico).
recheio(maracuja, frutado, _, adocicado).
recheio(limao, frutado, _, citrico).
recheio(abacaxi, frutado, _, doce_citrico).
recheio(laranja, frutado, _, adocicado).
recheio(frutas_vermelhas, frutado, _, citrico).
recheio(ameixa, frutado, _, amargo).

recheio(brigadeiro, classicos, sim, adocicado). 
recheio(mouse, classicos, sim, aveludado). 
recheio(doce_de_leite, classicos, sim, caramelizado).
recheio(quatro_leites, classicos, sim, cremoso).
recheio(coco_queimado, classicos, sim, cremoso).

recheio(pistache, nozes_castanhas, _, crocante). 
recheio(avelã, nozes_castanhas, _, creme_avela_pedaçudo). 
recheio(nozes, nozes_castanhas, sim, cremoso).    
recheio(amendoas, nozes_castanhas, _, laminado).

recheio(buttercream, internacional, sim, amanteigado).
recheio(mascarpone, internacional, sim, queijo_cremoso).
recheio(cream_chesse, internacional, sim, queijo_acucarado).
recheio(pasta_de_amendoim, internacional, nao, pacoca).

recheio(nao_existe, _, _, _).


massa(cremoso, amanteigada, estruturada).
massa(espumosos, aerada, clara_em_neve).
massa(adicao, caseira, liquidos_secos).
massa(_, nao_existe, _).

saborMassa(baunilha).
saborMassa(laranja).
saborMassa(chocolate).
saborMassa(red_velvet).
saborMassa(nao_existe).

cobertura(ganache).
cobertura(pasta_americana).
cobertura(naked).
cobertura(chantininho).
cobertura(buttercream).
cobertura(nao_existe).

% Predicado principal
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
   

rech(X) :-
   sabor(W),
   der_leite(Y),
   tipo(W, X),
   recheio(X, W, Y, _).

cob(C) :-
   write('Qual tipo de cobertura / decoração você prefere?'), nl,
   write('As alternativas no nosso cardapio são:'), nl,   
   write('ganache, pasta_americana, naked, chantininho ou buttercream'), nl,
   read(C), nl, nl,
   cobertura(C).

main :- 
   write('Venha encontrar o bolo ideal para o seu aniversário'), nl,
   write('Você nunca mais vai ter duvida do que escolher'), nl, nl,
   mas(M, S),
   rech(X),    
   cob(C),
   existe(M, S, X, C).
    
