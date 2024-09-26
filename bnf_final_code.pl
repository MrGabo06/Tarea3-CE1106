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
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,hacer), actividad(Interm,Resto,_),!.

% (tener y sinonimos) - condicion
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,tener), condicion(Interm,Resto,_),!.

% (estar) - con - condicion
predicado(Completa,Resto,_,Cantidad,Pronombre):- verbo(Completa,Interm,Cantidad,Pronombre,dep,estar), es_palabra(con, Interm, Interm1), condicion(Interm1,Resto,_),!.

% gustaria - articulo - sustantivo
predicado(Completa,Resto,_,Cantidad,_):- verbo(Completa,Interm,Cantidad,me,superdep,agradarFuturo),articulo(Interm,Interm1,Genero,Cantidad,np,indef),sustantivo(Interm1,Resto,Genero,Cantidad,np),!.


% Palabras conocidas
% Articulos:
% ([Articulo|Resto],Resto,Genero(masculino/femenino),Cantidad(plural/singular),Pronombre(np),Definicion(def/indef))
articulo([un|Resto],Resto,masculino,singular,np,indef).
articulo([una|Resto],Resto,femenino,singular,np,indef).

% Sustantivos
% ([Sustantivo|Resto],Resto,Genero(masculino/femenino),Cantidad(plural/singular),Pronombre(np))
sustantivo([ejercicio, Resto],Resto, masculino,singular,np).

% Persona
% ([Pronombre|Resto],Resto,Genero(masculino/femenino),Cantidad(plural/singular),Pronombre)
persona([yo|Resto],Resto,masculino,singular,yo).
persona([me|Resto],Resto,masculino,singular,me).

% Adjetivos
% ([Adjetivo|Resto],Resto,Genero(masculino/femenino),Cantidad(plural/singular),Pronombre(np))
adjetivo([intenso|Resto],Resto,masculino,singular,np).

% Verbos
% ([Verbo|Resto],Resto,Cantidad(plural/singular),Pronombre,Dependencia,Familia)
verbo([hago|Resto],Resto,singular,yo,dep,hacer).
verbo([practico|Resto],Resto,singular,yo,dep,hacer).
verbo([corro|Resto],Resto,singular,yo,indep,accionPresente).
verbo([entreno|Resto],Resto,singular,yo,indep,accionPresente).
verbo([tengo|Resto],Resto,singular,yo,dep,tener).
verbo([estoy|Resto],Resto,singular,yo,dep,estar).
verbo([gustaria|Resto],Resto,singular,me,superdep,agradarFuturo).

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
