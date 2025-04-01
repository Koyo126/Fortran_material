program main
implicit none

integer, parameter :: N = 100
logical, parameter :: if_debug = .false.

integer :: test(2*N), test2(N, 2)

integer :: iloop, jloop

do iloop = 1, N
  !!! 結果を 1 次元配列の特定の範囲に格納
  call return_array(test(iloop:iloop+1), iloop)
  if (if_debug) write(*,"(A15, 2I5)") "Received : ", test(iloop), test(iloop+1)

  !!! 結果を 2 次元配列の特定の行の一部の列に格納
  call return_array(test2(iloop,1:2), iloop)
  if (if_debug) then 
    write(*,"(A15, 2I5)") "Received : ", test2(iloop,1), test2(iloop,2)
    write(*,*)
  end if

  if ( test(iloop)   /= test2(iloop,1) ) write(*,*) "There is an issue with subroutine return_array itself or the way it is used."
  if ( test(iloop+1) /= test2(iloop,2) ) write(*,*) "There is an issue with subroutine return_array itself or the way it is used."
end do

contains
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !!!
  !!! 2 要素の 1 次元配列を出力。
  !!!
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine return_array(array,icount)

  integer, intent(out) :: array(2)
  integer, intent(in) :: icount
  logical, parameter :: if_debug = .false.

  integer :: iloop

  do iloop = 1, 2
    array(iloop) = iloop + icount
  end do
  if(if_debug) write(*,"(A15, 2I5)") "InRoutine : ", array(1), array(2)

  return 

  end subroutine return_array
end program main
