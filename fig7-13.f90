real function quadf(x,a,b,c)

implicit none

real, intent(in) :: x
real, intent(in) :: a
real, intent(in) :: b
real, intent(in) :: c

quadf = a*x**2 + b*x + c

end function quadf