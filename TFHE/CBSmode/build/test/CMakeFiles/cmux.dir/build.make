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
CMAKE_SOURCE_DIR = /home/wangfangzhen/Yux/CBSmode

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wangfangzhen/Yux/CBSmode/build

# Include any dependencies generated for this target.
include test/CMakeFiles/cmux.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/cmux.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/cmux.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/cmux.dir/flags.make

test/CMakeFiles/cmux.dir/cmux.cpp.o: test/CMakeFiles/cmux.dir/flags.make
test/CMakeFiles/cmux.dir/cmux.cpp.o: /home/wangfangzhen/Yux/CBSmode/test/cmux.cpp
test/CMakeFiles/cmux.dir/cmux.cpp.o: test/CMakeFiles/cmux.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wangfangzhen/Yux/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/cmux.dir/cmux.cpp.o"
	cd /home/wangfangzhen/Yux/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/cmux.dir/cmux.cpp.o -MF CMakeFiles/cmux.dir/cmux.cpp.o.d -o CMakeFiles/cmux.dir/cmux.cpp.o -c /home/wangfangzhen/Yux/CBSmode/test/cmux.cpp

test/CMakeFiles/cmux.dir/cmux.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/cmux.dir/cmux.cpp.i"
	cd /home/wangfangzhen/Yux/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wangfangzhen/Yux/CBSmode/test/cmux.cpp > CMakeFiles/cmux.dir/cmux.cpp.i

test/CMakeFiles/cmux.dir/cmux.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/cmux.dir/cmux.cpp.s"
	cd /home/wangfangzhen/Yux/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wangfangzhen/Yux/CBSmode/test/cmux.cpp -o CMakeFiles/cmux.dir/cmux.cpp.s

# Object files for target cmux
cmux_OBJECTS = \
"CMakeFiles/cmux.dir/cmux.cpp.o"

# External object files for target cmux
cmux_EXTERNAL_OBJECTS =

test/cmux: test/CMakeFiles/cmux.dir/cmux.cpp.o
test/cmux: test/CMakeFiles/cmux.dir/build.make
test/cmux: src/libtfhe++.a
test/cmux: thirdparties/randen/libranden.a
test/cmux: thirdparties/spqlios/libspqlios.a
test/cmux: test/CMakeFiles/cmux.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/wangfangzhen/Yux/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable cmux"
	cd /home/wangfangzhen/Yux/CBSmode/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cmux.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/cmux.dir/build: test/cmux
.PHONY : test/CMakeFiles/cmux.dir/build

test/CMakeFiles/cmux.dir/clean:
	cd /home/wangfangzhen/Yux/CBSmode/build/test && $(CMAKE_COMMAND) -P CMakeFiles/cmux.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/cmux.dir/clean

test/CMakeFiles/cmux.dir/depend:
	cd /home/wangfangzhen/Yux/CBSmode/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wangfangzhen/Yux/CBSmode /home/wangfangzhen/Yux/CBSmode/test /home/wangfangzhen/Yux/CBSmode/build /home/wangfangzhen/Yux/CBSmode/build/test /home/wangfangzhen/Yux/CBSmode/build/test/CMakeFiles/cmux.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/cmux.dir/depend
