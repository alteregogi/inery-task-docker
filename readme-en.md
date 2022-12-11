## Inery Task Docker

The purpose of this repository is to make it easier for you to install Node and run its tasks. All of the steps and tasks below should be run within Docker. If you want to use this version of inery-automation, you will need to reinstall your Node using the instructions in step below.

**Requirements:**

delete and uninstall previous inery node, kill its process

```
pkill nodine
```



## 1. Update OS 

```
sudo apt update && sudo apt upgrade -y
```



## 2. Install Requirements

```
sudo apt-get install -y git make
```



## 3. Clone Repositories

```
git clone https://github.com/alteregogi/inery-task-docker.git
```


Change Directories to inery-task-docker

```
cd inery-task-docker/
```


Edit Configuration

```
nano ./docker-compose.yml
```


Edit required parameters

| Parameters           | Change to           |
| -------------------- | ------------------- |
| `INERY_ACCOUNT_NAME` | Your Inery Account  |
| `INERY_PUBLIC_KEY`   | Your Public Account |
| `INERY_PRIVATE_KEY`  | Your Private Key    |
| `NODE_IP_ADDRESS`    | Your Node IP        |



## 4. Installation

#### Install Docker

```shell
make install.docker
```

run `docker version` to check if docker installed in your node

#### Install Master Node

```makefile
make create.volume
```

```makefile
make install.node
```

```makefile
make node.master
```

Check master node logs, make sure that node picking up new block

```makefile
make logs.master
```



#### Install task automation

```makefile
make install.automation
```



#### Show inery-automation menu

```makefile
make menu
```



#### Create your wallet

```shell
make menu
```

go to Wallet Menu, choose create new wallet and input your wallet name



## All command references

##### Installation Command

| Command                   | Functions                                                    |
| ------------------------- | ------------------------------------------------------------ |
| `make install.docker`     | To install Docker                                            |
| `make install.automation` | To install inery-automation tools                            |
| `make install.node`       | To install inery-node                                        |
| `make create.volume`      | To create `~/inery/inery-node-vol` directory to save all blockchain data in there |

##### Node related Command

| Command             | Functions                       |
| ------------------- | ------------------------------- |
| `make node.lite`    | To create lite node             |
| `make node.master`  | To create inery master node     |
| `make node.restart` | To restart inery node           |
| `make node.process` | Check process inside node       |
| `make node.kill`    | Kill nodine process inside node |
| `make node.stop`    | Stop inery node                 |
| `make node.start`   | Start inery node                |
| `make node.bash`    | run terminal inside your node   |
| `make menu`         | to show inery-automation menu   |
| `make logs.lite`    | show logs for lite nod          |
| `make logs.master`  | show logs for master node       |

##### Inery Automation

Just use **Create Wallet** menu, and **Task 1 - 3** menu, since we have created our inery node in previous step.

| Command     | Functions                     |
| ----------- | ----------------------------- |
| `make menu` | to show inery-automation menu |

##### Management Command

| Command                 | Functions                                      |
| ----------------------- | ---------------------------------------------- |
| `make delete.all`       | delete all docker container, image, and volume |
| `make delete.container` | delete node container                          |
| `make delete.image`     | delete node image                              |
| `make delete.volume`    | delete volume                                  |
| `make all`              | Delete docker image and create master node     |

