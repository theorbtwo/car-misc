#!/usr/bin/env python3

# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
from pprint import pprint
import json
import sys
import pijuice

pj = pijuice.PiJuice(1, 0x14)
status = pj.status.GetStatus()['data']
is_fault = status['isFault']
is_button = status['isButton']
bat_status = status['battery']
power_in_status = status['powerInput']
power_in_5vIo_status = status['powerInput5vIo']
bat_charge_level = pj.status.GetChargeLevel()["data"]
bat_temp = pj.status.GetBatteryTemperature()["data"]
bat_voltage = pj.status.GetBatteryVoltage()["data"]/1000
bat_current = pj.status.GetBatteryCurrent()["data"]

# https://docs.influxdata.com/influxdb/v2.7/reference/syntax/line-protocol/

print(f'pijuice bat_temp={bat_temp:#f} is_fault={is_fault} is_button={is_button} bat_status="{bat_status}" power_in_5vIo_status={power_in_5vIo_status} bat_charge_level={bat_charge_level:#f} bat_temp={bat_temp:#f} bat_voltage={bat_voltage:#f} bat_current={bat_current:#f}')
