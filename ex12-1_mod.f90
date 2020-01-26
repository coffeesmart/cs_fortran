module types

implicit none

! Declare type personal info
type :: personal_info
	character(len=12) :: first        ! First name
	character         :: mi           ! Middle initial
	character(len=12) :: last         ! Last name
	character(len=26) :: street       ! Street address
	character(len=12) :: city         ! City
	character(len=2)  :: State        ! State
	integer           :: zip          ! Zip code
end type personal_info

end module types

