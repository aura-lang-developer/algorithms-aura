# ⚡ Algoritmos y Estructuras de Datos en Aura Lang (Golang Style v0.2.0)

> Implementación canónica, modular y educativa de las principales **estructuras de datos** y **algoritmos fundamentales** en **Aura Lang**, adoptando el **estilo de desarrollo y arquitectura idiomática de Go (Golang)**: structs con métodos receptores (*receiver methods*), interfaces estructurales (duck-typing), constructores canónicos `New...()`, manejo explícito de errores (`Result<T, String>`), semántica de *slices*, y funciones exportadas en `PascalCase` con compatibilidad retroactiva total.

---

## 📋 Tabla de Contenidos

- [Filosofía y Estilo Golang en Aura](#-filosofía-y-estilo-golang-en-aura)
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
- [Suite de Pruebas Automatizadas (16/16 PASS)](#-suite-de-pruebas-automatizadas-1616-pass)

---

## 🐹 Filosofía y Estilo Golang en Aura

En esta versión (`v0.2.0`), el código sigue las convenciones del diseño de software en Go adaptadas a la sintaxis y semántica de Aura Lang:

1. **Constructores canónicos `New...()`**:
   Cada estructura cuenta con una función de inicialización segura que garantiza un estado inicial consistente:
   ```aura
   let stack = NewArrayStack();
   let queue = NewQueue();
   let heap  = NewMinHeap();
   let ht    = NewHashTable(16);
   ```

2. **Métodos con Receptor (*Receiver Methods*)**:
   Las operaciones están vinculadas a los structs mediante receptores, permitiendo sintaxis de invocación fluida orientada a objetos ligeros:
   ```aura
   stack.Push(42);
   let elem = stack.Pop();
   let count = stack.Len();
   ```

3. **Interfaces Estructurales**:
   Definición de contratos abstractos (`Stack`, `QueueInterface`, `LinkedList`, `SearchTree`, `PriorityQueue`, `MapInterface`, `PrefixTree`, `GraphInterface`) para desacoplar implementaciones de consumidores.

4. **Manejo Explícito de Errores y Resultados**:
   Patrón de retorno explícito con `Result<T, String>` (`Ok(val)` / `Err("descripción")`) y `Option<T>` (`Some(val)` / `None`), evitando excepciones silenciosas:
   ```aura
   match SearchInts(arr, target) {
     Ok(idx)  => println("Encontrado en índice: " + idx),
     Err(msg) => println("Error: " + msg),
   };
   ```

5. **Semántica de Slices y Nomenclatura Go**:
   - Operaciones de longitud con método `.Len()` y función estándar `len(slice)`.
   - Nombres exportados con capitalización `PascalCase` (`BubbleSort`, `LinearSearch`, `Dijkstra`).
   - Mantenimiento de envoltorios (*wrappers*) en minúsculas (`stackPush`, `queueEnqueue`, etc.) para compatibilidad total con código preexistente.

6. **Despacho Dinámico Determinista**:
   Cada struct incorpora una etiqueta interna `__aura_type` para garantizar el despacho de métodos seguro en el runtime generado.

---

## 🚀 Características Principales

1. **100% Aura Lang Nativo**: Tipado estático estricto, pattern matching exhaustivo y compilación a código JavaScript/ES Modules optimizado.
2. **Cero Dependencias Externas**: Algoritmos y estructuras implementados desde cero.
3. **Binario Nativo Autónomo**: Compilable a ejecutable independiente mediante `aurac` y `bun build --compile` con tiempo de arranque casi instantáneo.
4. **16 Pruebas Automatizadas (100% Exitosas)**: Validación rigurosa de invariantes estructurales, algorítmicas y de diseño Go.

---

## 📂 Estructura del Proyecto

```text
algorithms-aura/
├── aura.mod                               # Manifiesto oficial del módulo (v0.2.0)
├── README.md                              # Documentación técnica completa (estilo Go)
├── build.sh                               # Script automatizado de compilación, checks y tests
├── Makefile                               # Atajos estándar (make run, make test, make check)
│
├── src/
│   ├── main.aura                          # Punto de entrada interactivo con CLI y demostraciones
│   │
│   ├── structures/                        # 🏛️ Estructuras de Datos (Go Style)
│   │   ├── stack.aura                     # ArrayStack, Stack interface, NewArrayStack, Push/Pop
│   │   ├── queue.aura                     # Queue, Deque, CircularBuffer, QueueInterface
│   │   ├── linked_list.aura               # SinglyLinkedList, LinkedList interface, ADT IntList
│   │   ├── binary_search_tree.aura        # BinarySearchTree, SearchTree interface, recorridos
│   │   ├── heap.aura                      # MinHeap, PriorityQueue interface, HeapSort
│   │   ├── hash_table.aura                # HashTable, MapInterface, Chaining, HashKey
│   │   ├── trie.aura                      # Trie, PrefixTree interface, StartsWith
│   │   └── graph.aura                     # Graph, GraphInterface, lista de adyacencia
│   │
│   └── algorithms/                        # ⚡ Algoritmos Fundamentales (Go Style)
│       ├── sorting.aura                   # Bubble, Selection, Insertion, Merge, Quick + SortStats
│       ├── searching.aura                 # Linear, Binary, Jump, Ternary, Duplicados, SearchInts
│       ├── graphs.aura                    # BFS, DFS, Dijkstra, Conectividad
│       ├── dynamic_programming.aura       # Fibonacci, Mochila 0/1, LCS, Coins, Kadane
│       └── strings.aura                   # Naive, Rabin-Karp, Palíndromo, Levenshtein
│
├── tests/                                 # 🧪 Suites de Pruebas Unitarias
│   ├── test_structures.aura               # 10 tests de estructuras de datos (inc. Go paradigm)
│   ├── test_algorithms.aura               # 6 tests de familias de algoritmos (inc. Go paradigm)
│   └── test_all.aura                      # Ejecutor unificado (16/16 pruebas exitosas)
│
└── bin/
    └── algorithms-aura                    # Ejecutable binario nativo compilado (Mach-O)
```

---

## 🏛️ Estructuras de Datos Implementadas

### 1. Pila (Stack LIFO)
- **Archivo**: `src/structures/stack.aura`
- **Tipos e Interfaces**: `struct ArrayStack`, `interface Stack`.
- **Constructor**: `NewArrayStack() -> ArrayStack`, `NewStack() -> ArrayStack`.
- **Métodos**: `s.Push(val)`, `s.Pop() -> Option<Int>`, `s.Peek() -> Option<Int>`, `s.Len() -> Int`, `s.IsEmpty() -> Bool`, `s.Clear()`.
- **Aplicación Práctica**: `IsBalancedParentheses(expr)` para validación de sintaxis `()`, `[]`, `{}`.
- **Complejidad**: $O(1)$ amortizado en todas las operaciones clave.

### 2. Cola (Queue FIFO), Deque y Búfer Circular
- **Archivo**: `src/structures/queue.aura`
- **Tipos e Interfaces**: `struct Queue`, `struct Deque`, `struct CircularBuffer`, `interface QueueInterface`, `interface DequeInterface`.
- **Constructores**: `NewQueue()`, `NewDeque()`, `NewCircularBuffer(cap)`.
- **Métodos**:
  - `Queue`: `q.Enqueue(val)`, `q.Dequeue() -> Option<Int>`, `q.Peek() -> Option<Int>`, `q.Len()`, `q.IsEmpty()`.
  - `Deque`: `d.PushFront(val)`, `d.PushBack(val)`, `d.PopFront()`, `d.PopBack()`, `d.Len()`.
  - `CircularBuffer`: `cb.Write(val) -> Bool`, `cb.Read() -> Option<Int>`, `cb.IsFull()`, `cb.IsEmpty()`.
- **Complejidad**: $O(1)$ inserción y extracción.

### 3. Lista Simplemente Enlazada y Lista ADT Funcional
- **Archivo**: `src/structures/linked_list.aura`
- **Tipos e Interfaces**: `struct SinglyLinkedList`, `struct ListNode`, `interface LinkedList`, `type IntList = Nil | Cons`.
- **Constructores**: `NewSinglyLinkedList()`.
- **Métodos**: `l.Prepend(val)`, `l.Append(val)`, `l.ToSlice() -> []Int`, `l.Contains(val) -> Bool`, `l.Delete(val) -> Bool`, `l.Reverse()`, `l.Len()`.
- **Variante Funcional**: ADT recursivo con `cons(head, tail)`, `listLength(l)`, `listSum(l)`, `adtListContains(l, val)`.

### 4. Árbol Binario de Búsqueda (BST)
- **Archivo**: `src/structures/binary_search_tree.aura`
- **Tipos e Interfaces**: `struct BinarySearchTree`, `interface SearchTree`, `type BST = Empty | Node`.
- **Constructor**: `NewBinarySearchTree()`.
- **Métodos**: `t.Insert(val)`, `t.Search(val) -> Bool`, `t.Min() -> Option<Int>`, `t.Max() -> Option<Int>`, `t.InOrder() -> []Int`, `t.Len()`.
- **Recorridos Libres**: `inOrder(tree)`, `preOrder(tree)`, `postOrder(tree)`, `treeHeight(tree)`.

### 5. Montículo Binario (Min-Heap) y HeapSort
- **Archivo**: `src/structures/heap.aura`
- **Tipos e Interfaces**: `struct MinHeap`, `interface PriorityQueue`.
- **Constructor**: `NewMinHeap()`.
- **Métodos**: `h.Push(val)`, `h.Pop() -> Option<Int>`, `h.Peek() -> Option<Int>`, `h.Len() -> Int`, `h.IsEmpty() -> Bool`.
- **Algoritmo Derivado**: `HeapSort(arr: []Int) -> []Int` con garantía temporal estricta de $O(n \log n)$ usando *sift-down*.

### 6. Tabla Hash con Encadenamiento (Separate Chaining)
- **Archivo**: `src/structures/hash_table.aura`
- **Tipos e Interfaces**: `struct HashTable`, `struct HashEntry`, `struct HashBucket`, `interface MapInterface`.
- **Constructor**: `NewHashTable(cap: Int)`.
- **Métodos**: `ht.Put(key, val)`, `ht.Get(key) -> Option<String>`, `ht.Contains(key) -> Bool`, `ht.Delete(key) -> Bool`, `ht.Keys() -> []String`, `ht.Len() -> Int`.
- **Función Hash**: `HashKey(key, cap)` (algoritmo polinomial con primo 31).

### 7. Árbol de Prefijos (Trie)
- **Archivo**: `src/structures/trie.aura`
- **Tipos e Interfaces**: `struct Trie`, `struct TrieNode`, `interface PrefixTree`.
- **Constructor**: `NewTrie()`.
- **Métodos**: `t.Insert(word)`, `t.Search(word) -> Bool`, `t.StartsWith(prefix) -> Bool`, `t.Len() -> Int`.
- **Complejidad**: $O(L)$ para inserción y búsqueda, donde $L$ es la longitud de la cadena.

### 8. Grafo con Lista de Adyacencia
- **Archivo**: `src/structures/graph.aura`
- **Tipos e Interfaces**: `struct Graph`, `struct GraphEdge`, `struct GraphVertex`, `interface GraphInterface`.
- **Constructor**: `NewGraph()`.
- **Métodos**: `g.AddVertex(id, name) -> Int`, `g.AddEdge(u, v, weight, bidirectional)`, `g.GetNeighbors(u) -> []Int`, `g.GetDegree(u) -> Int`, `g.VertexCount() -> Int`.

---

## ⚡ Algoritmos Fundamentales

### 1. Algoritmos de Ordenamiento (Sorting)
- **Archivo**: `src/algorithms/sorting.aura`
- **Estructura de Diagnóstico**: `struct SortStats` con método `stats.Summary() -> String`.
- **Algoritmos Idiomáticos**:
  - `BubbleSort(arr)`: Con bandera de corte temprano.
  - `SelectionSort(arr)`: Selección mínima iterativa.
  - `InsertionSort(arr)`: Inserción en subarreglo ordenado ($O(n)$ en mejor caso).
  - `MergeSort(arr)`: Divide y vencerás recursivo estable.
  - `QuickSort(arr)`: Particionado eficiente en sub-bloques.
  - `IsSorted(arr)`: Verificación de invariante en tiempo lineal $O(n)$.

### 2. Algoritmos de Búsqueda (Searching)
- **Archivo**: `src/algorithms/searching.aura`
- **Algoritmos Idiomáticos**:
  - `LinearSearch(arr, target) -> Int`: Búsqueda secuencial.
  - `BinarySearch(arr, target) -> Int`: Búsqueda binaria iterativa.
  - `JumpSearch(arr, target) -> Int`: Búsqueda por saltos en bloques de $\lfloor\sqrt{n}\rfloor$.
  - `TernarySearch(arr, target) -> Int`: Particionado en tercios logarítmicos.
  - `FindFirstOccurrence(arr, target) -> Int` y `FindLastOccurrence(arr, target) -> Int`: Búsqueda de bordes en arreglos con duplicados.
  - `SearchInts(arr, target) -> Result<Int, String>`: Retorno idiomático de error cuando el elemento no existe.

### 3. Algoritmos de Grafos (BFS, DFS, Dijkstra)
- **Archivo**: `src/algorithms/graphs.aura`
- **Algoritmos**:
  - `BFS(graph, start) -> []Int`: Exploración en anchura por niveles.
  - `DFS(graph, start) -> []Int`: Exploración en profundidad exhaustiva.
  - `Dijkstra(graph, start) -> []Int`: Caminos más cortos para pesos no negativos.
  - `IsConnected(graph) -> Bool`: Verificación de alcanzabilidad global.

### 4. Programación Dinámica (Dynamic Programming)
- **Archivo**: `src/algorithms/dynamic_programming.aura`
- **Problemas Clásicos**:
  - `Fibonacci(n: Int) -> Int`: Cálculo en $O(n)$ tiempo y $O(1)$ memoria.
  - `Knapsack01(weights, values, capacity) -> Int`: Selección óptima con programación dinámica.
  - `LongestCommonSubsequence(text1, text2) -> Int`: Longitud de subsecuencia común más larga (LCS).
  - `MinCoinChange(coins, amount) -> Int`: Mínimo número de monedas para alcanzar un monto.
  - `MaxSubarraySum(arr) -> Int`: Algoritmo lineal de Kadane en $O(n)$ tiempo y $O(1)$ espacio.

### 5. Procesamiento de Cadenas (Strings)
- **Archivo**: `src/algorithms/strings.aura`
- **Algoritmos**:
  - `NaivePatternSearch(text, pattern) -> []Int`: Búsqueda de coincidencia por ventana deslizante.
  - `RabinKarpSearch(text, pattern) -> []Int`: Búsqueda por rolling hash polinomial.
  - `IsPalindrome(s) -> Bool`: Técnica de dos punteros en $O(n)$ tiempo y $O(1)$ espacio.
  - `IsAnagram(s1, s2) -> Bool`: Comparación de frecuencias de caracteres.
  - `ReverseString(s) -> String`: Inversión de caracteres.
  - `LevenshteinDistance(s1, s2) -> Int`: Matriz de operaciones de edición mínima.

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
- **Bun** (para empaquetado del binario autónomo): `~/.bun/bin/bun`.

### Comandos de Construcción (`./build.sh`)

```bash
# 1. Validación estática de tipos en todos los módulos (sin compilar)
./build.sh check

# 2. Ejecutar la suite completa de pruebas unitarias (16/16 tests)
./build.sh test

# 3. Compilar a JavaScript/ESM y empaquetar binario nativo independiente
./build.sh build

# 4. Ejecutar la demostración interactiva
./build.sh run
```

### Ejecución Directa con `aurac`

```bash
# Demostración interactiva CLI
aurac run src/main.aura

# Suite completa de pruebas
aurac run tests/test_all.aura
```

### Atajos con Makefile

```bash
make          # Compila el binario independiente (./bin/algorithms-aura)
make test     # Ejecuta la suite de pruebas unitarias completa
make check    # Valida el sistema de tipos estático
make run      # Ejecuta la demostración del CLI
make clean    # Limpia directorios generados (dist/ y bin/)
```

---

## 🧪 Suite de Pruebas Automatizadas (16/16 PASS)

El proyecto incluye dos suites con **16 pruebas unitarias rigurosas**:

```text
=================================================================
  SUITE DE PRUEBAS: ESTRUCTURAS DE DATOS EN AURA LANG (GO STYLE)
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
  [PASS] 10: Paradigma Golang (Constructores New..., Métodos con Receptor)
=================================================================
  ✨ ¡TODAS LAS PRUEBAS DE ESTRUCTURAS PASARON EXITOSAMENTE! (10/10)
=================================================================

=================================================================
  SUITE DE PRUEBAS: ALGORITMOS FUNDAMENTALES EN AURA LANG (GO STYLE)
=================================================================
  [PASS] 01: Algoritmos de Ordenamiento (Bubble, Selection, Insert, Merge, Quick)
  [PASS] 02: Algoritmos de Búsqueda (Linear, Binary, Jump, Ternary, Dups)
  [PASS] 03: Algoritmos de Grafos (BFS, DFS, Dijkstra, Conectividad)
  [PASS] 04: Programación Dinámica (Fibonacci, Knapsack, LCS, Coins, Kadane)
  [PASS] 05: Procesamiento de Cadenas (Naive, Rabin-Karp, Palindrome, Levenshtein)
  [PASS] 06: Paradigma Golang (PascalCase, Slices y Struct de Métricas)
=================================================================
  ✨ ¡TODAS LAS PRUEBAS DE ALGORITMOS PASARON EXITOSAMENTE! (6/6)
=================================================================

#################################################################
  🏆 RESULTADO FINAL: 16/16 PRUEBAS EXITOSAS (100% PASSED)
  ✨ Todas las estructuras y algoritmos cumplen con el estilo Golang.
#################################################################
```

---

## 📄 Licencia

Desarrollado bajo licencia MIT para la comunidad y el ecosistema de **Aura Lang**.
