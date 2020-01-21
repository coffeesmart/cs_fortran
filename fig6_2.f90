PROGRAM squares
IMPLICIT NONE
INTEGER :: i
INTEGER, DIMENSION(10) :: number, square
! Initialize number and calculate square.
! DO i = 1, 9
! number(i) = i ! Initialize number
! square(i) = number(i)**2 ! Calculate square
! END DO
! Write out each number and its square.
DO i = 1, 10
WRITE (*,100) number(i), square(i)
100 FORMAT ('Number = ',I20,' Square = ',I20)
END DO
END PROGRAM squares