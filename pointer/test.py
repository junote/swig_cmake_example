import example

# First create some objects using the pointer library.
a = example.new_intp()
b = example.new_intp()
c = example.new_intp()
example.intp_assign(a, 3)
example.intp_assign(b, 4)
# Call the add() function with some pointers
example.add(a, b, c)
# Now get the result
r = example.intp_value(c)
print(f"3 + 4 = {r}")
# Clean up the pointers
example.delete_intp(a)
example.delete_intp(b)
example.delete_intp(c)

# Now try the typemap library
# This should be much easier. Now how it is no longer
# necessary to manufacture pointers.
r = example.sub(37, 42)
print(f"37 - 42 = {r}")

# Now try the version with multiple return values
q, r = example.divide(42, 37)
print(f"42 div 37 = {q} remind {r}")




