program forall_practice

	implicit none

	real, dimension(10,10) :: I_10 = 0.
	integer :: i,j

	forall (i=1:10)
		I_10(i,i) = 1.0
	end forall

	write (*,'(10F4.1)') I_10
	write (*,'(/)')

	forall (i=1:10, j=1:10, I_10(i,j) /= 0)
		I_10(i,j) = 3*i*I_10(i,j)
	end forall

	write (*,'(10F4.1)') I_10

    
end program forall_practice
