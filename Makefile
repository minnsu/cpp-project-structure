CC= # compiler
CXXFLAGS= # compiler flags
LDFLAGS= # linker flags
TARGET= program# executable file name

BINARY= ./bin/# executable file directory
OBJECT= ./obj/# object files directory
SOURCE= ./src/# source files directory

# get cpp file list from src directory using wildcard and change its pattern by patsubst
OBJ_NAMES := $(patsubst ${SOURCE}%.cpp,${OBJECT}%.o,$(wildcard ${SOURCE}*.cpp))
OBJS= ${OBJ_NAMES}

# OBJ_NAMES= # add object files name in here( XXX.o YYY.o ... )
# OBJS= $(addprefix $(OBJECT), $(OBJ_NAMES))

# make executable file from object files, excutable program file store in this directory
$(BINARY)$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)

# make object files from source files, object files store in BINARY directory
$(OBJECT)%.o: $(SOURCE)%.cpp
	$(CC) -c $< -o $@ $(CXXFLAGS)

clean:
	rm $(OBJECT)*.o
	rm $(BINARY)$(TARGET)
