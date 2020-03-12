n = int(input("Nth Fibo?"))
n1 = 0
n2 = 1
for i in range(0,n):
        nf = n1 + n2
        n1 = n2
        n2 = nf
        print(i,nf)
