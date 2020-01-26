program customer_db

use types

	implicit none

	integer, parameter :: max_size = 100

	logical, external :: lt_last
	logical, external :: lt_city
	logical, external :: lt_zip


	type(personal_info), dimension(max_size) :: customers

	integer :: choice
	logical :: exceed = .FALSE.


	character(len=20) :: filename
	character(len=80) :: msg
	integer :: i
	integer :: nvals=0
	integer :: status
	type(personal_info) :: temp

	write (*,*) 'Enter the file name having customers info : '
	read (*,'(A20)') filename

	open (unit=9, file=filename, status='old', &
		iostat=status, iomsg=msg)

	if ( status == 0 ) then
		do
			read (9, 1010, iostat=status) temp
			1010 format (A12,1X,A1,1X,A12,1X,A26,1X,A2,1X,A12,1X,I5)
			if ( status /= 0 ) exit
			nvals = nvals + 1
			size: if ( nvals <= max_size ) then
				customers(nvals) = temp
			else
				exceed = .TRUE.
			end if size
		end do

		if ( exceed ) then
			write (*,*) 'Maximum array size exceeded'
		end if
	end if

	write (*,1040) ( customers(i), i=1, nvals )
 	1040 format (A12,1X,A1,1X,A12,1X,A26,1X,A12,1X,A2,1X,I5)
 	write (*,1050) ( customers(i)%city, i=1, nvals )
 	1050 format (A26)


!		else
! 			write (*,1030)
! 			1030 format ('Enter way to sort database : ',/, &
! 				'  1 -- By last name  ',/, &
! 				'  2 -- By city       ',/, &
! 				'  3 -- By zip code   ')
! 			read (*,*) choice

! 			select case ( choice )
! 			case ( 1 )
! 				call sort_database(customers, nvals, lt_last)
! 			case ( 2 )
! 				call sort_database(customers, nvals, lt_city)
! 			case ( 3 )
! 				call sort_database(customers, nvals, lt_zip)
! 			case default
! 				write (*,*) 'Invalid choice entered!'
! 			end select

! 			write (*,'(A)') 'The sorted database values are : '
! 			write (*,1040) ( customers(i), i=1, nvals )
! 			1040 format (A12,1X,A1,1X,A12,1X,A26,1X,A12,1X,A12,1X,I5)
! 		end if
! 	else 
! 		write (*,1050) msg
! 		1050 format ('File open failed : ', A)
! 	end if			

end program customer_db
! !----------------------------------------------------
! subroutine sort_database(array, n, lt_fun)

! use types

! implicit none

! 	integer, intent(in) :: n
! 	type(personal_info), dimension(n), intent(inout) :: array

! 	logical, external :: lt_fun

! 	integer :: i
! 	integer :: iptr
! 	integer :: j
! 	type(personal_info) :: temp

! 	do i=1, n-1
! 		iptr = i
! 		do j=i+1, n
! 			if ( lt_fun(array(j),array(iptr)) ) then
! 				iptr = j
! 			end if
! 		end do

! 		if ( i /= iptr ) then
! 			temp = array(i)
! 			array(i) = array(iptr)
! 			array(iptr) = temp
! 		end if
! 	end do
! end subroutine sort_database
! !-----------------------------------------------------
! logical function lt_last(a,b)

! use types

! implicit none

! type(personal_info), intent(in) :: a,b

! lt_last = LLT(a%last, b%last)

! end function lt_last

! logical function lt_city(a,b)

! use types

! implicit none

! type(personal_info), intent(in) :: a,b

! lt_city = LLT(a%city, b%city)

! end function lt_city

! logical function lt_zip(a,b)

! use types

! implicit none

! type(personal_info), intent(in) :: a,b

! lt_zip = a%zip < b%zip

! end function lt_zip


