# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wfz/Yux/CBSmode

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wfz/Yux/CBSmode/build

# Include any dependencies generated for this target.
include thirdparties/spqlios/CMakeFiles/spqlios.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include thirdparties/spqlios/CMakeFiles/spqlios.dir/compiler_depend.make

# Include the progress variables for this target.
include thirdparties/spqlios/CMakeFiles/spqlios.dir/progress.make

# Include the compile flags for this target's objects.
include thirdparties/spqlios/CMakeFiles/spqlios.dir/flags.make

thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-fft-fma.s.o: thirdparties/spqlios/CMakeFiles/spqlios.dir/flags.make
thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-fft-fma.s.o: /home/wfz/Yux/CBSmode/thirdparties/spqlios/spqlios-fft-fma.s
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wfz/Yux/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building ASM object thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-fft-fma.s.o"
	cd /home/wfz/Yux/CBSmode/build/thirdparties/spqlios && /usr/local/bin/c++ $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/spqlios.dir/spqlios-fft-fma.s.o -c /home/wfz/Yux/CBSmode/thirdparties/spqlios/spqlios-fft-fma.s

thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-fft-fma.s.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing ASM source to CMakeFiles/spqlios.dir/spqlios-fft-fma.s.i"
	cd /home/wfz/Yux/CBSmode/build/thirdparties/spqlios && /usr/local/bin/c++ $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E /home/wfz/Yux/CBSmode/thirdparties/spqlios/spqlios-fft-fma.s > CMakeFiles/spqlios.dir/spqlios-fft-fma.s.i

thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-fft-fma.s.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling ASM source to assembly CMakeFiles/spqlios.dir/spqlios-fft-fma.s.s"
	cd /home/wfz/Yux/CBSmode/build/thirdparties/spqlios && /usr/local/bin/c++ $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S /home/wfz/Yux/CBSmode/thirdparties/spqlios/spqlios-fft-fma.s -o CMakeFiles/spqlios.dir/spqlios-fft-fma.s.s

thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-ifft-fma.s.o: thirdparties/spqlios/CMakeFiles/spqlios.dir/flags.make
thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-ifft-fma.s.o: /home/wfz/Yux/CBSmode/thirdparties/spqlios/spqlios-ifft-fma.s
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wfz/Yux/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building ASM object thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-ifft-fma.s.o"
	cd /home/wfz/Yux/CBSmode/build/thirdparties/spqlios && /usr/local/bin/c++ $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/spqlios.dir/spqlios-ifft-fma.s.o -c /home/wfz/Yux/CBSmode/thirdparties/spqlios/spqlios-ifft-fma.s

thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-ifft-fma.s.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing ASM source to CMakeFiles/spqlios.dir/spqlios-ifft-fma.s.i"
	cd /home/wfz/Yux/CBSmode/build/thirdparties/spqlios && /usr/local/bin/c++ $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E /home/wfz/Yux/CBSmode/thirdparties/spqlios/spqlios-ifft-fma.s > CMakeFiles/spqlios.dir/spqlios-ifft-fma.s.i

thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-ifft-fma.s.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling ASM source to assembly CMakeFiles/spqlios.dir/spqlios-ifft-fma.s.s"
	cd /home/wfz/Yux/CBSmode/build/thirdparties/spqlios && /usr/local/bin/c++ $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S /home/wfz/Yux/CBSmode/thirdparties/spqlios/spqlios-ifft-fma.s -o CMakeFiles/spqlios.dir/spqlios-ifft-fma.s.s

thirdparties/spqlios/CMakeFiles/spqlios.dir/fft_processor_spqlios.cpp.o: thirdparties/spqlios/CMakeFiles/spqlios.dir/flags.make
thirdparties/spqlios/CMakeFiles/spqlios.dir/fft_processor_spqlios.cpp.o: /home/wfz/Yux/CBSmode/thirdparties/spqlios/fft_processor_spqlios.cpp
thirdparties/spqlios/CMakeFiles/spqlios.dir/fft_processor_spqlios.cpp.o: thirdparties/spqlios/CMakeFiles/spqlios.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wfz/Yux/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object thirdparties/spqlios/CMakeFiles/spqlios.dir/fft_processor_spqlios.cpp.o"
	cd /home/wfz/Yux/CBSmode/build/thirdparties/spqlios && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT thirdparties/spqlios/CMakeFiles/spqlios.dir/fft_processor_spqlios.cpp.o -MF CMakeFiles/spqlios.dir/fft_processor_spqlios.cpp.o.d -o CMakeFiles/spqlios.dir/fft_processor_spqlios.cpp.o -c /home/wfz/Yux/CBSmode/thirdparties/spqlios/fft_processor_spqlios.cpp

thirdparties/spqlios/CMakeFiles/spqlios.dir/fft_processor_spqlios.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/spqlios.dir/fft_processor_spqlios.cpp.i"
	cd /home/wfz/Yux/CBSmode/build/thirdparties/spqlios && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wfz/Yux/CBSmode/thirdparties/spqlios/fft_processor_spqlios.cpp > CMakeFiles/spqlios.dir/fft_processor_spqlios.cpp.i

thirdparties/spqlios/CMakeFiles/spqlios.dir/fft_processor_spqlios.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/spqlios.dir/fft_processor_spqlios.cpp.s"
	cd /home/wfz/Yux/CBSmode/build/thirdparties/spqlios && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wfz/Yux/CBSmode/thirdparties/spqlios/fft_processor_spqlios.cpp -o CMakeFiles/spqlios.dir/fft_processor_spqlios.cpp.s

thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-fft-impl.cpp.o: thirdparties/spqlios/CMakeFiles/spqlios.dir/flags.make
thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-fft-impl.cpp.o: /home/wfz/Yux/CBSmode/thirdparties/spqlios/spqlios-fft-impl.cpp
thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-fft-impl.cpp.o: thirdparties/spqlios/CMakeFiles/spqlios.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wfz/Yux/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-fft-impl.cpp.o"
	cd /home/wfz/Yux/CBSmode/build/thirdparties/spqlios && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-fft-impl.cpp.o -MF CMakeFiles/spqlios.dir/spqlios-fft-impl.cpp.o.d -o CMakeFiles/spqlios.dir/spqlios-fft-impl.cpp.o -c /home/wfz/Yux/CBSmode/thirdparties/spqlios/spqlios-fft-impl.cpp

thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-fft-impl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/spqlios.dir/spqlios-fft-impl.cpp.i"
	cd /home/wfz/Yux/CBSmode/build/thirdparties/spqlios && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wfz/Yux/CBSmode/thirdparties/spqlios/spqlios-fft-impl.cpp > CMakeFiles/spqlios.dir/spqlios-fft-impl.cpp.i

thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-fft-impl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/spqlios.dir/spqlios-fft-impl.cpp.s"
	cd /home/wfz/Yux/CBSmode/build/thirdparties/spqlios && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wfz/Yux/CBSmode/thirdparties/spqlios/spqlios-fft-impl.cpp -o CMakeFiles/spqlios.dir/spqlios-fft-impl.cpp.s

# Object files for target spqlios
spqlios_OBJECTS = \
"CMakeFiles/spqlios.dir/spqlios-fft-fma.s.o" \
"CMakeFiles/spqlios.dir/spqlios-ifft-fma.s.o" \
"CMakeFiles/spqlios.dir/fft_processor_spqlios.cpp.o" \
"CMakeFiles/spqlios.dir/spqlios-fft-impl.cpp.o"

# External object files for target spqlios
spqlios_EXTERNAL_OBJECTS =

thirdparties/spqlios/libspqlios.a: thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-fft-fma.s.o
thirdparties/spqlios/libspqlios.a: thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-ifft-fma.s.o
thirdparties/spqlios/libspqlios.a: thirdparties/spqlios/CMakeFiles/spqlios.dir/fft_processor_spqlios.cpp.o
thirdparties/spqlios/libspqlios.a: thirdparties/spqlios/CMakeFiles/spqlios.dir/spqlios-fft-impl.cpp.o
thirdparties/spqlios/libspqlios.a: thirdparties/spqlios/CMakeFiles/spqlios.dir/build.make
thirdparties/spqlios/libspqlios.a: thirdparties/spqlios/CMakeFiles/spqlios.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/wfz/Yux/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library libspqlios.a"
	cd /home/wfz/Yux/CBSmode/build/thirdparties/spqlios && $(CMAKE_COMMAND) -P CMakeFiles/spqlios.dir/cmake_clean_target.cmake
	cd /home/wfz/Yux/CBSmode/build/thirdparties/spqlios && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/spqlios.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
thirdparties/spqlios/CMakeFiles/spqlios.dir/build: thirdparties/spqlios/libspqlios.a
.PHONY : thirdparties/spqlios/CMakeFiles/spqlios.dir/build

thirdparties/spqlios/CMakeFiles/spqlios.dir/clean:
	cd /home/wfz/Yux/CBSmode/build/thirdparties/spqlios && $(CMAKE_COMMAND) -P CMakeFiles/spqlios.dir/cmake_clean.cmake
.PHONY : thirdparties/spqlios/CMakeFiles/spqlios.dir/clean

thirdparties/spqlios/CMakeFiles/spqlios.dir/depend:
	cd /home/wfz/Yux/CBSmode/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wfz/Yux/CBSmode /home/wfz/Yux/CBSmode/thirdparties/spqlios /home/wfz/Yux/CBSmode/build /home/wfz/Yux/CBSmode/build/thirdparties/spqlios /home/wfz/Yux/CBSmode/build/thirdparties/spqlios/CMakeFiles/spqlios.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : thirdparties/spqlios/CMakeFiles/spqlios.dir/depend

