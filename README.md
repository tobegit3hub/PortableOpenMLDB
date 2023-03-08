# Portable OpenMLDB

The portable OpenMLDB cluster which can be run without installation. Here are the features:

* Try and test OpenMLDB cluster **without installation**.
* Setup **full-featured OpenMLDB cluster** without network.
* Persist cluster and data in **U Disk** to run anywhere.
* One commmand to **upgrade to the latest OpenMLDB** version.

## Download

If you want to run OpenMLDB without installation and network, just download the pre-built package.

```
wget http://topic-land.com:39137/portable_openmldb/0.7.2/portable_openmldb.tar.gz

tar xzf ./portable_openmldb.tar.gz
```

The downloaded files can be run offline in Linux and MacOS. You can put the files in hard disk or U Disk.

## Usage

| Operation | Command | Introduction |
| --------- | ------- | ------------ |
| Start Cluster | `./start.sh` | This will start ZooKeeper(1 Node) and OpenMLDB cluster(NameServer/2 Tables/APIServer/TaskManager). |
| Stop Cluster | `./stop.sh` | This will stop ZooKeeper and OpenMLDB cluster.  |
| Cleanup Cluster | `./cleanup.sh` | This will cleanup all the data of ZooKeeper and OpenMLDB. |
| Test Cluster | `./test.sh` | You can run smoke test for OpenMLDB cluster. |
| Access Cluster | `./openmldb_cli.sh` | You can use OpenMLDB CLI for more usage. |
| Upgrade Cluster | `./upgrade.sh` | Upgrade OpenMLDB will clean up all the current data by default. You may backup the data before upgrading. |
| GUI Console | `./console.sh` | You can use the command-line console with cursor supported. |

![](./images/portable_openmldb_console.png)

Notice that `dialog` is required for `./console.sh`. You can run the following command for Ubuntu.

```
apt install -y dialog
```

Install with this command for MacOS.

```
brew install dialog
```

## Build From Scratch

If you want to build the package file with custom binaries, please run with the following commands.

```
./download_packages.sh

./update_udisk_packages.sh

./build_portable_openmldb.sh
```

