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
include test/CMakeFiles/rom.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/rom.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/rom.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/rom.dir/flags.make

test/CMakeFiles/rom.dir/rom.cpp.o: test/CMakeFiles/rom.dir/flags.make
test/CMakeFiles/rom.dir/rom.cpp.o: /home/wangfangzhen/Yux/CBSmode/test/rom.cpp
test/CMakeFiles/rom.dir/rom.cpp.o: test/CMakeFiles/rom.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wangfangzhen/Yux/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/rom.dir/rom.cpp.o"
	cd /home/wangfangzhen/Yux/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/rom.dir/rom.cpp.o -MF CMakeFiles/rom.dir/rom.cpp.o.d -o CMakeFiles/rom.dir/rom.cpp.o -c /home/wangfangzhen/Yux/CBSmode/test/rom.cpp

test/CMakeFiles/rom.dir/rom.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/rom.dir/rom.cpp.i"
	cd /home/wangfangzhen/Yux/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wangfangzhen/Yux/CBSmode/test/rom.cpp > CMakeFiles/rom.dir/rom.cpp.i

test/CMakeFiles/rom.dir/rom.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/rom.dir/rom.cpp.s"
	cd /home/wangfangzhen/Yux/CBSmode/build/test && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wangfangzhen/Yux/CBSmode/test/rom.cpp -o CMakeFiles/rom.dir/rom.cpp.s

# Object files for target rom
rom_OBJECTS = \
"CMakeFiles/rom.dir/rom.cpp.o"

# External object files for target rom
rom_EXTERNAL_OBJECTS =

test/rom: test/CMakeFiles/rom.dir/rom.cpp.o
test/rom: test/CMakeFiles/rom.dir/build.make
test/rom: src/libtfhe++.a
test/rom: thirdparties/randen/libranden.a
test/rom: thirdparties/spqlios/libspqlios.a
test/rom: test/CMakeFiles/rom.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/wangfangzhen/Yux/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable rom"
	cd /home/wangfangzhen/Yux/CBSmode/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rom.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/rom.dir/build: test/rom
.PHONY : test/CMakeFiles/rom.dir/build

test/CMakeFiles/rom.dir/clean:
	cd /home/wangfangzhen/Yux/CBSmode/build/test && $(CMAKE_COMMAND) -P CMakeFiles/rom.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/rom.dir/clean

test/CMakeFiles/rom.dir/depend:
	cd /home/wangfangzhen/Yux/CBSmode/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wangfangzhen/Yux/CBSmode /home/wangfangzhen/Yux/CBSmode/test /home/wangfangzhen/Yux/CBSmode/build /home/wangfangzhen/Yux/CBSmode/build/test /home/wangfangzhen/Yux/CBSmode/build/test/CMakeFiles/rom.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/rom.dir/depend
