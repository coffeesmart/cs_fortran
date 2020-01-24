program implied_DO_loop

	implicit none
    
	real, dimension(5) :: a=[1,2,3,4,5]
	integer :: i

	write (*,'(A,5F4.1)') 'a = ', (a(i), i=1,5)

end program implied_DO_loop


