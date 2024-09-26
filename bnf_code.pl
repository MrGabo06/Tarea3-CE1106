% Pronombres necesarios para el sintagma nominal
pronombre([yo|S], S).
pronombre([el|S], S).
pronombre([ella|S], S).
pronombre([mi|S], S).
pronombre([nos|S], S).
pronombre([nosotros|S], S).
pronombre([ellos|S], S).

% Sintagma Nominal
stgma_nominal(Oracion, S) :- pronombre(Oracion, S).

% Verbos necesarios para el análisis del sintagma verbal
verbo([tengo|S], S).
verbo([soy|S], S).
verbo([estoy|S], S).
verbo([empezar|S], S).
verbo([quiero|S], S).
verbo([hacer|S], S).
verbo([ir|S], S).
verbo([deseo|S], S).
verbo([puedo|S], S).
verbo([practicar|S], S).
verbo([gustaría|S], S).
verbo([padezco|S], S).
verbo([padecer|S], S).
verbo([ganas|S], S).
verbo([salir|S], S).
verbo([que|S], S).
verbo([buenos|S], S).
verbo([consultar|S], S).
verbo([recomendar|S], S).
verbo([necesito|S], S).
verbo([preguntar|S], S).
verbo([conocer|S], S).
verbo([me|S], S).
verbo([avisar|S], S).

% Define preposiciones comunes
preposicion([a|Resto], Resto).
preposicion([ante|Resto], Resto).
preposicion([bajo|Resto], Resto).
preposicion([con|Resto], Resto).
preposicion([de|Resto], Resto).
preposicion([en|Resto], Resto).

% Sintagma Verbal
stgma_verbal(Oracion, S) :- verbo(Oracion, Oracion1), preposicion(Oracion1, S).
stgma_verbal(Oracion, S) :- verbo(Oracion, Oracion1), verbo(Oracion1, S).
stgma_verbal(Oracion, S) :- verbo(Oracion, S).

% Define las consultas nutricionales
consulta_nutricion('dieta').
consulta_nutricion('nutrición').
consulta_nutricion('calorías').
consulta_nutricion('alimento').
consulta_nutricion('comida').
consulta_nutricion('nutritiva').
consulta_nutricion('recomendación').

% Define los saludos
existe_saludo('hola').
existe_saludo('buenos').
existe_saludo('buenas').
existe_saludo('saludos').

% Define los padecimientos
existe_padecimiento('diabetes').
existe_padecimiento('hipertensión').
existe_padecimiento('obesidad').

% Oraciones de nutrición
oracion([X|_], X) :- consulta_nutricion(X).
oracion(Oracion, S) :- stgma_nominal(Oracion, Oracion1), stgma_verbal(Oracion1, S), consulta_nutricion(S).
oracion(Oracion, S) :- stgma_verbal(Oracion, S), consulta_nutricion(S).

% Oraciones de salud
oracion([X|_], X) :- existe_saludo(X).
oracion(Oracion, S) :- stgma_nominal(Oracion, Oracion1), stgma_verbal(Oracion1, Oracion2), preposicion(Oracion2, S), existe_saludo(S).
oracion(Oracion, S) :- stgma_nominal(Oracion, Oracion1), stgma_verbal(Oracion1, S), existe_saludo(S).
oracion(Oracion, S) :- stgma_verbal(Oracion, Oracion1), preposicion(Oracion1, S), existe_saludo(S).
oracion(Oracion, S) :- stgma_verbal(Oracion, S), existe_saludo(S).

% Oraciones de padecimiento
oracion([X|_], X) :- existe_padecimiento(X).
oracion(Oracion, S) :- stgma_nominal(Oracion, Oracion1), stgma_verbal(Oracion1, Oracion2), preposicion(Oracion2, S), existe_padecimiento(S).
oracion(Oracion, S) :- stgma_nominal(Oracion, Oracion1), stgma_verbal(Oracion1, S), existe_padecimiento(S).
oracion(Oracion, S) :- stgma_verbal(Oracion, Oracion1), preposicion(Oracion1, S), existe_padecimiento(S).
oracion(Oracion, S) :- stgma_verbal(Oracion, S), existe_padecimiento(S).
