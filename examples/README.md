# Ejemplos de Algoritmos en Aura Lang

Este directorio contiene **50 ejemplos ejecutables independientes** que demuestran el uso de los algoritmos implementados en el proyecto:

## Estructura de Ejemplos

### Ordenamiento (Sorting)
- [`01_bubble_sort.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/01_bubble_sort.aura) — Bubble Sort estándar.
- [`02_selection_sort.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/02_selection_sort.aura) — Selection Sort.
- [`03_insertion_sort.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/03_insertion_sort.aura) — Insertion Sort.
- [`04_merge_sort.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/04_merge_sort.aura) — Merge Sort recursivo O(n log n).
- [`05_quick_sort.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/05_quick_sort.aura) — Quick Sort con pivote.
- [`06_is_sorted.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/06_is_sorted.aura) — Verificación de si un arreglo está ordenado.
- [`07_clone_slice.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/07_clone_slice.aura) — Clonación segura de slices.
- [`08_sort_stats.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/08_sort_stats.aura) — Estructura y métricas de ordenamiento.
- [`09_sort_descending.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/09_sort_descending.aura) — Ordenamiento y reversa a descendente.
- [`10_sort_already_sorted.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/10_sort_already_sorted.aura) — Insertion Sort sobre arreglo casi ordenado.

### Búsqueda (Searching)
- [`11_linear_search.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/11_linear_search.aura) — Búsqueda lineal O(n).
- [`12_binary_search.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/12_binary_search.aura) — Búsqueda binaria O(log n).
- [`13_jump_search.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/13_jump_search.aura) — Jump Search por bloques.
- [`14_ternary_search.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/14_ternary_search.aura) — Ternary Search dividiendo en tercios.
- [`15_find_first_occurrence.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/15_find_first_occurrence.aura) — Primera aparición con elementos repetidos.
- [`16_find_last_occurrence.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/16_find_last_occurrence.aura) — Última aparición con elementos repetidos.
- [`17_search_ints.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/17_search_ints.aura) — Función idiomática estilo Go `SearchInts`.
- [`18_binary_search_not_found.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/18_binary_search_not_found.aura) — Manejo de valor no encontrado (-1).
- [`19_search_edges.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/19_search_edges.aura) — Búsqueda en los bordes del arreglo.
- [`20_search_and_sort_pipeline.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/20_search_and_sort_pipeline.aura) — Pipeline combinando QuickSort y BinarySearch.

### Algoritmos en Grafos (Graphs)
- [`21_graph_bfs.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/21_graph_bfs.aura) — Recorrido BFS (amplitud).
- [`22_graph_dfs.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/22_graph_dfs.aura) — Recorrido DFS (profundidad).
- [`23_graph_dijkstra.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/23_graph_dijkstra.aura) — Algoritmo de Dijkstra para caminos mínimos.
- [`24_graph_is_connected.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/24_graph_is_connected.aura) — Verificación de alcanzabilidad entre nodos.
- [`25_graph_shortest_path_unweighted.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/25_graph_shortest_path_unweighted.aura) — Camino más corto con pesos uniformes.
- [`26_graph_cycle_traversal.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/26_graph_cycle_traversal.aura) — BFS en grafo con ciclos.
- [`27_graph_disconnected_components.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/27_graph_disconnected_components.aura) — Nodos no conectados y detección.
- [`28_graph_star_topology.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/28_graph_star_topology.aura) — Topología en estrella centrada en un Hub.
- [`29_graph_line_topology.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/29_graph_line_topology.aura) — Topología lineal / camino continuo con DFS.
- [`30_graph_triangle_path.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/30_graph_triangle_path.aura) — Dijkstra eligiendo desvío óptimo frente a ruta directa.

### Programación Dinámica (Dynamic Programming)
- [`31_fibonacci_dp.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/31_fibonacci_dp.aura) — Fibonacci optimizado O(n) con memorización tabular.
- [`32_knapsack_01.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/32_knapsack_01.aura) — Mochila 0/1 estándar.
- [`33_longest_common_subsequence.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/33_longest_common_subsequence.aura) — Longest Common Subsequence (LCS).
- [`34_min_coin_change.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/34_min_coin_change.aura) — Cambio mínimo de monedas.
- [`35_max_subarray_sum.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/35_max_subarray_sum.aura) — Algoritmo de Kadane.
- [`36_fibonacci_series.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/36_fibonacci_series.aura) — Generación de secuencia de Fibonacci.
- [`37_knapsack_all_fit.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/37_knapsack_all_fit.aura) — Mochila con capacidad suficiente para todos los elementos.
- [`38_knapsack_tight_capacity.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/38_knapsack_tight_capacity.aura) — Mochila con restricciones estrictas de peso.
- [`39_lcs_identical_strings.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/39_lcs_identical_strings.aura) — LCS entre cadenas idénticas.
- [`40_kadane_all_positives.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/40_kadane_all_positives.aura) — Kadane con arreglo de valores positivos.

### Algoritmos sobre Cadenas (Strings)
- [`41_naive_pattern_search.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/41_naive_pattern_search.aura) — Búsqueda Naive de subsecuencias/patrones.
- [`42_rabin_karp_search.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/42_rabin_karp_search.aura) — Algoritmo Rabin-Karp con función hash deslizante.
- [`43_is_palindrome.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/43_is_palindrome.aura) — Detección de palíndromos.
- [`44_is_anagram.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/44_is_anagram.aura) — Detección de anagramas mediante conteo de frecuencias.
- [`45_reverse_string.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/45_reverse_string.aura) — Inversión de strings.
- [`46_levenshtein_distance.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/46_levenshtein_distance.aura) — Distancia de edición Levenshtein.
- [`47_pattern_search_not_found.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/47_pattern_search_not_found.aura) — Búsqueda de patrón ausente en texto.
- [`48_levenshtein_identical.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/48_levenshtein_identical.aura) — Distancia de Levenshtein entre cadenas iguales (distancia = 0).
- [`49_single_char_palindrome.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/49_single_char_palindrome.aura) — Casos base de palíndromos (1 caracter o vacíos).
- [`50_anagram_different_length.aura`](file:///Users/mavro/Projects/AuraProjects/algorithms-aura/examples/50_anagram_different_length.aura) — Descarte rápido de anagramas por longitud desigual.

## Cómo Ejecutar

Para ejecutar cualquiera de los ejemplos, utiliza el comando `aura run`:

```bash
aura run examples/01_bubble_sort.aura
aura run examples/23_graph_dijkstra.aura
aura run examples/35_max_subarray_sum.aura
```
