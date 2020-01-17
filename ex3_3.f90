program ex3_3

	implicit none

	real :: x, y
	real :: f_xy    ! f(x,y)

	write (*,*) 'Enter the value of x :'
	read (*,*) x
	write (*,*) 'Enter the value of y :'
	read (*,*) y

	  if (x >= 0 .and. y >= 0) then
		f_xy = x + y
	  else if (x >= 0 .and. y < 0) then
		f_xy = x + y**2
	  else if (x < 0 .and. y >= 0) then
		f_xy = x**2 + y
	  else
		f_xy = x**2 + y**2
	  end if

	write (*,*) 'You input x = ', x, ', y = ', y
	write (*,*) 'The solution, f(x,y) = ', f_xy
    
end program ex3_3
