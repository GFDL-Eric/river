program rd_lake_tocell

!  code reads tocell values for routing through lakes (for c720 grid)

implicit none

include "param.h"

integer, parameter :: nlake_def= 16, nlake_defp1= nlake_def+1
integer, parameter :: mval= 9999

integer :: l, ntile, i1, i2, j1, j2, ni, nj, i, j, ilk, n

integer, dimension (id)          :: ipt
integer, dimension (jd)          :: jpt
integer, dimension (id,jd)       :: tocell

character(len=11), dimension (nlake_defp1) :: lake_name = &
(/ 'Michigan   ', 'Huron      ', 'Superior   ', 'Victoria   ', &
   'Tanganyika ', 'Baikal     ', 'Great Bear ', 'Malawi     ', &
   'Great Slave', 'Erie       ', 'Winnipeg   ', 'Ontario    ', &
   'Balkhash   ', 'Ladoga     ', 'Aral       ', 'Chad       ', &
   'Caspian    ' /)
   
open (25, file= 'out.rd_lake_tocell', form= 'formatted')

open (20, form= 'formatted')

! first read caspian data
read (20,*) ilk
if (ilk /= nlake_defp1) then
    write (6,*) "ERROR: invalid Caspian index"
    stop 1
endif
read (20,*) ntile, i1, i2, j1, j2
ni= i2-i1+1 ; nj= j2-j1+1
read (20,*) (ipt(i), i= 1,ni)
do j= 1,nj
   read (20,*) jpt(j), (tocell(i,j), i= 1,ni)
enddo
do j= 1,nj
   do i= 1,ni
      if (tocell(i,j) > 0) then
          write (25,'(3i5,f6.0,i8)') ntile, jpt(j), ipt(i), real(tocell(i,j)), ilk
      endif
   enddo
enddo

read (20,*) ilk
if (ilk /= nlake_defp1) then
    write (6,*) "ERROR: invalid Caspian index"
    stop 1
endif
read (20,*) ntile, i1, i2, j1, j2
ni= i2-i1+1 ; nj= j2-j1+1
read (20,*) (ipt(i), i= 1,ni)
do j= 1,nj
   read (20,*) jpt(j), (tocell(i,j), i= 1,ni)
enddo
do j= 1,nj
   do i= 1,ni
      if (tocell(i,j) > 0) then
          write (25,'(3i5,f6.0,i8)') ntile, jpt(j), ipt(i), real(tocell(i,j)), ilk
      endif
   enddo
enddo

do l= 1,nlake_def
   do n= 1,ntiles
      read (20,*) ilk
      if (ilk /= l) then
          write (6,*) "ERROR: inconsistent lake index, ", ilk, l, trim(lake_name(l))
          stop 10
      endif
      read (20,*) ntile, i1, i2, j1, j2
      if (i1 == mval) go to 20
      ni= i2-i1+1 ; nj= j2-j1+1
      read (20,*) (ipt(i), i= 1,ni)
      do j= 1,nj
         read (20,*) jpt(j), (tocell(i,j), i= 1,ni)
      enddo
      do j= 1,nj
         do i= 1,ni
            if (tocell(i,j) > 0) then
                 write (25,'(3i5,f6.0,i8)') ntile, jpt(j), ipt(i), real(tocell(i,j)), ilk
            endif
         enddo
      enddo
20    continue
   enddo
enddo

close (20)
close (25)

stop

end

