#lightweight pycoin miner
#by arctic

import random
import os
import time
import string

loop = 1
pycoin = 0

#random string thing i found on stackoverflow
def id_generator(size=20, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for x in range(size))

while(loop == 1):
    print ("Pycoin Miner")
    print ("Number of pycoins:")
    print (pycoin)
    raw_input("Press Enter to mine...")

    os.system('cls')
    print "@(________)"
    time.sleep(.1)

    os.system('cls')
    print "@(_______)"
    time.sleep(.1)

    os.system('cls')
    print "@(______)"
    time.sleep(.1)

    os.system('cls')
    print "@(_____)"
    time.sleep(.1)

    os.system('cls')
    print "@(____)"
    time.sleep(.1)

    os.system('cls')
    print "@(___)"
    time.sleep(.1)

    os.system('cls')
    print "@(__)"
    time.sleep(.1)

    os.system('cls')
    print "@(_)"
    time.sleep(.1)

    os.system('cls')
    print "@()"
    time.sleep(.1)
    os.system('cls')

    n = 0;
    crypt = random.randrange(50,100)
    while (n <= crypt):
        print(id_generator())
        n+=1
        time.sleep(.1)
        os.system('cls')

    mined = random.randrange(1,3)
    pycoin += mined
