#!/bin/bash

analyze_size() {
    local path="$1"

    if [ -d "$path" ]; then
        local size=$(du -sh $path 2>/dev/null | cut -f1)
        echo "Директория: $path | Размер: $size"

    elif [ -f "$path" ]; then
        local size=$(du -sh $path 2>/dev/null | cut -f1)
        echo "Файл: $path | Размер: $size"
    fi
}

main() {
    echo "Анализ текущей директории: $(pwd)"
    echo "--------------------------------------"

    local results=()

    for item in *; do
        if [ -e "$item" ]; then
            results+=("$(analyze_size "$item")")
        fi
    done

    printf "%s\n" "${results[@]}" | sort -nr -k1 | cut -d' ' -f2-

    echo "--------------------------------------"
    echo "Анализ завершён."
}

main
