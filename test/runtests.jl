using ZeroBasedIndexing, Base.Test
zerobased()

x = [1, 2, 3]
@test x[0] == 1
x[1] = 5
@test x == [1, 5, 3]
