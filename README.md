# **H-A-D-M** 

*****************

## Here to simplify your life

Welcome to Health And Device Monitor, or HADM for short.
The purpose of this tool is to simplify the life of a Sys-Admin by helping with command writing.

Commands can be tedious and hard to write, that's why this shit exists! Because being lazy is what we like, right?
(👉ﾟヮﾟ)👉

HADM is made with simplicity in mind, so just specify what you'd like to do and follow the steps!
It's that SHRIMPLE. (Why do I do this to myself?...)

At the moment, the following utility categories are planned(I have no detailed plan of structure at the moment.)
Finished categories are ticked with a checkbox:

- [X] Hardware status (CPU/Tasks/RAM(Short/Long)) using `top`
- [X] Hardware temperatures using `lm-sensors`
  - [X] Check availibility on WSL/WSL2/VM (Does not work, maybe I could make it work though... (T_T) )
  - [X] Check availability on an native Linux device (It does work... Usually! (⊙ˍ⊙) )
- [X] S.M.A.R.T utility (Drive management/status) using `smartmon`
  - [X] Scan for drives.
  - [X] Retrieve drive data.
  - [X] Health control of specified drive (`smartctl`).
- [X] Drive I/O (Drive I/O statistics and status) using `iostat`
- [ ] Network details (UP/DOWN/TYPE) using `ss`
  - [X] Check availability on WSL/WSL2/VM (Does not work, maybe I could make it work though... (T_T) ).
  - [ ] Check availability on an native Linux device (It'll probably work, unless something is very wrong... (⊙ˍ⊙))
- [ ] Usage alert (Drive full, low battery) using `N/A`

Here are some things I'm planning on implementing to make usage of HADM easier!:

- [ ] Find a way to get the script crontabbed.
- [ ] Finish my python assignments... So I can work on this full-time :'D
- [ ] Optimize the code, so it doesn't look like actual spaghetti...
- [ ] Have an install script to make installing necessary packages easier.
  - [ ] Install/Uninstall with the script.
  - [X] Checks exit status codes for `apt`: (0/1/100/*).
  - [X] Checks for sudo perms. (`WE NEED SUDO! ┻━┻ ︵ ＼( °□° )／ ︵ ┻━┻`)
  - [X] `yes`

*****************

## Note

### Sudo priviliges

HADM uses some tools that require SUDO privs, usually you shouldn't just give SUDO privs to a script that you've found online, but the script is relatively simple, so if you decide to read and find out how it works, you'll see that it will not be malicious and execute any `MALICIOUS CODE` or `RUIN YOUR SYSTEM` in any kind of way.
(If you're still skeptical, then I'm not sure what to tell you... 😅)

### Dependencies

Note that there may be some dependencies that you may need to install, such as the package for SMART tools and something that wouldn't come downloaded by default in a system. Because we're just cool like that. I'll make sure to include an list of dependencies for your convencience and make an script for installing the dependencies.
(⌐■_■)

*****************

Happy coding, by yours truly!
RichCat-code (Student arc)