# Phase 01 Notepad

## Permissions

Learning about permissions from [wooledge - Permissions](https://mywiki.wooledge.org/Permissions)

### Notes

**29th April 2026**

- The files aren't owned by names like danish. they are owned by UID numbers (User IDs) and they are displayed in human readable names with the help of `ls` that uses getpwid(3) from C library to do it. Likewise for the GID ( Group ID)
- Permissions are in Octal numbers when converted from binary that display the 3 octal digits to show the permissions for owner, group and others. For Example: `111101101` Here the first 3 numbers are for owner if we convert them to octal 111 becomes 4+2+1 or 7. Second number becomes 4+0+1 or 5 and Third one 4+0+1 or 5. Meaning the Owner has read write execute permissions. And group and others just have read and execute.
- You can easily determine the octal number by adding the `r,w and x`. Where `r` always corresponds to a `4`, `w` is always a `2` and an `x` is alays a `1`. So the `111101101` becomes `755`.

**30th April 2026**

- **UMASK** Basically is a permission filter that you can set before creating files and directories. The umask you set will determine what permissions will be on the file and directory. For example a `umask` 077 means you don't want anyone except the owner to have `rwx` permissions.
- **Directory Permissions** - When you have read permission of a directory you can just get a list of filenames in that directory and nothing else. You cannot see the stats with `ls` and cannot open files.
- With write permission of a directory you can `create` , `rename` or `delete` files even without ownership or permissions on the file themselves.
- Umasks are one per process and not per directory.

**1st May 2026**

- `chmod 000` works as intended for other users and for `cat`, but as the file owner I can still force-write in vim using `:wq!` because ownerships trumps permission bits for the owner
- Same behaviour with other restrictions
- `cat` works as intended
- `chmod` without `r` permission on a directory stops you from `cd` into it
- `chmod 444` on a directory stops you from `cd` into it or accessing files inside the directory with vim
- `chmod 111` on a directory lets you `cd` into it
- `chmod 222` on a directory stops you from `cd` into it
- `chmod 666` on a directory stops you from `cd` into it
- `chmod 666` on a directory stops you from opening files in it in vim
- `chmod 555` on  a directory lets you open the files in it with vim
- From my understanding you need execute permission to open the files in vim as well as read permission if you miss any of them you cannot open the files in vim I think its the same with cat as well
- `755` is the standard for directories and `644` for files
- `rm` (delete) permission exists on the directory, not the file. so you can delete anything inside a directory that you own regardless of who owns the file or what the file's permissions are. 
- File's permissions protect reading and writing its contents. The parent-directory's write permissions controls whether you can remove the file entirely.
- This is also why chmod 1777 (the sticky bit) exists on directories like /tmp. Without it, anyone could delete anyone else's files in a shared directory since everyone has write access. The sticky bit restricts deletion so only the file's owner can delete it even if the directory is world-writable.

**13th May 2026**

- `chown` is used to change ownership of a file. You will need superuser `sudo` permissions to change it.
- `umask` works as intended. it is essentially a filter of permissions you use at the time of creating files. such as `umask` of 022 removes write permissions from `group` and `others`.
- `setuid` is a special permission bit that allows you to run a command with file owner's permissions
- `setuid` bit `s` represents it. in case of capital `S` it still does the same thing but it won't have execute permission so it is essentially useless and most probably a mistake
- `setuid (4)` - file runs as owner, not the user executing it. shown as `s` in owner execute.
- `setgid (2)` - file runs as group, not the user's group. shown as `s` in group execute.
- `sticky (1)` - on directories, only owner can delete their own files. shown as `t` in other execute.
- That's `chmod 4755`, `chmod 2755`, `chmod 1777` respectively.
- Basically bit `4` is for running as the owner, `2` is for running as group that that file access is cleared for and the sticky bit `1` that only lets the owner of the file delete it.
- `setgid` or `4` on a directory behaves differently than on a file. On a file it means run as the group. On a directory it means any new files created inside inherit the directory's group instead of the creator's default group. Useful for shared team directories.

**14th May 2026**

- **Process Management**
- Every process is identified by a number, called the **PID**, or **Process IDentifier**.
- When working with a process, you must know its PID in order to be able to do anything with it because Looking for processes by name is extremely error prone.
- the reason looking for processes by name is error prone is because multiple processes can have the same name, and process names can be spoofed. PID is the only guaranteed unique identifier. That's why scripts that rely on `ps | grep processname` are fragile because you might kill the wrong thing.
- You can use `command &` to run a process in the background. For multiple commands you can use `command & command & command &` and they will run in the background simultaneously 
- `;` can also be used to separate commands but `&` runs them in the background and `;` runs them in sequence
- The `$!` special parameter holds the PID of the most recently executed background job
- simply run the `ps` command to get a snapshot of the active processes in the current terminal session
- `ps aux` is used to display:
	- `a` - displays all processes for all users
	- `u` - provides a detailed user oriented format
	- `x` - includes processes that are not attached to any terminal, like daemons that start at boot and show `?` at the TTY column
- `ps aux` is a BSD Style without dash before options
- `ps -ef` is used to display:
	- `-e` - selects every process on the system
	- `-f` - displays full format which includes details like UID, PPID (Parent Process ID), C (CPU utilization), and STIME (start time).
- `ps -ef` is a System V style with dash before options
- `top` is the real-time monitoring command that displays all the processes that are currently running and displays things like CPU and RAM Usage among many other things

**15th May 2026**

- TTY = Teletype
- Terminal and Pseudo Terminals
- Kernel allocates resources to processes
- Kernel also acts as a scheduler allocates resources by need and priority if there are competing processes. This way they all get fair share of resources.
- The `fork` call creates a nearly identical child process. 
- After forking, the child process can either continue running the same program as its parent or, more commonly, use the `execve` system call to load and run a new program.
- `fork-exec` two step is how you create a process in linux. 
- Every single time you run any command in your terminal like `ls`, `chmod`, `git`, `vim` that fork-exec sequence happens. Every time. Only Exceptions are builtins like `cd`, `echo`, `pwd` that are handled by shell itself.
- `init` process is the ancestor process with PID 1. It starts when the system boots and is basically the parent of all other processes that will run.
- `_exit` tells the kernel process is finished and its resources are ready to be reclaimed.
- Kernel stores the `PID` and exit status as a `0` if the exit was successful or `non-zero` if it had complications. This inbetween time is called the `zombie process` like its dead but not yet buried
- Then the parent calls `wait` and kernel gives the exit status to the parent and cleans the process from table
- The process of a parent calling `wait` is called "reaping"
- If a parent process never calls `wait`, zombies will keep increasing. A few zombies are not a big deal but a lot of them can fill the process table to keep new processes from being created. If a parent process dies before the child process is finished then `init` adopts it and will call `wait` to reap it
- You will also see `zombie` processes when you run `ps aux` as `Z` in the status column
- Orphan process is active whose parent is dead, `init` adopts it and it continues to execute until it is done
- Zombie process is dead itself after completing its execution but still is present in process table. It is waiting for parent process to read its exit status

**16th May 2026**

- Signal is a software interrupt sent to a process to notify it that something important has happened.
- Signals are the primary IPC(inter-process communication)
- Users can send signals for example CTRL-C to terminate the process
- Kernel can send signals to notify of a process accessing memory that it is not authorized to access
- System administrators use signals to manage processess, like reloading a configuration or requesting termination of a process
- When a signal is generated by an event happening, it is sent to the process but it remains in the pending state until the kernel runs it. The the next time the process gets to use the CPU before handing over the control to the process, the kernel runs the signals first. 
- Processes have Signal masks and they can be configured to block specific signals from being delivered
- When the signal is delivered to the process, it can take one of many actions:
	 1. **Ignore the Signal**: process just ignores and shrugs off the signal and continues what it was executing
	 2. **Catch the Signal**: process executes a custom function called *signal handler* to respond to the signal
	 3. **Perform the default action**: if the signal is not caught or ignored then the default action is taken. For many processes this means terminating the process
	 4. **Block the signal**: signals that are in that process's signal mask remain pending until they are unblocked
- **SIG** is the start of os sig codes
- **SIGHUP(1)**: is the hangup. It is used to reload a daemon's configuration
- **SIGINT(2)**: Interrupt. It is sent by `CTRL-C`. It is a request to terminate the process.
- **SIGKILL(9)**: Kill. This is not a request but an immediate forceful termination of a process. The process is unable to ignore, catch, or block this signal.
- **SIGSEGV(11)**: This is the signal that indicates that the process tried to access a segment of memory that is unauthorized for it to access, or it does not exist, or it has read access to the memory but tried to write. kernel sends the **SIGSEGV** and the process dies unless it has a handler for it. 
- **SIGTERM(15)**: Termination. A polite way to ask the process to terminate. It is the default signal sent by the `kill` command. A Process can catch this signal and do the cleanup before exiting. 
- **SIGSTOP**: Stop. It pauses the process. It cannot be caught or ignored like **SIGKILL** 
- Main difference between **SIGTERM(15)** and **SIGKILL** is that **SIGTERM** is a request of termination that can be handled, but **SIGKILL** just kills the process immediately.
