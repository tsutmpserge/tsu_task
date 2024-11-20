import os

def get_size(path):

    if os.path.isfile(path):
        return os.path.getsize(path)
    elif os.path.isdir(path):
        total_size = 0
        for dirpath, _, filenames in os.walk (path):
            for file in filenames:
                filepath = os.path.join(dirpath, file)
                try:
                    total_size += os.path.getsize(filepath)
                except FileNotFounderError:
                    pass
        return total_size
    return 0

def analyze_directory(directory="."):

    results = []
    for item in os.listdir(directory):
        full_path = os.path.join(directory, item)
        size = get_size(full_path)
        results.append((size, full_path))
    return results

def print_results(results):

    print(f"Анализ директории: {os.getcwd()}")
    print("---------------------------------------------")
    for size, path in sorted(results, key=lambda x: x[0], reverse=True):
        size_mb = size / (1024 * 1024)
        print(f"{size_mb:2f} MB - {path}")
    print("---------------------------------------------")
    print(f"Анализ завершён.")

if __name__ == "__main__":

    results = analyze_directory()
    print_results(results)
