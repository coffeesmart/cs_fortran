program Stats_subroutines

	implicit none

	character(len=20) :: filename
	character(len=80) :: msg
	integer :: iostatus
	integer :: nvals = 0
	real :: value

	integer, parameter :: max_size = 20
	real, dimension(max_size) :: arr, temp_arr
	real :: max_val
	real :: min_val
	real :: avg_val
	real :: std_val
	real :: median_val


	write (*,*) 'Enter the name of input file : '
	read (*,*) filename
	write (*,'(2A)') 'The file name is : ', filename

	open (unit=3, file=filename, status='old', action='read', &
		iostat=iostatus, iomsg=msg)

	! if file open is ok.
	openif: if ( iostatus == 0 ) then

		readloop: do
			read (3,*,iostat=iostatus) value
			if (iostatus /= 0) exit
			nvals = nvals + 1
			arr(nvals) = value
		end do readloop

		if ( iostatus > 0 ) then
			write (*,'(A,I3)') 'Reading error occurred in line ', nvals+1
		else
			write (*,'(A,I3,1X,A)') 'End of file reached. There were', nvals, &
			'values in the file'
		end if

	else     ! open error
		write (*,'(A,I3)') 'Open error occurred, IOSTAT = ', iostatus
		write (*,'(A)')	trim(msg)
	end if openif

	close (unit=3)

	temp_arr = arr

	call rmax(arr, nvals, max_val)
	call rmin(arr, nvals, min_val)
	call avg_std(arr, nvals, avg_val, std_val)
	call median(temp_arr, nvals, median_val)

	write (*,'(A,F6.2)') 'max value is : ', max_val
	write (*,'(A,F6.2)') 'min value is : ', min_val
	write (*,'(A,F6.2)') 'avg value is : ', avg_val
	write (*,'(A,F6.2)') 'std value is : ', std_val
	write (*,'(A,F6.2)') 'median value is : ', median_val 
	! write (*, '(10F6.2)') arr

end program Stats_subroutines
!------------------------------------------------------------
subroutine rmax(array, n, max)

	implicit none

	integer, intent(in) :: n                   ! size of array
	real, dimension(n), intent(in) :: array    ! array
	real, intent(out) :: max                   ! max value

	integer :: i, i_max    ! index

	i_max = 1
	do i=1, n
		if ( array(i) > array(i_max) ) then
			i_max = i
		end if
	end do

	max = array(i_max)

end subroutine rmax

subroutine rmin(array, n, min)

	implicit none

	integer, intent(in) :: n                   ! size of array
	real, dimension(n), intent(in) :: array    ! array
	real, intent(out) :: min                   ! min value

	integer :: i, i_min    ! index

	i_min = 1
	do i=1, n
		if ( array(i) < array(i_min) ) then
			i_min = i
		end if
	end do

	min = array(i_min)

end subroutine rmin


subroutine avg_std(array, n, avg, std)

	implicit none

	integer, intent(in) :: n                   ! size of array
	real, dimension(n), intent(in) :: array    ! array
	real, intent(out) :: avg                   ! avg value
	real, intent(out) :: std                   ! std value

	integer :: i
	real :: sum=0, sum_2=0

	do i=1, n
		sum = sum + array(i)
		sum_2 = sum_2 + array(i)**2
	end do

	avg = sum / n
	std = sqrt((sum_2/n) - avg**2)

end subroutine avg_std


subroutine median(array, n, med)

	implicit none

	integer, intent(in) :: n                   ! size of array
	real, dimension(n), intent(inout) :: array    ! array
	real, intent(out) :: med                   ! median value

	integer :: i, i_min, j
	real :: temp

	do i=1, n-1
		i_min = i
		do j=i, n
			if (array(i_min) > array(j)) then
				i_min = j
			end if
		end do

		if (i /= j) then
			temp = array(i)
			array(i) = array(i_min)
			array(i_min) = temp
		end if
	end do

	if ( mod(n,2) == 0 ) then
		med = (array(n/2) + array(n/2+1))/2
	else if ( mod(n,2) == 1 ) then
		med = (array(floor(real(n)/2)+1))
	end if

end subroutine median