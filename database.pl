% Tipo de Dieta: nombre, descripción.
tipo_dieta(keto, 'Dieta cetogénica').
tipo_dieta(proteica, 'Dieta rica en proteínas').
tipo_dieta(vegetariana, 'Dieta basada en plantas').
tipo_dieta(alcalina, 'Dieta que busca equilibrar el pH').
tipo_dieta(baja_en_grasas, 'Dieta baja en grasas').
tipo_dieta(vegana, 'Dieta sin productos de origen animal').
tipo_dieta(mediterranea, 'Dieta inspirada en la cocina tradicional mediterránea').
tipo_dieta(carnivora, 'Dieta basada en carne y productos animales').

% Padecimiento: nombre, descripción, dietas recomendadas.
padecimiento(dislipidemia, 'Problemas del control del colesterol', [baja_en_grasas, mediterranea]).
padecimiento(hipercolesterolemia, 'Aumento de colesterol en la sangre', [vegana, vegetariana]).
padecimiento(diabetes, 'Alteración en los niveles de azúcar en la sangre', [baja_en_grasas, mediterranea]).
padecimiento(obesidad, 'Exceso de grasa corporal', [keto, baja_en_grasas]).
padecimiento(desnutricion, 'Deficiencia de nutrientes', [proteica, carnivora]).

% Nivel de actividad: nombre, rango.
nivel_actividad(inicial, '0-2 veces por semana').
nivel_actividad(intermedio, '3-4 veces por semana').
nivel_actividad(avanzado, '5 o más veces por semana').

% Dieta: nombre, tipo, calorías, [padecimientos NO recomendados], [padecimientos recomendados], [actividades NO recomendadas], [actividades recomendadas], detalle.
dieta(dieta_keto, keto, 1800, [hipercolesterolemia], [obesidad], [avanzado], [inicial], 'Plan bajo en carbohidratos y alto en grasas').
dieta(dieta_vegetariana, vegetariana, 1600, [], [hipercolesterolemia], [avanzado], [inicial, intermedio], 'Plan basado en plantas').
dieta(dieta_baja_grasas, baja_en_grasas, 1500, [], [diabetes, dislipidemia], [inicial], [intermedio, avanzado], 'Plan bajo en grasas para control de lípidos').
dieta(dieta_proteica, proteica, 2000, [], [desnutricion], [], [intermedio, avanzado], 'Plan alto en proteínas para ganar masa muscular').
dieta(dieta_alcalina, alcalina, 1700, [], [], [inicial], [intermedio, avanzado], 'Plan para equilibrar el pH del cuerpo').
dieta(dieta_vegana, vegana, 1400, [], [hipercolesterolemia], [inicial], [intermedio], 'Plan sin productos animales').
dieta(dieta_mediterranea, mediterranea, 1900, [], [dislipidemia], [], [intermedio], 'Plan balanceado inspirado en la dieta mediterránea').
dieta(dieta_carnivora, carnivora, 2500, [hipercolesterolemia, dislipidemia], [desnutricion], [inicial], [intermedio, avanzado], 'Plan basado en productos animales').
dieta(dieta_obesidad, baja_en_grasas, 1800, [], [obesidad], [avanzado], [inicial, intermedio], 'Dieta baja en grasas para pérdida de peso').
dieta(dieta_diabetes, baja_en_grasas, 1600, [], [diabetes], [], [inicial, intermedio], 'Plan para control de azúcar en sangre').
dieta(dieta_aumentar_musculo, proteica, 2200, [], [desnutricion], [], [avanzado], 'Plan para aumento de masa muscular').
dieta(dieta_perdida_grasa, keto, 1800, [], [obesidad], [inicial], [intermedio], 'Plan cetogénico para pérdida de grasa').

% Sugerir una dieta en función del padecimiento.
sugerir_dieta_por_padecimiento(Padecimiento, Dieta) :-
    padecimiento(Padecimiento, _, DietasRecomendadas),
    dieta(Dieta, TipoDieta, _, _, _, _, _, _),
    member(TipoDieta, DietasRecomendadas).

% Sugerir una dieta en función del nivel de actividad física.
sugerir_dieta_por_actividad(NivelActividad, Dieta) :-
    dieta(Dieta, _, _, _, _, ActividadesRecomendadas, _, _),
    member(NivelActividad, ActividadesRecomendadas).
