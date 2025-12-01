% Calculadora en Prolog
% Para iniciar, carga este archivo y ejecuta el predicado: iniciar.

iniciar :-
    writeln('--- Calculadora en Prolog ---'),
    writeln('Nota: Al ingresar numeros u opciones, finalice siempre con un punto (.).'),
    menu.

menu :-
    nl,
    writeln('Seleccione una operacion:'),
    writeln('1. Suma (+)'),
    writeln('2. Resta (-)'),
    writeln('3. Multiplicacion (*)'),
    writeln('4. Division (/)'),
    writeln('5. Salir'),
    write('Opcion: '),
    catch(read(Opcion), _, (writeln('Entrada no valida.'), fail)),
    ejecutar(Opcion).

% Caso de salida
ejecutar(5) :-
    writeln('Gracias por usar la calculadora. Adios!'), !.

% Casos de operación válida
ejecutar(Opcion) :-
    member(Opcion, [1, 2, 3, 4]),
    !,
    pedir_numeros(X, Y),
    calcular(Opcion, X, Y, Resultado),
    mostrar_resultado(Resultado),
    menu.

% Caso de opción inválida
ejecutar(_) :-
    writeln('Error: Opcion no valida. Intente de nuevo.'),
    menu.

% Predicado para solicitar números con validación
pedir_numeros(X, Y) :-
    write('Ingrese el primer numero: '),
    catch(read(X), _, (writeln('Entrada invalida.'), fail)),
    number(X),
    write('Ingrese el segundo numero: '),
    catch(read(Y), _, (writeln('Entrada invalida.'), fail)),
    number(Y),
    !.

pedir_numeros(X, Y) :-
    writeln('Error: Debe ingresar valores numericos validos.'),
    pedir_numeros(X, Y).

% Lógica de las operaciones
calcular(1, X, Y, R) :- R is X + Y.
calcular(2, X, Y, R) :- R is X - Y.
calcular(3, X, Y, R) :- R is X * Y.
calcular(4, _, 0, 'Error: Division por cero no permitida.') :- !.
calcular(4, X, Y, R) :- R is X / Y.

% Mostrar resultados
mostrar_resultado(Resultado) :-
    number(Resultado),
    !,
    format('El resultado es: ~2f~n', [Resultado]).

mostrar_resultado(MensajeError) :-
    writeln(MensajeError).
