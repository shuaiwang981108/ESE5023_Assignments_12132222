program READ

implicit none

integer                                :: u1, u2, a, b, c, d, i, j
real(4), dimension(:,:),allocatable    :: M, N


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


do i=1,b
    write(*,*) "Line ",i,":",M(i,:)
enddo



do i=1,d
    write(*,*) "Line ",i,":",N(i,:)
enddo


deallocate(M)
deallocate(N)


End program READ

