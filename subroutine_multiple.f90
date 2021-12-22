subroutine Matrix_multiple(M,N,MN)

implicit none

real(8),dimension(4,3),intent(in) :: M
real(8),dimension(3,4),intent(in) :: N
real(8),dimension(4,4),intent(out) :: MN
integer :: i,j,k
real(8) :: a

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