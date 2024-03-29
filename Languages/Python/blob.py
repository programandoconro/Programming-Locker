import numpy as np
import random

class Randcount:
    
    def __init__(self):
        pass

    def create(self):
        m = np.zeros((8,8))
        for i in range(8):
            for j in range(8):
                m[i,j] = random.randint(0,1)
        return m
    
class Blob:
    def __init__(self):
        pass

    def create(n):
        d = {i: {'x':[],'y':[],'bbox':()} for i in range(n)}
        return d

    def clear(d):
        return d.clear()

    def register(d,n):
        d.update({n:{'x':[],'y':[],'bbox':()}})
        return d

    def unregister(d,n):
        del d[n]
        return d

    def associate(dx,x,dy,y):
        
        lastx = {key:dx[key][-1] for key in dx}

        def equal_values():
            prev = -1
            for k in lastx:
                if prev == lastx[k]:
                    return True
                prev = lastx[k]
            
        if equal_values() is not True:
            rx = {key:abs(x - lastx[key]) for key in lastx}
            minx = min(rx, key=rx.get)
            
            return dx[minx].append(x)
        
        else:
            lasty = {key:dy[key][-1] for key in dy}
            ry = {key:abs(y - lasty[key]) for key in lasty}
            miny = min(ry, key=ry.get)
            
            return dx[miny].append(x)
    
    def counter(dx,count): 

        direction = {key:np.mean(np.diff(np.array(dx[key]))) for key in dx}

        for key in direction:

            if direction[key] > 0:
                count += 1
                print(" ======= IN ======= ")

            elif direction[key] < 0:
                count -= 1
                print(" ======= OUT ====== " )
            
            else:
                pass
        
        print("Count: " + str(count))
        
        return count





        
    

