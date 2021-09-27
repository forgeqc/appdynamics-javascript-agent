# Appdynamics javascript agent
Nginx docker image hosting all of the `cdn.appdynamics.com` javascript EUM agent files required for on-premises deployment.

## Current version
Current version is **adrum-21.7.0.3493.js"

To update the image published on docker hub, update the version number in this Readme, merge into master, and create a new tag for this version.

## Usage
Nginx is configured to run as an unprivileged user and is as such listening on `TCP/8080` port by default.

```
docker run -p8080:8080 -d forgeqc/appdynamics-javascript-agent
```

## Agent integration
The javascript agent has to be loaded synchronously

```
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta ... />

    <title>Apache2 Ubuntu Default Page: It works</title>
    
    <script charset='UTF-8'>
      window['adrum-start-time'] = new Date().getTime();
      (function(config){
        config.appKey = 'SH-AAB-AAC-XAR';
        //HTTP URL to the docker image hosting javascript agent files (this project)
        config.adrumExtUrlHttp = 'http://eum-agent.your-domain.com';
        //HTTPS URL to the docker image hosting javascript agent files (this project)
        config.adrumExtUrlHttps = 'https://eum-agent.your-domain.com'; 
        config.beaconUrlHttp = 'http://eum-col.your-domain.com'; //EUM server URL
        config.beaconUrlHttps = 'https://eum-col.your-domain.com'; //EUM server URL
        config.xd = {enable : false};
      })(window['adrum-config'] || (window['adrum-config'] = {}));
    </script>
    <script src='//eum-col.your-domain.com/adrum/adrum-latest.js' type='text/javascript' charset='UTF-8'></script>
    
    <script>[...]</script>
  </head>
```
