program test_ave_value

	implicit none

	real :: ave_value
	real, external :: my_function        ! function to evaluate

	real :: ave

	! call function with func-my_function
	ave = ave_value(my_function, 0., 1., 101)
	write (*,1000) 'my_function', ave
	1000 format ('The average value of ', A, &
		' between x=[0, 1] is ', F16.6, '.')
    
end program test_ave_value

!------------------------------------------
real function my_function(x)

	implicit none

	real, intent(in) :: x
	my_function = 3. * x

end function my_function
