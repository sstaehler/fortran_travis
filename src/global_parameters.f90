!******************************************************************************
!
!    This file is part of:
!    MC Kernel: Calculating seismic sensitivity kernels on unstructured meshes
!    Copyright (C) 2016 Simon Staehler, Martin van Driel, Ludwig Auer
!
!    You can find the latest version of the software at:
!    <https://www.github.com/tomography/mckernel>
!
!    MC Kernel is free software: you can redistribute it and/or modify
!    it under the terms of the GNU General Public License as published by
!    the Free Software Foundation, either version 3 of the License, or
!    (at your option) any later version.
!
!    MC Kernel is distributed in the hope that it will be useful,
!    but WITHOUT ANY WARRANTY; without even the implied warranty of
!    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!    GNU General Public License for more details.
!
!    You should have received a copy of the GNU General Public License
!    along with MC Kernel. If not, see <http://www.gnu.org/licenses/>.
!
!******************************************************************************

!=========================================================================================
module global_parameters

  implicit none
  public
  integer, parameter         :: sp = selected_real_kind(6, 37)
  integer, parameter         :: dp = selected_real_kind(15, 307)
  integer, parameter         :: qp = selected_real_kind(33, 4931)

  integer,parameter          :: int4 = selected_int_kind(5)
  integer,parameter          :: long = selected_int_kind(15)

  real(kind=dp), parameter   :: pi = 3.1415926535898D0
  real(kind=dp), parameter   :: deg2rad = pi / 180.d0
  real(kind=dp), parameter   :: rad2deg = 180.d0 / pi
  integer                    :: verbose = 0

  integer, parameter         :: WORKTAG = 1
  integer, parameter         :: DIETAG  = 2

  logical, protected         :: master, firstslave, ioworker=.false.
  logical                    :: testing = .false. !< Set to true only for unit test, 
                                                  !! because some routines require action
                                                  !! from master or slave, which would not 
                                                  !! be tested otherwise
  integer, protected         :: myrank, nproc, myrank_node, nproc_node
  integer, protected         :: myrank_master_slaves, nproc_master_slaves
  integer, protected         :: lu_out !< Logical unit for output. 
                                       !! 6 (Screen) for master
  contains


!----------------------------------------------------------------------------------------
subroutine init_random_seed()
   integer :: i, n, clock
   integer, dimension(:), allocatable :: seed
                                                  
   call random_seed(size = n)
   allocate(seed(n))

   call system_clock(count=clock)

   seed = clock + 37 * [ (i - 1, i = 1, n) ]
   call random_seed(put = seed)

   deallocate(seed)

end subroutine init_random_seed
!-----------------------------------------------------------------------------------------

!----------------------------------------------------------------------------------------
subroutine set_lu_out(lu_out_value)
  integer, intent(in)   :: lu_out_value

  lu_out = lu_out_value

end subroutine set_lu_out
!----------------------------------------------------------------------------------------

end module
!=========================================================================================
