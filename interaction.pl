% interaccion.pl

:- consult('database.pl').  % Cargar la base de datos.

% Preguntar al usuario sobre su padecimiento y nivel de actividad.
inicio :-
    write('Bienvenido a Nutritec.'), nl,
    write('¿Cuál es su padecimiento? (Ejemplo: dislipidemia, diabetes, etc.)'), nl,
    read(Padecimiento),
    write('¿Cuál es su nivel de actividad? (inicial, intermedio, avanzado)'), nl,
    read(NivelActividad),
    sugerir_dieta(Padecimiento, NivelActividad).

% Sugerir dieta basada en el padecimiento y el nivel de actividad.
sugerir_dieta(Padecimiento, NivelActividad) :-
    sugerir_dieta_por_padecimiento(Padecimiento, DietaPorPadecimiento),
    sugerir_dieta_por_actividad(NivelActividad, DietaPorActividad),
    write('Se recomienda la dieta: '), write(DietaPorPadecimiento), nl,
    write('Se recomienda la dieta: '), write(DietaPorActividad), nl.
