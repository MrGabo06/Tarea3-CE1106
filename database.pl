% Base de datos de nutricionista

% Tipo de Dieta: nombre, descripción.
tipo_dieta([keto, 'Dieta cetogénica que limita los carbohidratos para inducir cetosis.']).
tipo_dieta([proteica, 'Dieta rica en proteínas para aumentar la masa muscular.']).
tipo_dieta([vegetariana, 'Dieta basada en plantas, excluyendo carne y pescado.']).
tipo_dieta([alcalina, 'Dieta que busca equilibrar el pH del cuerpo.']).
tipo_dieta([baja_en_grasas, 'Dieta baja en grasas saturadas para controlar el colesterol.']).
tipo_dieta([vegana, 'Dieta sin productos de origen animal, rica en plantas.']).
tipo_dieta([mediterranea, 'Dieta inspirada en la cocina tradicional mediterránea, rica en grasas saludables.']).
tipo_dieta([carnivora, 'Dieta basada en carne y productos animales, excluyendo vegetales.']).
tipo_dieta([gluten_free, 'Dieta sin gluten para personas con intolerancia.']).
tipo_dieta([paleo, 'Dieta basada en alimentos paleolíticos, excluyendo granos y procesados.']).

% Padecimiento: nombre, descripción, dietas recomendadas.
padecimiento([dislipidemia, 'Problemas del control del colesterol', [baja_en_grasas, mediterranea]]).
padecimiento([hipercolesterolemia, 'Aumento de colesterol en la sangre', [vegana, vegetariana]]).
padecimiento([diabetes, 'Alteración en los niveles de azúcar en la sangre', [baja_en_grasas, mediterranea]]).
padecimiento([obesidad, 'Exceso de grasa corporal', [keto, baja_en_grasas]]).
padecimiento([desnutricion, 'Deficiencia de nutrientes', [proteica, carnivora]]).
padecimiento([intolerancia_gluten, 'Intolerancia al gluten', [gluten_free, paleo]]).

% Nivel de actividad: nombre, rango.
nivel_actividad([inicial, '0-2 veces por semana']).
nivel_actividad([intermedio, '3-4 veces por semana']).
nivel_actividad([avanzado, '5 o más veces por semana']).

% Dieta: nombre, tipo, calorías, [padecimientos NO recomendados], [padecimientos recomendados], [actividades NO recomendadas], [actividades recomendadas], detalle.
dieta([keto, hipercolesterolemia, inicial, intermedio, avanzado, 'Plan de Alimentacion:
Desayuno: 2 huevos con 1/4 aguacate. 
Merienda 1: 10 almendras. 
Almuerzo: Pollo a la parrilla (150g) con espinacas (1 taza). 
Merienda 2: Yogur griego (100g) con nueces. 
Cena: Salmón (120g) con brócoli (1 taza).
Notas:Tomar mínimo 3 litros diarios de agua.']).

dieta([dieta_vegetariana, vegetariana, 1600, [], [hipercolesterolemia], [avanzado], [inicial, intermedio], 'Plan de Alimentacion: 
Desayuno: Batido de frutas (1 plátano, 1 taza de espinacas, 1 taza de leche de almendra) con avena (50g). 
Merienda 1: 1 manzana. 
Almuerzo: Ensalada de lentejas (150g) con verduras. 
Merienda 2: 1 puñado de frutos secos (30g). 
Cena: Tofu a la parrilla (100g) con quinoa (1/2 taza).
Notas:Tomar minimo 3 litros diarios de agua.']).
dieta([dieta_baja_grasas, baja_en_grasas, 1500, [], [diabetes, dislipidemia], [inicial], [intermedio, avanzado], 'Plan de Alimentacion:
Desayuno: 2 huevos picados con verduras, 1/8 de aguacate. 
Merienda 1: 1 taza de leche descremada, 1/4 taza de granola sin azúcar.
Almuerzo: 1 taza de vegetales salteados, 1 bistec encebollado (60g). 
Merienda 2: 1 taza de café o té, 2 tortillas, 30g de queso. 
Cena: 1 taza de ensalada, 60g de pollo a la plancha.
Notas:Tomar minimo 3 litros diarios de agua.']).
dieta([dieta_proteica, proteica, 2000, [], [desnutricion], [], [intermedio, avanzado], 'Plan de Alimentacion: 
Desayuno: 4 claras de huevo con espinacas (1 taza). 
Merienda 1: 1 batido de proteína.
Almuerzo: Pechuga de pollo (200g) con arroz integral (1 taza). 
Merienda 2: 1 yogurt bajo en grasa (150g). 
Cena: Pescado a la parrilla (150g) con ensalada (1 taza).
Notas:Tomar minimo 3 litros diarios de agua.']).
dieta([dieta_alcalina, alcalina, 1700, [], [], [inicial], [intermedio, avanzado], 'Plan de Alimentacion: 
Desayuno: Batido verde (1 taza de espinacas, 1/2 pepino, 1 manzana verde). 
Merienda 1: 1 puñado de almendras (30g). 
Almuerzo: Ensalada de quinoa (1 taza) con aguacate (1/4 aguacate). 
Merienda 2: 1 batido de frutas (1 plátano, 1 taza de leche de almendras). 
Cena: Sopa de vegetales (1 taza).
Notas:Tomar minimo 3 litros diarios de agua.']).
dieta([dieta_vegana, vegana, 1400, [], [hipercolesterolemia], [inicial], [intermedio], 'Plan de Alimentacion: 
Desayuno: Tostadas de aguacate (2 rebanadas de pan integral). 
Merienda 1: 1 banano. 
Almuerzo: Ensalada de garbanzos (150g) con verduras. 
Merienda 2: 1 puñado de nueces (30g). 
Cena: Salteado de tofu (100g) con verduras (1 taza).
Notas:Tomar minimo 3 litros diarios de agua.']).
dieta([dieta_mediterranea, mediterranea, 1900, [], [dislipidemia], [], [intermedio], 'Plan de Alimentacion: 
Desayuno: Yogur con frutos secos (100g de yogur, 30g de nueces). 
Merienda 1: 1 naranja. 
Almuerzo: Pescado (150g) con arroz (1 taza) y ensalada (1 taza). 
Merienda 2: 1 taza de té verde y 1 puñado de almendras (30g). 
Cena: Verduras asadas (1 taza) con hummus (50g).
Notas:Tomar minimo 3 litros diarios de agua.']).
dieta([dieta_carnivora, carnivora, 2500, [hipercolesterolemia, dislipidemia], [desnutricion], [inicial], [intermedio, avanzado], 'Plan de Alimentacion: 
Desayuno: Huevos revueltos (3) con tocino (2 tiras). 
Merienda 1: 1 rebanada de queso cheddar (30g). 
Almuerzo: Bistec (200g) con mantequilla. 
Merienda 2: 1 taza de caldo de hueso. 
Cena: Hamburguesa de carne (200g) sin pan.
Notas:Tomar minimo 3 litros diarios de agua.']).
dieta([dieta_obesidad, baja_en_grasas, 1800, [], [obesidad], [avanzado], [inicial, intermedio], 'Plan de Alimentacion: 
Desayuno: Avena (50g) con frutas (1/2 manzana).
Merienda 1: 1 puñado de almendras (30g). 
Almuerzo: Pechuga de pollo (150g) con verduras (1 taza). 
Merienda 2: 1 batido de proteínas (1 porción). 
Cena: Pescado a la parrilla (150g) con espinacas (1 taza).
Notas:Tomar minimo 3 litros diarios de agua.']).
dieta([dieta_diabetes, baja_en_grasas, 1600, [], [diabetes], [], [inicial, intermedio], 'Plan de Alimentacion: 
Desayuno: Tostada integral (2 rebanadas) con aguacate (1/4 aguacate). 
Merienda 1: 1 manzana. 
Almuerzo: Pollo a la parrilla (150g) con ensalada (1 taza). 
Merienda 2: 1 yogurt descremado (100g). 
Cena: Pescado (150g) con vegetales al vapor (1 taza).
Notas:Tomar minimo 3 litros diarios de agua.']).

dieta([dieta_aumentar_musculo, proteica, 2200, [], [desnutricion], [], [avanzado], 'Plan de Alimentacion: 
Desayuno: 4 claras de huevo con avena (50g). 
Merienda 1: 1 batido de proteínas. 
Almuerzo: Pechuga de pollo (200g) con arroz (1 taza). 
Merienda 2: Yogur griego (100g). 
Cena: Carne roja (200g) con espinacas (1 taza).
Notas:Tomar minimo 3 litros diarios de agua.']).
dieta([dieta_perdida_grasa, keto, 1800, [], [obesidad], [inicial], [intermedio], 'Plan de Alimentacion: 
Desayuno: Huevos (2) con aguacate (1/4). 
Merienda 1: 1 puñado de almendras (30g). 
Almuerzo: Pollo a la parrilla (150g) con espinacas (1 taza). 
Merienda 2: Yogur griego (100g). 
Cena: Salmón (120g) con brócoli (1 taza).
Notas:Tomar minimo 3 litros diarios de agua.']).
dieta([dieta_gluten_free, gluten_free, 1500, [], [intolerancia_gluten], [], [inicial, intermedio], 'Plan de Alimentacion: 
Desayuno: Tostada de arroz (2 rebanadas) con aguacate (1/4 aguacate). 
Merienda 1: 1 naranja. 
Almuerzo: Pollo (150g) con quinoa (1 taza). 
Merienda 2: 1 batido de frutas (1 taza de leche de almendra, 1 plátano). 
Cena: Pescado (150g) con ensalada (1 taza).
Notas:Tomar minimo 3 litros diarios de agua.']).
dieta([dieta_paleo, paleo, 1700, [], [intolerancia_gluten], [], [inicial, avanzado], 'Plan de Alimentacion: 
Desayuno: Huevos (2) con aguacate (1/4 aguacate). 
Merienda 1: 1 batido de proteínas. 
Almuerzo: Carne magra (150g) con espinacas (1 taza). 
Merienda 2: 1 taza de frutos secos (30g). 
Cena: Pescado (150g) con verduras (1 taza).
Notas:Tomar minimo 3 litros diarios de agua.']).


% Reglas para sugerir dietas.

%%% Sugerir una dieta en función del padecimiento.
%sugerir_dieta_por_padecimiento(Padecimiento, Dieta) :-
%    padecimiento(Padecimiento, _, DietasRecomendadas),
%    dieta(Dieta, TipoDieta, _, _, _, _, _),
%    member(TipoDieta, DietasRecomendadas).

%% Sugerir una dieta en función del nivel de actividad física.
%sugerir_dieta_por_actividad(NivelActividad, Dieta) :-
%    dieta(Dieta, _, _, _, _, ActividadesRecomendadas, _, _),
%    member(NivelActividad, ActividadesRecomendadas).