% consult('bnf_final_code.pl').
% Importar las bibliotecas necesarias
:- use_module(library(pcre)).
:- use_module(library(lists)).

% Funcion principal que recibe la cadena y devuelve la lista de palabras (y números)
procesar_cadena(Cadena,ResultadoProcesado):- string_lower(Cadena,CadenaMinuscula),remover_tildes(CadenaMinuscula,CadenaSinTildes),remover_puntuacion(CadenaSinTildes,CadenaLimpia),split_string(CadenaLimpia," ","",Lista),maplist(convertir_a_numero_si_es_posible,Lista,ResultadoProcesado).

% Funcion que remueve tildes de las vocales usando expresiones regulares (pcre)
remover_tildes(Cadena,Resultado):-
    re_replace("á"/g,"a",Cadena,Temp1),
    re_replace("é"/g,"e",Temp1,Temp2),
    re_replace("í"/g,"i",Temp2,Temp3),
    re_replace("ó"/g,"o",Temp3,Temp4),
    re_replace("ú"/g,"u",Temp4,Resultado).

% Funcion que remueve signos de puntuación y símbolos de la cadena
remover_puntuacion(Cadena,Resultado):-
    re_replace("[!¡?¿,\\.\\-;:()\"\'\\[\\]]"/g,"",Cadena,Resultado).

% Funcion que convierte una cadena en número si es posible
convertir_a_numero_si_es_posible(Cadena,Numero):- number_string(Numero,Cadena),!.
convertir_a_numero_si_es_posible(Cadena,Cadena).

% Hecho auxiliar para buscar palabras específicas
es_palabra(Palabra,[Palabra|Resto],Resto).

% Funcion para verificar una oracion
verifica(Oracion):- oracion(Oracion,[]).

% Estructuras de oraciones
% Oracion que se divide en un pronombre (yo) y un predicado
oracion(Completa,Resto):- persona(Completa,Interm,_,Cantidad,Pronombre),predicado(Interm,Resto,_,Cantidad,Pronombre),!.

% Oracion que se divide en un me y un predicado condicional (ej: me gusta/gustaria...)
oracion(Completa,Resto):- es_palabra(me,Completa,Interm),predicado(Interm,Resto,_,_,me),!.

% Oracion con pronombre (yo) implicito
oracion(Completa,Resto):- predicado(Completa,Resto,_,singular,yo),!.

% oracion compuesta por solo un numero
oracion(Completa,Resto):- sustantivo(Completa,Resto,masculino,singular,np),!.

% Oracion con saludo simple
oracion(Completa,Resto):- saludo(Completa,Interm),es_palabra(nutritec,Interm,Resto),!.
oracion(Completa,Resto):- saludo(Completa,Interm),es_palabra(nutritec,Interm,Interm1),oracion(Interm1,Resto),!.

% Oracion de agradecimiento
oracion(Completa,Resto):- agradecimiento(Completa,Interm,_),es_palabra(nutritec,Interm,Resto),!.
oracion(Completa,Resto):- agradecimiento(Completa,Resto,_),!.
oracion(Completa,Resto):- agradecimiento(Completa,Interm,_),es_palabra(nutritec,Interm,Interm1),oracion(Interm1,Resto),!.
oracion(Completa,Resto):- agradecimiento(Completa,Interm,_),oracion(Interm,Resto),!.

% Estructuras de predicados
% Predicados de un sólo verbo independiente
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Resto,Cantidad,Pronombre,indep,_),!.

% (hacer y sinonimos) - actividad
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,hacerPresentePP),actividad(Interm,Resto,_),!.

% (actividad presente primera persona) - n - veces a la semana - (opcional) - m - horas - por - semana
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,indep,actividadPresentePP),sustantivo(Interm,Resto,_,_,np,nv),!.

predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,indep,actividadPresentePP),sustantivo(Interm,Interm1,_,_,np,nv),sustantivo(Interm1,Resto,_,_,np,nh),!.

% (tener y sinonimos) - articulo - sustantivo / condicion
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,tenerPresente),articulo(Interm,Interm1,GeneroS,CantidadS,np,indef),sustantivo(Interm1,Resto,GeneroS,CantidadS,np).

predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,tenerPresente),sustantivo(Interm,Resto,_,_,np).

predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,tenerPresente),condicion(Interm,Resto,_),!.

% (estar) - con - condicion
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,estarPresente),es_palabra(con,Interm,Interm1),condicion(Interm1,Resto,_),!.

% gustaria - articulo - sustantivo
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,agradarFuturo),articulo(Interm,Interm1,Genero,Cantidad,np,indef),sustantivo(Interm1,Resto,Genero,Cantidad,np),!.

predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,agradarFuturo),articulo(Interm,Interm1,Genero,Cantidad,np,indef),sustantivo(Interm1,Interm2,Genero,Cantidad,np),adjetivo(Interm2,Resto,Genero,Cantidad,np),!.

%gustaria - realizar - articulo - sustantivo - adjetivo
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,agradarFuturo),verbo(Interm,Interm1,Cantidad,Pronombre,dep,realizarPresente),articulo(Interm1,Interm2,Genero1,Cantidad,np,indef),sustantivo(Interm2,Interm3,Genero1,Cantidad,np),adjetivo(Interm3,Resto,Genero1,Cantidad,np),!.

% gustaria - hacer - actividad
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,agradarFuturo),verbo(Interm,Interm1,singular,me,dep,hacerPresente),actividad(Interm1,Resto,_),!.

% gusta/n - articulo - sustantivo
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,agradarPresente),articulo(Interm,Interm1,Genero,Cantidad,np,def),sustantivo(Interm1,Resto,Genero,Cantidad,np),!.

% gusta - hacer - actividad
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,agradarPresente),verbo(Interm,Interm1,singular,me,dep,hacerPresente),actividad(Interm1,Resto,_),!.

% yo - hago - actividad - n - veces - a - la - semana
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,hacerPresentePP),actividad(Interm,Interm1,_),sustantivo(Interm1,Resto,_,_,np,nv),!.

% yo - hago - actividad - n - veces - a - la - semana - n horas
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,hacerPresentePP),actividad(Interm,Interm1,_),sustantivo(Interm1,Interm2,_,_,np,nv),sustantivo(Interm2,Resto,_,_,np,nh),!.

% deseo - articulo - sustantivo
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,quererPresentePP),articulo(Interm,Interm1,GeneroS,CantidadS,np,indef),sustantivo(Interm1,Resto,GeneroS,CantidadS,np),!.

predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,quererPresentePP),articulo(Interm,Interm1,GeneroS,CantidadS,np,indef),sustantivo(Interm1,Interm2,GeneroS,CantidadS,np),adjetivo(Interm2,Resto,GeneroS,CantidadS,np),!.

% gustaria - llevar - un - estilo de vida saludable
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,agradarFuturo),verbo(Interm,Interm1,Cantidad,Pronombre,dep,llevarPresente),articulo(Interm1,Interm2,GeneroV,Cantidad,np,indef),sustantivo(Interm2,Interm3,GeneroV,Cantidad,np,svp),adjetivo(Interm3,Resto,GeneroV,Cantidad,np),!.

% deseo (y sinonimos) - llevar - un - estilo de vida - saludable
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,quererPresentePP),verbo(Interm,Interm1,Cantidad,Pronombre,dep,llevarPresente),articulo(Interm1,Interm2,GeneroV,Cantidad,np,indef),sustantivo(Interm2,Interm3,GeneroV,Cantidad,np,svp),adjetivo(Interm3,Resto,GeneroV,Cantidad,np),!.

% han - diagnosticado - condicion
predicado(Completa,Resto,_,Cantidad,Pronombre):- es_palabra(han,Completa,Interm),verbo(Interm,Interm1,Cantidad,Pronombre,dep,diagnosticarPasado),condicion(Interm1,Resto,_),!.

% habia - pensado - articulo - sustantivo
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,haberPasadoS),verbo(Interm,Interm1,Cantidad,Pronombre,dep,pensarPasado),articulo(Interm1,Interm2,Genero,CantidadS,np,indef),sustantivo(Interm2,Resto,Genero,CantidadS,np),!.

predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,haberPasadoS),verbo(Interm,Interm1,Cantidad,Pronombre,dep,pensarPasado),articulo(Interm1,Interm2,Genero,CantidadS,np,indef),sustantivo(Interm2,Interm3,Genero,CantidadS,np),adjetivo(Interm3,Resto,Genero,CantidadS,np),!.

% habia - pensado - unas - n - calorias
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,haberPasadoS),verbo(Interm,Interm1,Cantidad,Pronombre,dep,pensarPasado),articulo(Interm1,Interm2,femenino,CantidadS,np,indef),sustantivo(Interm2,Resto,femenino,CantidadS,np,rn),!.

% diagnosticaron - condicion
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,diagnosticarPasado),condicion(Interm,Resto,_),!.

% fui - diagnosticado - con - condicion
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,serPasado),verbo(Interm,Interm1,Cantidad,Pronombre,dep,diagnosticarPasado),es_palabra(con,Interm1,Interm2),condicion(Interm2,Resto,_),!.

% Palabras conocidas

% Aceptacion/negacion:
acept_neg([si|Resto],Resto).
acept_neg([no|Resto],Resto).
acept_neg([''|Resto],Resto).

% Articulos:
% ([Articulo|Resto],Resto,Genero(masculino/femenino),Cantidad(plural/singular),Pronombre(np),Definicion(def/indef))
articulo([un|Resto],Resto,masculino,singular,np,indef).
articulo([una|Resto],Resto,femenino,singular,np,indef).
articulo([unas|Resto],Resto,femenino,plural,np,indef).
articulo([unos|Resto],Resto,masculino,plural,np,indef).
articulo([el|Resto],Resto,masculino,singular,np,def).
articulo([la|Resto],Resto,femenino,singular,np,def).
articulo([los|Resto],Resto,masculino,plural,np,def).
articulo([las|Resto],Resto,femenino,plural,np,def).


% Sustantivos
% ([Sustantivo|Resto],Resto,Genero(masculino/femenino),Cantidad(plural/singular),Pronombre(np))
sustantivo([ejercicio|Resto],Resto,masculino,singular,np).
sustantivo([dieta|Resto],Resto,femenino,singular,np).
sustantivo([mariscos|Resto],Resto,masculino,plural,np).
sustantivo([semillas|Resto],Resto,femenino,plural,np).
sustantivo([Numero|Resto],Resto,masculino,singular,np):-number(Numero).
sustantivo([vida|Resto],Resto,femenino,singular,np,vid).
sustantivo([estilo,de,vida|Resto],Resto,masculino,singular,np,svp).
sustantivo([Numero,calorias|Resto],Resto,femenino,plural,np,rn):-number(Numero).
sustantivo([Numero,veces,a,la,semana|Resto],Resto,masculino,plural,np,nv):-number(Numero),Numero\==1.
sustantivo([Numero,vez,a,la,semana|Resto],Resto,masculino,plural,np,nv):-number(Numero),Numero==1.
sustantivo([Numero,horas|Resto],Resto,masculino,plural,np,nh):-number(Numero),Numero\==1.
sustantivo([Numero,hora|Resto],Resto,masculino,plural,np,nh):-number(Numero),Numero==1.
sustantivo([dislipidemia|Resto],Resto,femenino,singular,np).
sustantivo([peso|Resto],Resto,masculino,singular,np).
sustantivo([sobrepeso|Resto],Resto,masculino,singular,np).
sustantivo([calorias|Resto],Resto,femenino,plural,np).
sustantivo([ciclismo|Resto],Resto,masculino,singular,np).
sustantivo([desnutricion|Resto],Resto,femenino,singular,np).
sustantivo([vegetales|Resto],Resto,masculino,plural,np).
sustantivo([lentejas|Resto],Resto,femenino,plural,np).
sustantivo([gallo,pinto|Resto],Resto,masculino,singular,np).
sustantivo([pollo|Resto],Resto,masculino,singular,np).
sustantivo([pescado|Resto],Resto,masculino,singular,np).
sustantivo([bistec|Resto],Resto,masculino,singular,np).
sustantivo([verduras|Resto],Resto,femenino,plural,np).
sustantivo([fruta|Resto],Resto,femenino,singular,np).
sustantivo([papaya|Resto],Resto,femenino,singular,np).
sustantivo([yogurt|Resto],Resto,masculino,singular,np).
sustantivo([granola|Resto],Resto,femenino,singular,np).
sustantivo([cafe|Resto],Resto,masculino,singular,np).
sustantivo([aguacate|Resto],Resto,masculino,singular,np).


% Persona
% ([Pronombre|Resto],Resto,Genero(masculino/femenino),Cantidad(plural/singular),Pronombre)
persona([yo|Resto],Resto,masculino,singular,yo).
persona([me|Resto],Resto,masculino,singular,me).

% Adjetivos
% ([Adjetivo|Resto],Resto,Genero(masculino/femenino),Cantidad(plural/singular),Pronombre(np))
adjetivo([intenso|Resto],Resto,masculino,singular,np).
adjetivo([saludable|Resto],Resto,masculino,singular,np).
adjetivo([saludable|Resto],Resto,femenino,singular,np).
adjetivo([keto|Resto],Resto,femenino,singular,np).
adjetivo([proteica|Resto],Resto,femenino,singular,np).
adjetivo([vegetariana|Resto],Resto,femenino,singular,np).
adjetivo([alcalina|Resto],Resto,femenino,singular,np).
adjetivo([baja,en,grasas|Resto],Resto,femenino,singular,np).
adjetivo([vegana|Resto],Resto,femenino,singular,np).
adjetivo([mediterranea|Resto],Resto,femenino,singular,np).
adjetivo([carnivora|Resto],Resto,femenino,singular,np).
adjetivo([gluten,free|Resto],Resto,femenino,singular,np).
adjetivo([paleo|Resto],Resto,femenino,singular,np).
adjetivo([sobrepeso|Resto],Resto,masculino,singular,np).
adjetivo([normal|Resto],Resto,masculino,singular,np).
adjetivo([keto|Resto],Resto,masculino,singular,np).
adjetivo([vegetariano|Resto],Resto,masculino,singular,np).
adjetivo([bajo,en,grasas|Resto],Resto,masculino,singular,np).
adjetivo([mediterraneo|Resto],Resto,masculino,singular,np).




% Verbos
% ([Verbo|Resto],Resto,Cantidad(plural/singular),Pronombre,Dependencia,Familia)
verbo([hago|Resto],Resto,singular,yo,dep,hacerPresentePP).
verbo([hacer|Resto],Resto,singular,me,dep,hacerPresente).
verbo([practico|Resto],Resto,singular,yo,dep,hacerPresentePP).
verbo([corro|Resto],Resto,singular,yo,indep,actividadPresentePP).
verbo([entreno|Resto],Resto,singular,yo,indep,actividadPresentePP).
verbo([nado|Resto],Resto,singular,yo,indep,actividadPresentePP).
verbo([tengo|Resto],Resto,singular,yo,dep,tenerPresente).
verbo([estoy|Resto],Resto,singular,yo,dep,estarPresente).
verbo([gustaria|Resto],Resto,singular,me,superdep,agradarFuturo).
verbo([gustarian|Resto],Resto,plural,me,superdep,agradarFuturo).
verbo([gusta|Resto],Resto,singular,me,dep,agradarPresente).
verbo([gustan|Resto],Resto,plural,me,dep,agradarPresente).
verbo([deseo|Resto],Resto,singular,yo,dep,quererPresentePP).
verbo([diagnosticado|Resto],Resto,singular,me,dep,diagnosticarPasado).
verbo([diagnosticaron|Resto],Resto,singular,me,dep,diagnosticarPasado).
verbo([diagnosticado|Resto],Resto,singular,yo,dep,diagnosticarPasado).
verbo([fui|Resto],Resto,singular,yo,dep,serPasado).
verbo([llevar|Resto],Resto,singular,me,dep,llevarPresente).
verbo([llevar|Resto],Resto,singular,yo,dep,llevarPresente).
verbo([quiero|Resto],Resto,singular,yo,superdep,quererPresentePP).
verbo([quiero|Resto],Resto,singular,yo,dep,quererPresentePP).
verbo([deseo|Resto],Resto,singular,yo,superdep,quererPresentePP).
verbo([habia|Resto],Resto,singular,yo,superdep,haberPasadoS).
verbo([pensado|Resto],Resto,singular,yo,dep,pensarPasado).
verbo([realizar|Resto],Resto,singular,me,dep,realizarPresente).
verbo([realizo|Resto],Resto,singular,yo,indep,actividadPresentePP).
verbo([practico|Resto],Resto,singular,yo,indep,actividadPresentePP).
verbo([correria|Resto],Resto,singular,yo,indep,actividadCondicionalPP).
verbo([pienso|Resto],Resto,singular,yo,dep,pensarPresente).
verbo([deseo|Resto],Resto,singular,yo,superdep,quererPresentePP).


% Agradecimientos
agradecimiento([gracias|Resto],Resto,femenino).
agradecimiento([muchas,gracias|Resto],Resto,femenino).
agradecimiento([te,agradezco|Resto],Resto,masculino).
agradecimiento([te,agradezco,mucho|Resto],Resto,masculino).
agradecimiento([pura,vida|Resto],Resto,masculino).

% Actividades
% ([Actividad|Resto],Resto,Genero)
actividad([atletismo|Resto],Resto,masculino).
actividad([ejercicio|Resto],Resto,masculino).
actividad([natacion|Resto],Resto,masculino).

% Condiciones
% ([Condicion|Resto],Resto,Genero)
condicion([diabetes|Resto],Resto,femenino).

% Saludo
% ([Saludo|Resto],Resto)
saludo([hola|Resto],Resto).
saludo([saludos|Resto],Resto).
saludo([buenas,tardes|Resto],Resto).
saludo([buenos,dias|Resto],Resto).


% Funcion para que la lista que se le envie al BNF sea compuesta por atomos unicamente
string_a_atom([],[]).
string_a_atom([H|T],[AtomH|AtomT]):- (number(H) -> AtomH = H ; atom_string(AtomH,H)),string_a_atom(T,AtomT).

% Funcion para leer entradas del cliente por la linea de comandos
leer:- read_line_to_string(user_input,Oracion),procesar_cadena(Oracion,OracionListaStrings),string_a_atom(OracionListaStrings,OracionLista),verifica(OracionLista).

