a = [1,2,3]
b = ["a","b","c"]

l = list(zip(a,b))
print(l)

c, d = zip(*l)
print([*c],[*d])

e =  [['Product', 'Q', 'QA', 'Status'], 
      ['PS001', 500, 200, 'Good'], ['PS002', 400, 100, 'Bad']]
list(dict(zip(e[0],i)) for i in e[1:])

