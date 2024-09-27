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
    conversacion.

conversacion:-
    read_line_to_string(user_input, Mensaje),
    %PASA POR EL BNF
    (verifica_coincidencias(Mensaje);
    genera_respuesta(Mensaje)).

genera_respuesta(Mensaje):-
    (verifica_saludo(Mensaje);
    verifica_despedida(Mensaje);
    verifica_preferencia(Mensaje)).

verifica_saludo(Mensaje) :-
    saludos(Lista),
    verificar_palabra(Mensaje, Lista, Palabra),
    write('Hola, como puedo ayudarte hoy?').

verifica_despedida(Mensaje) :-
    despedidas(Lista),
    verificar_palabra(Mensaje, Lista, Palabra),
    write('Adios, que te vaya bien').

verifica_preferencia(Mensaje) :-
    preferencias(Lista),
    verificar_palabra(Mensaje, Lista, Palabra),
    write('entiendo tu preferencia').

verifica_coincidencias(Mensaje) :-
    ( verifica_padecimiento(Mensaje) ; 
      verifica_actividad(Mensaje) ; 
      verifica_dieta(Mensaje) ),
    lista_coincidencias(Lista1),
    dieta(Lista2),
    compara_dieta(Lista1, Lista2).

verifica_dieta(Mensaje) :-
    tipo_dieta(Lista),
    verificar_palabra(Mensaje, Lista, Palabra),
    agregar_a_lista(Palabra).

verifica_padecimiento(Mensaje) :-
    padecimiento(Lista),
    verificar_palabra(Mensaje, Lista, Palabra),
    agregar_a_lista(Palabra).

verifica_actividad(Mensaje) :-
    nivel_actividad(Lista),
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
    miembro_de_lista(PalabraEncontrada, ListaPredefinida).

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
imprimir_lista(Lista) :-
    ( Lista = [] -> 
        writeln('No se encontraron coincidencias.')
    ; 
        ultimo_elemento(Lista, Ultimo),
        write('Último elemento encontrado: '), writeln(Ultimo)
    ).

% Predicado para obtener el último elemento de una lista
ultimo_elemento([Ultimo], Ultimo).  % Caso base: cuando solo queda un elemento
ultimo_elemento([_|Resto], Ultimo) :-
    ultimo_elemento(Resto, Ultimo).  % Seguir recorriendo la lista hasta el último elemento


% Verificar si al menos tres elementos de la primera lista están en la segunda lista
compara_dieta(Lista1, Lista2) :-
    contar_comunes(Lista1, Lista2, 0, Cuenta),
    Cuenta >= 3,
    imprimir_lista(Lista2).

% Recibe dos listas, un contador inicial y devuelve el número de elementos comunes
contar_comunes([], _, Cuenta, Cuenta).
contar_comunes([H|T], Lista2, CuentaActual, CuentaFinal) :-
    ( miembro_de_lista(H, Lista2) ->
        NuevoCuenta is CuentaActual + 1
    ; NuevoCuenta = CuentaActual
    ),
    contar_comunes(T, Lista2, NuevoCuenta, CuentaFinal).