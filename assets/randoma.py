import random

while True:
    with open("random_numbers.txt","w+") as f:
        data = f.write(str(random.randrange(1, 9)))

