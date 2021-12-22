program Test

use solar_hour_angle

implicit none

real(4) :: t,lon,angle
integer :: mon,day

t=14
lon=114.05
mon=11
day=08

call calculation(lon,mon,day,t,angle)

write(*,*) angle

end program Test