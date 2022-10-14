# Manjaro

## **Informações de Hardware**

- `lscpu`: The command reports information about the cpu and processing units.
It does not have any further option or functionality.
- `lshw`: **List Hardware**. A general purpose utility that reports detailed
and brief information about multiple different hardware units such as cpu,
memory, disk, usb controllers, network adapters etc. It extracts the information
from different /proc files.
- `lspci`: **List PCI**. The command lists out all the pci buses and details
about the devices connected to them. The vga adapter, graphics card, network
adapter, usb ports, sata controllers, etc all fall under this category.
- `lsscsi`: **List scsi devices**. Lists out the scsi/sata devices like hard
drives and optical drives.
- `lsusb`: **List usb buses and devices details**. This command shows the USB
controllers and details about devices connected to them. By default brief
information is printed. Use the verbose option "-v" to print detailed
information about each usb port.
- `lsblk`: **List block devices**. List out information all block devices,
which are the hard drive partitions and other storage devices like optical
drives and flash drives.
- `hwinfo`: **Hardware Information**. It is another general purpose hardware
probing utility that can report detailed and brief information about multiple
different hardware components, and more than `lshw` can report.
- `inxi`: Inxi is a 10K line mega bash script that fetches hardware details
from multiple different sources and commands on the system, and generates a
beautiful looking report that non technical users can read easily.
- `df`: **Disk space of file systems**. Reports various partitions, their mount
points and the used and available space on each.
- `pydf`: **Python df**. An improved df version written in python, that
displays colored output that looks better than df.
- `fdisk`: Fdisk is a utility to modify partitions on hard drives, and can be
used to list out the partition information as well.
- `mount`: The mount is used to mount/unmount and view mounted file systems.
- `free`: **Check RAM**. Check the amount of used, free and total amount of RAM
on system with the free command.
- `dmidecode`: The dmidecode command is different from all other commands. It
extracts hardware information by reading data from the SMBOIS data structures
(also called DMI tables).
- `hdparm`: The hdparm command gets information about sata devices like hard
disks.
- **/proc files**. Many of the virtual files in the */proc* directory contain
information about hardware and configurations.

