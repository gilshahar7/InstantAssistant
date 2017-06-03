ARCHS = armv7 arm64
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = InstantAssistant
InstantAssistant_FILES = Tweak.xm
InstantAssistant_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 OPA"
