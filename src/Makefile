PROG = ../bin/test.x

FC      = mpif90
FFLAGS  = -O3 -g -fbacktrace -cpp -march=native   # Fortran compiler flags        
LDFLAGS = -O3 -g -fbacktrace -cpp -march=native   # Linking flags   

SRCS =	ftnunit.f90 global_parameters.f90 hello_world.f90 nc_routines.f90 \
	simple_routines.f90 test_ftnunit.f90 test_nc_routines.f90

OBJS =	ftnunit.o global_parameters.o hello_world.o nc_routines.o \
	simple_routines.o test_ftnunit.o test_nc_routines.o

# Handle NetCDF and other library paths
ifdef NETCDF_PATH
    LIBS = -L $(strip $(NETCDF_PATH))/lib -lnetcdff -Wl,-rpath,$(strip $(NETCDF_PATH))/lib
    INCLUDE = -I/usr/include -I $(strip $(NETCDF_PATH))/include
else
    LIBS = -lnetcdff
    INCLUDE = -I /usr/include
endif
# If the MPI module comes from another compiler version
ifeq ($(strip $(INCLUDE_MPI)),true) 
  FFLAGS += -Dinclude_mpi 
endif 


# cancel m2c implicit rule 
%.o : %.mod 
 

all: $(PROG) 

$(PROG): $(OBJS)
	$(FC) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

clean:
	rm -f $(PROG) $(OBJS) *.M *.mod *.d *.il core *.gcda *.gcno 

.SUFFIXES: $(SUFFIXES) .f90 .F90

.f90.o:
	$(FC) $(FFLAGS) -c $(INCLUDE) $<

.F90.o:
	$(FC) $(FFLAGS) -c $(INCLUDE) $<

ftnunit.o:  Makefile 
global_parameters.o:  Makefile 
hello_world.o: ftnunit.o test_ftnunit.o Makefile 
nc_routines.o: global_parameters.o simple_routines.o Makefile 
simple_routines.o: global_parameters.o Makefile 
test_ftnunit.o: ftnunit.o global_parameters.o test_nc_routines.o Makefile 
test_nc_routines.o: ftnunit.o global_parameters.o nc_routines.o Makefile 
