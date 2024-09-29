% Base de datos de nutricionista

% Tipo de Dieta: nombre, descripciÃ³n.
tipo_dieta([keto, 'Dieta cetogÃ©nica que limita los carbohidratos para inducir cetosis.']).
tipo_dieta([proteica, 'Dieta rica en proteÃ­nas para aumentar la masa muscular.']).
tipo_dieta([vegetariana, 'Dieta basada en plantas, excluyendo carne y pescado.']).
tipo_dieta([alcalina, 'Dieta que busca equilibrar el pH del cuerpo.']).
tipo_dieta([baja_en_grasas, 'Dieta baja en grasas saturadas para controlar el colesterol.']).
tipo_dieta([vegana, 'Dieta sin productos de origen animal, rica en plantas.']).
tipo_dieta([mediterranea, 'Dieta inspirada en la cocina tradicional mediterrÃ¡nea, rica en grasas saludables.']).
tipo_dieta([carnivora, 'Dieta basada en carne y productos animales, excluyendo vegetales.']).
tipo_dieta([gluten_free, 'Dieta sin gluten para personas con intolerancia.']).
tipo_dieta([paleo, 'Dieta basada en alimentos paleolÃ­ticos, excluyendo granos y procesados.']).

% Lista ampliada de saludos (saludos)
saludos([hola, buenas, saludos, hey, buenos]).

% Lista ampliada de preferencias (preferencias)
preferencias([quiero, gustaria, gusta, prefiero, deseo, anhelo]).

% Lista ampliada de despedidas (despedidas)
despedidas([adios, chao, hasta, cuidate, bye, adieu]).

% Lista ampliada de negaciones (negaciones)
negaciones([no, nunca, jamas, tampoco, never, imposible, nada, negativo]).

agradecimientos([gracias, agradezco]).


% Padecimiento: nombre, descripciÃ³n, dietas recomendadas.
padecimiento([dislipidemia, 'Problemas del control del colesterol', [baja_en_grasas, mediterranea]]).
padecimiento([hipercolesterolemia, 'Aumento de colesterol en la sangre', [vegana, vegetariana]]).
padecimiento([diabetes, 'AlteraciÃ³n en los niveles de azÃºcar en la sangre', [baja_en_grasas, mediterranea]]).
padecimiento([obesidad, 'Exceso de grasa corporal', [keto, baja_en_grasas]]).
padecimiento([desnutricion, 'Deficiencia de nutrientes', [proteica, carnivora]]).
padecimiento([intolerancia_gluten, 'Intolerancia al gluten', [gluten_free, paleo]]).

% Nivel de actividad: nombre, rango.
nivel_actividad([inicial, '0','1','2']).
nivel_actividad([intermedio, '3','4']).
nivel_actividad([avanzado, '5','6','7']).

%Actividades: nombre, descripciÃ³n.
actividad([natacion, 'Actividad acuÃ¡tica que trabaja todos los mÃºsculos del cuerpo.']).
actividad([correr, 'Actividad cardiovascular que mejora la resistencia y quema calorÃ­as.']).
actividad([ciclismo, 'Actividad cardiovascular que mejora la resistencia y fortalece las piernas.']).
actividad([yoga, 'Actividad que combina ejercicios de estiramiento y relajaciÃ³n.']).
actividad([pilates, 'Actividad que fortalece el core y mejora la flexibilidad.']).
actividad([crossfit, 'Actividad de alta intensidad que combina ejercicios de fuerza y cardio.']).
actividad([baile, 'Actividad cardiovascular que mejora la coordinaciÃ³n y quema calorÃ­as.']).
actividad([entrenamiento_funcional, 'Actividad que trabaja todos los mÃºsculos del cuerpo y mejora la resistencia.']).
actividad([zumba, 'Actividad cardiovascular que combina baile y ejercicios de tonificaciÃ³n.']).
actividad([patinaje, 'Actividad que mejora la resistencia y fortalece las piernas.']).
actividad([caminata, 'Actividad cardiovascular que mejora la resistencia y quema calorÃ­as.']).
actividad([pesas, 'Actividad que fortalece los mÃºsculos y mejora la resistencia.']).
actividad([futbol, 'Actividad cardiovascular que mejora la resistencia y la coordinaciÃ³n.']).
actividad([baloncesto, 'Actividad cardiovascular que mejora la resistencia y la coordinaciÃ³n.']).
actividad([voleibol, 'Actividad cardiovascular que mejora la resistencia y la coordinaciÃ³n.']).
actividad([tenis, 'Actividad cardiovascular que mejora la resistencia y la coordinaciÃ³n.']).
actividad([padel, 'Actividad cardiovascular que mejora la resistencia y la coordinaciÃ³n.']).
actividad([squash, 'Actividad cardiovascular que mejora la resistencia y la coordinaciÃ³n.']).
actividad([rugby, 'Actividad cardiovascular que mejora la resistencia y la coordinaciÃ³n.']).
actividad([hockey, 'Actividad cardiovascular que mejora la resistencia y la coordinaciÃ³n.']).
actividad([badminton, 'Actividad cardiovascular que mejora la resistencia y la coordinaciÃ³n.']).
actividad([escalada, 'Actividad que trabaja la fuerza y la resistencia.']).
actividad([surf, 'Actividad acuÃ¡tica que mejora la resistencia y la coordinaciÃ³n.']).
actividad([boxeo, 'Actividad que mejora la resistencia y la coordinaciÃ³n.']).
actividad([karate, 'Actividad que mejora la resistencia y la coordinaciÃ³n.']).
actividad([atletismo, 'Actividad de correr rapido']).


calorias(['1800','2000','2200','2300','2400','2500']).
alimentos([mariscos,carne,carnes,vegetales,lacteos]).

dieta([mariscos, vegetales, keto, obesidad, '2000', ciclismo, correr, natacion, avanzado, '5','6','7', 'Plan de Alimentacion:
Desayuno: 2 huevos
Merienda 1: 10 almendras.
Almuerzo: Pollo a la parrilla (150g) con espinacas (1 taza) y aceite de oliva.
Merienda 2: Yogur griego (100g) con nueces.
Cena: Pescado blanco (120g) con brocoli (1 taza) y aceite de coco.
Notas: Tomar minimo 3 litros diarios de agua']).

dieta([vegetales,lacteos,proteica, obesidad, '2500', pesas, correr, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: 4 claras de huevo con 1 aguacate.
Merienda 1: 30g de almendras.
Almuerzo: Pollo a la parrilla (200g) con arroz integral (1 taza).
Merienda 2: Batido de proteínas con plátano y mantequilla de maní.
Cena: Bistec (200g) con puré de patatas al horno.
Notas: Tomar mínimo 4 litros diarios de agua.']).

dieta([carnes,carne,mariscos,vegetariana, hipercolesterolemia, '1800', yoga, pilates, intermedio, '3','4', 'Plan de Alimentacion:
Desayuno: Tostada de pan integral con aguacate y tomate.
Merienda 1: 15 almendras.
Almuerzo: Ensalada de garbanzos con espinacas, aguacate, y semillas de chía.
Merienda 2: Pudín de chía con leche de almendras y nueces.
Cena: Salteado de tofu con brócoli, zanahorias, y pimientos al vapor.
Notas: Tomar mínimo 2 litros diarios de agua']).

dieta([vegetales,mariscos,alcalina, diabetes, '2200', caminata, patinaje, inicial, '0','1','2', 'Plan de Alimentacion:
Desayuno: Smoothie de fresas, plátano y leche de almendra.
Merienda 1: 10 nueces.
Almuerzo: Ensalada de atún (120g) con lechuga, aguacate y maíz.
Merienda 2: Manzana con mantequilla de almendra.
Cena: Pollo al horno (150g) con puré de batata.
Notas: Tomar mínimo 3 litros diarios de agua.']).

dieta([carne,carnes,lacteos,baja_en_grasas, dislipidemia, '2000', baile, zumba, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: Avena con frutas frescas y semillas de chía.
Merienda 1: 1 rebanada de pan integral con aguacate.
Almuerzo: Ensalada de quinoa con camarones (100g) y verduras.
Merienda 2: Zanahorias con hummus.
Cena: Filete de pescado (120g) con espárragos.
Notas: Tomar mínimo 2.5 litros diarios de agua.']).

dieta([carne,carnes,lacteos,mariscos,vegana, hipercolesterolemia, '1800', entrenamiento_funcional, yoga, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: Avena con leche de almendra, frutos rojos y semillas de lino.
Merienda 1: Batido de proteÃ­nas veganas con espinacas.
Almuerzo: Tofu (150g) con quinoa y brÃ³coli.
Merienda 2: Hummus con zanahorias crudas.
Cena: Lentejas estofadas con espinacas y tomate.
Notas: Tomar mÃ­nimo 2 litros diarios de agua.']).

dieta([vegetales,lacteos,mediterranea, diabetes, '2200', caminata, patinaje, inicial, '0','1','2','Plan de Alimentacion:
Desayuno: Yogur de coco con nueces y fresas.
Merienda 1: 10 almendras.
Almuerzo: Ensalada con atún, aguacate, quinoa y maíz.
Merienda 2: 1 manzana.
Cena: Salmón a la plancha (150g) con puré de patata.
Notas: Tomar mínimo 3 litros diarios de agua.']).

dieta([vegetales,carnivora, desnutricion, '2500', pesas, crossfit, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: 4 claras de huevo con 200g de carne de res.
Merienda 1: 30g de nueces.
Almuerzo: Filete de res (200g) con espinacas.
Merienda 2: 100g de jamÃ³n serrano.
Cena: Chuleta de cerdo (250g) con espÃ¡rragos.
Notas: Tomar mÃ­nimo 3 litros diarios de agua.']).

dieta([carnes,gluten_free, intolerancia_gluten, '2000', baile, zumba, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: Pan sin gluten con aguacate y tomate.
Merienda 1: 10 almendras.
Almuerzo: Ensalada de garbanzos (150g) con espinacas y pepino.
Merienda 2: Yogur sin gluten con nueces.
Cena: Tofu (120g) con brócoli al vapor.
Notas: Tomar mínimo 3 litros diarios de agua.']).

dieta([lacteos,paleo, intolerancia_gluten, '2000', baile, zumba, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: 2 huevos con espinacas y aguacate.
Merienda 1: 10 nueces.
Almuerzo: Tofu a la parrilla (150g) con brócoli y zanahorias.
Merienda 2: Batido de proteínas con plátano y espinacas.
Cena: Filete de garbanzos (200g) con ensalada de hojas verdes.
Notas: Tomar mínimo 3 litros diarios de agua.']).

% Dieta Keto - Diabetes, actividad intermedia, 2000 kcal
dieta([vegetales,keto, diabetes, '2000', caminata, pesas, intermedio,'3','4', 'Plan de Alimentacion:
Desayuno: 2 huevos con aguacate y champiñones.
Merienda 1: 10 nueces.
Almuerzo: Pollo a la parrilla (150g) con quinoa.
Merienda 2: Yogur griego sin azúcar (100g).
Cena: Salmón a la plancha (120g) con puré de patata.
Notas: Tomar mínimo 2.5 litros de agua.']).

% Dieta MediterrÃ¡nea - Dislipidemia, actividad avanzada, 2200 kcal
dieta([carne,carnes,mediterranea, dislipidemia, '2200', natacion, ciclismo, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: Avena con nueces y fresas.
Merienda 1: 1 rebanada de pan integral con tomate.
Almuerzo: Ensalada con garbanzos (150g), aceitunas y aguacate.
Merienda 2: Yogur griego bajo en grasa.
Cena: Tofu a la parrilla (150g) con verduras al vapor.
Notas: Tomar mínimo 3 litros de agua.']).

% Dieta Proteica - Hipercolesterolemia, actividad avanzada, 2500 kcal
dieta([lacteos,proteica, hipercolesterolemia, '2500', pesas, crossfit, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: 3 claras de huevo con aguacate.
Merienda 1: 20g de nueces.
Almuerzo: Tofu a la parrilla (200g) con quinoa (1 taza).
Merienda 2: Batido de proteínas con plátano y leche de almendra.
Cena: Hamburguesa de garbanzos (200g) con espárragos asados.
Notas: Tomar mínimo 4 litros diarios de agua.']).

% Dieta Paleo - Obesidad, actividad inicial, 1800 kcal
dieta([mariscos,paleo, obesidad, '1800', caminata, yoga, inicial,'0','1','2', 'Plan de Alimentacion:
Desayuno: 2 huevos con espinacas y aguacate.
Merienda 1: 10 almendras.
Almuerzo: Pollo a la parrilla (120g) con espárragos al vapor.
Merienda 2: Zanahorias crudas con hummus.
Cena: Tofu a la plancha (120g) con brócoli.
Notas: Tomar mínimo 2 litros de agua.']).

% Dieta Vegetariana - DesnutriciÃ³n, actividad intermedia, 2300 kcal
dieta([carne,carnes,vegetariana, desnutricion, '2300', pilates, entrenamiento_funcional, intermedio,'3','4', 'Plan de Alimentacion:
Desayuno: Avena con leche de almendra y frutos secos.
Merienda 1: 15 almendras.
Almuerzo: Ensalada de garbanzos con espinacas, aguacate y quinoa.
Merienda 2: Pudding de chía con nueces.
Cena: Hamburguesa de lentejas con espárragos.
Notas: Tomar mínimo 2.5 litros de agua.']).

% Dieta CarnÃ­vora - Diabetes, actividad avanzada, 2400 kcal
dieta([vegetales,carnivora, diabetes, '2400', pesas, ciclismo, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: 3 claras de huevo con 150g de carne de res.
Merienda 1: 20g de nueces.
Almuerzo: Bistec de res (200g) con puré de patatas.
Merienda 2: Jamón serrano (100g).
Cena: Filete de cerdo (200g) con arroz integral.
Notas: Tomar mínimo 3 litros de agua.']).

% Dieta Gluten-Free - Hipercolesterolemia, actividad intermedia, 2000 kcal
dieta([lacteos,gluten_free, hipercolesterolemia, '2000', baile, zumba, intermedio,'3','4', 'Plan de Alimentacion:
Desayuno: Tostada sin gluten con aguacate y tomate.
Merienda 1: 10 almendras.
Almuerzo: Ensalada de pollo (150g) con espinacas y pepino.
Merienda 2: Batido de plátano y mantequilla de almendra.
Cena: Pescado (120g) con verduras asadas.
Notas: Tomar mínimo 3 litros diarios de agua.']).

% Dieta Alcalina - Intolerancia al Gluten, actividad inicial, 1800 kcal
dieta([mariscos,alcalina, intolerancia_gluten, '1800', caminata, yoga, inicial,'0','1','2', 'Plan de Alimentacion:
Desayuno: Smoothie de espinacas, plátano y leche de almendra.
Merienda 1: 10 nueces.
Almuerzo: Ensalada de pollo (120g) con espinacas y aguacate.
Merienda 2: Manzana con mantequilla de almendra.
Cena: Pechuga de pollo al horno (150g) con calabacín.
Notas: Tomar mínimo 2 litros diarios de agua.']).

% Dieta Vegana - DesnutriciÃ³n, actividad avanzada, 2300 kcal
dieta([carne,carnes,vegana, desnutricion, '2300', entrenamiento_funcional, pesas, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: Avena con leche de almendra, plátano y nueces.
Merienda 1: Batido de proteínas veganas con espinacas.
Almuerzo: Garbanzos (150g) con quinoa y espinacas.
Merienda 2: Hummus con zanahorias crudas.
Cena: Frijoles negros con espinacas y tomate.
Notas: Tomar mínimo 3 litros diarios de agua.']).

% Dieta MediterrÃ¡nea - Obesidad, actividad inicial, 2000 kcal
dieta([mariscos,mediterranea, obesidad, '2000', caminata, yoga, inicial,'0','1','2', 'Plan de Alimentacion:
Desayuno: Yogur griego con nueces y fresas.
Merienda 1: 10 almendras.
Almuerzo: Ensalada con pollo a la parrilla, aguacate y espinacas.
Merienda 2: 1 manzana.
Cena: Filete de ternera (120g) con espárragos al vapor.
Notas: Tomar mínimo 2.5 litros diarios de agua.']).

%HASTA AQUI LAS DIETAS CAMBIADAS

% Dieta Alcalina - Hipercolesterolemia, actividad avanzada, 2200
dieta([alcalina, hipercolesterolemia, '2200', natacion, ciclismo, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: Smoothie de espinacas, plÃ¡tano, y leche de almendra.
Merienda 1: 10 almendras.
Almuerzo: Ensalada de garbanzos, aguacate y espinacas.
Merienda 2: Batido de proteÃ­nas vegano.
Cena: Pescado (150g) con brÃ³coli y espinacas.
Notas: Tomar mÃ­nimo 3 litros diarios de agua.']).

% Dieta Paleo - Intolerancia al Gluten, actividad intermedia, 2000
dieta([paleo, intolerancia_gluten, '2000', entrenamiento_funcional, yoga, intermedio,'3','4', 'Plan de Alimentacion:
Desayuno: 2 huevos con espinacas y aguacate.
Merienda 1: 10 nueces.
Almuerzo: Pollo a la parrilla (150g) con ensalada de espinacas y pepino.
Merienda 2: Manzana con crema de almendra.
Cena: Pescado a la parrilla (150g) con espÃ¡rragos asados.
Notas: Tomar mÃ­nimo 2.5 litros diarios de agua.']).

% Dieta CarnÃ­vora - Dislipidemia, actividad avanzada, 2500
dieta([carnivora, dislipidemia, '2500', pesas, ciclismo, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: 3 claras de huevo con carne de res (150g).
Merienda 1: 20g de nueces.
Almuerzo: Bistec de res (200g) con espinacas.
Merienda 2: JamÃ³n serrano con queso bajo en grasa.
Cena: Filete de cerdo (200g) con brÃ³coli.
Notas: Tomar mÃ­nimo 3.5 litros diarios de agua.']).

% Dieta Keto - Hipercolesterolemia, actividad intermedia, 1800
dieta([keto, hipercolesterolemia, '1800', caminata, yoga, intermedio,'3','4', 'Plan de Alimentacion:
Desayuno: 2 huevos revueltos con espinacas y aguacate.
Merienda 1: 10 almendras.
Almuerzo: Ensalada de pollo (120g) con pepino y aguacate.
Merienda 2: Yogur griego bajo en grasa.
Cena: SalmÃ³n a la parrilla (150g) con espÃ¡rragos.
Notas: Tomar mÃ­nimo 2.5 litros de agua.']).

% Dieta MediterrÃ¡nea - Hipercolesterolemia, actividad inicial, 2000
dieta([mediterranea, hipercolesterolemia, '2000', caminata, yoga, inicial,'0','1','2', 'Plan de Alimentacion:
Desayuno: Yogur griego con nueces y fresas.
Merienda 1: 1 tostada integral con aguacate.
Almuerzo: AtÃºn (150g) con ensalada de espinacas y tomate.
Merienda 2: 10 almendras.
Cena: Pescado al horno (120g) con brÃ³coli.
Notas: Tomar mÃ­nimo 2.5 litros de agua.']).

% Dieta Proteica - Diabetes, actividad avanzada, 2500
dieta([proteica, diabetes, '2500', crossfit, pesas, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: 3 claras de huevo con aguacate.
Merienda 1: Batido de proteÃ­nas con almendras.
Almuerzo: Pollo a la parrilla (200g) con quinoa y espinacas.
Merienda 2: Yogur griego sin azÃºcar.
Cena: Bistec (200g) con espÃ¡rragos asados.
Notas: Tomar mÃ­nimo 3 litros diarios de agua.']).

% Dieta Vegana - Intolerancia al Gluten, actividad avanzada, 2200
dieta([vegana, intolerancia_gluten, '2200', entrenamiento_funcional, ciclismo, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: Avena con leche de almendra, plÃ¡tano y nueces.
Merienda 1: Batido de proteÃ­nas veganas con espinacas.
Almuerzo: Tofu (150g) con quinoa y espinacas.
Merienda 2: Zanahorias crudas con hummus.
Cena: Lentejas con espinacas y tomate.
Notas: Tomar mÃ­nimo 3 litros diarios de agua.']).

% Dieta Baja en Grasas - Obesidad, actividad inicial, 1800
dieta([baja_en_grasas, obesidad, '1800', caminata, yoga, inicial,'0','1','2', 'Plan de Alimentacion:
Desayuno: Smoothie de espinacas con plÃ¡tano y leche de almendra.
Merienda 1: 10 nueces.
Almuerzo: Pollo a la parrilla (150g) con ensalada de pepino y espinacas.
Merienda 2: Yogur bajo en grasa.
Cena: Pescado a la plancha (120g) con espÃ¡rragos asados.
Notas: Tomar mÃ­nimo 2 litros diarios de agua.']).

% Dieta Alcalina - DesnutriciÃ³n, actividad intermedia, 2300
dieta([alcalina, desnutricion, '2300', pilates, caminata, intermedio,'3','4', 'Plan de Alimentacion:
Desayuno: Smoothie de espinacas, plÃ¡tano y leche de almendra.
Merienda 1: 15 almendras.
Almuerzo: Ensalada de garbanzos con espinacas y aguacate.
Merienda 2: Batido de proteÃ­nas vegano.
Cena: Pescado al horno (150g) con espÃ¡rragos.
Notas: Tomar mÃ­nimo 3 litros de agua.']).

% Dieta Paleo - Diabetes, actividad intermedia, 2200
dieta([paleo, diabetes, '2200', natacion, ciclismo, intermedio,'3','4', 'Plan de Alimentacion:
Desayuno: 2 huevos con espinacas y aguacate.
Merienda 1: 10 nueces.
Almuerzo: Pollo a la parrilla (150g) con ensalada de espinacas.
Merienda 2: Zanahorias crudas con hummus.
Cena: SalmÃ³n a la parrilla (150g) con espÃ¡rragos.
Notas: Tomar mÃ­nimo 3 litros diarios de agua.']).

% Dieta Keto - Diabetes, actividad avanzada, 2500
dieta([keto, diabetes, '2500', ciclismo, crossfit, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: 3 huevos revueltos con espinacas y aguacate.
Merienda 1: 20g de nueces.
Almuerzo: Pollo a la parrilla (200g) con espÃ¡rragos.
Merienda 2: Yogur griego sin azÃºcar con almendras.
Cena: SalmÃ³n al horno (200g) con brÃ³coli.
Notas: Tomar mÃ­nimo 3.5 litros diarios de agua.']).

% Dieta Vegana - DesnutriciÃ³n, actividad inicial, 2300
dieta([vegana, desnutricion, '2300', caminata, yoga, inicial,'0','1','2', 'Plan de Alimentacion:
Desayuno: Smoothie de avena, espinacas y leche de almendra.
Merienda 1: 15 almendras.
Almuerzo: Ensalada de garbanzos con quinoa y espinacas.
Merienda 2: Batido de proteÃ­nas vegano.
Cena: Tofu (150g) con espÃ¡rragos y ensalada de espinacas.
Notas: Tomar mÃ­nimo 3 litros de agua.']).

% Dieta MediterrÃ¡nea - Obesidad, actividad intermedia, 2000
dieta([mediterranea, obesidad, '2000', pilates, caminata, intermedio,'3','4', 'Plan de Alimentacion:
Desayuno: Yogur griego con fresas y nueces.
Merienda 1: 10 almendras.
Almuerzo: AtÃºn a la parrilla (150g) con ensalada de espinacas.
Merienda 2: Manzana con crema de almendra.
Cena: Pescado al horno (150g) con brÃ³coli.
Notas: Tomar mÃ­nimo 2.5 litros de agua.']).

% Dieta Proteica - Dislipidemia, actividad avanzada, 2500
dieta([proteica, dislipidemia, '2500', crossfit, pesas, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: 3 claras de huevo con espinacas.
Merienda 1: Batido de proteÃ­nas con almendras.
Almuerzo: Bistec de res (200g) con quinoa y espinacas.
Merienda 2: Yogur griego bajo en grasa.
Cena: Pollo a la parrilla (200g) con espÃ¡rragos.
Notas: Tomar mÃ­nimo 3 litros diarios de agua.']).

% Dieta Baja en Grasas - Diabetes, actividad intermedia, 2000
dieta([baja_en_grasas, diabetes, '2000', yoga, natacion, intermedio, '3','4', 'Plan de Alimentacion:
Desayuno: Smoothie de plÃ¡tano y espinacas con leche de almendra.
Merienda 1: 10 nueces.
Almuerzo: Pollo a la parrilla (150g) con ensalada de espinacas.
Merienda 2: Manzana con crema de almendra.
Cena: Pescado al horno (120g) con brÃ³coli.
Notas: Tomar mÃ­nimo 2.5 litros diarios de agua.']).

% Dieta Alcalina - Intolerancia al Gluten, actividad avanzada, 2200
dieta([alcalina, intolerancia_gluten, '2200', ciclismo, natacion, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: Smoothie de espinacas, plÃ¡tano y leche de almendra.
Merienda 1: 15 almendras.
Almuerzo: Ensalada de garbanzos con espinacas y pepino.
Merienda 2: Batido de proteÃ­nas vegano.
Cena: Pescado a la parrilla (150g) con brÃ³coli y espinacas.
Notas: Tomar mÃ­nimo 3 litros de agua.']).

% Dieta CarnÃ­vora - Hipercolesterolemia, actividad inicial, 2300
dieta([carnivora, hipercolesterolemia, '2300', caminata, yoga, inicial,'0','1','2', 'Plan de Alimentacion:
Desayuno: 3 claras de huevo con carne de res (150g).
Merienda 1: 20g de nueces.
Almuerzo: Pollo a la parrilla (200g) con espinacas.
Merienda 2: JamÃ³n serrano con queso bajo en grasa.
Cena: Filete de cerdo (200g) con brÃ³coli.
Notas: Tomar mÃ­nimo 3 litros diarios de agua.']).

% Dieta MediterrÃ¡nea - DesnutriciÃ³n, actividad avanzada, 2500
dieta([mediterranea, desnutricion, '2500', ciclismo, pesas, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: Avena con fresas, nueces y leche de almendra.
Merienda 1: 15 almendras.
Almuerzo: AtÃºn a la parrilla (200g) con ensalada de espinacas.
Merienda 2: Yogur griego con nueces.
Cena: Pescado al horno (200g) con espÃ¡rragos.
Notas: Tomar mÃ­nimo 3.5 litros diarios de agua.']).

% Dieta Keto - Dislipidemia, actividad intermedia, 2000
dieta([keto, dislipidemia, '2000', yoga, pilates, intermedio, '3','4', 'Plan de Alimentacion:
Desayuno: 2 huevos revueltos con aguacate.
Merienda 1: 10 almendras.
Almuerzo: Ensalada de pollo (150g) con espinacas y pepino.
Merienda 2: Yogur griego bajo en grasa.
Cena: SalmÃ³n a la parrilla (150g) con espÃ¡rragos.
Notas: Tomar mÃ­nimo 2.5 litros de agua.']).

% Dieta Vegana - Diabetes, actividad avanzada, 2200
dieta([vegana, diabetes, '2200', crossfit, entrenamiento_funcional, avanzado,'5','6','7', 'Plan de Alimentacion:
Desayuno: Smoothie de avena, plÃ¡tano y leche de almendra.
Merienda 1: 15 almendras.
Almuerzo: Ensalada de garbanzos con espinacas.
Merienda 2: Batido de proteÃ­nas vegano.
Cena: Tofu (150g) con espÃ¡rragos asados y brÃ³coli.
Notas: Tomar mÃ­nimo 3 litros diarios de agua.']).

dieta_predefinida([carnivora, hipercolesterolemia, '2300', caminata, yoga, inicial, '0','1','2', 'Plan de Alimentacion:
Desayuno: 3 claras de huevo con carne de res (150g).
Merienda 1: 20g de nueces.
Almuerzo: Pollo a la parrilla (200g) con espinacas.
Merienda 2: JamÃ³n serrano con queso bajo en grasa.
Cena: Filete de cerdo (200g) con brÃ³coli.
Notas: Tomar mÃ­nimo 3 litros diarios de agua.']).
