program table

	implicit none

	integer :: i
	integer :: cube_i
	integer :: square_i
	real :: sq_root_i

	! Print the title of table on a new page.
	write (*,100)
	100 format (/T3,'Table of Square Roots, Squares, and Cubes'/)

	write (*,110)
	110 format (T3, 'Number', 3X, 'Square Roots', 3X, 'Squares', 3X, 'Cubes')

	write (*,120)
	120 format (T3, '======', 3X, '============', 3X, '=======', 3X, '====='/)
	
	do i=1, 10
		cube_i = i**3
		square_i = i**2
		sq_root_i = sqrt(real(i))
		write (*,130) i, sq_root_i, square_i, cube_i
		130 format (T3, I4, 5X, F8.2, 8X, I4, 6X, I4)
	end do
    
end program table
