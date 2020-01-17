program The_quadratic_eqn

	implicit none

	real :: a    ! coeff of x^2
	real :: b    ! coeff of x^1
	real :: c    ! coeff of x^0
	real :: D    ! discriminant
	real :: soln_1    ! solution 1
	real :: soln_2    ! solution 2
	real :: soln_real ! real part of solution
	real :: soln_comp ! complex part of solution

	write (*,*) 'Enter the coefficient of x^2 : '
	read (*,*) a
	write (*,*) 'Enter the coefficient of x^1 : '
	read (*,*) b
	write (*,*) 'Enter the coefficient of x^0 : '
	read (*,*) c
	write (*,*) 'You input ', a, 'x^2+', b, 'x+', c, '=0'

	D = b**2 - 4*a*c

	if (D > 0.) then
		soln_1 = (-b + sqrt(D))/(2.*a)
		soln_2 = (-b - sqrt(D))/(2.*a)
		write (*,*) 'The solutions are ', soln_1, ', ', soln_2
	else if (D == 0.) then
		soln_1 = (-b)/(2.*a)
		write (*,*) 'The solution is ', soln_1
	else
		soln_real = (-b)/(2.*a)
		soln_comp = sqrt(-D)/(2.*a)
		write (*,*) 'The solutions are ', soln_real, '+', soln_comp, 'i',&
		', ', soln_real, '-', soln_comp, 'i'
	end if

    
end program The_quadratic_eqn
