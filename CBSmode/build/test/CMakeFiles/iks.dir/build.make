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
include test/CMakeFiles/iks.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/iks.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/iks.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/iks.dir/flags.make

test/CMakeFiles/iks.dir/iks.cpp.o: test/CMakeFiles/iks.dir/flags.make
test/CMakeFiles/iks.dir/iks.cpp.o: /home/wangfangzhen/Fregata/CBSmode/test/iks.cpp
test/CMakeFiles/iks.dir/iks.cpp.o: test/CMakeFiles/iks.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wangfangzhen/Fregata/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/iks.dir/iks.cpp.o"
	cd /home/wangfangzhen/Fregata/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/iks.dir/iks.cpp.o -MF CMakeFiles/iks.dir/iks.cpp.o.d -o CMakeFiles/iks.dir/iks.cpp.o -c /home/wangfangzhen/Fregata/CBSmode/test/iks.cpp

test/CMakeFiles/iks.dir/iks.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/iks.dir/iks.cpp.i"
	cd /home/wangfangzhen/Fregata/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wangfangzhen/Fregata/CBSmode/test/iks.cpp > CMakeFiles/iks.dir/iks.cpp.i

test/CMakeFiles/iks.dir/iks.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/iks.dir/iks.cpp.s"
	cd /home/wangfangzhen/Fregata/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wangfangzhen/Fregata/CBSmode/test/iks.cpp -o CMakeFiles/iks.dir/iks.cpp.s

# Object files for target iks
iks_OBJECTS = \
"CMakeFiles/iks.dir/iks.cpp.o"

# External object files for target iks
iks_EXTERNAL_OBJECTS =

test/iks: test/CMakeFiles/iks.dir/iks.cpp.o
test/iks: test/CMakeFiles/iks.dir/build.make
test/iks: src/libtfhe++.a
test/iks: thirdparties/randen/libranden.a
test/iks: thirdparties/spqlios/libspqlios.a
test/iks: test/CMakeFiles/iks.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/wangfangzhen/Fregata/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable iks"
	cd /home/wangfangzhen/Fregata/CBSmode/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/iks.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/iks.dir/build: test/iks
.PHONY : test/CMakeFiles/iks.dir/build

test/CMakeFiles/iks.dir/clean:
	cd /home/wangfangzhen/Fregata/CBSmode/build/test && $(CMAKE_COMMAND) -P CMakeFiles/iks.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/iks.dir/clean

test/CMakeFiles/iks.dir/depend:
	cd /home/wangfangzhen/Fregata/CBSmode/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wangfangzhen/Fregata/CBSmode /home/wangfangzhen/Fregata/CBSmode/test /home/wangfangzhen/Fregata/CBSmode/build /home/wangfangzhen/Fregata/CBSmode/build/test /home/wangfangzhen/Fregata/CBSmode/build/test/CMakeFiles/iks.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/iks.dir/depend

