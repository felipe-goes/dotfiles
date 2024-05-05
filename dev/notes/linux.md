# Linux Basics

## [What is in a Distribution](https://christitus.com/choose-linux-distro/)

### Bootloader

This is usually either GRUB or systemd-boot. GRUB has been around for ages and
can be themed while having a ton of flexibility. It supports UEFI and Legacy,
while systemd-boot is pretty much included with every modern linux distribution
and only boots via UEFI and has a limited menu system. Chris Titus highly
encourages you that want a themed multi-boot system to check out his [Top 5
Bootloader project that auto-installs multiple themes](https://christitus.com/bootloader-themes/)

### Init System

When your system is initializing on startup it needs to verify all the devices
it will use and get the system ready for boot. Almost every Linux system these
days use systemd. Systemd is very big and inclusive, but to many is bloated. It
does much more than just initializing the system. It has Timers, bootloader,
services, and much more. Chris Titus did a YouTube video explaining everything
in systemd if you want [to learn more.](https://youtu.be/hc7J-zWEty8) There is
other options out there for Linux and certain fringe distributions that use
them, but if you want other options check out init.d and precursors to systemd.
They are much faster and if looking at building an ultimate minimal system this
is the route to take.

### Display Render

To draw graphics on the screen we need a render. There are only two major ones
you need to know about. Wayland and Xorg. Wayland is the new kid that should be
faster and better, but is lacking features and compatibility. Xorg is the old,
wise man that just works, but is starting to show its age. Xorg has two features
that Wayland is lacking for me right now. It has X11 forwarding for running GUI
programs remotely through an SSH connection and using legacy programs for
sharing a keyboard/mouse across screens using synergy/barrier. Chris Titus did
a [video on this here](https://youtu.be/Fci_ALdEzGc). To many it simply doesn’t
matter, because they both fundamentally do the same thing.

### Display Manager

This really should be called a Login Manager or user selector, but in Linux the
entire ecosystem is run by extremely smart technical people, that just so
happen to be terrible at marketing. So the "Display Manager" comes in many
flavors and this is where we start to run into many personal options in
Distributions. There are three main ones that are used and can be configured
differently:

- lightdm
- sddm
- gdm

While there are others, these three pretty much are always chosen for a
distribution. SDDM is generally bundled with KDE systems (which we will get
into here in a bit), GDM is for GNOME systems, and lightdm (my personal fav) is
pretty much a catch all.

### Desktop Environment

Think of Desktop Environments as the tools that make up the control center in
an Operating System. Want to change the display resolution, theme, colors,
fonts, etc. well all that stuff is in the desktop environment. Now you don't
technically need a full blow DE with all this stuff. The main thing you do need
is a Window Manager to control where windows are placed. With all that said
lets layout the common DEs:

- GNOME
- KDE
- XFCE
- Window Managers

### Package Managers

This is how distributions install programs. Here are the major ones you need to
know about.

- APT - Debian distros `apt install programname`
- DNF / YUM - RHEL distros `dnf install programname`
- Pacman - Arch distros `pacman -S programname`

## Philosophy

| **Principle** | **Description** |
|:--------------|:----------------|
| **Everything is a file** | All configuration files for the various services running on the Linux operating system are stored in one or more text files. |
| **Small, single-purpose programs** | Linux offers many different tools that we will work with, which can be combined to work together. |
| **Ability to chain programs together to perform complex tasks** | The integration and combination of different tools enable us to carry out many large and complex tasks, such as processing or filtering specific data results. |
| **Avoid captive user interfaces** | 	Linux is designed to work mainly with the shell (or terminal), which gives the user greater control over the operating system. |
| **Configuration data stored in a text file** | An example of such a file is the `/etc/passwd` file, which stores all users registered on the system. |

## Components

| **Component** | **Description** |
|:--------------|:----------------|
| **Bootloader** | A piece of code that runs to guide the booting process to start the operating system. Parrot Linux uses the GRUB Bootloader. |
| **OS Kernel** | The kernel is the main component of an operating system. It manages the resources for I/O devices the system at the hardware level. |
| **Daemons** | Background services are called "daemons" in Linux. Their purpose is to ensure that key functions such as scheduling, printing, and multimedia are working correctly. These small programs load after we booted or log into the computer. |
| **OS Shell** | The operating system shell or the command language interpreter (also known as the command line) is the interface between the OS and the user. This interface allows the user to tell the OS what to do. The most commonly used shells are Bash, Tcsh/Csh, Ksh, Zsh, and Fish. |
| **Graphics server** | This provides a graphical sub-system (server) called "X" or "X-server" that allows graphical programs to run locally or remotely on the X-windowing system. |
| **Window Manager** | Also known as a graphical user interface (GUI). There are many options, including GNOME, KDE, MATE, Unity, and Cinnamon. A desktop environment usually has several applications, including file and web browsers. These allow the user to access and manage the essential and frequently accessed features and services of an operating system. |
| **Utilities** | Applications or utilities are programs that perform particular functions for the user or another program. |

## Linux Architecture

| **Layer** | **Description** |
|:----------|:----------------|
| **Hardware** | Peripheral devices such as the system's RAM, hard drive, CPU, and others. |
| **Kernel** | The core of the Linux operating system whose function is to virtualize and control common computer hardware resources like CPU, allocated memory, accessed data, and others. The kernel gives each process its own virtual resources and prevents/mitigates conflicts between different processes. |
| **Shell** | A command-line interface (CLI), also known as a shell that a user can enter commands into to execute the kernel's functions. |
| **System Utility** | Makes available to the user all of the operating system's functionality. |

## File System Hierarchy

| **Path** | **Description** |
|:---------|:----------------|
| **/** | The top-level directory is the root filesystem and contains all of the files required to boot the operating system before other filesystems are mounted as well as the files required to boot the other filesystems. After boot, all of the other filesystems are mounted at standard mount points as subdirectories of the root. |
| **/bin** | Contains essential command binaries. |
| **/boot** | Consists of the static bootloader, kernel executable, and files required to boot the Linux OS. |
| **/dev** | Contains device files to facilitate access to every hardware device attached to the system. |
| **/etc** | Local system configuration files. Configuration files for installed applications may be saved here as well. |
| **/home** | Each user on the system has a subdirectory here for storage. |
| **/lib** | Shared library files that are required for system boot. |
| **/media** | External removable media devices such as USB drives are mounted here. |
| **/mnt** | Temporary mount point for regular filesystems. |
| **/opt** | Optional files such as third-party tools can be saved here. |
| **/root** | The home directory for the root user. |
| **/sbin** | This directory contains executables used for system administration (binary system files). |
| **/tmp** | The operating system and many programs use this directory to store temporary files. This directory is generally cleared upon system boot and may be deleted at other times without any warning. |
| **/usr** | Contains executables, libraries, man files, etc. |
| **/var** | This directory contains variable data files such as log files, email in-boxes, web application related files, cron files, and more. |

## System Information

| **Command** | **Description** |
|:------------|:----------------|
| `man <tool>` | Opens man pages for the specified tool. | 
| `<tool> -h` | Prints the help page of the tool. | 
| `apropos <keyword>` | Searches through man pages' descriptions for instances of a given keyword. | 
| `cat` | Concatenate and print files. |
| `whoami` | Displays current username. | 
| `id` | Returns users identity. | 
| `hostname` | Sets or prints the name of the current host system. | 
| `uname` | Prints operating system name. | 
| `pwd` | Returns working directory name. | 
| `ifconfig` | The `ifconfig` utility is used to assign or view an address to a network interface and/or configure network interface parameters. | 
| `ip` | Ip is a utility to show or manipulate routing, network devices, interfaces, and tunnels. | 
| `netstat` | Shows network status. | 
| `ss` | Another utility to investigate sockets. | 
| `ps` | Shows process status. | 
| `who` | Displays who is logged in. | 
| `env` | Prints environment or sets and executes a command. | 
| `lsblk` | Lists block devices. | 
| `lsusb` | Lists USB devices. | 
| `lsof` | Lists opened files. | 
| `lspci` | Lists PCI devices. | 
| `sudo` | Execute command as a different user. | 
| `su` | The `su` utility requests appropriate user credentials via PAM and switches to that user ID (the default user is the superuser).  A shell is then executed. | 
| `useradd` | Creates a new user or update default new user information. | 
| `userdel` | Deletes a user account and related files. |
| `usermod` | Modifies a user account. | 
| `addgroup` | Adds a group to the system. | 
| `delgroup` | Removes a group from the system. | 
| `passwd` | Changes user password. |
| `dpkg` | Install, remove and configure Debian-based packages. | 
| `apt` | High-level package management command-line utility. | 
| `aptitude` | Alternative to `apt`. | 
| `snap` | Install, remove and configure snap packages. |
| `gem` | Standard package manager for Ruby. | 
| `pip` | Standard package manager for Python. | 
| `git` | Revision control system command-line utility. | 
| `systemctl` | Command-line based service and systemd control manager. |
| `ps` | Prints a snapshot of the current processes. | 
| `journalctl` | Query the systemd journal. | 
| `kill` | Sends a signal to a process. | 
| `bg` | Puts a process into background. |
| `jobs` | Lists all processes that are running in the background. | 
| `fg` | Puts a process into the foreground. | 
| `curl` | Command-line utility to transfer data from or to a server. | 
| `wget` | An alternative to `curl` that downloads files from FTP or HTTP(s) server. |
| `python3 -m http.server` | Starts a Python3 web server on TCP port 8000. | 
| `ls` | Lists directory contents. | 
| `cd` | Changes the directory. |
| `clear` | Clears the terminal. | 
| `touch` | Creates an empty file. |
| `mkdir` | Creates a directory. | 
| `tree` | Lists the contents of a directory recursively. |
| `mv` | Move or rename files or directories. | 
| `cp` | Copy files or directories. |
| `nano` | Terminal based text editor. | 
| `which` | Returns the path to a file or link. |
| `find` | Searches for files in a directory hierarchy. | 
| `updatedb` | Updates the locale database for existing contents on the system. |
| `locate` | Uses the locale database to find contents on the system. | 
| `more` | Pager that is used to read STDOUT or files. |
| `less` | An alternative to `more` with more features. | 
| `head` | Prints the first ten lines of STDOUT or a file. |
| `tail` | Prints the last ten lines of STDOUT or a file. | 
| `sort` | Sorts the contents of STDOUT or a file. |
| `grep` | Searches for specific results that contain given patterns. | 
| `cut` | Removes sections from each line of files. |
| `tr` | Replaces certain characters. | 
| `column` | Command-line based utility that formats its input into multiple columns. |
| `awk` | Pattern scanning and processing language. |
| `sed` | A stream editor for filtering and transforming text. | 
| `wc` | Prints newline, word, and byte counts for a given input. |
| `chmod` | Changes permission of a file or directory. |
| `chown` | Changes the owner and group of a file or directory. |

## Kill a Process

A process can be in the following states:

- Running
- Waiting (waiting for an event or system resource)
- Stopped
- Zombie (stopped but still has an entry in the process table).

Processes can be controlled using kill, pkill, pgrep, and killall. To interact with a process, we must send a signal to it. We can view all signals with the command `kill -l`:

| **Signal** | **Description** |
|:------------|:----------------|
| **1** | **`SIGHUP`** - This is sent to a process when the terminal that controls it is closed. |
| **2** | **`SIGINT`** - Sent when a user presses `[Ctrl] + C` in the controlling terminal to interrupt a process. |
| **3** | **`SIGQUIT`** - Sent when a user presses `[Ctrl] + D` to quit. |
| **9** | **`SIGKILL`** - Immediately kill a process with no clean-up operations. |
| **15** | **`SIGTERM`** - Program termination. |
| **19** | **`SIGSTOP`** - Stop the program. It cannot be handled anymore. |
| **20** | **`SIGTSTP`** - Sent when a user presses [Ctrl] + Z to request for a service to suspend. The user can handle it afterward. |

## Vim

| **Mode** | **Description** |
|:---------|:----------------|
| **Normal** | In normal mode, all inputs are considered as editor commands. So there is no insertion of the entered characters into the editor buffer, as is the case with most other editors. After starting the editor, we are usually in the normal mode. |
| **Insert** | With a few exceptions, all entered characters are inserted into the buffer. |
| **Visual** | The visual mode is used to mark a contiguous part of the text, which will be visually highlighted. By positioning the cursor, we change the selected area. The highlighted area can then be edited in various ways, such as deleting, copying, or replacing it. |
| **Command** | It allows us to enter single-line commands at the bottom of the editor. This can be used for sorting, replacing text sections, or deleting them, for example. |
| **Replace** | In replace mode, the newly entered text will overwrite existing text characters unless there are no more old characters at the current cursor position. Then the newly entered text will be added. |

## Find

| **Option** | **Description** |
|:-----------|:----------------|
| **`-type f`** | 	Hereby, we define the type of the searched object. In this case, 'f' stands for 'file'. |
| **`-name *.conf`** | With `'-name'`, we indicate the name of the file we are looking for. The asterisk (*) stands for 'all' files with the `'.conf'` extension. |
| **`-user root`** | This option filters all files whose owner is the root user. |
| **`-size +20k`** | We can then filter all the located files and specify that we only want to see the files that are larger than 20 KiB. |
| **`-newermt 2020-03-03`** | With this option, we set the date. Only files newer than the specified date will be presented. |
| **`-exec ls -al {} \;`** | This option executes the specified command, using the curly brackets as placeholders for each result. The backslash escapes the next character from being interpreted by the shell because otherwise, the semicolon would terminate the command and not reach the redirection. |
| **`2>/dev/null`** | This is a **`STDERR`** redirection to the `'null device'`, which we will come back to in the next section. This redirection ensures that no errors are displayed in the terminal. This redirection must not be an option of the 'find' command. |

## File Descriptors
1. Data Stream for Input
- `STDIN - 0`
2. Data Stream for Output
- `STDOUT - 1`
3. Data Stream for Output that relates to an error occuring
- `STDERR - 2`

## Change Permissions
We can modify permissions using the `chmod` command, permission group references (`u` - owner, `g` - Group, `o` - others, `a` - All users), and either a [`+`] or a [`-`] to add remove the designated permissions. In the following example, a user creates a new shell script owned by that user, not executable, and set with read/write permissions for all users.

Imagem explicando as permissões em /home/felipe/Pictures/Linux.


# Linux Shortcuts

## Auto-Complete
`[TAB]` - Initiates auto-complete. This will suggest to us different options based on the `STDIN` we provide. These can be specific suggestions like directories in our current working environment, commands starting with the same number of characters we already typed, or options.

## Cursor Movement
- `[CTRL] + A` - Move the cursor to the **beginning** of the -current line.
- `[CTRL] + E` - Move the cursor to the **end** of the current line.
- `[CTRL] + [←]` / `[→]` - Jump at the beginning of the current/previous word.
- `[ALT] + B` / `F` - Jump backward/forward one word.

## Erase The Current Line
`[CTRL] + U` - Erase everything from the current position of the cursor to the **beginning** of the line.
`[Ctrl] + K` - Erase everything from the current position of the cursor to the **end** of the line.
`[Ctrl] + W` - Erase the word preceding the cursor position.

## Paste Erase Contents
`[Ctrl] + Y` - Pastes the erased text or word.

## Ends Task
`[CTRL] + C` - Ends the current task/process by sending the `SIGINT` signal. For example, this can be a scan that is running by a tool. If we are watching the scan, we can stop it / kill this process by using this shortcut. While not configured and developed by the tool we are using. The process will be killed without asking us for confirmation.

## End-of-File (EOF)
`[CTRL] + D` - Close `STDIN` pipe that is also known as End-of-File (EOF) or End-of-Transmission.

## Clear Terminal
`[CTRL] + L` - Clears the terminal. An alternative to this shortcut is the `clear` command you can type to clear our terminal.

## Background a Process
`[CTRL] + Z` - Suspend the current process by sending the `SIGTSTP` signal.

## Search Through Command History
`[CTRL] + R` - Search through command history for commands we typed previously that match our search patterns.
`[↑]` / `[↓]` - Go to the previous/next command in the command history.

## Switch Between Applications
`[ALT] + [TAB]` - Switch between opened applications.

## Zoom
`[CTRL] + [+]` - Zoom in.
`[CTRL] + [-]` - Zoom out.

