% Palabras clave: saludos, despedidas, preguntas.

% Saludos
saludo([hola]).
saludo([buenos, dias]).
saludo([buenas, tardes]).

% Despedidas
despedida([gracias]).
despedida([muchas, gracias]).
despedida([adios]).

% Preguntas
pregunta([que]).
pregunta([cual]).
pregunta([por, que]).


% Procesar la entrada del usuario y clasificarla como saludo, despedida o pregunta.

procesar_entrada(Entrada) :-
    saludo(Entrada), 
    write('Saludo detectado!'), nl.
procesar_entrada(Entrada) :-
    despedida(Entrada), 
    write('Despedida detectada!'), nl.
procesar_entrada(Entrada) :-
    pregunta(Entrada), 
    write('Pregunta detectada!'), nl.
procesar_entrada(_) :-
    write('No se ha detectado ninguna palabra clave.'), nl.

% Iniciar la conversación con el usuario
iniciar :-
    write('Hola, bienvenido a NutriTec! ¿Cómo puedo ayudarte hoy?'), nl,
    write('Por favor, ingresa tu padecimiento (o escribe "ninguno" si no tienes): '), nl,
    read(Padecimiento),
    procesar_padecimiento(Padecimiento).

% Procesar el padecimiento del usuario
procesar_padecimiento(ninguno) :-
    write('Por favor, ingresa tu nivel de actividad física (inicial, intermedio o avanzado): '), nl,
    read(NivelActividad),
    sugerir_dieta_por_actividad(NivelActividad, Dieta),
    mostrar_dieta(Dieta).
procesar_padecimiento(Padecimiento) :-
    sugerir_dieta_por_padecimiento(Padecimiento, Dieta),
    mostrar_dieta(Dieta).

% Mostrar la dieta sugerida al usuario
mostrar_dieta(Dieta) :-
    dieta(Dieta, TipoDieta, Calorias, _, _, _, _, Detalle),
    write('Te sugerimos la siguiente dieta: '), nl,
    write('Tipo de dieta: '), write(TipoDieta), nl,
    write('Calorías: '), write(Calorias), nl,
    write('Descripción: '), write(Detalle), nl.

% Sugerir una dieta en función del padecimiento.
sugerir_dieta_por_padecimiento(Padecimiento, Dieta) :-
    padecimiento(Padecimiento, _, DietasRecomendadas),
    dieta(Dieta, TipoDieta, _, _, _, _, _, _),
    member(TipoDieta, DietasRecomendadas),
    !.  % Usamos "cut" para detenerse en la primera dieta encontrada.

% Sugerir una dieta en función del nivel de actividad física.
sugerir_dieta_por_actividad(NivelActividad, Dieta) :-
    dieta(Dieta, _, _, _, _, ActividadesRecomendadas, _, _),
    member(NivelActividad, ActividadesRecomendadas),
    !.
