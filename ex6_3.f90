program sorting_data

	implicit none

	character(len=20) :: filename    ! input file name
	character(len=80) :: msg         ! error message

	integer :: nvals = 0             ! number of values read in
	integer :: status                ! I/O status
	integer :: i,i_min,j             ! index
	real :: value                    ! the real value read in
	integer, parameter :: max_size = 20 ! dimension max size
	real, dimension(max_size) :: arr_input ! input array
	real :: temp                     ! temporary value

	write (*,*) 'Please enter input file name :'
	read (*,*) filename
	write (*,'(2A)') 'The input file name is : ', filename    

	! Open the file, and check for errors on open.
	open (unit=3, file=filename, status='old', action='read', &
		iostat=status, iomsg=msg)
	openif: if (status == 0) then

		! open was ok. read values.
		readloop: do
			read (3,*,iostat=status) value
			if (status /= 0) exit
			nvals = nvals + 1
			arr_input(nvals) = value
			! write (*,1010) nvals, value
			! 1010 format ('Line', I6, ': Value = ', F10.4)
		end do readloop

		readif: if (status > 0) then    ! a READ error occurred
			write (*,1020) nvals + 1
			1020 format ('An error occurred reading line ', I6)
		else    ! the end of the data was reached.
			write (*,1030) nvals
			1030 format ('End of file reached. There were ', I6, &
				' values in the file.')
		end if readif

	else openif    ! open error
		write (*,1040) status
		1040 format ('error opening file : IOSTAT = ', I6)
		write (*,1050) TRIM(msg)
		1050 format (A)
	end if openif

	close (unit=3)

	sortloop1: do i=1,nvals-1
		! Find min_val
		i_min = i
		sortloop2: do j=i+1, nvals-1
			if (arr_input(j) < arr_input(i_min)) then
				i_min = j
			end if
		end do sortloop2

		swap: if (i /= i_min) then
			temp = arr_input(i)
			arr_input(i) = arr_input(i_min)
			arr_input(i_min) = temp
		end if swap

	end do sortloop1

	write (*,'(F6.1)') (arr_input(i), i = 1, nvals)


end program sorting_data
