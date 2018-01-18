CC = $(CROSS_COMPILE)gcc

IFLAGS := -g -Wall

DFLAGS += -DLIB

#DFLAGS += -DIL_BIGENDIAN

obj-dhd_priv = dhd_priv.o
obj-brcm = brcm_patchram_plus.o

DHD_PRIV := dhd_priv
BRCM := brcm_patchram_plus

CFLAGS += $(IFLAGS) $(DFLAGS)

all:  $(DHD_PRIV) $(BRCM)

$(DHD_PRIV): $(obj-dhd_priv)
	$(CC) -o $@ $(obj-dhd_priv)
$(BRCM): $(obj-brcm)
	$(CC) -o $@ $(obj-brcm)
install: all
	install -D $(DHD_PRIV) /usr/bin/$(DHD_PRIV)
	install -D $(BRCM) /usr/bin/$(BRCM)
clean:
	-rm -f $(DHD_PRIV) $(BRCM) *.o
