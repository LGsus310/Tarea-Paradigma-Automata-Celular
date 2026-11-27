# Autómata Celular – Reglas de Wolfram

## Descripción

Este proyecto implementa un autómata celular unidimensional en Haskell, utilizando las reglas de Wolfram, numeradas entre 0 y 255.

El autómata consiste en una fila de células que pueden estar vivas o muertas. Cada generación se obtiene aplicando una regla a cada célula, considerando su estado y los estados de sus vecinos izquierdo y derecho.

El programa utiliza bordes periódicos, por lo que las células de los extremos se consideran vecinas entre sí.

## Requisitos

- GHC (Glasgow Haskell Compiler).
- GNU Make.

## Compilación

Para compilar el programa, ejecutar desde la carpeta del proyecto:

```bash
make
```

Esto generará el ejecutable `prog`.

Para eliminar los archivos generados durante la compilación:

```bash
make clean
```

## Ejecución

El programa recibe tres argumentos desde la línea de comandos:

```bash
./prog <regla> <ancho> <generaciones>
```

Donde:

- **regla:** número de regla de Wolfram, entre 0 y 255.
- **ancho:** cantidad de células que tendrá cada generación.
- **generaciones:** cantidad de líneas que se mostrarán, incluyendo la generación inicial.

### Ejemplo

```bash
./prog 90 31 8
```

Este comando ejecuta el autómata utilizando la regla 90, con un ancho de 31 células y mostrando 8 generaciones.

## Funcionamiento

La generación inicial se crea con todas las células muertas, excepto una célula viva ubicada en el centro.

En cada paso, el programa calcula una nueva generación considerando las vecindades de tres células:

- Vecino izquierdo.
- Célula central.
- Vecino derecho.

La combinación de estos tres estados determina si la célula estará viva o muerta en la siguiente generación, según la regla de Wolfram seleccionada.

Los bordes son periódicos, por lo que la primera y la última célula se consideran vecinas.

## Representación

La salida del programa utiliza los siguientes caracteres:

- `#`: célula viva.
- Espacio: célula muerta.

Cada línea representa una generación del autómata.

## Validaciones

El programa verifica que:

- La regla esté dentro del rango de 0 a 255.
- El ancho sea mayor que 0.
- La cantidad de generaciones sea mayor que 0.
- Los argumentos ingresados sean números enteros.
- Se entreguen exactamente tres argumentos.

En caso de ingresar argumentos inválidos, el programa muestra un mensaje de error.

## Archivos del proyecto

- `main.hs`: contiene el punto de entrada del programa, lectura y validación de argumentos y ejecución de la simulación.
- `Automata.hs`: contiene la definición del autómata y las funciones encargadas de inicializarlo, aplicar las reglas, generar nuevas generaciones y mostrar los resultados.
- `Makefile`: permite compilar y limpiar los archivos generados.
- `README.md`: documentación del proyecto.
