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
% Oracion que se divide en un pronombre y un predicado
oracion(Completa,Resto):- persona(Completa,Interm,_,Cantidad,Pronombre),predicado(Interm,Resto,_,Cantidad,Pronombre),!.

% Oracion que se divide en un me y un predicado condicional (ej: me gusta/gustaria...)
oracion(Completa,Resto):- es_palabra(me,Completa,Interm),predicado(Interm,Resto,_,_,me),!.

% Oracion con pronombre (yo) implicito
oracion(Completa,Resto):- predicado(Completa,Resto,_,singular,yo),!.

% Oraciones con saludo simple
oracion(Completa,Resto):- saludo(Completa,Interm),es_palabra(nutritec,Interm,Resto),!.

% Estructuras de predicados
% Predicados de un sólo verbo independiente
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Resto,Cantidad,Pronombre,indep,_),!.

% Predicados de verbos dependientes
% (hacer y sinonimos) - actividad
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,hacerActual),actividad(Interm,Resto,_),!.

% (tener y sinonimos) - condicion
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,tenerPresente),condicion(Interm,Resto,_),!.

% (estar) - con - condicion
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,estarPresente),es_palabra(con,Interm,Interm1),condicion(Interm1,Resto,_),!.

% gustaria - articulo - sustantivo
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,agradarFuturo),articulo(Interm,Interm1,Genero,Cantidad,np,indef),sustantivo(Interm1,Resto,Genero,Cantidad,np),!.

% gustaria - hacer - actividad
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,agradarFuturo),verbo(Interm,Interm1,singular,me,dep,hacerPresente),actividad(Interm1,Resto,_),!.

% gusta/n - articulo - sustantivo
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,agradarPresente),articulo(Interm,Interm1,Genero,Cantidad,np,def),sustantivo(Interm1,Resto,Genero,Cantidad,np),!.

% gusta - hacer - actividad
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,agradarPresente),verbo(Interm,Interm1,singular,me,dep,hacerPresente),actividad(Interm1,Resto,_),!.

% deseo - articulo - sustantivo
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,agradarPresente),articulo(Interm,Interm1,Genero,Cantidad,np,indef),sustantivo(Interm1,Resto,Genero,Cantidad,np),!.

% gustaria - llevar - un - estilo de vida saludable
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,agradarFuturo),verbo(Interm,Interm1,Cantidad,Pronombre,dep,llevarPresente),articulo(Interm1,Interm2,Genero,Cantidad,np,indef),sustantivo(Interm2,Interm3,Genero,Cantidad,np,svp),adjetivo(Interm3,Resto,Genero,Cantidad,np),!.

% deseo (y sinonimos) - llevar - un - estilo de vida - saludable
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,quererPresentePP),verbo(Interm,Interm1,Cantidad,Pronombre,dep,llevarPresente),articulo(Interm1,Interm2,Genero,Cantidad,np,indef),sustantivo(Interm2,Interm3,Genero,Cantidad,np,svp),adjetivo(Interm3,Resto,Genero,Cantidad,np),!.

% han - diagnosticado - condicion
predicado(Completa,Resto,_,Cantidad,Pronombre):- es_palabra(han,Completa,Interm),verbo(Interm,Interm1,Cantidad,Pronombre,dep,diagnosticarPasado),condicion(Interm1,Resto,_),!.

% habia - pensado - articulo - sustantivo
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,haberPasadoS),verbo(Interm,Interm1,Cantidad,Pronombre,dep,pensarPasado),articulo(Interm1,Interm2,Genero,CantidadS,np,indef),sustantivo(Interm2,Resto,Genero,CantidadS,np),!.

% habia - pensado - unas - n - calorias
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,haberPasadoS),verbo(Interm,Interm1,Cantidad,Pronombre,dep,pensarPasado),articulo(Interm1,Interm2,femenino,CantidadS,np,indef),sustantivo(Interm2,Resto,femenino,CantidadS,np,rn),!.

% diagnosticaron - condicion
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,diagnosticarPasado),condicion(Interm,Resto,_),!.

% fui - diagnosticado - con - condicion
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,serPasado),verbo(Interm,Interm1,Cantidad,Pronombre,dep,diagnosticarPasado),es_palabra(con,Interm1,Interm2),condicion(Interm2,Resto,_),!.

% Palabras conocidas
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
sustantivo([estilo,de,vida|Resto],Resto,masculino,singular,np,svp).
sustantivo([Numero,calorias|Resto],Resto,femenino,plural,np,rn):-number(Numero).

% Persona
% ([Pronombre|Resto],Resto,Genero(masculino/femenino),Cantidad(plural/singular),Pronombre)
persona([yo|Resto],Resto,masculino,singular,yo).
persona([me|Resto],Resto,masculino,singular,me).

% Adjetivos
% ([Adjetivo|Resto],Resto,Genero(masculino/femenino),Cantidad(plural/singular),Pronombre(np))
adjetivo([intenso|Resto],Resto,masculino,singular,np).
adjetivo([saludable|Resto],Resto,masculino,singular,np).

% Verbos
% ([Verbo|Resto],Resto,Cantidad(plural/singular),Pronombre,Dependencia,Familia)
verbo([hago|Resto],Resto,singular,yo,dep,hacerActual).
verbo([hacer|Resto],Resto,singular,me,dep,hacerPresente).
verbo([practico|Resto],Resto,singular,yo,dep,hacerPresente).
verbo([corro|Resto],Resto,singular,yo,indep,accionPresente).
verbo([entreno|Resto],Resto,singular,yo,indep,accionPresente).
verbo([tengo|Resto],Resto,singular,yo,dep,tenerPresente).
verbo([estoy|Resto],Resto,singular,yo,dep,estarPresente).
verbo([gustaria|Resto],Resto,singular,me,superdep,agradarFuturo).
verbo([gustarian|Resto],Resto,plural,me,superdep,agradarFuturo).
verbo([gusta|Resto],Resto,singular,me,dep,agradarPresente).
verbo([gustan|Resto],Resto,plural,me,dep,agradarPresente).
verbo([deseo|Resto],Resto,singular,yo,dep,agradarPresente).
verbo([diagnosticado|Resto],Resto,singular,me,dep,diagnosticarPasado).
verbo([diagnosticaron|Resto],Resto,singular,me,dep,diagnosticarPasado).
verbo([diagnosticado|Resto],Resto,singular,yo,dep,diagnosticarPasado).
verbo([fui|Resto],Resto,singular,yo,dep,serPasado).
verbo([llevar|Resto],Resto,singular,me,dep,llevarPresente).
verbo([llevar|Resto],Resto,singular,yo,dep,llevarPresente).
verbo([quiero|Resto],Resto,singular,yo,superdep,quererPresentePP).
verbo([deseo|Resto],Resto,singular,yo,superdep,quererPresentePP).
verbo([habia|Resto],Resto,singular,yo,superdep,haberPasadoS).
verbo([pensado|Resto],Resto,singular,yo,dep,pensarPasado).




% Actividades
% ([Actividad|Resto],Resto,Genero)
actividad([atletismo|Resto],Resto,masculino).
actividad([ejercicio|Resto],Resto,masculino).

% Condiciones
% ([Condicion|Resto],Resto,Genero)
condicion([diabetes|Resto],Resto,femenino).

% Saludo
% ([Saludo|Resto],Resto)
saludo([hola|Resto],Resto).
saludo([saludos|Resto],Resto).


% Funcion para que la lista que se le envie al BNF sea compuesta por atomos unicamente
string_a_atom([],[]).
string_a_atom([H|T],[AtomH|AtomT]):- atom_string(AtomH,H),string_a_atom(T,AtomT).

% Funcion para leer entradas del cliente por la linea de comandos
leer:- read_line_to_string(user_input,Oracion),procesar_cadena(Oracion,OracionListaStrings),string_a_atom(OracionListaStrings,OracionLista),nl,verifica(OracionLista).

