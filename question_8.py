def fizzbuzz_word(x=50):
    f = open("fizzbuzz.txt", "w")
    for i in range(1, x+1):
        if i % 3 == 0 and i % 5 == 0:
            word = "fizzbuzz"
        elif i % 3 == 0:
            word = "fizz"
        elif i % 5 == 0:
            word = "buzz"
        else:
            word= str(i)
        f.write(word + '\n')
    f.close()

def fizzbuzz_word_reverse():
    f_one = open("fizzbuzz.txt", "r")
    f_two = open("fizzbuzz_reverse.txt", "w")
    lines = f_one.readlines()
    for line in lines:
        f_two.write(line[::-1])

    


if __name__ == "__main__":
    fizzbuzz_word()
    fizzbuzz_word_reverse()







    