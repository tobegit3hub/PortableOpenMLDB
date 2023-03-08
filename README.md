# Portable OpenMLDB

The portable OpenMLDB cluster which can be run offline without installation.

Here are the features:

* Decompress OpenMLDB cluster **without installation**.
* Start and access OpenMLDB cluster **without network**.
* **Encapsulated in U Disk** or hard disk to run anywhere.
* Integraded to **upgrade for the latest OpenMLDB** version.
* **Persist the data** of OpenMLDB cluster in your U Disk.

## Download

If you want to run OpenMLDB without network, just download the pre-built package file.

```
wget http://topic-land.com:39137/portable_openmldb/0.7.2/portable_openmldb.tar.gz

tar xzf ./portable_openmldb.tar.gz
```

The downloaded files can be run offline in Linux and MacOS. You can put it in hard disk or U Disk.

## Usage

![](./images/portable_openmldb_console.png)

| Operation | Command | Introduction |
| --------- | ------- | ------------ |
| Start Cluster | `./start.sh` | This will start ZooKeeper(1 Node) and OpenMLDB cluster(NameServer/2 Tables/APIServer/TaskManager). |
| Stop Cluster | `./stop.sh` | This will stop ZooKeeper and OpenMLDB cluster.  |
| Cleanup Cluster | `./cleanup.sh` | This will cleanup all the data of ZooKeeper and OpenMLDB cluster. |
| Test Cluster | `./test.sh` | You can run smoke test for OpenMLDB cluster. |
| Access Cluster | `./openmldb_cli.sh` | You can use OpenMLDB CLI for more usage. |
| Upgrade OpenMLDB | `./upgrade.sh` | Upgrade OpenMLDB will clean up all the current data by default. You may backup the data before upgrading. |
| GUI Console | `./console.sh` | You can use the command-line console now. |

Notice that `dialog` is required for `./console.sh`. You can run the following command for Ubuntu.

```
apt install -y dialog
```

Install with this command for MacOS.

```
brew install dialog
```

## Build From Scratch

If you want to build the package file so that you can run anywhere in offline mode, please run with the following commands.

```
./download_packages.sh

./update_udisk_packages.sh

./build_portable_openmldb.sh
```

