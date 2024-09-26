:- dynamic lista_coincidencias/1.  % Declarar como dinámica
:- consult('database.pl').  % Cargar la base de datos.

lista_animales([perro, leon, gato, pez]).
emociones([felicidad, tristeza, ira, sorpresa, miedo]).
colores([rojo, azul, verde, amarillo, negro]).

% Inicializar la lista de coincidencias vacía
lista_coincidencias([]).

% inicio del programa
inicio :-
    write('Bienvenido a Nutritec.'), nl,
    read_line_to_string(user_input, Mensaje),
    verifica_coincidencias(Mensaje).

verifica_coincidencias(Mensaje) :-
    ( verifica_padecimiento(Mensaje) ; 
      verifica_calorias(Mensaje) ; 
      verifica_dieta(Mensaje) ),
    imprimir_lista_coincidencias.

verifica_dieta(Mensaje) :-
    lista_animales(Lista),
    verificar_palabra(Mensaje, Lista, Palabra),
    agregar_a_lista(Palabra).

verifica_padecimiento(Mensaje) :-
    emociones(Lista),
    verificar_palabra(Mensaje, Lista, Palabra),
    agregar_a_lista(Palabra).

verifica_calorias(Mensaje) :-
    colores(Lista),
    verificar_palabra(Mensaje, Lista, Palabra),
    agregar_a_lista(Palabra).

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

% Agregar una palabra a la lista de coincidencias
agregar_a_lista(Palabra) :-
    lista_coincidencias(Lista),
    \+ miembro_de_lista(Palabra, Lista),  % Solo agregar si no está ya en la lista
    retract(lista_coincidencias(Lista)),  % Eliminar la lista anterior
    assertz(lista_coincidencias([Palabra | Lista])).  % Agregar la nueva palabra

% Imprimir la lista de coincidencias
imprimir_lista_coincidencias :-
    lista_coincidencias(Lista),
    ( Lista = [] -> 
        writeln('No se encontraron coincidencias.')
    ; 
        write('Palabras encontradas: '), write(Lista), nl  % Cambiado a write para imprimir la lista completa
    ).
