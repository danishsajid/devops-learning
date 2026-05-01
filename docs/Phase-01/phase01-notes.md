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
