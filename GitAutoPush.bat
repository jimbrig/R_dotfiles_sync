:loop

	:: Navigate to the directory you wish to push to GitHub
	::Change <path> as needed. Eg. C:\Users\rich\Desktop\Writings
	cd "%userprofile%/.R/R_dotfiles_sync"

	::Initialize GitHub
	::git init

	::Pull any external changes (maybe you deleted a file from your repo?)
	git pull

	::Add all files in the directory
	git add --all

	::Commit all changes with the message "auto push".
	::Change as needed.
	git commit -m "auto push"

	::Push all changes to GitHub
	git push

	::Alert user to script completion and relaunch.
	echo Complete. Relaunching...

	::Wait 86,400 seconds (1 Day) until going to the start of the loop.
	::Change as needed.
	TIMEOUT 86400

::Restart from the top.
goto loop
