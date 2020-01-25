program test_quadf

	implicit none

	real :: quadf 
	real :: a, b, d, x

	WRITE (*,*) 'Enter quadratic coefficients a, b, and c: '
	READ (*,*) a, b, d
	WRITE (*,*) 'Enter location at which to evaluate equation: '
	READ (*,*) x
	! Write out result.
	WRITE (*,100) 'quadf(', x, ')= ', quadf(x,a,b,d)
	100 FORMAT (A,F10.4,A,F12.4)

end program test_quadf


real function quadf(x,a,b,c)

implicit none

real, intent(in) :: x
real, intent(in) :: a
real, intent(in) :: b
real, intent(in) :: c

quadf = a*x**2 + b*x + c

end function quadf