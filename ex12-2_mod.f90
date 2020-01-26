module vector_module

	implicit none

	type :: vector
		real :: x
		real :: y
	end type vector

	contains

		type(vector) function vector_add(v1,v2)

		implicit none

		type(vector), intent(in) :: v1
		type(vector), intent(in) :: v2

		vector_add%x = v1%x + v2%x
		vector_add%y = v1%y + v2%y

		end function vector_add
		!----------------------------------------!
		type(vector) function vector_sub(v1,v2)

		implicit none

		type(vector), intent(in) :: v1
		type(vector), intent(in) :: v2

		vector_sub%x = v1%x - v2%x
		vector_sub%y = v1%y - v2%y

		end function vector_sub

end module vector_module