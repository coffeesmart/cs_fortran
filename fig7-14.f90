program test_quadf

	implicit none

	real :: quadf 
	real :: a, b, c, x

	WRITE (*,*) 'Enter quadratic coefficients a, b, and c: '
	READ (*,*) a, b, c
	WRITE (*,*) 'Enter location at which to evaluate equation: '
	READ (*,*) x
	! Write out result.
	WRITE (*,100) 'quadf(', x, ')= ', quadf(x,a,b,c)
	100 FORMAT (A,F10.4,A,F12.4)

end program test_quadf
