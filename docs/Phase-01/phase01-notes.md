# Phase 01 Notepad

## Permissions

Learning about permissions from [wooledge - Permissions](https://mywiki.wooledge.org/Permissions)

### Notes

- The files aren't owned by names like danish. they are owned by UID numbers (User IDs) and they are displayed in human readable names with the help of `ls` that uses getpwid(3) from C library to do it. Likewise for the GID ( Group ID)
- Permissions are in Octal numbers when converted from binary that display the 3 octal digits to show the permissions for owner, group and others. For Example: `111101101` Here the first 3 numbers are for owner if we convert them to octal 111 becomes 4+2+1 or 7. Second number becomes 4+0+1 or 5 and Third one 4+0+1 or 5. Meaning the Owner has read write execute permissions. And group and others just have read and execute.
- You can easily determine the octal number by adding the `r,w and x`. Where `r` always corresponds to a `4`, `w` is always a `2` and an `x` is alays a `1`. So the `111101101` becomes `755`.

