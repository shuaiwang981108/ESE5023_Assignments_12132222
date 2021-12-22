program READ

implicit none

integer                                :: u1, u2, a, b, c, d, i, j
real(4), dimension(:,:),allocatable    :: M, N
real(4),  dimension(4,4)  :: MN

u1=111
u2=222
a=3
b=4
c=4
d=3

open(unit=u1,file='M.dat',status='old')
open(unit=u2,file='N.dat',status='old')

allocate(M(b,a))
allocate(N(d,c))

do i=1,b
    read(u1,*) M(i,:)
enddo

do i=1,d
    read(u2,*) N(i,:)
enddo

close(u1)
close(u2)

do i=1,b
    write(*,*) "Line ",i,":",M(i,:)
enddo

do i=1,d
    write(*,*) "Line ",i,":",N(i,:)
enddo

call  Matrix_multiple(M,N,MN)

do i=1,4
    write(*,*) "Line ",i,":",MN(i,:)
enddo

open(unit=u1,file='MN.dat',status='replace')
do i=1,4
    write(u1,'(f9.2)') MN(i,:)
enddo

close(u1)

deallocate(M)
deallocate(N)

End program READ


!this is the subroutine

subroutine Matrix_multiple(M,N,MN)

implicit none

real(4),dimension(4,3),intent(in) :: M
real(4),dimension(3,4),intent(in) :: N
real(4),dimension(4,4),intent(out) :: MN
integer :: i,j,k
real(4) :: a

do i=1,4
    do j=1,4
        a=0
        do k=1,3
            a=a+M(i,k)*N(k,j)
        enddo
        MN(i,j)=a
    enddo
enddo

end subroutine Matrix_multiple