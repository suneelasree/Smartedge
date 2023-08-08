def main():
    try:
        number = int(input("Enter a number: "))

        for i in range(number, 0, -1):
            output = ""

            if i % 5 == 0:
                output += "Agile"
            if i % 3 == 0:
                output += "Software"
            if not output:
                output = i

            print(output)

    except ValueError:
        print("Please enter a valid number.")


if __name__ == "__main__":
    main()
