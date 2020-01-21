program year_of_day

	implicit none

	integer :: day
	integer :: month
	integer :: year
	integer :: yo_day = 0
	integer :: i
	integer :: leap_year

	write (*,*) 'Enter the year(ex.2020) : '
	read (*,*) year
	write (*,*) 'Enter the month(ex.3) : '
	read (*,*) month
	write (*,*) 'Enter the day(ex.2) : '
	read (*,*) day

	if (mod(year,400)==0) then
		leap_year = 1
	else if (mod(year,100)==0) then
		leap_year = 0
	else if (mod(year,4)==0) then
		leap_year = 1
	else
		leap_year = 0
	end if

	do i=1, month-1
		! if (i==1 .or. i==3 .or. i==5 .or. i==7 .or. i==8 .or. i==10 .or. i==12) then
		! 	yo_day = yo_day + 31
		! else if (i==2) then
		! 	yo_day = yo_day + 28 + leap_year
		! else
		! 	yo_day = yo_day + 30
		! end if
		select case (i)
		case (1,3,5,7,8,10,12)
			yo_day = yo_day + 31
		case (2)
			yo_day = yo_day + 28 + leap_year
		case (4,6,9,11)
			yo_day = yo_day + 30
		end select

	end do

	yo_day = yo_day + day

	write (*,*) 'The year of the day is : ', yo_day

end program year_of_day
