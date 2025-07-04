# Syncthing plugin for KOReader

*Forked from https://github.com/jasonchoimtt/koreader-syncthing which seems unmaintained.*

This is a plugin for running Syncthing on e-readers running KOReader. Syncthing
is a peer-to-peer file synchronization program. This makes it possible to sync
files between your e-reader and computer / phone automatically. The Syncthing
instance on your e-reader can be managed directly in the KOReader menu.

The method of running Syncthing is originally based on [The Anarcat's blog post](https://anarc.at/hardware/tablet/kobo-clara-hd/#install-syncthing).

This version should work on ARM32 and on AMD64 hardware.

## Project status

- This plugin has not been widely tested. Make frequent data backups and use it
  at your own risk!
- Tested on Kobo Sage

## Installation

### Prerequisites

- Currently the plugin is only tested on a Kobo device. Maybe it will also work
  on Kindle and other Linux-based environments, but additional testing will be
  needed.
- You should have installed KOReader and will need to copy files to the device.
- You need to setup Syncthing on another device, which will be able to connect
  to your e-reader in your local Wi-Fi network.

### Install plugin

1.  Download the [latest ZIP from GitHub](https://github.com/wardwouts/koreader-syncthing/archive/refs/heads/main.zip)
    and extract the archive.
2.  Copy the folder `syncthing.koplugin` to your KOReader installation, under
    the `plugins` folder. For Kobo devices, this is usually
    `.adds/koreader/plugins` in the device storage.
3.  Restart KOReader.

### Configure devices and folders

4.  The Syncthing menu will be available under the Tools tab in the file
    browser. Check *Syncthing* menu item to start the Syncthing server. Make
    sure the e-reader is also connected to Wi-Fi.
5.  On your other Syncthing device, add the e-reader by scanning the QR code or
    entering the device ID manually.
6.  Go to the *Pending* menu and accept the device.
7.  On your other Syncthing device, add the e-reader to a folder.
8.  Go to the *Pending* menu and accept the folder.
9.  View the *Status* menu to see sync status.
10. For other options you will need to use the Syncthing GUI. Use *Set GUI
    Password* menu item to set GUI password and go to `http://<ereader-ip>:8384`
    on another device. Login with username `syncthing` and your password. You
    can tap *Syncthing Web GUI* menu item to see network info.

## FAQ

- **Why would you want Syncthing on an e-reader?**

  It keeps my books and annotations continuously synchronized with my computer
  and my Android phone (which can has a Syncthing app). It comes in handy when
  you read books with KOReader on multiple devices. For the privacy-conscious
  people, Syncthing does not require creating a cloud account and storing your
  data in their cloud.

- **How well does it work?**

  The synchronization itself usually works quite well on the e-reader side, but
  the connectivity is also affected by your other devices and the local network
  conditions. I will still need to iron out a few wrinkles to make the
  experience great. But having a Syncthing menu right in KOReader is the first
  step in making this accessible to the community.

## Developing

- Syncthing binaries are included in the repository from the [official
  releases](https://syncthing.net/downloads/)
  - Using Linux ARM 32-bit and AMD64 binary

## Limitations

- The Syncthing menu is still limited in functionality when it comes to managing
  devices and folders.

## TODO

- [ ] Allow adding device to folder from e-reader
- [ ] Properly accept three-way sharing
- [ ] Implement conflict resolution for KOReader metadata file
