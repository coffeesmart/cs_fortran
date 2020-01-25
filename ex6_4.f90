program median_find

	implicit none

	character(len=20) :: filename    ! input file name
	character(len=80) :: msg         ! error message

	integer :: nvals = 0             ! number of values read in
	integer :: status                ! I/O status
	integer :: i, i_min, j           ! index
	real :: value                    ! the real value read in
	integer, parameter :: max_size = 20 ! dimension max size
	real, dimension(max_size) :: arr    ! input array
	real :: temp
	real :: sum = 0
	real :: sum_sq = 0
	real :: mean
	real :: median
	real :: std

	write (*,*) 'Please enter input file name :'
	read (*,*) filename
	write (*,'(2A)') 'The input file name is : ', filename  

	open(unit=3, file=filename, status='old', action='read', &
		iostat=status, iomsg=msg)

	openif: if (status == 0) then
		readloop: do 
			read(3,*,iostat=status) value
			if (status /= 0) exit
			nvals = nvals + 1
			arr(nvals) = value
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

	sortloop1:do i=1, nvals-1
		i_min = i
		! find min_val
		findmin: do j=i+1, nvals
			if (arr(j) < arr(i_min)) then
				i_min = j
			end if
		end do findmin

		swap: if (i /= i_min) then
			temp = arr(i)
			arr(i) = arr(i_min)
			arr(i_min) = temp
		end if swap

	end do sortloop1

	! Calculate mean value
	sumdo: do i=1, nvals
		sum = sum + arr(i)
		sum_sq = sum_sq + arr(i)**2
	end do sumdo

	mean = sum / nvals

	write (*,'(A,2X,F6.2)') 'Mean value is : ', mean

	! Calculate median value
	if ( mod(nvals,2) == 0 ) then
		median = (arr(nvals/2) + arr(nvals/2+1))/2
		write (*,'(A,2X,F6.2)') 'Median value is : ', median
	else if ( mod(nvals,2) == 1) then
		median = arr(floor(real(nvals)/2)+1)
		write (*,'(A,2X,F6.2)') 'Median value is : ', median
	end if

	! Calculate std value
	std = sqrt((sum_sq/nvals - mean**2))
	write (*,'(A,2X,F6.2)') 'Standard deviation value is : ', std


end program median_find