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
module unit_tests

  use ftnunit, only: test
  use global_parameters, only: lu_out, verbose
  use test_nc_routines

  implicit none

contains
!-----------------------------------------------------------------------------------------
subroutine test_all
  integer   :: oldverbose

  call init_output()

  ! test_nc_routines
  write(6,'(/,a)') 'TEST NC_ROUTINES MODULE'
  call test_nc_create_testfile()
  call test(test_nc_create_file, 'Create NetCDF file')
  call test(test_nc_create_group, 'Create Group')
  call test(test_nc_open_for_read, 'Open NetCDF file for reading')
  call test(test_nc_open_for_write, 'Open NetCDF file for writing')
  call test(test_nc_getvar_1d_float, 'Read 1D Float by name')
  call test(test_nc_getvar_2d_float, 'Read 2D Float by name')
  call test(test_nc_getvar_3d_float, 'Read 3D Float by name')
  call test(test_nc_getvar_1d_int, 'Read 1D Integer by name')
  call test(test_nc_getvar_2d_int, 'Read 2D Integer by name')
  call test(test_nc_getvar_3d_int, 'Read 3D Integer by name')
  call test(test_nc_putvar_1d, 'Write 1D Float by name')
  call test(test_nc_putvar_2d, 'Write 2D Float by name')
  call test(test_nc_putvar_3d, 'Write 3D Float by name')
  call test(test_nc_putvar_1d_into_nd, 'Write 1D slices into 3D variable by name')

  call finish_output()
end subroutine
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine init_output()
  character(len=11) :: fnam
  integer           :: lu_out_local

  fnam = 'OUTPUT_test'
  open(newunit=lu_out_local, file=fnam, status='unknown', position='append')
  call set_lu_out(lu_out_local)
  write(lu_out,*) '*********************************************************************'

end subroutine
!-----------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------
subroutine finish_output()
  close(lu_out)
end subroutine
!-----------------------------------------------------------------------------------------

end module
!=========================================================================================
