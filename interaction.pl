% Palabras clave: saludos, despedidas, preguntas.

% Saludos
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

    % Iniciar interacción
iniciar :-
    write('Hola, bienvenido a NutriTec! ¿Cómo puedo ayudarte hoy?'), nl,
    read_line_to_string(user_input, Mensaje),
    atom_string(AtomMensaje, Mensaje),
    parcer(AtomMensaje).

% Procesar el mensaje del usuario
parcer(Mensaje) :-
    Saludos = [hola, adios, cuando, como],
    ( member(Mensaje, Saludos)).

% Mostrar la dieta sugerida al usuario
mostrar_dieta(Dieta) :-
    dieta(Dieta, TipoDieta, Calorias, _, _, _, _, Detalle),
    write('Te sugerimos la siguiente dieta: '), nl,
    write('Tipo de dieta: '), write(TipoDieta), nl,
    write('CalorÃ­as: '), write(Calorias), nl,
    write('DescripciÃ³n: '), write(Detalle), nl.

% Sugerir una dieta en funciÃ³n del padecimiento.
sugerir_dieta_por_padecimiento(Padecimiento, Dieta) :-
    padecimiento(Padecimiento, _, DietasRecomendadas),
    dieta(Dieta, TipoDieta, _, _, _, _, _, _),
    member(TipoDieta, DietasRecomendadas),
    !.  % Usamos "cut" para detenerse en la primera dieta encontrada.

% Sugerir una dieta en funciÃ³n del nivel de actividad fÃ­sica.
sugerir_dieta_por_actividad(NivelActividad, Dieta) :-
    dieta(Dieta, _, _, _, _, ActividadesRecomendadas, _, _),
    member(NivelActividad, ActividadesRecomendadas),
    !.

% Lista de palabras predefinidas (en átomos)
palabras_predefinidas([hola, adios, como, estas, cuando]).

% Predicado para verificar si una oración contiene alguna palabra de la lista predefinida
verificar_palabra :-
    writeln('Por favor, ingresa una oración:'),
    read_line_to_string(user_input, Oracion),       % Lee la oración como un string
    split_string(Oracion, " ", "", ListaCadenas),   % Divide la oración en cadenas
    maplist(string_to_atom, ListaCadenas, ListaAtomos),  % Convierte las cadenas en átomos
    palabras_predefinidas(ListaPredefinida),        % Obtiene la lista de palabras predefinidas
    ( miembro_de_lista(ListaPredefinida, ListaAtomos) ->  % Verifica si alguna palabra está en la lista
        writeln('Se encontró una palabra de la lista predefinida en la oración.')
    ;   writeln('No se encontró ninguna palabra de la lista predefinida en la oración.')
    ).

% Predicado auxiliar para verificar si alguna palabra de una lista está en otra lista
miembro_de_lista([], _) :- fail.  % Si la lista predefinida está vacía, falla
miembro_de_lista([Palabra|Resto], ListaPalabras) :-
    ( member(Palabra, ListaPalabras) -> true  % Si se encuentra la palabra, retorna true
    ; miembro_de_lista(Resto, ListaPalabras)  % Si no se encuentra, revisa las demás
    ).