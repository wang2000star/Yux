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
include homoSM4_CB/CMakeFiles/homoAES.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include homoSM4_CB/CMakeFiles/homoAES.dir/compiler_depend.make

# Include the progress variables for this target.
include homoSM4_CB/CMakeFiles/homoAES.dir/progress.make

# Include the compile flags for this target's objects.
include homoSM4_CB/CMakeFiles/homoAES.dir/flags.make

homoSM4_CB/CMakeFiles/homoAES.dir/AES.cpp.o: homoSM4_CB/CMakeFiles/homoAES.dir/flags.make
homoSM4_CB/CMakeFiles/homoAES.dir/AES.cpp.o: /home/wangfangzhen/Fregata/CBSmode/homoSM4_CB/AES.cpp
homoSM4_CB/CMakeFiles/homoAES.dir/AES.cpp.o: homoSM4_CB/CMakeFiles/homoAES.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wangfangzhen/Fregata/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object homoSM4_CB/CMakeFiles/homoAES.dir/AES.cpp.o"
	cd /home/wangfangzhen/Fregata/CBSmode/build/homoSM4_CB && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT homoSM4_CB/CMakeFiles/homoAES.dir/AES.cpp.o -MF CMakeFiles/homoAES.dir/AES.cpp.o.d -o CMakeFiles/homoAES.dir/AES.cpp.o -c /home/wangfangzhen/Fregata/CBSmode/homoSM4_CB/AES.cpp

homoSM4_CB/CMakeFiles/homoAES.dir/AES.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/homoAES.dir/AES.cpp.i"
	cd /home/wangfangzhen/Fregata/CBSmode/build/homoSM4_CB && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wangfangzhen/Fregata/CBSmode/homoSM4_CB/AES.cpp > CMakeFiles/homoAES.dir/AES.cpp.i

homoSM4_CB/CMakeFiles/homoAES.dir/AES.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/homoAES.dir/AES.cpp.s"
	cd /home/wangfangzhen/Fregata/CBSmode/build/homoSM4_CB && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wangfangzhen/Fregata/CBSmode/homoSM4_CB/AES.cpp -o CMakeFiles/homoAES.dir/AES.cpp.s

homoSM4_CB/CMakeFiles/homoAES.dir/AES_homo.cpp.o: homoSM4_CB/CMakeFiles/homoAES.dir/flags.make
homoSM4_CB/CMakeFiles/homoAES.dir/AES_homo.cpp.o: /home/wangfangzhen/Fregata/CBSmode/homoSM4_CB/AES_homo.cpp
homoSM4_CB/CMakeFiles/homoAES.dir/AES_homo.cpp.o: homoSM4_CB/CMakeFiles/homoAES.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wangfangzhen/Fregata/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object homoSM4_CB/CMakeFiles/homoAES.dir/AES_homo.cpp.o"
	cd /home/wangfangzhen/Fregata/CBSmode/build/homoSM4_CB && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT homoSM4_CB/CMakeFiles/homoAES.dir/AES_homo.cpp.o -MF CMakeFiles/homoAES.dir/AES_homo.cpp.o.d -o CMakeFiles/homoAES.dir/AES_homo.cpp.o -c /home/wangfangzhen/Fregata/CBSmode/homoSM4_CB/AES_homo.cpp

homoSM4_CB/CMakeFiles/homoAES.dir/AES_homo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/homoAES.dir/AES_homo.cpp.i"
	cd /home/wangfangzhen/Fregata/CBSmode/build/homoSM4_CB && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wangfangzhen/Fregata/CBSmode/homoSM4_CB/AES_homo.cpp > CMakeFiles/homoAES.dir/AES_homo.cpp.i

homoSM4_CB/CMakeFiles/homoAES.dir/AES_homo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/homoAES.dir/AES_homo.cpp.s"
	cd /home/wangfangzhen/Fregata/CBSmode/build/homoSM4_CB && /usr/local/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wangfangzhen/Fregata/CBSmode/homoSM4_CB/AES_homo.cpp -o CMakeFiles/homoAES.dir/AES_homo.cpp.s

# Object files for target homoAES
homoAES_OBJECTS = \
"CMakeFiles/homoAES.dir/AES.cpp.o" \
"CMakeFiles/homoAES.dir/AES_homo.cpp.o"

# External object files for target homoAES
homoAES_EXTERNAL_OBJECTS =

homoSM4_CB/homoAES: homoSM4_CB/CMakeFiles/homoAES.dir/AES.cpp.o
homoSM4_CB/homoAES: homoSM4_CB/CMakeFiles/homoAES.dir/AES_homo.cpp.o
homoSM4_CB/homoAES: homoSM4_CB/CMakeFiles/homoAES.dir/build.make
homoSM4_CB/homoAES: src/libtfhe++.a
homoSM4_CB/homoAES: thirdparties/randen/libranden.a
homoSM4_CB/homoAES: thirdparties/spqlios/libspqlios.a
homoSM4_CB/homoAES: /usr/local/lib64/libgomp.so
homoSM4_CB/homoAES: /lib/x86_64-linux-gnu/libpthread.a
homoSM4_CB/homoAES: homoSM4_CB/CMakeFiles/homoAES.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/wangfangzhen/Fregata/CBSmode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable homoAES"
	cd /home/wangfangzhen/Fregata/CBSmode/build/homoSM4_CB && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/homoAES.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
homoSM4_CB/CMakeFiles/homoAES.dir/build: homoSM4_CB/homoAES
.PHONY : homoSM4_CB/CMakeFiles/homoAES.dir/build

homoSM4_CB/CMakeFiles/homoAES.dir/clean:
	cd /home/wangfangzhen/Fregata/CBSmode/build/homoSM4_CB && $(CMAKE_COMMAND) -P CMakeFiles/homoAES.dir/cmake_clean.cmake
.PHONY : homoSM4_CB/CMakeFiles/homoAES.dir/clean

homoSM4_CB/CMakeFiles/homoAES.dir/depend:
	cd /home/wangfangzhen/Fregata/CBSmode/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wangfangzhen/Fregata/CBSmode /home/wangfangzhen/Fregata/CBSmode/homoSM4_CB /home/wangfangzhen/Fregata/CBSmode/build /home/wangfangzhen/Fregata/CBSmode/build/homoSM4_CB /home/wangfangzhen/Fregata/CBSmode/build/homoSM4_CB/CMakeFiles/homoAES.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : homoSM4_CB/CMakeFiles/homoAES.dir/depend

