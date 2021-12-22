program TestProgram

use Declination_angle

implicit none

real(4) ::dangle
integer ::mon, day

mon=11
day=08

call calculate_angle(mon,day,dangle)

write(*,*) dangle

end program TestProgram