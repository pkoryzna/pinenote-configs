#!/usr/bin/env python3
import rockchip_ebc_custom_ioctl as reci
from pathlib import Path
from sys import argv

btw = Path(argv[1])
reci.set_off_screen(btw, None)
