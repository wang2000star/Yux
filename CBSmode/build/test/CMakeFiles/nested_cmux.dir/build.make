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
include test/CMakeFiles/nested_cmux.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/nested_cmux.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/nested_cmux.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/nested_cmux.dir/flags.make

test/CMakeFiles/nested_cmux.dir/nested_cmux.cpp.o: test/CMakeFiles/nested_cmux.dir/flags.make
test/CMakeFiles/nested_cmux.dir/nested_cmux.cpp.o: /home/wfz/Yux/CBSmode/test/nested_cmux.cpp
test/CMakeFiles/nested_cmux.dir/nested_cmux.cpp.o: test/CMakeFiles/nested_cmux.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wfz/Yux/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/nested_cmux.dir/nested_cmux.cpp.o"
	cd /home/wfz/Yux/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/nested_cmux.dir/nested_cmux.cpp.o -MF CMakeFiles/nested_cmux.dir/nested_cmux.cpp.o.d -o CMakeFiles/nested_cmux.dir/nested_cmux.cpp.o -c /home/wfz/Yux/CBSmode/test/nested_cmux.cpp

test/CMakeFiles/nested_cmux.dir/nested_cmux.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/nested_cmux.dir/nested_cmux.cpp.i"
	cd /home/wfz/Yux/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wfz/Yux/CBSmode/test/nested_cmux.cpp > CMakeFiles/nested_cmux.dir/nested_cmux.cpp.i

test/CMakeFiles/nested_cmux.dir/nested_cmux.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/nested_cmux.dir/nested_cmux.cpp.s"
	cd /home/wfz/Yux/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wfz/Yux/CBSmode/test/nested_cmux.cpp -o CMakeFiles/nested_cmux.dir/nested_cmux.cpp.s

# Object files for target nested_cmux
nested_cmux_OBJECTS = \
"CMakeFiles/nested_cmux.dir/nested_cmux.cpp.o"

# External object files for target nested_cmux
nested_cmux_EXTERNAL_OBJECTS =

test/nested_cmux: test/CMakeFiles/nested_cmux.dir/nested_cmux.cpp.o
test/nested_cmux: test/CMakeFiles/nested_cmux.dir/build.make
test/nested_cmux: src/libtfhe++.a
test/nested_cmux: thirdparties/randen/libranden.a
test/nested_cmux: thirdparties/spqlios/libspqlios.a
test/nested_cmux: test/CMakeFiles/nested_cmux.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/wfz/Yux/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable nested_cmux"
	cd /home/wfz/Yux/CBSmode/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/nested_cmux.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/nested_cmux.dir/build: test/nested_cmux
.PHONY : test/CMakeFiles/nested_cmux.dir/build

test/CMakeFiles/nested_cmux.dir/clean:
	cd /home/wfz/Yux/CBSmode/build/test && $(CMAKE_COMMAND) -P CMakeFiles/nested_cmux.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/nested_cmux.dir/clean

test/CMakeFiles/nested_cmux.dir/depend:
	cd /home/wfz/Yux/CBSmode/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wfz/Yux/CBSmode /home/wfz/Yux/CBSmode/test /home/wfz/Yux/CBSmode/build /home/wfz/Yux/CBSmode/build/test /home/wfz/Yux/CBSmode/build/test/CMakeFiles/nested_cmux.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/nested_cmux.dir/depend

