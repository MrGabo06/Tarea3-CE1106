:- dynamic lista_coincidencias/1.  % Declarar como dinÃ¡mica
:- consult('database.pl').  % Cargar la base de datos.
:- consult('bnf_final_code.pl').

lista_animales([perro, leon, gato, pez]).
emociones([felicidad, tristeza, ira, sorpresa, miedo]).
colores([rojo, azul, verde, amarillo, negro]).

% Inicializar la lista de coincidencias vacÃ­a
lista_coincidencias([]).

% inicio del programa
inicio :-
    write('Bienvenido a Nutritec.'), nl,
    conversacion.

conversacion:-
    read_line_to_string(user_input, Mensaje),
    (bnf_verif(Mensaje);
    write('Lo siento, no te entendi'),nl,
    conversacion),
    (verifica_negaciones(Mensaje);
    verifica_coincidencias(Mensaje);
    genera_respuesta(Mensaje)), nl,
    conversacion.

verifica_negaciones(Mensaje):-
    negaciones(Lista),
    verificar_palabra(Mensaje, Lista, _), nl.
    

genera_respuesta(Mensaje):-
    (verifica_saludo(Mensaje);
    verifica_despedida(Mensaje);
    verifica_preferencia(Mensaje);
    verifica_agradecimiento(Mensaje)).

verifica_agradecimiento(Mensaje):-
    agradecimientos(Lista),
    verificar_palabra(Mensaje, Lista, _),
    write('Es un placer serte util').

verifica_saludo(Mensaje) :-
    saludos(Lista),
    verificar_palabra(Mensaje, Lista, _),
    write('Hola, como puedo ayudarte hoy?').

verifica_despedida(Mensaje) :-
    despedidas(Lista),
    verificar_palabra(Mensaje, Lista, _),
    write('Adios, que te vaya bien'), halt.

verifica_preferencia(Mensaje) :-
    preferencias(Lista),
    verificar_palabra(Mensaje, Lista, _),
    write('Excelente iniciativa, vamos a encontrar la mejor alternativa para ti'),nl,
    realizar_pregunta_alimento.

realizar_pregunta_alimento:-
    (write('Tienes algun alimento que prefieras no comer?'),nl,
    read_line_to_string(user_input, Mensaje6),
    (bnf_verif(Mensaje6),!;
    write('Lo siento, no te entendi'),nl,
    realizar_pregunta_alimento),
    verifica_alimentos(Mensaje6)),
    realizar_pregunta_padecimiento,!.

realizar_pregunta_padecimiento:-
    (write('Tienes algun padecimiento?'),nl,
    read_line_to_string(user_input,Mensaje),
   (bnf_verif(Mensaje),!;
    write('Lo siento, no te entendi'),nl,
    realizar_pregunta_padecimiento),
    verifica_padecimiento(Mensaje)),
    realizar_pregunta_dieta,!.

realizar_pregunta_dieta:-
    (write('Tienes alguna dieta en mente?'),nl,
    read_line_to_string(user_input, Mensaje2),
    (bnf_verif(Mensaje2),!;
    write('Lo siento, no te entendi'),nl,
    realizar_pregunta_dieta),
    verifica_dieta(Mensaje2)),
    realizar_pregunta_deporte,!.

realizar_pregunta_deporte:-
    (write('practicas algun deporte?'),nl,
    read_line_to_string(user_input, Mensaje4),
    (bnf_verif(Mensaje4),!;
    write('Lo siento, no te entendi'),nl,
    realizar_pregunta_deporte),
    verifica_deporte(Mensaje4)),
    realizar_pregunta_nivel,!.

realizar_pregunta_nivel:-
    (write('cual es tu nivel de ejercicio?'),nl,
    read_line_to_string(user_input, Mensaje3),
    (bnf_verif(Mensaje3),!;
    write('Lo siento, no te entendi'),nl,
    realizar_pregunta_nivel),
    verifica_actividad(Mensaje3)),
    realizar_pregunta_calorias,!.

realizar_pregunta_calorias:-
    (write('tienes una cantidad de calorias en mente?'),nl,
    read_line_to_string(user_input, Mensaje5),
    (bnf_verif(Mensaje5),!;
    write('Lo siento, no te entendi'),nl,
    realizar_pregunta_calorias),
    verifica_calorias(Mensaje5)),
    busca_dieta.

busca_dieta:-
    lista_coincidencias(Lista1),
    dieta(Lista2),
    compara_dieta(Lista1, Lista2);
    lista_coincidencias(_),
    dieta(_),
    no_dieta(_,_);
    dieta_random(_,_).

verifica_coincidencias(Mensaje) :-
    ( verifica_padecimiento(Mensaje),
      verifica_actividad(Mensaje),
      verifica_dieta(Mensaje) ),
    lista_coincidencias(Lista1),
    dieta(Lista2),
    compara_dieta(Lista1, Lista2).

verifica_dieta(Mensaje) :-
    verifica_negaciones(Mensaje);
    (tipo_dieta(Lista),
    verificar_palabra(Mensaje, Lista, Palabra),
    agregar_a_lista(Palabra)).

verifica_padecimiento(Mensaje) :-
    verifica_negaciones(Mensaje);
    (padecimiento(Lista),
    verificar_palabra(Mensaje, Lista, Palabra),
    agregar_a_lista(Palabra)).

verifica_actividad(Mensaje) :-
    verifica_negaciones(Mensaje);
    (nivel_actividad(Lista),
    verificar_palabra(Mensaje, Lista, Palabra),
    agregar_a_lista(Palabra)).

verifica_deporte(Mensaje) :-
    verifica_negaciones(Mensaje);
    (actividad(Lista),
    verificar_palabra(Mensaje, Lista, Palabra),
    agregar_a_lista(Palabra)).

verifica_calorias(Mensaje) :-
    verifica_negaciones(Mensaje);
    (calorias(Lista),
    verificar_palabra(Mensaje, Lista, Palabra),
    agregar_a_lista(Palabra)).

verifica_alimentos(Mensaje) :-
    (alimentos(Lista),
    verificar_palabra(Mensaje, Lista, Palabra),
    agregar_a_lista(Palabra));
    verifica_negaciones(Mensaje).

% Verificar si alguna palabra de la oraciÃ³n estÃ¡ en la lista predefinida
verificar_palabra(OracionInicial, ListaPredefinida, PalabraEncontrada) :-
    % Convertimos la cadena a minuscula para asegurarnos coincidencias con la base de datos
    string_lower(OracionInicial,Oracion),

    % Dividimos la oraciÃ³n en palabras (lista de cadenas)
    split_string(Oracion, " ", "", ListaCadenas),

    % Convertimos las cadenas en Ã¡tomos para comparar
    maplist(string_to_atom, ListaCadenas, ListaAtomos),

    % Verificamos si alguna palabra de la lista de la oraciÃ³n estÃ¡ en la lista predefinida
    miembro_de_lista(PalabraEncontrada, ListaAtomos),
    miembro_de_lista(PalabraEncontrada, ListaPredefinida).

% Predicado para verificar si un elemento es miembro de una lista
miembro_de_lista(Elemento, [Elemento|_]).
miembro_de_lista(Elemento, [_|Resto]) :-
    miembro_de_lista(Elemento, Resto).

% Agregar una palabra a la lista de coincidencias
agregar_a_lista(Palabra) :-
    lista_coincidencias(Lista),
    \+ miembro_de_lista(Palabra, Lista),  % Solo agregar si no estÃ¡ ya en la lista
    retract(lista_coincidencias(Lista)),  % Eliminar la lista anterior
    assertz(lista_coincidencias([Palabra | Lista])).  % Agregar la nueva palabra

% Imprimir la lista de coincidencias
imprimir_lista(Lista) :-
    ( Lista = [] ->
        dieta_predefinida(Lista2),
        ultimo_elemento(Lista2,Ultimoe),
        writeln('Puedes iniciar con esta dieta:'),
        writeln(Ultimoe)

    ;
        ultimo_elemento(Lista, Ultimo),
        writeln('Puedes iniciar con esta dieta:'),
        writeln(Ultimo)
    ).

% Predicado para obtener el Ãºltimo elemento de una lista
ultimo_elemento([Ultimo], Ultimo).  % Caso base: cuando solo queda un elemento
ultimo_elemento([_|Resto], Ultimo) :-
    ultimo_elemento(Resto, Ultimo).  % Seguir recorriendo la lista hasta el Ãºltimo elemento


% Verificar si al menos tres elementos de la primera lista estÃ¡n en la segunda lista
compara_dieta(Lista1, Lista2) :-
    contar_comunes(Lista1, Lista2, 0, Cuenta),
    (Cuenta >= 3,
    imprimir_lista(Lista2)).

no_dieta(Lista1,Lista2):-
    contar_comunes(Lista1, Lista2, 0, Cuenta),
    (Cuenta >=1,
    write('Lo siento, no tengo una dieta para tus necesidades')).

dieta_random(Lista1,Lista2):-
    contar_comunes(Lista1, Lista2, 0, Cuenta),
    (Cuenta = 0,
    imprimir_lista(Lista2)).

% Recibe dos listas, un contador inicial y devuelve el nÃºmero de elementos comunes
contar_comunes([], _, Cuenta, Cuenta).
contar_comunes([H|T], Lista2, CuentaActual, CuentaFinal) :-
    ( miembro_de_lista(H, Lista2) ->
        NuevoCuenta is CuentaActual + 1
    ; NuevoCuenta = CuentaActual
    ),
    contar_comunes(T, Lista2, NuevoCuenta, CuentaFinal).
