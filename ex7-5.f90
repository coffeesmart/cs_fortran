program sinc_prog

	implicit none

	real :: sinc
	real :: x_input

	write (*,*) 'Enter the value of x : '
	read (*,*) x_input

	write (*,'(/A,F8.3)') 'sinc(x) = ', sinc(x_input)


end program sinc_prog
!-----------------------------
function sinc(x)

	real, intent(in) :: x
	real :: sinc

	real, parameter :: eips = 1.0E-30

	if (abs(x) > eips) then
		sinc = sin(x)/x
	else
		sinc = 1
	end if

end function sinc