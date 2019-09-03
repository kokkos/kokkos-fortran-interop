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
KOKKOS_LIB=-L $(KOKKOS_ROOT)/lib $(KOKKOS_CXXLDFLAGS) $(KOKKOS_LIBS)

OMP = -fopenmp
#DEBUG = -g
DEBUG =
SRCDIR=.
LIBFLCLDIR=../../build
FLCLSRCDIR=../../src

ifeq ($(FC),ifort)
  FSTD = -std08
endif
ifeq ($(FC),gfortran)
  FSTD = -std=f2008
endif

all: axpy.x

axpy-cxx.o: $(SRCDIR)/axpy-cxx.cc
	$(CXX) $(DEBUG) -I$(FLCLSRCDIR)/ $(KOKKOS_INC) -c $(SRCDIR)/axpy-cxx.cc

axpy-f.o: $(SRCDIR)/axpy-f.f90
	$(FC) $(FSTD) $(DEBUG) -I$(LIBFLCLDIR)/ -c $(SRCDIR)/axpy-f.f90

axpy-main.o: $(SRCDIR)/axpy-main.f90
	$(FC) $(FSTD) $(DEBUG) -I$(SRCDIR)/ -I$(LIBFLCLDIR)/ -c $(SRCDIR)/axpy-main.f90

axpy.x: axpy-cxx.o axpy-f.o axpy-main.o $(LIBFLCLDIR)/libflcl.a
	$(FC) $(FSTD) $(DEBUG) -I$(SRCDIR)/ axpy-cxx.o axpy-f.o axpy-main.o -L$(LIBFLCLDIR)/ -lflcl $(KOKKOS_LIB) -lstdc++ -o axpy.x

clean:
	rm -f ./*.o ./*.x ./*.mod
