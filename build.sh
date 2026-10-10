#!/usr/bin/env bash
# ==============================================================================
# Algoritmos y Estructuras en Aura Lang
# build.sh - Script de Construcción, Verificación y Ejecución
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

AURAC="${AURAC:-$(command -v aurac || echo "$HOME/.cargo/bin/aurac")}"
if [ ! -x "$AURAC" ]; then
    echo "❌ Error: compilador aurac no encontrado en '$AURAC'." >&2
    exit 1
fi

BUN="${BUN:-$(command -v bun || echo "$HOME/.bun/bin/bun")}"

COMMAND="${1:-build}"

case "$COMMAND" in
    clean)
        echo "🧹 Limpiando artefactos de compilación..."
        rm -rf dist bin
        echo "✓ Directorios dist/ y bin/ eliminados."
        exit 0
        ;;

    check)
        echo "🔍 Verificando tipos con el compilador aurac..."
        echo "--- Estructuras ---"
        "$AURAC" check src/structures/stack.aura
        "$AURAC" check src/structures/queue.aura
        "$AURAC" check src/structures/linked_list.aura
        "$AURAC" check src/structures/binary_search_tree.aura
        "$AURAC" check src/structures/heap.aura
        "$AURAC" check src/structures/hash_table.aura
        "$AURAC" check src/structures/trie.aura
        "$AURAC" check src/structures/graph.aura

        echo "--- Algoritmos ---"
        "$AURAC" check src/algorithms/sorting.aura
        "$AURAC" check src/algorithms/searching.aura
        "$AURAC" check src/algorithms/graphs.aura
        "$AURAC" check src/algorithms/dynamic_programming.aura
        "$AURAC" check src/algorithms/strings.aura

        echo "--- Main y Tests ---"
        "$AURAC" check src/main.aura
        "$AURAC" check tests/test_structures.aura
        "$AURAC" check tests/test_algorithms.aura
        "$AURAC" check tests/test_all.aura
        echo "✅ Todos los módulos superaron el análisis de tipos estático."
        exit 0
        ;;

    test)
        echo "🧪 Ejecutando suite global de pruebas (test_all.aura)..."
        "$AURAC" run tests/test_all.aura
        exit 0
        ;;

    test:structures)
        echo "🧪 Ejecutando suite de pruebas de estructuras de datos..."
        "$AURAC" run tests/test_structures.aura
        exit 0
        ;;

    test:algorithms)
        echo "🧪 Ejecutando suite de pruebas de algoritmos..."
        "$AURAC" run tests/test_algorithms.aura
        exit 0
        ;;

    run)
        shift || true
        if [ -f "bin/algorithms-aura" ]; then
            ./bin/algorithms-aura "$@"
        else
            "$AURAC" run src/main.aura "$@"
        fi
        exit 0
        ;;

    build|"")
        echo "================================================================="
        echo "  Compilando Algoritmos y Estructuras (Aura Lang Native Binary)"
        echo "================================================================="
        echo "• Compilador: $AURAC"
        echo "• Bundler:    $BUN"
        echo ""

        mkdir -p dist/structures dist/algorithms bin

        echo "▶ 1/2 Compilando módulos Aura a JavaScript/ES Modules..."
        "$AURAC" src/structures/stack.aura -o dist/structures/stack.mjs
        "$AURAC" src/structures/queue.aura -o dist/structures/queue.mjs
        "$AURAC" src/structures/linked_list.aura -o dist/structures/linked_list.mjs
        "$AURAC" src/structures/binary_search_tree.aura -o dist/structures/binary_search_tree.mjs
        "$AURAC" src/structures/heap.aura -o dist/structures/heap.mjs
        "$AURAC" src/structures/hash_table.aura -o dist/structures/hash_table.mjs
        "$AURAC" src/structures/trie.aura -o dist/structures/trie.mjs
        "$AURAC" src/structures/graph.aura -o dist/structures/graph.mjs

        "$AURAC" src/algorithms/sorting.aura -o dist/algorithms/sorting.mjs
        "$AURAC" src/algorithms/searching.aura -o dist/algorithms/searching.mjs
        "$AURAC" src/algorithms/graphs.aura -o dist/algorithms/graphs.mjs
        "$AURAC" src/algorithms/dynamic_programming.aura -o dist/algorithms/dynamic_programming.mjs
        "$AURAC" src/algorithms/strings.aura -o dist/algorithms/strings.mjs

        "$AURAC" src/main.aura -o dist/main.mjs

        if [ -x "$BUN" ]; then
            echo ""
            echo "▶ 2/2 Empaquetando ejecutable binario nativo independiente..."
            "$BUN" build --compile dist/main.mjs --outfile bin/algorithms-aura
            chmod +x bin/algorithms-aura
            rm -f bin/*.__aura_tmp* bin/*.go 2>/dev/null || true
            echo ""
            echo "✅ Binario nativo generado exitosamente en bin/algorithms-aura:"
            ls -lh bin/algorithms-aura
        else
            echo "ℹ bun no disponible, el proyecto puede ejecutarse con: aurac run src/main.aura"
        fi

        echo ""
        echo "================================================================="
        echo "  ¡Compilación completada! Puedes ejecutar:"
        echo "    ./bin/algorithms-aura"
        echo "    ./build.sh test"
        echo "================================================================="
        ;;

    help|--help|-h)
        echo "Algoritmos y Estructuras en Aura Lang — Gestor de Construcción"
        echo "Uso: ./build.sh [comando]"
        echo ""
        echo "Comandos:"
        echo "  build (defecto)    Compila módulos y genera binario independiente"
        echo "  run                Ejecuta el binario compilado o corre src/main.aura"
        echo "  test               Ejecuta las 16 pruebas automatizadas globales"
        echo "  test:structures    Ejecuta las 10 pruebas de estructuras de datos"
        echo "  test:algorithms    Ejecuta las 6 pruebas de algoritmos"
        echo "  check              Verifica tipos estáticos en todos los archivos"
        echo "  clean              Elimina dist/ y bin/"
        echo "  help               Muestra esta ayuda"
        ;;

    *)
        echo "Comando desconocido: $COMMAND. Ejecuta './build.sh help' para ver opciones."
        exit 1
        ;;
esac
