#CXX=gcc
#FC=gfortran
#CXX=icpc
#FC=ifort

include $(KOKKOS_ROOT)/Makefile.kokkos

KOKKOS_INC= $(KOKKOS_CXXFLAGS)
KOKKOS_LIB=-L $(KOKKOS_ROOT)/lib $(KOKKOS_CXXLDFLAGS) $(KOKKOS_LIBS)

OMP = -fopenmp
#DEBUG = -g
DEBUG =
SRCDIR=../src
TESTSRCDIR=../test

ifeq ($(FC),ifort)
  FSTD = -std08
endif
ifeq ($(FC),gfortran)
  FSTD = -std=f2008
endif

all: libflcl.a

flcl-cxx.o: $(SRCDIR)/flcl-cxx.cc
	$(CXX) $(DEBUG) -I$(SRCDIR)/ $(KOKKOS_INC) -c $(SRCDIR)/flcl-cxx.cc

flcl-f.o: $(SRCDIR)/flcl-f.f90
	$(FC) $(FSTD) $(DEBUG) -I$(SRCDIR)/ -c $(SRCDIR)/flcl-f.f90

libflcl.a: flcl-f.o flcl-cxx.o
	ar rcs libflcl.a flcl-f.o flcl-cxx.o

test-flcl-cxx.o: $(TESTSRCDIR)/test-flcl-cxx.cc
	$(CXX) $(DEBUG) -I$(SRCDIR) -I$(TESTSRCDIR)/ $(KOKKOS_INC) -c $(TESTSRCDIR)/test-flcl-cxx.cc

test-flcl-f.o: flcl-f.o $(TESTSRCDIR)/test-flcl-f.f90
	$(FC) $(FSTD) $(DEBUG) -I$(TESTSRCDIR)/ -c $(TESTSRCDIR)/test-flcl-f.f90

test-flcl-main.o: flcl-f.o test-flcl-f.o $(TESTSRCDIR)/test-flcl-f.f90
	$(FC) $(FSTD) $(DEBUG) -I$(TESTSRCDIR)/ -c $(TESTSRCDIR)/test-flcl-main.f90

test-flcl.x: test-flcl-cxx.o test-flcl-f.o test-flcl-main.o libflcl.a
	$(FC) $(FSTD) $(DEBUG) -I$(TESTSRCDIR)/ test-flcl-cxx.o test-flcl-f.o test-flcl-main.o -L. -lflcl $(KOKKOS_LIB) -lstdc++ -o test-flcl.x

clean:
	rm -f ./*.o ./*.mod ./libflcl.a