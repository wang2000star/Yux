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
CMAKE_SOURCE_DIR = /home/wangfangzhen/Fregata/CBSmode

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wangfangzhen/Fregata/CBSmode/build

# Include any dependencies generated for this target.
include test/CMakeFiles/invcircuitbootstrapping.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/invcircuitbootstrapping.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/invcircuitbootstrapping.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/invcircuitbootstrapping.dir/flags.make

test/CMakeFiles/invcircuitbootstrapping.dir/invcircuitbootstrapping.cpp.o: test/CMakeFiles/invcircuitbootstrapping.dir/flags.make
test/CMakeFiles/invcircuitbootstrapping.dir/invcircuitbootstrapping.cpp.o: /home/wangfangzhen/Fregata/CBSmode/test/invcircuitbootstrapping.cpp
test/CMakeFiles/invcircuitbootstrapping.dir/invcircuitbootstrapping.cpp.o: test/CMakeFiles/invcircuitbootstrapping.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wangfangzhen/Fregata/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/invcircuitbootstrapping.dir/invcircuitbootstrapping.cpp.o"
	cd /home/wangfangzhen/Fregata/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/invcircuitbootstrapping.dir/invcircuitbootstrapping.cpp.o -MF CMakeFiles/invcircuitbootstrapping.dir/invcircuitbootstrapping.cpp.o.d -o CMakeFiles/invcircuitbootstrapping.dir/invcircuitbootstrapping.cpp.o -c /home/wangfangzhen/Fregata/CBSmode/test/invcircuitbootstrapping.cpp

test/CMakeFiles/invcircuitbootstrapping.dir/invcircuitbootstrapping.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/invcircuitbootstrapping.dir/invcircuitbootstrapping.cpp.i"
	cd /home/wangfangzhen/Fregata/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wangfangzhen/Fregata/CBSmode/test/invcircuitbootstrapping.cpp > CMakeFiles/invcircuitbootstrapping.dir/invcircuitbootstrapping.cpp.i

test/CMakeFiles/invcircuitbootstrapping.dir/invcircuitbootstrapping.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/invcircuitbootstrapping.dir/invcircuitbootstrapping.cpp.s"
	cd /home/wangfangzhen/Fregata/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wangfangzhen/Fregata/CBSmode/test/invcircuitbootstrapping.cpp -o CMakeFiles/invcircuitbootstrapping.dir/invcircuitbootstrapping.cpp.s

# Object files for target invcircuitbootstrapping
invcircuitbootstrapping_OBJECTS = \
"CMakeFiles/invcircuitbootstrapping.dir/invcircuitbootstrapping.cpp.o"

# External object files for target invcircuitbootstrapping
invcircuitbootstrapping_EXTERNAL_OBJECTS =

test/invcircuitbootstrapping: test/CMakeFiles/invcircuitbootstrapping.dir/invcircuitbootstrapping.cpp.o
test/invcircuitbootstrapping: test/CMakeFiles/invcircuitbootstrapping.dir/build.make
test/invcircuitbootstrapping: src/libtfhe++.a
test/invcircuitbootstrapping: thirdparties/randen/libranden.a
test/invcircuitbootstrapping: thirdparties/spqlios/libspqlios.a
test/invcircuitbootstrapping: test/CMakeFiles/invcircuitbootstrapping.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/wangfangzhen/Fregata/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable invcircuitbootstrapping"
	cd /home/wangfangzhen/Fregata/CBSmode/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/invcircuitbootstrapping.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/invcircuitbootstrapping.dir/build: test/invcircuitbootstrapping
.PHONY : test/CMakeFiles/invcircuitbootstrapping.dir/build

test/CMakeFiles/invcircuitbootstrapping.dir/clean:
	cd /home/wangfangzhen/Fregata/CBSmode/build/test && $(CMAKE_COMMAND) -P CMakeFiles/invcircuitbootstrapping.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/invcircuitbootstrapping.dir/clean

test/CMakeFiles/invcircuitbootstrapping.dir/depend:
	cd /home/wangfangzhen/Fregata/CBSmode/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wangfangzhen/Fregata/CBSmode /home/wangfangzhen/Fregata/CBSmode/test /home/wangfangzhen/Fregata/CBSmode/build /home/wangfangzhen/Fregata/CBSmode/build/test /home/wangfangzhen/Fregata/CBSmode/build/test/CMakeFiles/invcircuitbootstrapping.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/invcircuitbootstrapping.dir/depend

