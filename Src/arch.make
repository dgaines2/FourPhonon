# export FFLAGS=-qopenmp -traceback -debug -O2 -static_intel
export FFLAGS=-qopenmp -traceback -O2 -static-intel
export LDFLAGS=-L/global/homes/d/dwg4898/local/lib -lsymspg -qmkl
export MPIFC=mpifort
MKL=$(MKLROOT)/lib/intel64/libmkl_lapack95_lp64.a -Wl,--start-group	\
$(MKLROOT)/lib/intel64/libmkl_intel_lp64.a				\
 $(MKLROOT)/lib/intel64/libmkl_sequential.a				\
 $(MKLROOT)/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm
export LAPACK=$(MKL)
export LIBS=$(LAPACK)
