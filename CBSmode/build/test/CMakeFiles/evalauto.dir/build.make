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
include test/CMakeFiles/evalauto.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/evalauto.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/evalauto.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/evalauto.dir/flags.make

test/CMakeFiles/evalauto.dir/evalauto.cpp.o: test/CMakeFiles/evalauto.dir/flags.make
test/CMakeFiles/evalauto.dir/evalauto.cpp.o: /home/wfz/Yux/CBSmode/test/evalauto.cpp
test/CMakeFiles/evalauto.dir/evalauto.cpp.o: test/CMakeFiles/evalauto.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wfz/Yux/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/evalauto.dir/evalauto.cpp.o"
	cd /home/wfz/Yux/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/evalauto.dir/evalauto.cpp.o -MF CMakeFiles/evalauto.dir/evalauto.cpp.o.d -o CMakeFiles/evalauto.dir/evalauto.cpp.o -c /home/wfz/Yux/CBSmode/test/evalauto.cpp

test/CMakeFiles/evalauto.dir/evalauto.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/evalauto.dir/evalauto.cpp.i"
	cd /home/wfz/Yux/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wfz/Yux/CBSmode/test/evalauto.cpp > CMakeFiles/evalauto.dir/evalauto.cpp.i

test/CMakeFiles/evalauto.dir/evalauto.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/evalauto.dir/evalauto.cpp.s"
	cd /home/wfz/Yux/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wfz/Yux/CBSmode/test/evalauto.cpp -o CMakeFiles/evalauto.dir/evalauto.cpp.s

# Object files for target evalauto
evalauto_OBJECTS = \
"CMakeFiles/evalauto.dir/evalauto.cpp.o"

# External object files for target evalauto
evalauto_EXTERNAL_OBJECTS =

test/evalauto: test/CMakeFiles/evalauto.dir/evalauto.cpp.o
test/evalauto: test/CMakeFiles/evalauto.dir/build.make
test/evalauto: src/libtfhe++.a
test/evalauto: thirdparties/randen/libranden.a
test/evalauto: thirdparties/spqlios/libspqlios.a
test/evalauto: test/CMakeFiles/evalauto.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/wfz/Yux/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable evalauto"
	cd /home/wfz/Yux/CBSmode/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/evalauto.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/evalauto.dir/build: test/evalauto
.PHONY : test/CMakeFiles/evalauto.dir/build

test/CMakeFiles/evalauto.dir/clean:
	cd /home/wfz/Yux/CBSmode/build/test && $(CMAKE_COMMAND) -P CMakeFiles/evalauto.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/evalauto.dir/clean

test/CMakeFiles/evalauto.dir/depend:
	cd /home/wfz/Yux/CBSmode/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wfz/Yux/CBSmode /home/wfz/Yux/CBSmode/test /home/wfz/Yux/CBSmode/build /home/wfz/Yux/CBSmode/build/test /home/wfz/Yux/CBSmode/build/test/CMakeFiles/evalauto.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/evalauto.dir/depend

