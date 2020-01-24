program vector_subscript_practice

	implicit none

	INTEGER, DIMENSION(5) :: vec = [1, 2]
	REAL, DIMENSION(10) :: a = [1., -2., 3., -4., 5., -6., 7., -8., 9., -10.]
	real, dimension(5) :: b

	b = a(vec)

	write (*,'(5f5.1)') b

    
end program vector_subscript_practice
