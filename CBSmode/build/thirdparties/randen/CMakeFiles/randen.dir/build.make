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
include thirdparties/randen/CMakeFiles/randen.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include thirdparties/randen/CMakeFiles/randen.dir/compiler_depend.make

# Include the progress variables for this target.
include thirdparties/randen/CMakeFiles/randen.dir/progress.make

# Include the compile flags for this target's objects.
include thirdparties/randen/CMakeFiles/randen.dir/flags.make

thirdparties/randen/CMakeFiles/randen.dir/randen.cc.o: thirdparties/randen/CMakeFiles/randen.dir/flags.make
thirdparties/randen/CMakeFiles/randen.dir/randen.cc.o: /home/wangfangzhen/Fregata/CBSmode/thirdparties/randen/randen.cc
thirdparties/randen/CMakeFiles/randen.dir/randen.cc.o: thirdparties/randen/CMakeFiles/randen.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wangfangzhen/Fregata/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object thirdparties/randen/CMakeFiles/randen.dir/randen.cc.o"
	cd /home/wangfangzhen/Fregata/CBSmode/build/thirdparties/randen && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT thirdparties/randen/CMakeFiles/randen.dir/randen.cc.o -MF CMakeFiles/randen.dir/randen.cc.o.d -o CMakeFiles/randen.dir/randen.cc.o -c /home/wangfangzhen/Fregata/CBSmode/thirdparties/randen/randen.cc

thirdparties/randen/CMakeFiles/randen.dir/randen.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/randen.dir/randen.cc.i"
	cd /home/wangfangzhen/Fregata/CBSmode/build/thirdparties/randen && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wangfangzhen/Fregata/CBSmode/thirdparties/randen/randen.cc > CMakeFiles/randen.dir/randen.cc.i

thirdparties/randen/CMakeFiles/randen.dir/randen.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/randen.dir/randen.cc.s"
	cd /home/wangfangzhen/Fregata/CBSmode/build/thirdparties/randen && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wangfangzhen/Fregata/CBSmode/thirdparties/randen/randen.cc -o CMakeFiles/randen.dir/randen.cc.s

# Object files for target randen
randen_OBJECTS = \
"CMakeFiles/randen.dir/randen.cc.o"

# External object files for target randen
randen_EXTERNAL_OBJECTS =

thirdparties/randen/libranden.a: thirdparties/randen/CMakeFiles/randen.dir/randen.cc.o
thirdparties/randen/libranden.a: thirdparties/randen/CMakeFiles/randen.dir/build.make
thirdparties/randen/libranden.a: thirdparties/randen/CMakeFiles/randen.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/wangfangzhen/Fregata/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libranden.a"
	cd /home/wangfangzhen/Fregata/CBSmode/build/thirdparties/randen && $(CMAKE_COMMAND) -P CMakeFiles/randen.dir/cmake_clean_target.cmake
	cd /home/wangfangzhen/Fregata/CBSmode/build/thirdparties/randen && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/randen.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
thirdparties/randen/CMakeFiles/randen.dir/build: thirdparties/randen/libranden.a
.PHONY : thirdparties/randen/CMakeFiles/randen.dir/build

thirdparties/randen/CMakeFiles/randen.dir/clean:
	cd /home/wangfangzhen/Fregata/CBSmode/build/thirdparties/randen && $(CMAKE_COMMAND) -P CMakeFiles/randen.dir/cmake_clean.cmake
.PHONY : thirdparties/randen/CMakeFiles/randen.dir/clean

thirdparties/randen/CMakeFiles/randen.dir/depend:
	cd /home/wangfangzhen/Fregata/CBSmode/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wangfangzhen/Fregata/CBSmode /home/wangfangzhen/Fregata/CBSmode/thirdparties/randen /home/wangfangzhen/Fregata/CBSmode/build /home/wangfangzhen/Fregata/CBSmode/build/thirdparties/randen /home/wangfangzhen/Fregata/CBSmode/build/thirdparties/randen/CMakeFiles/randen.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : thirdparties/randen/CMakeFiles/randen.dir/depend

