% Base de conocimientos: Personajes de Avengers 1 y 2
% Para consultar, carga el archivo y usa predicados como:
% ?- aparece(iron_man, avengers1).
% ?- personajes_por_pelicula(avengers2, Personaje).

% --- Hechos: Personajes (Alias, Nombre Real) ---
personaje(iron_man, 'Tony Stark').
personaje(captain_america, 'Steve Rogers').
personaje(thor, 'Thor Odinson').
personaje(hulk, 'Bruce Banner').
personaje(black_widow, 'Natasha Romanoff').
personaje(hawkeye, 'Clint Barton').
personaje(nick_fury, 'Nick Fury').
personaje(maria_hill, 'Maria Hill').
personaje(loki, 'Loki Laufeyson').
personaje(phil_coulson, 'Phil Coulson').
personaje(ultron, 'Ultron').
personaje(scarlet_witch, 'Wanda Maximoff').
personaje(quicksilver, 'Pietro Maximoff').
personaje(vision, 'Vision').
personaje(falcon, 'Sam Wilson').
personaje(war_machine, 'James Rhodes').
personaje(jarvis, 'J.A.R.V.I.S').

% --- Hechos: Bandos (Alias, Rol) ---
bando(iron_man, heroe).
bando(captain_america, heroe).
bando(thor, heroe).
bando(hulk, heroe).
bando(black_widow, heroe).
bando(hawkeye, heroe).
bando(nick_fury, shield).
bando(maria_hill, shield).
bando(phil_coulson, shield).
bando(loki, villano).
bando(ultron, villano).
bando(scarlet_witch, heroe). % Empieza villana, termina heroe (simplificado)
bando(quicksilver, heroe).
bando(vision, heroe).
bando(falcon, heroe).
bando(war_machine, heroe).

% --- Hechos: Apariciones (Alias, Pelicula) ---
% Avengers 1 (The Avengers)
aparece(iron_man, avengers1).
aparece(captain_america, avengers1).
aparece(thor, avengers1).
aparece(hulk, avengers1).
aparece(black_widow, avengers1).
aparece(hawkeye, avengers1).
aparece(nick_fury, avengers1).
aparece(maria_hill, avengers1).
aparece(loki, avengers1).
aparece(phil_coulson, avengers1).
aparece(jarvis, avengers1).

% Avengers 2 (Age of Ultron)
aparece(iron_man, avengers2).
aparece(captain_america, avengers2).
aparece(thor, avengers2).
aparece(hulk, avengers2).
aparece(black_widow, avengers2).
aparece(hawkeye, avengers2).
aparece(nick_fury, avengers2).
aparece(maria_hill, avengers2).
aparece(ultron, avengers2).
aparece(scarlet_witch, avengers2).
aparece(quicksilver, avengers2).
aparece(vision, avengers2).
aparece(falcon, avengers2).
aparece(war_machine, avengers2).
aparece(jarvis, avengers2).

% --- Reglas de Consulta ---

% Listar todos los personajes de una pelicula
personajes_por_pelicula(Pelicula, Personaje) :-
    aparece(Personaje, Pelicula).

% Buscar nombre real de un personaje
nombre_real(Alias, Nombre) :-
    personaje(Alias, Nombre).

% Listar villanos de una pelicula
villanos_en(Pelicula, Villano) :-
    aparece(Villano, Pelicula),
    bando(Villano, villano).

% Personajes que aparecen en ambas peliculas
aparece_en_ambas(Personaje) :-
    aparece(Personaje, avengers1),
    aparece(Personaje, avengers2).
