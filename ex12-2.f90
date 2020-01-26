program test_vectors

use vector_module

	implicit none

	type(vector) :: v1
	type(vector) :: v2

	write (*,*) 'Enter the first vector (x,y) : '
	read (*,*) v1%x, v1%y

	write (*,*) 'Enter the second vector (x,y) : '
	read (*,*) v2%x, v2%y

	write (*,1000) vector_add(v1,v2)
	1000 format('The sum of the points is (', F7.2, ', ', F7.2, ')')
	write (*,1100) vector_sub(v1,v2)
	1100 format('The difference of the points is (', F7.2, ', ', F7.2, ')') 

    
end program test_vectors
