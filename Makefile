install:
	bash ./install.sh

update:
	git pull origin master && bash ./install.sh
	echo "\33[32m[✔]\33[0m update success!"
push:
	git push origin master

add-u:
	git add -u

commit:
	make add-u
	git commit -m "little modify"

status:
	git status
