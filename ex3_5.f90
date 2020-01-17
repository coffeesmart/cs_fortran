program ex3_5

	implicit none
    
	integer :: i_day
	character(11) :: c_day

	write (*,*) 'Enter the number : '
	read (*,*) i_day

	select case (i_day)
case (1)
	write (*,*) "It's Sunday!"
case default
	write (*,*) "..."
end select

end program ex3_5