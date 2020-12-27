results = [1,2]
def main():
    def rice_grains():
        if len(results) < 65:
            new_value = results[len(results) - 1] + results[len(results) - 2]
            results.append(new_value)
            rice_grains()
    rice_grains()
    print(results)

main()
