JCC = jcc.exe
JCCOBJDIR = ../objs
JCCINCDIR = ../include
JCCFLAGS = -I$(JCCINCDIR) -o -fstk
JLD = prelink.exe
OBJS = dummydefs.obj lapi.obj lauxlib.obj lbaselib.obj lbitlib.obj lcode.obj lcorolib.obj lctype.obj ldblib.obj ldebug.obj ldo.obj ldump.obj lfunc.obj lgc.obj linit.obj liolib.obj llex.obj lmathlib.obj lmem.obj loadlib.obj lobject.obj lopcodes.obj loslib.obj lparser.obj lstate.obj lstring.obj lstrlib.obj ltable.obj ltablib.obj ltm.obj lundump.obj lutf8lib.obj lvm.obj lzio.obj

all: lua luac
	@echo "Done. Please upload the objects to MVS and link-edit them now."

lua: $(OBJS)
	@echo lua.c
	@$(JCC) $(JCCFLAGS) lua.c >> compile.log 2>&1
	@echo "Linking lua..."
	@$(JLD) -s $(JCCOBJDIR) lua_linked.obj $(OBJS) lua.obj >> compile.log 2>&1

luac: $(OBJS)
	@echo luac.c
	@$(JCC) $(JCCFLAGS) luac.c >> compile.log 2>&1
	@echo "Linking luac..."
	@$(JLD) -s $(JCCOBJDIR) luac_linked.obj $(OBJS) luac.obj >> compile.log 2>&1

%.obj: %.c
	@echo $<
	@$(JCC) $(JCCFLAGS) $< >> compile.log 2>&1


.PHONY: clean
clean:
	rm -f *.obj compile.log
