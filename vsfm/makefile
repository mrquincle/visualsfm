SHELL = /bin/sh
CC = g++ -w

BIN_DIR = bin
OUT_DIR = build
LIB_DIR = lib

# detect OS
OSUPPER = $(shell uname -s 2>/dev/null | tr [:lower:] [:upper:])
OSLOWER = $(shell uname -s 2>/dev/null | tr [:upper:] [:lower:])
DARWIN = $(strip $(findstring DARWIN, $(OSUPPER)))

ifneq ($(DARWIN),) 
	BUILD64 = 
	ifneq ($(BUILD64),)
		#where to look for 64-bit libraries (I use homebrew for 64 bit)
		PKG_CONFIG = /usr/local/bin/pkg-config
		LIB_LIST = -L/usr/local/lib -L/usr/x11/lib
	else
		#where to look for 32-bit libraries (I use fink for 32 bit)
		PKG_CONFIG = /sw/bin/pkg-config
		#prefer mesa 3D (I had problem with OpenGL)
		LIB_LIST =  -L/usr/lib 	-L/sw/lib/mesa -L/usr/X11/lib
		CC += -m32
	endif
else
	PKG_CONFIG = pkg-config
	LIB_LIST = 
endif

GTK_CFLAGS = $(shell $(PKG_CONFIG) --cflags  gtk+-2.0)
GTK_LIBS = $(shell $(PKG_CONFIG) --libs gtk+-2.0 gthread-2.0)

LIB_LIST +=  -pthread -lGL -lGLU -lX11 -ldl $(GTK_LIBS) $(LIB_DIR)/lapack.a \
			$(LIB_DIR)/blas.a $(LIB_DIR)/libf2c.a $(LIB_DIR)/libjpeg.a 

all:  makepath VisualSFM 
 
#rules for the rest of the object files
VisualSFM: makepath extract
	$(CC) -o $(BIN_DIR)/VisualSFM $(OUT_DIR)/*.* $(LIB_LIST)
	rm -f $(OUT_DIR)/*.*
	
extract: $(LIB_DIR)/VisualSFM.a
	cd $(OUT_DIR); ar -x ../$(LIB_DIR)/VisualSFM.a; cd ..;
	
makepath:
	mkdir -p $(OUT_DIR)
	mkdir -p $(BIN_DIR) 

clean:
	rm -f $(OUT_DIR)/*.*
	rm -f $(BIN_DIR)/VisualSFM


