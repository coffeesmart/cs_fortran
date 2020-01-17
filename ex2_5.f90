program C14_dating_cal

	implicit none
    
	real :: t_decay    ! decaying duration
	real, parameter :: d_const = 0.00012097	   ! decaying constant( /yr)
	real :: Q          ! remaining C14 in sample (%)
	real, parameter :: Q0 = 100         ! initial C14 (%)

	! read how much C14 is remained
	write (*,*) 'Enter the percentage of C14 remaining in sample : '
	read (*,*) Q
	write (*,*) 'You input : ', Q, '(%)'

	t_decay = -(1./d_const)*log(Q/Q0)

	write (*,*) 'The age of the sample is :', t_decay, '(yr)'

end program C14_dating_cal