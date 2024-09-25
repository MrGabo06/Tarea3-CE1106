% interaccion.pl

:- consult('database.pl').  % Cargar la base de datos.

% Preguntar al usuario sobre su padecimiento y nivel de actividad.
inicio :-
    write('Bienvenido a Nutritec.'), nl,
    read_line_to_string(user_input, Mensaje),
    verificar_palabra(Mensaje).

% verificar si una palabra se encuentra en una oracion
verificar_palabra(Oracion) :-     
    split_string(Oracion, " ", "", ListaCadenas),   
    maplist(string_to_atom, ListaCadenas, ListaAtomos),  
    palabras_predefinidas(ListaPredefinida),        
    ( miembro_de_lista(ListaPredefinida, ListaAtomos) ->
        writeln('Se encontro una palabra de la lista predefinida en la oracion.')
    ;   writeln('No se encontro ninguna palabra de la lista predefinida en la oracion.')
    ).

% Auxiliar para verificar si se encuentra una palabra en una lista
miembro_de_lista([], _) :- fail.  
miembro_de_lista([Palabra|Resto], ListaPalabras) :-
    ( member(Palabra, ListaPalabras) -> true  
    ; miembro_de_lista(Resto, ListaPalabras)).


% Sugerir dieta basada en el padecimiento y el nivel de actividad.
sugerir_dieta(Padecimiento, NivelActividad) :-
    sugerir_dieta_por_padecimiento(Padecimiento, DietaPorPadecimiento),
    sugerir_dieta_por_actividad(NivelActividad, DietaPorActividad),
    write('Se recomienda la dieta: '), write(DietaPorPadecimiento), nl,
    write('Se recomienda la dieta: '), write(DietaPorActividad), nl.