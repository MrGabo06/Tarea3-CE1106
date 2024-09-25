% Identificadores para pronombres en el sujeto de una oración
pronombre([yo|Resto], Resto).
pronombre([el|Resto], Resto).
pronombre([ella|Resto], Resto).
pronombre([mi|Resto], Resto).
pronombre([nos|Resto], Resto).
pronombre([nosotros|Resto], Resto).
pronombre([ellos|Resto], Resto).

% Extracción del sintagma nominal
extraer_sintagma_nominal(Oracion, Resto) :- pronombre(Oracion, Resto).

% Identificadores para verbos en la oración
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

% Extracción del sintagma verbal
extraer_sintagma_verbal(Oracion, Resto) :- verbo(Oracion, Oracion1), verbo(Oracion1, Oracion2), extraer_preposicion(Oracion2, Resto).
extraer_sintagma_verbal(Oracion, Resto) :- verbo(Oracion, Oracion1), verbo(Oracion1, Resto).
extraer_sintagma_verbal(Oracion, Resto) :- verbo(Oracion, Resto).

% Preposiciones comunes en las oraciones
extraer_preposicion([a|Resto], Resto).
extraer_preposicion([ante|Resto], Resto).
extraer_preposicion([bajo|Resto], Resto).
extraer_preposicion([con|Resto], Resto).
extraer_preposicion([de|Resto], Resto).
extraer_preposicion([en|Resto], Resto).

% Procesamiento de oraciones relacionadas con deportes
analizar_oracion_deporte(Oracion, Resultado) :- extraer_sintagma_nominal(Oracion, RestoOracion), extraer_sintagma_verbal(RestoOracion, Resultado), deporte_existente(Resultado).
analizar_oracion_deporte(Oracion, Resultado) :- extraer_sintagma_verbal(Oracion, Resultado), deporte_existente(Resultado).

% Procesamiento de oraciones relacionadas con saludos
analizar_oracion_saludo([X|_], X) :- saludo_existente(X).
analizar_oracion_saludo(Oracion, Resultado) :- extraer_sintagma_nominal(Oracion, RestoOracion), extraer_sintagma_verbal(RestoOracion, RestoVerbal), extraer_preposicion(RestoVerbal, Resultado), saludo_existente(Resultado).
analizar_oracion_saludo(Oracion, Resultado) :- extraer_sintagma_nominal(Oracion, RestoOracion), extraer_sintagma_verbal(RestoOracion, Resultado), saludo_existente(Resultado).
analizar_oracion_saludo(Oracion, Resultado) :- extraer_sintagma_verbal(Oracion, RestoOracion), extraer_preposicion(RestoOracion, Resultado), saludo_existente(Resultado).
analizar_oracion_saludo(Oracion, Resultado) :- extraer_sintagma_verbal(Oracion, Resultado), saludo_existente(Resultado).

% Procesamiento de oraciones relacionadas con padecimientos
analizar_oracion_padecimiento([X|_], X) :- padecimiento_existente(X).
analizar_oracion_padecimiento(Oracion, Resultado) :- extraer_sintagma_nominal(Oracion, RestoOracion), extraer_sintagma_verbal(RestoOracion, RestoVerbal), extraer_preposicion(RestoVerbal, Resultado), padecimiento_existente(Resultado).
analizar_oracion_padecimiento(Oracion, Resultado) :- extraer_sintagma_nominal(Oracion, RestoOracion), extraer_sintagma_verbal(RestoOracion, Resultado), padecimiento_existente(Resultado).
analizar_oracion_padecimiento(Oracion, Resultado) :- extraer_sintagma_verbal(Oracion, RestoOracion), extraer_preposicion(RestoOracion, Resultado), padecimiento_existente(Resultado).
analizar_oracion_padecimiento(Oracion, Resultado) :- extraer_sintagma_verbal(Oracion, Resultado), padecimiento_existente(Resultado).

% Verificar si el deporte existe en la base de datos
deporte_existente(Deporte) :- deporte(Deporte, _).

% Verificar si el padecimiento existe en la base de datos
padecimiento_existente(Padecimiento) :- padecimiento(Padecimiento, _).

% Verificar si el saludo existe en la base de datos
saludo_existente(Saludo) :- saludo(Saludo).
