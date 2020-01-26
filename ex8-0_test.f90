program test_2Darray

	implicit none

	integer :: i,j,m,n
	integer, dimension(4,3) :: istat, mstat

	do i=1,4
		do j=1,3
			istat(i,j) = j
		end do
	end do

	do i=1,4
		do j=1,3
			mstat(i,j) = i
		end do
	end do

	write (*,*) istat
	write (*,'(/)')
	write (*,*) istat(1,1), istat(1,2), istat(1,3)
	write (*,'(/)')
	write (*,*) mstat
	write (*,'(/)')
	write (*,*) mstat(1,1), mstat(1,2), mstat(1,3)
	write (*,'(/)')
	write (*,*) shape(mstat)
    
end program test_2Darray
