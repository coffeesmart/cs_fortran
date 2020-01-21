program format_practice

	implicit none
    
	integer :: index=-12, junk=4, number=-12345

	WRITE (*,100) index, index, index+12, junk, number
	100 FORMAT (2I5, I10)


end program format_practice