program the_factorial_function

	implicit none
    
	integer :: n 
	integer :: n_factorial=1 
	integer :: i

	write (*,*) 'Enter the n : '
	read (*,*) n

	do i=1, n
		n_factorial = n_factorial * i
	end do

	write (*,*) 'n! = ', n_factorial


end program the_factorial_function