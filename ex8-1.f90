program Electric_P_gene

	implicit none

	character(len=20) :: filename
	character(len=80) :: msg
	integer :: iostatus
	integer :: igen
	integer :: itime

	integer, parameter :: max_gen_n = 4
	integer, parameter :: max_gen_time = 6
	real, dimension(max_gen_time, max_gen_n) :: arr_power

	real, dimension(max_gen_n) :: arr_p_ave
	real, dimension(max_gen_time) :: arr_p_sum

	arr_p_ave = 0.
	arr_p_sum = 0.

	write (*,*) 'Enter the filename : '
	read (*,*) filename
	write (*,'(/2A/)') 'Filename is : ', filename

	open (unit=3, file=filename, status='old', action='read', &
		iostat=iostatus, iomsg=msg)

	if (iostatus == 0) then
		read (3,*,iostat=iostatus) arr_power

		do itime = 1, max_gen_time
			do igen = 1, max_gen_n
				arr_p_sum(itime) = arr_power(itime, igen) + arr_p_sum(itime)
			end do
		end do
	end if

	write (*,*) arr_power(3,1)
    
end program Electric_P_gene
