program SEA

use Declination_angle
use solar_hour_angle

implicit none

real, parameter :: newpi=3.1415926
real(4) :: lat,lon,t,angle,dangle
integer :: mon,day
real(4) :: a

lat=22.542883
lon=114.062996
t=10.0+32/60
mon=12
day=31

call calculate_angle(mon,day,dangle)


call calculation(lon,mon,day,t,angle)


a=asin(sin(lat/180*newpi)*sin(dangle/180*newpi)+cos(lat/180*newpi)*cos(dangle/180*newpi)*cos(angle/180*newpi))
a=a/newpi*180.0
write(*,*) a

end program SEA

