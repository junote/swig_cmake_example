import example

print("creating objects")
c = example.Circle(10)
s = example.Square(10)

print(f"\nThere are {example.cvar.Shape_nshapes} shapes")

c.x = 20
c.y = 30

s.x = -10
s.y = 5



for obj in [c, s]:
    print(f"{obj}")
    print(f"position: {obj.x} {obj.y}")
    print(f"area: {obj.area()}")
    print(f"perimeter: {obj.perimeter()}")
    print('\n')


