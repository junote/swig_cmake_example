import example

# Call some templated functions
print(example.maxint(3, 7))
print(example.maxdouble(3.14, 2.18))

# Create some class

iv = example.vecint(10)
dv = example.vecdouble(10)

for i in range(0, 10):
    iv.setitem(i, 2 * i)

for i in range(0, 10):
    dv.setitem(i, 1.0 / (i + 1))

sum = 0
for i in range(0, 10):
    sum = sum + iv.getitem(i)

print(f"vecint is {iv}")
print(f"vecint sum is {sum}")


sum = 0.0
for i in range(0, 10):
    sum = sum + dv.getitem(i)
print(f"vecdouble is {dv}")
print(f"vecdouble sum is {sum}")
