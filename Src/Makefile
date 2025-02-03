include arch.make

objects:=conductivity.o config.o data.o input.o iterations.o misc.o gruneisen.o phonon_routines.o integrals.o processes.o scaling.o symmetry.o wedgetc.o dos_routines.o ShengBTE.o



# Set compiler and flags based on goal
ifeq ($(MAKECMDGOALS),gpu)
  FFLAGS := $(GPU_FFLAGS)
  FC := $(GPU_COMPILER)
else
  FFLAGS := $(CPU_FFLAGS)
  FC := $(CPU_COMPILER)
endif

.PHONY: all cpu gpu clean


# Default target
all: cpu

# CPU version
cpu: ../ShengBTE-4th
gpu: ../ShengBTE-4th-gpu


../ShengBTE-4th: $(objects)
	$(CPU_COMPILER) $(FFLAGS) -o $@ $^ $(LDFLAGS) $(LIBS)

../ShengBTE-4th-gpu: $(objects)
	$(GPU_COMPILER) $(FFLAGS) -o $@ $^ $(LDFLAGS) $(LIBS)
	# $(GPU_COMPILER) $(FFLAGS) -o $@ $^ $(LDFLAGS)  $(LIBS)  # -static

# Pattern rule for object files
%.o %.mod: %.f90
	$(FC) $(FFLAGS) -c -o $*.o $<
	touch $*.mod

# Clean both versions
clean:
	rm -f ../ShengBTE-4th ../ShengBTE-4th-gpu *.mod *.o

# Dependencies
conductivity.o conductivity.mod: config.mod data.mod
config.o config.mod:  misc.mod data.mod symmetry.mod
input.o input.mod:  config.mod
iterations.o iterations.mod: data.mod config.mod wedgetc.mod
phonon_routines.o phonon_routines.mod: data.mod config.mod input.mod
dos_routines.o dos_routines.mod: config.mod
gruneisen.o gruneisen.mod: data.mod config.mod input.mod
processes.o processes.mod:  data.mod config.mod
scaling.o scaling.mod: config.mod data.mod
wedgetc.o wedgetc.mod: symmetry.mod config.mod misc.mod
ShengBTE.o: misc.mod config.mod input.mod processes.mod iterations.mod conductivity.mod scaling.mod gruneisen.mod dos_routines.mod phonon_routines.mod wedgetc.mod integrals.mod
