TARGET := iphone:10.2:8.0
ARCHS = armv7 arm64
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoTrending
NoTrending_FILES = Tweak.xm
NoTrending_LDFLAGS += -Wl,-segalign,4000

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
