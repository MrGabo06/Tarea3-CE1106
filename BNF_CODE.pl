 % Identificadores para pronombres en el sujeto de una oraci�n
pronombre([yo|Resto], Resto).
pronombre([el|Resto], Resto).
pronombre([ella|Resto], Resto).
pronombre([mi|Resto], Resto).
pronombre([nos|Resto], Resto).
pronombre([nosotros|Resto], Resto).
pronombre([ellos|Resto], Resto).

% Extracci�n del sintagma nominal
extraer_sintagma_nominal(Oracion, Resto) :- pronombre(Oracion, Resto).

% Identificadores para verbos en la oraci�n
verbo([tengo|Resto], Resto).
verbo([soy|Resto], Resto).
verbo([estoy|Resto], Resto).
verbo([empezar|Resto], Resto).
verbo([quiero|Resto], Resto).
verbo([hacer|Resto], Resto).
verbo([ir|Resto], Resto).
verbo([deseo|Resto], Resto).
verbo([puedo|Resto], Resto).
verbo([practicar|Resto], Resto).
verbo([gustaria|Resto], Resto).
verbo([padezco|Resto], Resto).
verbo([padecer|Resto], Resto).
verbo([ganas|Resto], Resto).
verbo([salir|Resto], Resto).
verbo([que|Resto], Resto).
verbo([buenos|Resto], Resto).
verbo([llevar|Resto], Resto).


% Extracci�n del sintagma verbal
extraer_sintagma_verbal(Oracion, Resto) :- verbo(Oracion, Oracion1), verbo(Oracion1, Oracion2), extraer_preposicion(Oracion2, Resto).
extraer_sintagma_verbal(Oracion, Resto) :- verbo(Oracion, Oracion1), verbo(Oracion1, Resto).
extraer_sintagma_verbal(Oracion, Resto) :- verbo(Oracion, Resto).

extraer_sintagma_verbal(Oracion, Resto) :-
    verbo(Oracion, Oracion1),
    verbo(Oracion1, Resto).

% Preposiciones comunes en las oraciones
extraer_preposicion([a|Resto], Resto).
extraer_preposicion([ante|Resto], Resto).
extraer_preposicion([bajo|Resto], Resto).
extraer_preposicion([con|Resto], Resto).
extraer_preposicion([de|Resto], Resto).
extraer_preposicion([en|Resto], Resto).
% Procesamiento de oraciones relacionadas con saludos
analizaroracion_saludo([X|_], X) :- saludoexistente(X).
analizar_oracion_saludo(Oracion, Resultado) :- extraer_sintagma_nominal(Oracion, RestoOracion), extraer_sintagma_verbal(RestoOracion, RestoVerbal), extraer_preposicion(RestoVerbal, Resultado), saludo_existente(Resultado).
analizar_oracion_saludo(Oracion, Resultado) :- extraer_sintagma_nominal(Oracion, RestoOracion), extraer_sintagma_verbal(RestoOracion, Resultado), saludo_existente(Resultado).
analizar_oracion_saludo(Oracion, Resultado) :- extraer_sintagma_verbal(Oracion, RestoOracion), extraer_preposicion(RestoOracion, Resultado), saludo_existente(Resultado).
analizar_oracion_saludo(Oracion, Resultado) :- extraer_sintagma_verbal(Oracion, Resultado), saludo_existente(Resultado).

% Procesamiento de oraciones relacionadas con padecimientos
analizar_oracion_padecimiento([X|_], X) :- padecimientoexistente(X).
analizar_oracion_padecimiento(Oracion, Resultado) :- extraer_sintagma_nominal(Oracion, RestoOracion), extraer_sintagma_verbal(RestoOracion, RestoVerbal), extraer_preposicion(RestoVerbal, Resultado), padecimiento_existente(Resultado).
analizar_oracion_padecimiento(Oracion, Resultado) :- extraer_sintagma_nominal(Oracion, RestoOracion), extraer_sintagma_verbal(RestoOracion, Resultado), padecimiento_existente(Resultado).
analizar_oracion_padecimiento(Oracion, Resultado) :- extraer_sintagma_verbal(Oracion, RestoOracion), extraer_preposicion(RestoOracion, Resultado), padecimiento_existente(Resultado).
analizar_oracion_padecimiento(Oracion, Resultado) :- extraer_sintagma_verbal(Oracion, Resultado), padecimiento_existente(Resultado).

% Procesamiento de oraciones de deseo o deseo
analizar_oracion_deseo(Oracion, Resultado) :-
    extraer_sintagma_nominal(Oracion, RestoOracion),
    extraer_sintagma_verbal(RestoOracion, Resultado).



% Verificar si el padecimiento existe en la base de datos
padecimiento_existente(Padecimiento) :- padecimiento(Padecimiento).

% Verificar si el saludo existe en la base de datos
saludo_existente(Saludo) :- saludo(Saludo).
