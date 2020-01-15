program my_first_program

	implicit none

	!  Purpose:
	!    ~

	! Declare the variables used in this program.
	integer :: i, j, k		! All variables are integers

	! Get two values to store in variables i and j
	write (*,*) 'Enter the numbers to multiply: '
	read (*,*) i, j

	! Multiply the numbers together
	k = i * j

	! Write out the result.
	write (*,*) 'Result = ', k


	! Finish up.
	error stop 'Error stop'
    
end program my_first_program