program subroutine_practice

	implicit none

	real :: s1
	real :: s2
	real :: hypot

	write (*,*) 'Enter the length of side 1 : '
	read (*,*) s1
	write (*,*) 'Enter the length of side 2 : '
	read (*,*) s2

	! call subroutine
	call calc_hypotenuse(s1,s2,hypot)

	! write out hypotenuse
	write (*,1000) hypot
	1000 format ('The length of the hypotenuse is : ', F8.3)

    
end program subroutine_practice

!---------------------------------------------------!
	subroutine calc_hypotenuse(side_1, side_2, hypotenuse)

		! Data dictionary : declare calling parameter
		real, intent(in) :: side_1
		real, intent(in) :: side_2
		real, intent(out) :: hypotenuse

		! Data dictionary : declare local variable
		real :: temp

		! Calculate hypotenuse
		temp = side_1**2 + side_2**2
		hypotenuse = sqrt(temp)

	end subroutine calc_hypotenuse



