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
include test/CMakeFiles/gate.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/gate.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/gate.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/gate.dir/flags.make

test/CMakeFiles/gate.dir/gate.cpp.o: test/CMakeFiles/gate.dir/flags.make
test/CMakeFiles/gate.dir/gate.cpp.o: /home/wfz/Yux/CBSmode/test/gate.cpp
test/CMakeFiles/gate.dir/gate.cpp.o: test/CMakeFiles/gate.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wfz/Yux/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/gate.dir/gate.cpp.o"
	cd /home/wfz/Yux/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/gate.dir/gate.cpp.o -MF CMakeFiles/gate.dir/gate.cpp.o.d -o CMakeFiles/gate.dir/gate.cpp.o -c /home/wfz/Yux/CBSmode/test/gate.cpp

test/CMakeFiles/gate.dir/gate.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/gate.dir/gate.cpp.i"
	cd /home/wfz/Yux/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wfz/Yux/CBSmode/test/gate.cpp > CMakeFiles/gate.dir/gate.cpp.i

test/CMakeFiles/gate.dir/gate.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/gate.dir/gate.cpp.s"
	cd /home/wfz/Yux/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wfz/Yux/CBSmode/test/gate.cpp -o CMakeFiles/gate.dir/gate.cpp.s

# Object files for target gate
gate_OBJECTS = \
"CMakeFiles/gate.dir/gate.cpp.o"

# External object files for target gate
gate_EXTERNAL_OBJECTS =

test/gate: test/CMakeFiles/gate.dir/gate.cpp.o
test/gate: test/CMakeFiles/gate.dir/build.make
test/gate: src/libtfhe++.a
test/gate: thirdparties/randen/libranden.a
test/gate: thirdparties/spqlios/libspqlios.a
test/gate: test/CMakeFiles/gate.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/wfz/Yux/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable gate"
	cd /home/wfz/Yux/CBSmode/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gate.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/gate.dir/build: test/gate
.PHONY : test/CMakeFiles/gate.dir/build

test/CMakeFiles/gate.dir/clean:
	cd /home/wfz/Yux/CBSmode/build/test && $(CMAKE_COMMAND) -P CMakeFiles/gate.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/gate.dir/clean

test/CMakeFiles/gate.dir/depend:
	cd /home/wfz/Yux/CBSmode/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wfz/Yux/CBSmode /home/wfz/Yux/CBSmode/test /home/wfz/Yux/CBSmode/build /home/wfz/Yux/CBSmode/build/test /home/wfz/Yux/CBSmode/build/test/CMakeFiles/gate.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/gate.dir/depend

