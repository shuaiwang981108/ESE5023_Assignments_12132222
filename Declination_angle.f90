module Declination_angle

implicit none

real, parameter :: pi=3.1415926

contains

    subroutine calculate_angle(mon,day,dangle)

    integer,intent(in) :: mon, day
    real(4),intent(out) :: dangle
    integer ::a
    a=(mon-1)*30+day

    dangle=asin(sin(-23.44/180*pi)*cos(((360/365.24)*(a+10)+360/pi*0.0167*sin(360/365.24*(a-2)))/180*pi))
    dangle=dangle/pi*180
    
    end subroutine calculate_angle

end module Declination_angle
