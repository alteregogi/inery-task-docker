## Inery Task Docker

Tujuan Repo ini adalah untuk memudahkan kalian install Node dan Menjalankan tasknya,  
Step di bawah dan Task yang ada di bawah semuanya di jalankan di dalam **Docker**, jadi kalau kalian mau memakai inery-automation di versi ini, kalian harus install ulang node kalian melalui step2 di bawah.

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


Pindah directory ke git yang barusan udah di clone

```
cd inery-task-docker/
```


Edit file docker-compose nya dan masukkan parameters sesuai yang kalian punya

```
nano ./docker-compose.yml
```


Penjelasan parametersnya

| Parameters           | Change to           |
| -------------------- | ------------------- |
| `INERY_ACCOUNT_NAME` | Your Inery Account  |
| `INERY_PUBLIC_KEY`   | Your Public Account |
| `INERY_PRIVATE_KEY`  | Your Private Key    |
| `NODE_IP_ADDRESS`    | Your Node IP        |



## 4. Node Installation dan Task Automation



#### Install Docker

```shell
make install.docker
```

check docker udah ke install belum pakai command ini, kalau ada muncul version berarti docker udah ke install.
```
docker version
```



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

Cek logs master nodenya , pastikan udah pick up block nya dengan command di bawah

```makefile
make logs.master
```

**Master node installation selesai tinggal nunggu sync aja** 

#### Install task automation

```makefile
make install.automation
```



#### Buat munculin menu task-automation

Task automation ini kalian tidak usah jalankan menu create node karena node sudah di bikin di awal, cukup jalankan menu **Create Wallet** dan menu **Task 1 - 3** saja

```makefile
make menu
```



## Semua penjelasan command

##### Command buat installation

| Command                   | Functions                                                    |
| ------------------------- | ------------------------------------------------------------ |
| `make install.docker`     | Install docker                                               |
| `make install.automation` | Install inery-automation tools                               |
| `make install.node`       | Buat awal install node                                       |
| `make create.volume`      | Buat bikin folder `~/inery/inery-node-vol` karena semua data blockchain bakal di masukin ke folder tersebut |

##### Node related Command

| Command             | Functions                               |
| ------------------- | --------------------------------------- |
| `make node.lite`    | Buat bikin lite node                    |
| `make node.master`  | Buat bikin master node                  |
| `make node.restart` | Restart Node                            |
| `make node.process` | Buat check process yang ada di dlm node |
| `make node.kill`    | Kill nodine                             |
| `make node.stop`    | Stop inery node                         |
| `make node.start`   | Start inery node                        |
| `make node.bash`    | Buat masuk ke terminal node nya         |
| `make menu`         | Buat munculin inery-automatino menu     |
| `make logs.lite`    | Buat munculin logs lite node            |
| `make logs.master`  | Buat munculin logs master node          |

##### Inery Automation

| Command     | Functions                           |
| ----------- | ----------------------------------- |
| `make menu` | Buat munculin menu inery-automation, documentation baca di https://github.com/briliant1/inery-automation |

##### Management Command

| Command                 | Functions                                                    |
| ----------------------- | ------------------------------------------------------------ |
| `make delete.all`       | Delete semua docker container, image, dan volume             |
| `make delete.container` | delete node container                                        |
| `make delete.image`     | delete node image                                            |
| `make delete.volume`    | delete volume                                                |
| `make all`              | delete semua related node di dlm docker dan bikin baru master nodenya. |
| `make update`           | Update inery-task-docker                                     |

