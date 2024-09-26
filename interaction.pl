:- consult('database.pl').  % Cargar la base de datos.

lista_animales([perro, leon, gato, pez]).

% inicio del programa
inicio :-
    write('Bienvenido a Nutritec.'), nl,
    read_line_to_string(user_input, Mensaje),
    lista_animales(Lista),  % Obtener la lista de animales
    verificar_palabra(Mensaje, Lista, Palabra).

% Verificar si alguna palabra de la oración está en la lista predefinida
verificar_palabra(Oracion, ListaPredefinida, PalabraEncontrada) :-
    % Dividimos la oración en palabras (lista de cadenas)
    split_string(Oracion, " ", "", ListaCadenas),
    
    % Convertimos las cadenas en átomos para comparar
    maplist(string_to_atom, ListaCadenas, ListaAtomos),
    
    % Verificamos si alguna palabra de la lista de la oración está en la lista predefinida
    miembro_de_lista(PalabraEncontrada, ListaAtomos),
    miembro_de_lista(PalabraEncontrada, ListaPredefinida),
    
    % Si se encuentra, devolvemos la palabra encontrada
    writeln('Se encontró una palabra de la lista predefinida en la oración: '),
    writeln(PalabraEncontrada).

% Predicado para verificar si un elemento es miembro de una lista
miembro_de_lista(Elemento, [Elemento|_]).
miembro_de_lista(Elemento, [_|Resto]) :-
    miembro_de_lista(Elemento, Resto).

% Sugerir dieta basada en el padecimiento y el nivel de actividad.
sugerir_dieta(Padecimiento, NivelActividad) :-
    sugerir_dieta_por_padecimiento(Padecimiento, DietaPorPadecimiento),
    sugerir_dieta_por_actividad(NivelActividad, DietaPorActividad),
    write('Se recomienda la dieta: '), write(DietaPorPadecimiento), nl,
    write('Se recomienda la dieta: '), write(DietaPorActividad), nl.
