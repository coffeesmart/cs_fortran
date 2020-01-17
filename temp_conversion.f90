program temp_conversion

	implicit none

	real :: temp_F, temp_K

	write (*,*) 'Enter the Fahrenheit degree : '
	read (*,*) temp_F
	write (*,*) 'You input the F degree : ', temp_F

	temp_K = (5./9.)*(temp_F - 32.) + 273.15

	write (*,*) 'Converted K degree : ', temp_K
    
end program temp_conversion