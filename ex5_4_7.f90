program read_format
	
	implicit none

	integer :: i,j,k,l,m

	READ (*,30) i, j
	READ (*,30) k, l, m
	30 FORMAT (5I5)
    
end program read_format