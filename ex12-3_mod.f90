module vector_module_v2

	implicit none

	type :: vector
		real :: x
		real :: y
	contains
		procedure, pass :: vector_add
		procedure, pass :: vector_sub
	end type vector

	contains
		type(vector) function vector_add(this, v2)
			implicit none
			class(vector), intent(in) :: this
			class(Vector), intent(in) :: v2

			vector_add%x = this%x + v2%x
			vector_add%y = this%y + v2%y
		end function vector_add

		type(vector) function vector_sub(this, v2)
			implicit none
			class(vector), intent(in) :: this
			class(Vector), intent(in) :: v2

			vector_sub%x = this%x - v2%x
			vector_sub%y = this%y - v2%y
		end function vector_sub


end module vector_module_v2