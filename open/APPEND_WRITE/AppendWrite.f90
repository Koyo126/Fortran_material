program AppendWrite
implicit none

integer :: unit_num
integer :: iloop
integer, parameter :: Nloop = 10
character(len=50), parameter :: FilePath = "./test.txt"

do iloop = 1, Nloop
  open(newunit=unit_num, file=FilePath, action="write", position="append")

  write(unit_num, "(A, I5)") "iloop = ", iloop

  close(unit_num, status="save")
end do

end program AppendWrite
