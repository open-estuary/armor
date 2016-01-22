# Makefile for GNU make
# Support building stand-alone Armor Utility application 

# Includes
INC_DIRS = ./inc
INC_OPTS = $(addprefix -I,$(INC_DIRS))

# Compiler/linker
COMPILE_OPTS = $(INC_OPTS)
ifeq ($(DEBUG),1)
    COMPILE_OPTS += -g -DDEBUG
    TGT_DIR = dbg
else
    COMPILE_OPTS += -O2
    TGT_DIR = ndbg
endif

C_COMPILER = aarch64-linux-gnu-gcc
LINK = aarch64-linux-gnu-gcc -o
LINK_OPTS = -pthread
EXE =
#EXTRA_LIB_NAMES = ncurses
LDADD = -lrt

C = c
CPP = cpp
OBJ = o
LIB_SUFFIX = a
C_FLAGS = $(COMPILE_OPTS)

# Local dirs
OBJ_DIR = obj
SRC_DIR = src
INC_DIR = inc
BIN_DIR = bin

# External buildable libs

# Libs to be linked with
LIB_DIRS =
LIB_OPTS =

LIB_NAMES = 

LINK_LIBS = $(addprefix -l,$(LIB_NAMES))

# Client target and objects
EXECUTABLE_NAME = ArmorUtility
EXECUTABLE_TGT = $(BIN_DIR)/$(EXECUTABLE_NAME)$(EXE)

EXECUTABLE_OBJ_NAMES = ArmorUtility
EXECUTABLE_OBJS = $(addprefix $(OBJ_DIR)/,$(addsuffix .$(OBJ),$(EXECUTABLE_OBJ_NAMES)))

# Objects to be linked with
OBJS = $(EXECUTABLE_OBJS)

# Targets
all: $(EXECUTABLE_TGT)   

$(OBJ_DIR)/%.$(OBJ): $(SRC_DIR)/%.$(C)
	$(C_COMPILER) -c $(C_FLAGS) $< -o $@

$(EXECUTABLE_TGT): $(OBJS) $(LIB_DEPS)
	if [ ! -e $(BIN_DIR) ]; then mkdir $(BIN_DIR); fi
	$(LINK) $@ $(LINK_OPTS) $(LIB_OPTS) $(OBJS) $(LIB_DEPS) $(LINK_LIBS) $(LDADD)

clean:
	-rm -rf $(OBJS) $(EXECUTABLE_TGT)
