module solar_hour_angle

implicit none

real, parameter :: pi=3.1415926

contains

    subroutine calculation(lon,mon,day,t,angle)
    implicit none

    integer,intent(in) :: mon, day
    real(4),intent(in) :: lon, t
    real(4),intent(out) :: angle
    integer :: a
    real(4) :: offset, eot, gama

    a=(mon-1)*30+day
    gama=2*pi/365*(a-1+(t-12)/24)
    eot=229.18*(0.000075+0.001868*cos(gama)-0.032077*sin(gama)-0.014615*cos(2*gama)-0.040849*sin(2*gama))
    offset=eot+MOD(lon,15.0)
    angle=15*(t-12)+offset/60
    
    end subroutine calculation

end module solar_hour_angle