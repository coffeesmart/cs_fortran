real function ave_value(func, first_value, last_value, n)

	implicit none

	real, external :: func           ! Function to be evaluated
	real, intent(in) :: first_value
	real, intent(in) :: last_value
	integer, intent(in) :: n

	real :: delta
	integer :: i
	real :: sum

	! Get step size
	delta = (last_value - first_value) / real(n-1)

	! Accumulate sum
	sum = 0
	do i = 1, n
		sum = sum + func(real(i-1) * delta)
	end do

	! Get average
	ave_value = sum / real(n)

end function ave_value