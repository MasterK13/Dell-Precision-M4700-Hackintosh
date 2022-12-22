# macOS on the Dell Precision M4700

![Desktop](/Images/macOS.png)

Extensive documentation for the process of Hackintoshing the Dell Precision M4700 laptop. **WORK IN PROGRESS!**
**FOR EDUCATIONAL PURPOSES!**

## Table of Contents

- [Screenshots](https://github.com/MasterK13/Dell-Precision-M4700-Hackintosh#screenshots)
- [Specifications](https://github.com/MasterK13/Dell-Precision-M4700-Hackintosh#specifications)
- [macOS Compatibility](https://github.com/MasterK13/Dell-Precision-M4700-Hackintosh#macos-update-history)
- [What's working](https://github.com/MasterK13/Dell-Precision-M4700-Hackintosh#whats-working)
- [What's not working](https://github.com/MasterK13/Dell-Precision-M4700-Hackintosh#whats-not-working)
- [Documentation](https://github.com/MasterK13/Dell-Precision-M4700-Hackintosh#documentation)
- [Credits](https://github.com/MasterK13/Dell-Precision-M4700-Hackintosh#credits)

## Screenshots

Coming soon.

## Specifications

Type | Specification
:---------|:---------
Model Name | Dell Precision M4700
CPU | Intel® Core™ i7-3840QM
Internal Graphics Card | Intel® HD Graphics 4000 (Ivy Bridge)
External Graphics Card | NVIDIA Quadro K1000M (Kepler)
RAM | 8 GB 1600 MHz DDR3
Wi-Fi | Intel® Centrino® Advanced-N 6205 (Replaced with Apple Broadcom BCM9460CD)
Ethernet | Intel® 82579LM Gigabit Ethernet
Audio | IDT 92HD93BXX

## macOS Update History

- ✅ macOS Catalina 10.15.7
- ✅ macOS Big Sur 11.6.7
- ✅ macOS Monterey 12.6.1 (Requires OpenCore Legacy Patcher Root Patching)
- ✅ macOS Ventura 13.1 (Requires OpenCore Legacy Patcher Root Patching)

## What's working

Type | Status
:---------|:----------
Intel® CPU Power Management | ✅
Intel® Ivy Bridge iGPU | ✅
NVIDIA Kepler dGPU | ✅
IDT Audio | ✅
Intel® Ethernet | ✅
Intel® Wi-Fi | ✅
USB Ports | ✅
Battery / AC | ✅
Sleep | ✅

## What's not working

Type | Info | Status
:---------|:---------|:----------
AirDrop / Apple Continuity | Intel Wi-Fi cards do not support AirDrop, this can be fixed by replacing the Intel Wi-Fi card with an official Apple AirPort card like a BCM9460CD with an adapter to Mini PCIe. | ❌

## Documentation

- [Power Management](/Documentation/PM.md)
- [SD Card](/Documentation/SDXC.md)
- [Replacing the Wi-Fi Card](/Documentation/Wi-Fi.md)

## Credits

- [Dortania](https://dortania.github.io) for their awesome guides.
- [Apple](https://www.apple.com) for macOS.
- [Acidanthera](https://github.com/acidanthera) for OpenCore and most of the Kexts used.
- [ExtremeXT](https://github.com/extremegrief1) for a lot of guidance and general help.
- [yusufklncc](https://github.com/yusufklncc) for README template.
- And anyone else that helped to develop and improve Hackintoshing.
