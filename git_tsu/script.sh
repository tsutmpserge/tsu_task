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

    for item in *; do
        analyze_size "$item"
    done

    echo "--------------------------------------"
    echo "Анализ завершён."
}

main
