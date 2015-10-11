install:
	bash ./install.sh

update:
	git pull orgin master && bash ./install.sh
	echo "\33[32m[✔]\33[0m update success!"
