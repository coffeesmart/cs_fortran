program electric_conversion

	implicit none

	real :: V, I, P, Q, S, PF, Z, theta

	real, parameter :: deg2rad = 1./180. 

	write (*,*) 'Enter the source voltage : '
	read (*,*) V
	write (*,*) 'You input the source voltage as ', V, '(V)'
	write (*,*) 'Enter the magnitude(ohms) and angle of impedance(degrees) : '
    read (*,*) Z, theta
    write (*,*) 'You input the source magnitude and angle of impedance as '
    write (*,*) Z, '(ohms),', theta, '(degrees)'

    I = V / Z
    P = V * I * cos(theta * deg2rad)
    Q = V * I * cos(theta * deg2rad)
    S = V * I
    PF = cos(theta/180.)

    write (*,*) 'Voltage         = ', V, '(V)'
    write (*,*) 'Impedance       = ', Z, '(ohms)'
    write (*,*) 'Current         = ', I, '(A)'
    write (*,*) 'Real power      = ', P, '(watts)'
    write (*,*) 'Reactive power  = ', Q, '(VAR)'
    write (*,*) 'Apparent power  = ', S, '(VA)'
    write (*,*) 'Power factor    = ', PF

end program electric_conversion