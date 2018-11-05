# Documentation

## Example

```
custom_template: 'custom-template.j2'
logrotate_config_files:
  - name: 'legacy'
    state: 'absent'
  - name: 'magento'
    template: custom_template
    paths:
      - '/home/user/magento/public/var/*.log'
    force: yes
    options:
      - 'compress'
      - 'create 0644 user user'
      - 'daily'
      - 'missingok'
      - 'notifempty'
      - 'rotate 5'
  - name: 'nginx'
    paths:
      - '/var/log/nginx/*.log'
    options:
      - 'compress'
      - 'create 0640 nobody adm'
      - 'daily'
      - 'delaycompress'
      - 'missingok'
      - 'notifempty'
      - 'rotate 5'
      - 'sharedscripts'
    scripts:
      postrotate: '[ -s /run/nginx.pid ] && kill -USR1 `cat /run/nginx.pid`'
```

## Role Variables

Available variables are listed below, along with default values (see [defaults/main.yml](/defaults/main.yml)):

```
logrotate_packages:
```

A list of the logrotate packages to install. Each package supports all parameters from the
[apt](http://docs.ansible.com/ansible/apt_module.html) or [yum](http://docs.ansible.com/ansible/yum_module.html) modules.
If the value remains omitted, the following packages will be installed by default.

| Debian/Ubuntu          | RedHat/CentOS           |
| :--------------------- | :---------------------- |
| logrotate              |  logrotate              |

```
logrotate_force_all: no
```

Whether to forcefully rotate config files even when not deemed necessary. If you would like to rotate
individual config files, you can specify the `force` parameter for each items wanting to be rotated.

```
logrotate_config_template: 'logrotate.j2'
```

The template file name used for each `logrotate_config_files` entry. The default template will suit
most peoples needs, however you can override this value and define your own template if needed. You
can also use a custom template for individual config files, by specifying the `template` parameter
for each items requiring a custom template.

```
logrotate_config_files:
```

The logrotate config files you would like to manage.