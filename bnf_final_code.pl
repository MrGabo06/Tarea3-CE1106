% Tipos de oraciones

% Oracion que se divide en sujeto y predicado
oracion(Completa,Resto):- sujeto(Completa,Interm,_,Cantidad), predicado(Interm,Resto,_,Cantidad).

% Sujeto se compone de un articulo y un sustantivo (genero incluido)
sujeto(Completa,Resto,Genero,Cantidad):- articulo(Completa,Interm,Genero,Cantidad),sustantivo(Interm,Interm1,Genero,Cantidad),adjetivo(Interm1,Resto,Genero,Cantidad).

% Caso 1
% Solamente se especifica accion sin alguien o algo que complemente la oracion
predicado(Completa,Resto,_,Cantidad):- verbo(Completa,Resto,Cantidad).

% Caso 2
% Se especifica un sujeto complementario al verbo del predicado
predicado(Completa,Resto,Genero,Cantidad):- verbo(Completa,Interm,Cantidad), sujeto(Interm,Resto,Genero,Cantidad).

% Palabras conocidas
% Articulos:
% ([Articulo, Resto], Resto, Genero, Cantidad)
articulo([el|Resto],Resto,masculino,singular).
articulo([la|Resto],Resto,femenino,singular).
articulo([los|Resto],Resto,masculino,plural).
articulo([las|Resto],Resto,femenino,plural).

% ([Sustantivo, Resto], Resto, Genero, Cantidad)
sustantivo([hombre|Resto],Resto,masculino,singular).
sustantivo([manzana|Resto],Resto,femenino,singular).
sustantivo([hombres|Resto],Resto,masculino,plural).
sustantivo([manzanas|Resto],Resto,femenino,plural).

% ([Adjetivo, Resto], Resto, Genero, Cantidad)
adjetivo([fuertes|Resto],Resto,masculino,plural).
adjetivo([fuertes|Resto],Resto,femenino,plural).
adjetivo([fuerte|Resto],Resto,masculino,singular).
adjetivo([fuerte|Resto],Resto,femenino,singular).
adjetivo([rojas|Resto],Resto,femenino,plural).
adjetivo([roja|Resto],Resto,femenino,singular).

% ([Verbo, Resto], Resto, Cantidad)
verbo([come|Resto],Resto,singular).
verbo([comen|Resto],Resto,plural).