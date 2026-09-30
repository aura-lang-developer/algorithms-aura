# ⚡ Algoritmos y Estructuras de Datos en Aura Lang

> Implementación canónica, modular y educativa de las principales **estructuras de datos** y **algoritmos fundamentales** en **Aura Lang**, aprovechando las capacidades del lenguaje: tipos algebraicos (ADTs), *pattern matching* exhaustivo, modelo de *slices* estilo Go, colecciones continuas en memoria y tipado estático seguro.

---

## 📋 Tabla de Contenidos

- [Características Principales](#-características-principales)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Estructuras de Datos Implementadas](#-estructuras-de-datos-implementadas)
  - [1. Pila (Stack LIFO)](#1-pila-stack-lifo)
  - [2. Cola (Queue FIFO), Deque y Búfer Circular](#2-cola-queue-fifo-deque-y-búfer-circular)
  - [3. Lista Simplemente Enlazada y Lista ADT Funcional](#3-lista-simplemente-enlazada-y-lista-adt-funcional)
  - [4. Árbol Binario de Búsqueda (BST)](#4-árbol-binario-de-búsqueda-bst)
  - [5. Montículo Binario (Min-Heap) y HeapSort](#5-montículo-binario-min-heap-y-heapsort)
  - [6. Tabla Hash con Encadenamiento (Separate Chaining)](#6-tabla-hash-con-encadenamiento-separate-chaining)
  - [7. Árbol de Prefijos (Trie)](#7-árbol-de-prefijos-trie)
  - [8. Grafo con Lista de Adyacencia](#8-grafo-con-lista-de-adyacencia)
- [Algoritmos Fundamentales](#-algoritmos-fundamentales)
  - [1. Algoritmos de Ordenamiento (Sorting)](#1-algoritmos-de-ordenamiento-sorting)
  - [2. Algoritmos de Búsqueda (Searching)](#2-algoritmos-de-búsqueda-searching)
  - [3. Algoritmos de Grafos (BFS, DFS, Dijkstra)](#3-algoritmos-de-grafos-bfs-dfs-dijkstra)
  - [4. Programación Dinámica (Dynamic Programming)](#4-programación-dinámica-dynamic-programming)
  - [5. Procesamiento de Cadenas (Strings)](#5-procesamiento-de-cadenas-strings)
- [Tabla Comparativa de Complejidades (Big-O)](#-tabla-comparativa-de-complejidades-big-o)
- [Guía de Compilación y Ejecución](#-guía-de-compilación-y-ejecución)
- [Suite de Pruebas Automatizadas](#-suite-de-pruebas-automatizadas)

---

## 🚀 Características Principales

1. **Pureza Idiomática en Aura Lang**: Código escrito siguiendo las mejores prácticas de Aura, con tipado estático estricto, manejo seguro de errores mediante `Result<T, E>`, constructores semánticos y funciones puras.
2. **Modelo Híbrido Golang + Rust**: Uso de *slices* nativos `[]T`, desestructuración con *pattern matching*, tipos suma recursivos y métodos explícitos.
3. **Cero Dependencias Externas**: Implementaciones desde cero de algoritmos clásicos y estructuras sin librerías de terceros.
4. **Binario Nativo Autónomo**: Compilable a ejecutable independiente mediante `aurac` y `bun build --compile` con tiempo de arranque casi instantáneo.
5. **Suite de Pruebas Automatizadas al 100%**: 14 tests unitarios integrados que verifican cada invariante algorítmica y estructural.

---

## 📂 Estructura del Proyecto

```text
algorithms-aura/
├── aura.mod                               # Manifiesto oficial del módulo Aura
├── README.md                              # Documentación técnica completa
├── build.sh                               # Script automatizado de compilación y pruebas
├── Makefile                               # Atajos estándar (make run, make test, etc.)
│
├── src/
│   ├── main.aura                          # Punto de entrada interactivo con CLI y demos
│   │
│   ├── structures/                        # 🏛️ Estructuras de Datos
│   │   ├── stack.aura                     # Pila (LIFO) y validador de paréntesis
│   │   ├── queue.aura                     # Cola (FIFO), Deque y Búfer Circular
│   │   ├── linked_list.aura               # Lista enlazada mutable y ADT funcional
│   │   ├── binary_search_tree.aura        # Árbol BST recursivo y recorridos
│   │   ├── heap.aura                      # Min-Heap, Cola de Prioridad y HeapSort
│   │   ├── hash_table.aura                # Tabla Hash con Separate Chaining
│   │   ├── trie.aura                      # Árbol de Prefijos (Trie)
│   │   └── graph.aura                     # Grafo ponderado con lista de adyacencia
│   │
│   └── algorithms/                        # ⚡ Algoritmos Fundamentales
│       ├── sorting.aura                   # Bubble, Selection, Insertion, Merge, Quick
│       ├── searching.aura                 # Linear, Binary, Jump, Ternary, Duplicados
│       ├── graphs.aura                    # BFS, DFS, Dijkstra, Conectividad
│       ├── dynamic_programming.aura       # Fibonacci, Mochila 0/1, LCS, Coins, Kadane
│       └── strings.aura                   # Naive, Rabin-Karp, Palíndromo, Levenshtein
│
├── tests/                                 # 🧪 Suites de Pruebas Unitarias
│   ├── test_structures.aura               # 9 tests para estructuras de datos
│   ├── test_algorithms.aura               # 5 tests para familias de algoritmos
│   └── test_all.aura                      # Ejecutor global unificado (14/14 tests)
│
└── bin/
    └── algorithms-aura                    # Ejecutable binario nativo compilado
```

---

## 🏛️ Estructuras de Datos Implementadas

### 1. Pila (Stack LIFO)
- **Archivo**: `src/structures/stack.aura`
- **Operaciones**: `push`, `pop`, `peek`, `isEmpty`, `stackSize`, `clear`.
- **Aplicación Práctica**: `isBalancedParentheses(expr)` para validación de sintaxis de corchetes, llaves y paréntesis balanceados.
- **Complejidad**: $O(1)$ en todas las operaciones clave.

### 2. Cola (Queue FIFO), Deque y Búfer Circular
- **Archivo**: `src/structures/queue.aura`
- **Variantes**:
  - `Queue`: Cola FIFO estándar con compactación amortizada.
  - `CircularBuffer`: Búfer de anillo con capacidad acotada en tiempo real.
  - `Deque`: Cola de doble extremo (`pushFront`, `pushBack`, `popFront`, `popBack`).
- **Complejidad**: $O(1)$ inserción y extracción.

### 3. Lista Simplemente Enlazada y Lista ADT Funcional
- **Archivo**: `src/structures/linked_list.aura`
- **Variantes**:
  - `SinglyLinkedList`: Basada en un pool contiguo de nodos en memoria con punteros a índices, permitiendo `slistAppend`, `slistPrepend`, `slistDelete`, `slistReverse` e iteración.
  - `IntList`: Tipo Suma Algebraico funcional (`Nil | Cons { head, tail }`) con funciones puras `listLength`, `listSum` y `adtListContains`.

### 4. Árbol Binario de Búsqueda (BST)
- **Archivo**: `src/structures/binary_search_tree.aura`
- **Representación**: Tipo Suma recursivo `Empty | Node { value, left, right }`.
- **Operaciones**:
  - Inserción y Búsqueda logarítmica.
  - Cálculo de Mínimo (`findMinBST`) y Máximo (`findMaxBST`).
  - Cálculo de Altura y Conteo total de nodos.
  - Recorridos: **In-Order** (ascendente), **Pre-Order** y **Post-Order**.
  - Eliminación de nodos con reemplazo por sucesor in-order.

### 5. Montículo Binario (Min-Heap) y HeapSort
- **Archivo**: `src/structures/heap.aura`
- **Operaciones**: `heapPush`, `heapPop`, `heapPeek`, `buildMinHeap` en $O(n)$ usando *sift-down*.
- **Algoritmo Derivado**: `heapSort(arr)` con garantía temporal estricta de $O(n \log n)$ y $O(n)$ espacio.

### 6. Tabla Hash con Encadenamiento (Separate Chaining)
- **Archivo**: `src/structures/hash_table.aura`
- **Diseño**: Arreglo de *buckets* con resolución de colisiones por lista de entradas contiguas.
- **Función Hash**: Hash polinomial de Horner con multiplicador primo (31).
- **Operaciones**: `put(key, val)`, `get(key)`, `containsKey(key)`, `removeKey(key)`, `getAllKeys()`.

### 7. Árbol de Prefijos (Trie)
- **Archivo**: `src/structures/trie.aura`
- **Diseño**: Pool de nodos caracter-a-caracter con bandera booleana `isEndOfWord`.
- **Operaciones**: Inserción de palabras en $O(L)$, búsqueda exacta en $O(L)$ y verificación de prefijos con `startsWith(prefix)` en $O(L)$ donde $L$ es la longitud de la cadena.

### 8. Grafo con Lista de Adyacencia
- **Archivo**: `src/structures/graph.aura`
- **Diseño**: Conjunto de vértices indexados con listas de aristas dirigidas o bidireccionales con peso numérico.
- **Operaciones**: `addVertex`, `addEdge`, `getNeighbors`, `getDegree`.

---

## ⚡ Algoritmos Fundamentales

### 1. Algoritmos de Ordenamiento (Sorting)
- **Archivo**: `src/algorithms/sorting.aura`
- **Algoritmos**:
  1. **Bubble Sort**: Burbujeo con corte temprano si no ocurren intercambios.
  2. **Selection Sort**: Selección del mínimo en cada pasada.
  3. **Insertion Sort**: Inserción en sub-arreglo ordenado ($O(n)$ en mejor caso).
  4. **Merge Sort**: Divide y vencerás recursivo estable con función `merge`.
  5. **Quick Sort**: Particionado *in-place* con pivote terminal.

### 2. Algoritmos de Búsqueda (Searching)
- **Archivo**: `src/algorithms/searching.aura`
- **Algoritmos**:
  1. **Linear Search**: $O(n)$ sobre colecciones desordenadas.
  2. **Binary Search**: $O(\log n)$ iterativo sobre colecciones ordenadas.
  3. **Jump Search**: $O(\sqrt{n})$ saltando por bloques de tamaño $\lfloor\sqrt{n}\rfloor$.
  4. **Ternary Search**: $O(\log_3 n)$ dividiendo el espacio en tres tercios.
  5. **Búsqueda de Rangos**: `findFirstOccurrence` y `findLastOccurrence` para encontrar límites en arreglos con duplicados.

### 3. Algoritmos de Grafos (BFS, DFS, Dijkstra)
- **Archivo**: `src/algorithms/graphs.aura`
- **Algoritmos**:
  1. **BFS (Breadth-First Search)**: Exploración por niveles con cola FIFO.
  2. **DFS (Depth-First Search)**: Exploración en profundidad exhaustiva con recursión.
  3. **Dijkstra**: Camino más corto desde un nodo origen a todos los demás vértices en grafos con pesos no negativos.
  4. **Conectividad**: Verificación de alcanzabilidad global mediante recorrido BFS.

### 4. Programación Dinámica (Dynamic Programming)
- **Archivo**: `src/algorithms/dynamic_programming.aura`
- **Problemas Clásicos**:
  1. **Fibonacci Tabulado**: Cálculo en $O(n)$ tiempo y $O(1)$ memoria.
  2. **Problema de la Mochila 0/1 (Knapsack)**: Selección óptima de elementos con pesos y valores para maximizar ganancia en $O(n \cdot W)$ tiempo y $O(W)$ espacio.
  3. **Subsecuencia Común Más Larga (LCS)**: Determinación de la longitud de coincidencia entre dos cadenas.
  4. **Cambio de Monedas (Coin Change)**: Mínima cantidad de monedas para alcanzar un valor dado.
  5. **Algoritmo de Kadane**: Suma máxima en un subarreglo continuo en tiempo lineal $O(n)$ y espacio $O(1)$.

### 5. Procesamiento de Cadenas (Strings)
- **Archivo**: `src/algorithms/strings.aura`
- **Algoritmos**:
  1. **Naive Pattern Search**: Búsqueda por ventana deslizante directa.
  2. **Rabin-Karp Search**: Búsqueda por hash rodante (*rolling hash*) con reducción de colisiones.
  3. **Verificación de Palíndromo**: Técnica de dos punteros en tiempo $O(n)$ y espacio $O(1)$.
  4. **Detección de Anagramas**: Comparación de histogramas de frecuencias de caracteres en $O(n)$.
  5. **Inversión de Cadena**: Reversión de caracteres.
  6. **Distancia de Levenshtein**: Matriz de edición para contar mínimas sustituciones, inserciones o borrados necesarios.

---

## 📊 Tabla Comparativa de Complejidades (Big-O)

| Estructura de Datos | Acceso | Búsqueda | Inserción | Eliminación | Espacio |
|---|---|---|---|---|---|
| **ArrayStack (Pila)** | $O(1)$ [peek] | $O(n)$ | $O(1)$ | $O(1)$ [pop] | $O(n)$ |
| **Queue (Cola FIFO)** | $O(1)$ [peek] | $O(n)$ | $O(1)$ | $O(1)$ [deq] | $O(n)$ |
| **CircularBuffer** | $O(1)$ | $O(n)$ | $O(1)$ | $O(1)$ | $O(K)$ |
| **SinglyLinkedList** | $O(n)$ | $O(n)$ | $O(1)$ [head] | $O(n)$ | $O(n)$ |
| **Binary Search Tree** | $O(\log n)$ | $O(\log n)$ | $O(\log n)$ | $O(\log n)$ | $O(n)$ |
| **Min-Heap** | $O(1)$ [min] | $O(n)$ | $O(\log n)$ | $O(\log n)$ | $O(n)$ |
| **HashTable (Chaining)**| — | $O(1)$ prom | $O(1)$ prom | $O(1)$ prom | $O(n + m)$ |
| **Trie (Prefijos)** | — | $O(L)$ | $O(L)$ | $O(L)$ | $O(\Sigma \cdot L)$ |

---

| Algoritmo | Mejor Caso | Promedio | Peor Caso | Espacio Auxiliar |
|---|---|---|---|---|
| **Bubble Sort** | $O(n)$ | $O(n^2)$ | $O(n^2)$ | $O(1)$ |
| **Selection Sort** | $O(n^2)$ | $O(n^2)$ | $O(n^2)$ | $O(1)$ |
| **Insertion Sort** | $O(n)$ | $O(n^2)$ | $O(n^2)$ | $O(1)$ |
| **Merge Sort** | $O(n \log n)$ | $O(n \log n)$ | $O(n \log n)$ | $O(n)$ |
| **Quick Sort** | $O(n \log n)$ | $O(n \log n)$ | $O(n^2)$ | $O(\log n)$ |
| **Heap Sort** | $O(n \log n)$ | $O(n \log n)$ | $O(n \log n)$ | $O(n)$ |
| **Linear Search** | $O(1)$ | $O(n)$ | $O(n)$ | $O(1)$ |
| **Binary Search** | $O(1)$ | $O(\log n)$ | $O(\log n)$ | $O(1)$ |
| **Jump Search** | $O(1)$ | $O(\sqrt{n})$ | $O(\sqrt{n})$ | $O(1)$ |
| **Dijkstra** | $O(V^2)$ | $O(V^2)$ | $O(V^2)$ | $O(V)$ |
| **Knapsack 0/1** | $O(n \cdot W)$ | $O(n \cdot W)$ | $O(n \cdot W)$ | $O(W)$ |
| **Kadane's Subarray**| $O(n)$ | $O(n)$ | $O(n)$ | $O(1)$ |

---

## 🛠️ Guía de Compilación y Ejecución

### Prerrequisitos

- **Compilador de Aura (`aurac`)**: Disponible en el PATH o en `~/.cargo/bin/aurac`.
- **Bun** (Opcional, para empaquetado nativo): `~/.bun/bin/bun`.

### Comandos Rápidos

```bash
# 1. Ejecución directa del CLI y demostraciones con aurac
aurac run src/main.aura

# 2. Ejecutar la suite global de 14 pruebas automatizadas
aurac run tests/test_all.aura

# 3. Compilación a binario nativo independiente
./build.sh build

# 4. Ejecución del binario nativo compilado
./bin/algorithms-aura

# 5. Verificación estática de tipos en todos los módulos
./build.sh check
```

### Uso con Makefile

```bash
make          # Compila el binario independiente
make run      # Ejecuta la demostración interactiva
make test     # Corre la suite de pruebas completa
make check    # Valida el sistema de tipos de todos los archivos
make clean    # Limpia artefactos generados (dist/ y bin/)
```

---

## 🧪 Suite de Pruebas Automatizadas

El proyecto incluye dos suites completas con **14 pruebas automatizadas**:

```text
=================================================================
  SUITE DE PRUEBAS: ESTRUCTURAS DE DATOS EN AURA LANG
=================================================================
  [PASS] 01: Pila LIFO (ArrayStack) y Verificación de Paréntesis
  [PASS] 02: Cola FIFO (Queue) y Deque de Doble Extremo
  [PASS] 03: Búfer Circular (Ring Buffer con límites fijos)
  [PASS] 04: Lista Enlazada (SinglyLinkedList & ADT Funcional)
  [PASS] 05: Árbol Binario de Búsqueda (BST & Recorridos)
  [PASS] 06: Montículo Binario (Min-Heap & HeapSort)
  [PASS] 07: Tabla Hash con Encadenamiento (Separate Chaining)
  [PASS] 08: Árbol de Prefijos (Trie / Prefix Matching)
  [PASS] 09: Grafo con Lista de Adyacencia y Grados

=================================================================
  SUITE DE PRUEBAS: ALGORITMOS FUNDAMENTALES EN AURA LANG
=================================================================
  [PASS] 01: Algoritmos de Ordenamiento (Bubble, Selection, Insert, Merge, Quick)
  [PASS] 02: Algoritmos de Búsqueda (Linear, Binary, Jump, Ternary, Dups)
  [PASS] 03: Algoritmos de Grafos (BFS, DFS, Dijkstra, Conectividad)
  [PASS] 04: Programación Dinámica (Fibonacci, Knapsack, LCS, Coins, Kadane)
  [PASS] 05: Procesamiento de Cadenas (Naive, Rabin-Karp, Palindrome, Levenshtein)

🏆 RESULTADO FINAL: 14/14 PRUEBAS EXITOSAS (100% PASSED)
```

---

## 📄 Licencia

Desarrollado bajo licencia MIT para la comunidad y el ecosistema de **Aura Lang**.
