# Portable OpenMLDB

The portable and out-of-the-box OpenMLDB cluster which can be run easily.

Here are the features:

* Setup and start OpenMLDB cluster without network.
* Encapsulated in U Disk which can be run anywhere.
* Easy to upgrade to the latest OpenMLDB version.
* Persist the data of OpenMLDB with custom U Disk.

## Usage

1. Insert the pre-built U Disk.
2. Start OpenMLDB cluster with `start.sh`.
3. Test OpenMLDB cluster with `test.sh`.
4. Use OpenMLDB CLI with `openmldb_cli.sh`.

## Build U Disk

If you don't have pre-built U Disk, you can download the release file and build for yourself.

```
wget $GITHUB_RELEASE_FILE

tar xzvf $GITHUB_RELEASE_FILE
```

The downloaded files can put in any directory and run OpenMLDB without network.

## Upgrade OpenMLDB

Upgrade OpenMLDB will clean up all the current data by default. You may backup the data before upgrading.

```
./upgrade.sh
```

