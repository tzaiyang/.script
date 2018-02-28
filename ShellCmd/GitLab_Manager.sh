#!/bin/bash

#GitLab 项目创建后地址由Localhost改为实际IP的方法 vim /opt/gitlab/embedded/service/gitlab-rails/config/gitlab.yml

## GitLab settings
  gitlab:
    ## Web server settings (note: host is the FQDN, do not include http://)
    host: localhost         >> 这里改为主机的IP即可
    port: 80
    https: false

    # Uncommment this line below if your ssh host is different from HTTP/HTTPS one
    # (you'd obviously need to replace ssh.host_example.com with your own host).
    # Otherwise, ssh host will be set to the `host:` value above
#restart GitLab
  gitlab-ctl restart
