% Base de datos de nutricionista

% Tipo de Dieta: nombre, descripción.
tipo_dieta(keto, 'Dieta cetogénica que limita los carbohidratos para inducir cetosis.').
tipo_dieta(proteica, 'Dieta rica en proteínas para aumentar la masa muscular.').
tipo_dieta(vegetariana, 'Dieta basada en plantas, excluyendo carne y pescado.').
tipo_dieta(alcalina, 'Dieta que busca equilibrar el pH del cuerpo.').
tipo_dieta(baja_en_grasas, 'Dieta baja en grasas saturadas para controlar el colesterol.').
tipo_dieta(vegana, 'Dieta sin productos de origen animal, rica en plantas.').
tipo_dieta(mediterranea, 'Dieta inspirada en la cocina tradicional mediterránea, rica en grasas saludables.').
tipo_dieta(carnivora, 'Dieta basada en carne y productos animales, excluyendo vegetales.').
tipo_dieta(gluten_free, 'Dieta sin gluten para personas con intolerancia.').
tipo_dieta(paleo, 'Dieta basada en alimentos paleolíticos, excluyendo granos y procesados.').

% Padecimiento: nombre, descripción, dietas recomendadas.
padecimiento(dislipidemia, 'Problemas del control del colesterol', [baja_en_grasas, mediterranea]).
padecimiento(hipercolesterolemia, 'Aumento de colesterol en la sangre', [vegana, vegetariana]).
padecimiento(diabetes, 'Alteración en los niveles de azúcar en la sangre', [baja_en_grasas, mediterranea]).
padecimiento(obesidad, 'Exceso de grasa corporal', [keto, baja_en_grasas]).
padecimiento(desnutricion, 'Deficiencia de nutrientes', [proteica, carnivora]).
padecimiento(intolerancia_gluten, 'Intolerancia al gluten', [gluten_free, paleo]).

% Nivel de actividad: nombre, rango.
nivel_actividad(inicial, '0-2 veces por semana').
nivel_actividad(intermedio, '3-4 veces por semana').
nivel_actividad(avanzado, '5 o más veces por semana').

% Dieta: nombre, tipo, calorías, [padecimientos NO recomendados], [padecimientos recomendados], [actividades NO recomendadas], [actividades recomendadas], detalle.
dieta(dieta_keto, keto, 1800, [hipercolesterolemia], [obesidad], [avanzado], [inicial], 'Desayuno: 2 huevos con aguacate. Almuerzo: Pollo a la parrilla con espinacas. Cena: Salmón con brócoli.').
dieta(dieta_vegetariana, vegetariana, 1600, [], [hipercolesterolemia], [avanzado], [inicial, intermedio], 'Desayuno: Batido de frutas con avena. Almuerzo: Ensalada de lentejas con verduras. Cena: Tofu a la parrilla con quinoa.').
dieta(dieta_baja_grasas, baja_en_grasas, 1500, [], [diabetes, dislipidemia], [inicial], [intermedio, avanzado], 'Desayuno: 2 huevos picados con verduras, 1/8 de aguacate. Merienda: 1 taza de leche descremada, 1/4 taza de granola sin azúcar. Almuerzo: 1 taza de vegetales salteados, 1 bistec encebollado (60g). Merienda: 1 taza de café o té, 2 tortillas, 30g de queso. Cena: 1 taza de ensalada, 60g de pollo a la plancha.').
dieta(dieta_proteica, proteica, 2000, [], [desnutricion], [], [intermedio, avanzado], 'Desayuno: 4 claras de huevo con espinacas. Almuerzo: Pechuga de pollo con arroz integral. Cena: Pescado a la parrilla con ensalada.').
dieta(dieta_alcalina, alcalina, 1700, [], [], [inicial], [intermedio, avanzado], 'Desayuno: Batido verde con espinacas. Almuerzo: Ensalada de quinoa con aguacate. Cena: Sopa de vegetales.').
dieta(dieta_vegana, vegana, 1400, [], [hipercolesterolemia], [inicial], [intermedio], 'Desayuno: Tostadas de aguacate. Almuerzo: Ensalada de garbanzos. Cena: Salteado de tofu con verduras.').
dieta(dieta_mediterranea, mediterranea, 1900, [], [dislipidemia], [], [intermedio], 'Desayuno: Yogur con frutos secos. Almuerzo: Pescado con arroz y ensalada. Cena: Verduras asadas con hummus.').
dieta(dieta_carnivora, carnivora, 2500, [hipercolesterolemia, dislipidemia], [desnutricion], [inicial], [intermedio, avanzado], 'Desayuno: Huevos revueltos con tocino. Almuerzo: Bistec con mantequilla. Cena: Hamburguesa de carne sin pan.').
dieta(dieta_obesidad, baja_en_grasas, 1800, [], [obesidad], [avanzado], [inicial, intermedio], 'Desayuno: Avena con frutas. Almuerzo: Pechuga de pollo con verduras. Cena: Pescado a la parrilla con espinacas.').
dieta(dieta_diabetes, baja_en_grasas, 1600, [], [diabetes], [], [inicial, intermedio], 'Desayuno: Tostada integral con aguacate. Almuerzo: Pollo a la parrilla con ensalada. Cena: Pescado con espinacas.').
dieta(dieta_aumentar_musculo, proteica, 2200, [], [desnutricion], [], [avanzado], 'Desayuno: 4 claras de huevo con avena. Almuerzo: Pechuga de pollo con arroz. Cena: Carne roja con espinacas.').
dieta(dieta_perdida_grasa, keto, 1800, [], [obesidad], [inicial], [intermedio], 'Desayuno: Huevos con aguacate. Almuerzo: Pollo a la parrilla con espinacas. Cena: Salmón con brócoli.').
dieta(dieta_gluten_free, gluten_free, 1500, [], [intolerancia_gluten], [], [inicial, intermedio], 'Desayuno: Tostada de arroz con aguacate. Almuerzo: Pollo con quinoa. Cena: Pescado con ensalada.').
dieta(dieta_paleo, paleo, 1700, [], [intolerancia_gluten], [], [inicial, avanzado], 'Desayuno: Huevos con aguacate. Almuerzo: Carne magra con espinacas. Cena: Pescado con verduras.').

% Reglas para sugerir dietas.

% Sugerir una dieta en función del padecimiento.
sugerir_dieta_por_padecimiento(Padecimiento, Dieta) :-
    padecimiento(Padecimiento, _, DietasRecomendadas),
    dieta(Dieta, TipoDieta, _, _, _, _, _),
    member(TipoDieta, DietasRecomendadas).

% Sugerir una dieta en función del nivel de actividad física.
sugerir_dieta_por_actividad(NivelActividad, Dieta) :-
    dieta(Dieta, _, _, _, _, ActividadesRecomendadas, _, _),
    member(NivelActividad, ActividadesRecomendadas).

% Ejemplos de uso:
% ?- sugerir_dieta_por_padecimiento(dislipidemia, Dieta).
% ?- sugerir_dieta_por_actividad(inicial, Dieta).

% Comentarios:
% Esta base de datos puede ser ampliada con mas dietas, padecimientos y niveles de actividad.
% Se recomienda mantener la consistencia en la nomenclatura y la estructura de los hechos y reglas.
