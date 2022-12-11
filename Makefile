# Prerequites
install.docker:
	curl -fsSL https://get.docker.com -o get-docker.sh
	sh get-docker.sh
	sudo apt-get install -y uidmap
	dockerd-rootless-setuptool.sh install

install.automation:
	docker compose exec -it inery-node sh -c "git clone https://github.com/briliant1/inery-automation.git \
												&& chmod +x ./inery-automation/ineryMenu.py \
												&& pip3 install -r ./inery-automation/requirements.txt"

install.node:
	sudo ufw allow 9010
	sudo ufw allow 8888
	docker compose up -d

create.volume:
	mkdir -p ~/inery/inery-node-vol

node.lite:
	docker compose exec -itd inery-node sh -c "cd ./inery-node/inery.setup/ && ./ine.py --lite"

node.master:
	docker compose exec -itd inery-node sh -c "cd ./inery-node/inery.setup/ && ./ine.py --master"

node.restart: node.stop node.start

node.process:
	docker compose exec -it inery-node ps aux

node.kill:
	docker compose exec -it inery-node sh -c "pkill nodine"

node.stop:
	docker compose exec -it inery-node sh -c "./inery.setup/master.node/stop.sh;"

node.start:
	docker compose exec -it inery-node sh -c "./inery.setup/master.node/start.sh"

node.bash:
	docker compose exec inery-node bash

menu:
	docker compose exec -it inery-node ineryMenu.py

delete.all: delete.container delete.image delete.volume

delete.container:
	docker container rm inery-node -f

delete.image:
	docker image rm alteregogi/inery-node

delete.volume:
	docker volume rm inery-node-docker

logs.master:
	docker compose exec -it inery-node sh -c "tail -f /root/inery-node/inery.setup/master.node/blockchain/nodine.log"

logs.lite:
	docker compose exec -it inery-node sh -c "tail -f /root/inery-node/inery.setup/lite.node/blockchain/nodine.log"

all: delete.container delete.image create.node create.master