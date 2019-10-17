# Copyright (c) 2019. Triad National Security, LLC. All rights reserved.
#
# This program was produced under U.S. Government contract 89233218CNA000001 for
# Los Alamos National Laboratory (LANL), which is operated by Triad National
# Security, LLC for the U.S. Department of Energy/National Nuclear Security
# Administration. All rights in the program are reserved by Triad National
# Security, LLC, and the U.S. Department of Energy/National Nuclear Security
# Administration. The Government is granted for itself and others acting on
# its behalf a nonexclusive, paid-up, irrevocable worldwide license in this
# material to reproduce, prepare derivative works, distribute copies to the
# public, perform publicly and display publicly, and to permit others to do so.
#
# This program is open source under the BSD-3 License.
#
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
# 3. Neither the name of the copyright holder nor the
#   names of its contributors may be used to endorse or promote products
#   derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#CXX=gcc
#FC=gfortran
#CXX=icpc
#FC=ifort

include $(KOKKOS_ROOT)/Makefile.kokkos

KOKKOS_INC= $(KOKKOS_CXXFLAGS)
KOKKOS_LIB=-L $(KOKKOS_ROOT)/lib $(KOKKOS_CXXLDFLAGS) $(KOKKOS_LIBS) $(KOKKOS_LINK_FLAGS)

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

ifeq ($(KOKKOS_DEVICES),Cuda)
	CXX=$(NVCC_WRAPPER)
endif

all: libflcl.a

flcl-cxx.o: $(SRCDIR)/flcl-cxx.cc $(SRCDIR)/flcl-cxx.hpp
	$(CXX) $(DEBUG) -I$(SRCDIR)/ $(KOKKOS_INC) -c $(SRCDIR)/flcl-cxx.cc

flcl-f.o: $(SRCDIR)/flcl-f.f90
	$(FC) $(FSTD) $(DEBUG) -I$(SRCDIR)/ -c $(SRCDIR)/flcl-f.f90

flcl-util-cxx.o: $(SRCDIR)/flcl-util-cxx.cc $(SRCDIR)/flcl-util-cxx.h
	$(CXX) $(DEBUG) -I$(SRCDIR)/ $(KOKKOS_INC) -c $(SRCDIR)/flcl-util-cxx.cc

flcl-util-f.o: $(SRCDIR)/flcl-util-f.f90 $(SRCDIR)/flcl-f.f90
	$(FC) $(FSTD) $(DEBUG) -I$(SRCDIR)/ -c $(SRCDIR)/flcl-util-f.f90

libflcl.a: flcl-f.o flcl-cxx.o flcl-util-f.o flcl-util-cxx.o
	ar rcs libflcl.a flcl-f.o flcl-cxx.o flcl-util-f.o flcl-util-cxx.o

test-flcl-cxx.o: $(TESTSRCDIR)/test-flcl-cxx.cc
	$(CXX) $(DEBUG) -I$(SRCDIR) -I$(TESTSRCDIR)/ $(KOKKOS_INC) -c $(TESTSRCDIR)/test-flcl-cxx.cc

test-flcl-f.o: flcl-f.o $(TESTSRCDIR)/test-flcl-f.f90
	$(FC) $(FSTD) $(DEBUG) -I$(TESTSRCDIR)/ -c $(TESTSRCDIR)/test-flcl-f.f90

test-flcl-main.o: flcl-f.o test-flcl-f.o $(TESTSRCDIR)/test-flcl-f.f90 flcl-util-f.o
	$(FC) $(FSTD) $(DEBUG) -I$(TESTSRCDIR)/ -c $(TESTSRCDIR)/test-flcl-main.f90

test-flcl.x: test-flcl-cxx.o test-flcl-f.o test-flcl-main.o libflcl.a
	$(FC) $(FSTD) $(DEBUG) -I$(TESTSRCDIR)/ test-flcl-cxx.o test-flcl-f.o test-flcl-main.o -L. -lflcl $(KOKKOS_LIB) -lstdc++ -o test-flcl.x

clean:
	rm -f ./*.o ./*.x ./*.mod ./*.out ./libflcl.a
