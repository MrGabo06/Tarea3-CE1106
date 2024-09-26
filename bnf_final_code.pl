% Hecho auxiliar para buscar palabras específicas
es_palabra(Palabra, [Palabra|Resto], Resto).

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
oracion(Completa,Resto):- saludo(Completa,Interm), es_palabra(nutritec,Interm,Resto),!.

% Estructuras de predicados
% Predicados de un sólo verbo independiente
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Resto,Cantidad,Pronombre,indep,_),!.

% Predicados de verbos dependientes
% (hacer y sinonimos) - actividad
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,hacerActual), actividad(Interm,Resto,_),!.

% (tener y sinonimos) - condicion
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,tenerPresente), condicion(Interm,Resto,_),!.

% (estar) - con - condicion
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,estarPresente), es_palabra(con, Interm, Interm1), condicion(Interm1,Resto,_),!.

% gustaria - articulo - sustantivo
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,agradarFuturo),articulo(Interm,Interm1,Genero,Cantidad,np,indef),sustantivo(Interm1,Resto,Genero,Cantidad,np),!.

% gustaria - hacer - actividad
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,superdep,agradarFuturo),verbo(Interm,Interm1,singular,me,dep,hacerPresente),actividad(Interm1,Resto,_),!.

% gusta - articulo - sustantivo
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,agradarPresente),articulo(Interm,Interm1,Genero,Cantidad,np,def),sustantivo(Interm1,Resto,Genero,Cantidad,np),!.

% gusta - hacer - actividad
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,agradarPresente),verbo(Interm,Interm1,singular,me,dep,hacerPresente),actividad(Interm1,Resto,_),!.

% deseo - articulo - sustantivo
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,agradarPresente),articulo(Interm,Interm1,Genero,Cantidad,np,indef),sustantivo(Interm1,Resto,Genero,Cantidad,np),!.

% han - diagnosticado - condicion
predicado(Completa,Resto,_,Cantidad,Pronombre):- es_palabra(han,Completa,Interm), verbo(Interm,Interm1,Cantidad,Pronombre,dep,diagnosticarPasado),condicion(Interm1,Resto,_),!.

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
sustantivo([ejercicio|Resto],Resto, masculino,singular,np).
sustantivo([dieta|Resto],Resto,femenino,singular,np).
sustantivo([mariscos|Resto],Resto, masculino,plural,np).
sustantivo([semillas|Resto],Resto,femenino,plural,np).

% Persona
% ([Pronombre|Resto],Resto,Genero(masculino/femenino),Cantidad(plural/singular),Pronombre)
persona([yo|Resto],Resto,masculino,singular,yo).
persona([me|Resto],Resto,masculino,singular,me).

% Adjetivos
% ([Adjetivo|Resto],Resto,Genero(masculino/femenino),Cantidad(plural/singular),Pronombre(np))
adjetivo([intenso|Resto],Resto,masculino,singular,np).

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

