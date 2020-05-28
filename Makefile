
# COMMAND benchmark
# DESCRIPTION Submit a benchmark script to Slurm
# ARGS
# - target: Name of the benchmark, packaged as a folder inside "benchmark"
.PHONY: benchmark
benchmark: benchmark/$(target)/run.sh
	sbatch --workdir=benchmark/$(target) $?

# COMMAND configure
# DESCRIPTION Configure build system (CMake)
.PHONY: configure
configure:
	@rm -rf miniqmc/build/omp
	cmake -S miniqmc -B miniqmc/build/omp -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CXX_COMPILER=icpc

# COMMAND build
# DESCRIPTION Build "miniqmc" binaries
.PHONY: build
build: miniqmc/build/$(target)/Makefile
	make -j -C miniqmc/build/$(target) miniqmc

# COMMAND xml2csv
# DESCRIPTION Extract data time in hierarchical format of a benchmark
# ARGS
# - target: Name of the benchmark, packaged as a folder inside "benchmark"
# OTHER: Uses "xmlstarlet"
.PHONY: xml2csv
xml2csv: benchmark/$(target)/time-*.xml
	@for f in $?; do \
		echo 'name,time_incl,time_excl' >benchmark/$(target)/$$(basename $$f .xml).csv; \
        xml sel -T -t \
            -m '//timer' \
                -m 'ancestor-or-self::timer' \
                    -v './name' \
                    -i 'not(position()=last())' \
                        -o '>' \
            -b -b \
            -o , -v './time_incl' -o , -v './time_excl' -n $$f >>benchmark/$(target)/$$(basename $$f .xml).csv; \
	done

# COMMAND trace
# DESCRIPTION Submit a trace script to Slurm
# ARGS
# - target: Name of the trace, packaged as a folder inside "trace"
.PHONY: trace
trace: trace/$(target)/trace.sh
	sbatch --workdir=trace/$(target) $?

# COMMAND prv
# DESCRIPTION Generate paraver ".prv" file from trace
# ARGS
# - target: Name of the trace, packaged as a folder inside "trace"
.PHONY: prv
prv: trace/$(target)/TRACE.mpits
	cd trace/$(target)
	mpi2prv -f TRACE.mpits

# COMMAND clean
# DESCRIPTION Clean all
.PHONY: clean
clean: miniqmc/build/* benchmark/**/*.csv
	rm --recursive --interactive=once $?