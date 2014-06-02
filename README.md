obnam Cookbook
==============

Installs obnam ppa, creates user keys and sets up a typical cron script
Assumes that you want to upload all files in *backup_targets* by SFTP to *backup_host* and store it according to *keep* schedule.

Requirements
------------
On the *backup_host* you will need to create user *backup_id* with home dir /home/*backup_id* where backups will be stored.
Then set up ssh based authentication using ~root/.ssh/id_rsa.pub source machine.

Tested on Ubuntu 14.04, should work on other Ubuntu versions.

#### packages
- `toaster` - apt (for ppa)
- `cron` - for cron management
- `ssh_known_hosts` - for initial import of the *backup_host* host key

Attributes
----------

#### obnam::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['obnam']['backup_host']</tt></td>
    <td>String</td>
    <td>IP or FQDN of there server where you want your backups to be uploaded</td>
    <td><tt>*SET THIS!!!*</tt></td>
  </tr>
  <tr>
    <td><tt>['obnam']['backup_id']</tt></td>
    <td>String</td>
    <td>Username on the *backup_host*</td>
    <td><tt>local hostname</tt></td>
  </tr>
  <tr>
    <td><tt>['obnam']['backup_targets']</tt></td>
    <td>Array</td>
    <td>Array of directories that needs to be backed up</td>
    <td><tt>[ '/etc', '/var/backups' ]</tt></td>
  </tr>
  <tr>
    <td><tt>['obnam']['keep']</tt></td>
    <td>String</td>
    <td>Backup schedule (see obnam manual). Default values keeps backups for last 7 days, 5 weekly backups and 4 monthly.</td>
    <td><tt>7d,5w,4m</tt></td>
  </tr>
</table>

Usage
-----
#### obnam::default
Just include `obnam` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[obnam]"
  ],
  "default": {
    "obnam": {
      "backup_host": "my.backup.server.com"
    }
  }
}
```

#### obnam::cron
Include it to install cron to
- run 'obnam backup' every hour at 17th minute
- run 'obnam forget' every sunday at 03:32 to forget unneeded generations


License and Authors
-------------------
Authors: Pavel Veretennikov
