def fizzbuzz_word():
    for i in range(50):
	    if i % 3 == 0 and i % 5 == 0:
	        print("fizzbuzz")
	        continue
	    elif i % 3 == 0:
	        print("fizz")
	        continue
	    elif i % 5 == 0:
	        print("buzz")
	        continue
	    print(i)


if __name__ == "__main__":
    fizzbuzz_word()







    