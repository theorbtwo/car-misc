#!/usr/bin/python3

from pijuice import PiJuice
import os
pijuice = PiJuice(1, 0x14)

# Set wakeup
pijuice.power.SetWakeUpOnCharge(0.0)
