podman build $* --network host --build-arg http_proxy=http://127.0.0.1:13128 --build-arg https_proxy=http://127.0.0.1:13128 -t rsyslog/syslog_appliance_wolfi:latest .
podman tag localhost/rsyslog/syslog_appliance_wolfi harbor.int.sigmaspa.com/sgmreleases/syslog_appliance_wolfi:1.0.0 
podman push harbor.int.sigmaspa.com/sgmreleases/syslog_appliance_wolfi:1.0.0 
