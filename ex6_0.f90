program array_practice

	implicit none

	integer :: i
	integer, dimension(10) :: j

	do i=1,8
		j(i) = 1
	end do

	write (*,110) j
	110 format (5I5)
    
end program array_practice
