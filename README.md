# Portable OpenMLDB

The portable and out-of-the-box OpenMLDB cluster which can be run offline.

Here are the features:

* Setup and start OpenMLDB cluster **without network**.
* **Encapsulated in U Disk** which can be run anywhere.
* Easy to **upgrade with the latest OpenMLDB** version.
* **Persist the data** of OpenMLDB cluster in U Disk.

## Usage

1. Insert the U Disk or download the pre-built package file.
2. Start and stop OpenMLDB cluster with `start.sh` and `stop.sh`.
3. Test OpenMLDB cluster with `test.sh` and `openmldb_cli.sh`.

If you have installed `dialog`, use `console.sh` just like other GUI applications.

![](./images/portable_openmldb_console.png)

## Run Offline

If you want to run OpenMLDB without network, just download the pre-built package file.

```
wget http://topic-land.com:39137/portable_openmldb/0.7.1/portable_openmldb.tar.gz

tar xzf ./portable_openmldb.tar.gz
```

The downloaded files can be run offline in Linux and MacOS. You can put it in hard disk or U Disk.

## Manage OpenMLDB

### Start Cluster

This will start ZooKeeper(1 Node) and OpenMLDB cluster(NameServer/2 Tables/APIServer/TaskManager).

```
./start.sh
```

### Stop Cluster

This will stop ZooKeeper and OpenMLDB cluster.

```
./stop.sh
```

### Cleanup Cluster

This will cleanup all the data of ZooKeeper and OpenMLDB cluster.

```
./cleanup.sh
```

### Access Cluster

You can run smoke test for OpenMLDB cluster.

```
./test.sh
```

You can use OpenMLDB CLI for more usage.

```
./openmldb_cli.sh
```

### Config Cluster

If you want to change the ports of ZooKepper and OpenMLDB cluster, update the following file.

```
vim ./openmldb.env
```

If you want to update the configuration of ZooKeeper and OpenMLDB manually, run the following command.

```
./update_config.sh
```

### Use Console

If you want to install `dialog`, run the following command for Ubuntu.

```
apt install -y dialog
```

Install with this command for MacOS.

```
brew install dialog
```

You can use the command-line console now.

```
./console.sh
```

For MacOS, you can double click `console.command` and use with cursor.

### Upgrade OpenMLDB

Upgrade OpenMLDB will clean up all the current data by default. You may backup the data before upgrading.

```
./upgrade.sh
```

## Build U Disk

If you want to build the package file so that you can run anywhere in offline mode, please run with the following commands.

```
./download_packages.sh

./update_udisk_packages.sh

./build_portable_openmldb.sh
```

