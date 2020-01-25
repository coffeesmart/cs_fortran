program sort_subroutine

	implicit none

	character(len=20) :: filename
	character(len=80) :: msg

	integer :: status
	integer :: nvals = 0
	integer :: i
	real :: value

	integer, parameter :: max_size = 20
	real, dimension(max_size) :: arr


	write (*,*) 'Enter the input file name : '
	read (*,*) filename

	open (unit=3, file=filename, status='old', action='read', &
		iostat=status, iomsg=msg)

	! Case that open is ok.
	openif: if ( status ==0 ) then
		readloop: do
			read (3,*,iostat=status) value
			if ( status /= 0 ) exit
			nvals = nvals + 1
			arr(nvals) = value
		end do readloop

		readif: if ( status > 0 ) then
			write (*,1020) nvals + 1
			1020 format ('A reading error occurred at line ', I3)
		else
			write (*,1030) nvals
			1030 format ('End of file reached. There were ', I3, &
				' values in the file.')
		end if readif

	else openif    ! open error
		write (*,1040) status
		1040 format ('error opening file : IOSTAT = ', I6)
		write (*,1050) TRIM(msg)
		1050 format (A)
	end if openif

	close (unit=3)

	call sort(arr, nvals)

	write (*,'(/)')
	write (*,'(F6.1)') (arr(i), i=1, nvals)
    
end program sort_subroutine

subroutine sort(array, n)

	implicit none

	integer, intent(in) :: n       ! n of values in array
	real, dimension(n), intent(inout) :: array

	integer :: i, i_min, j         ! index
	real :: temp                   ! temporary value

	! Sort the array

	do i=1, n
		i_min = i

		do j=i, n
			if ( array(j) < array(i_min) ) then
				i_min = j
			end if
		end do 

		if ( i /= i_min ) then
			temp = array(i)
			array(i) = array(i_min)
			array(i_min) = temp
		end if
	end do

end subroutine sort

