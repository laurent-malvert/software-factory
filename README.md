# Software Factory

A dockerized minimalist (yet powerful and feature-rich) software
factory setup to get your team up and running and industrialize your
software development processes.


## Concepts

This software factory should be:

 * easy to setup, demo and try out,
 * easy to industrialze and customizeB,
 * easy to teardown,
 * easy to backup and restore,
 * secure by default (WARNING: it's not at all, at the moment!)

We aim to achieve this by using a docker base and persistent volumes,
for convenience.


## Systems

This system can be customized at will and may package additional
components, but at its core it offers:

 * Jenkins (latest LTS),
 * Nexus (latest OSS),
 * SonarQube (latest LTS) (UPDATE: actually a 6.6 for convenience for now),
 * MailHog (latest) (to provide a testbed for email functionalities in your
   pipelines).

The services exposed via HTTP/HTTPS are made available to the host by a
customized NGINX reverse-proxy, using https://github.com/jwilder/nginx-proxy/.

By default, said services are reachable via: http://<service>.software-factory.lan/.

## Installation

### Prerequisites

#### Packages

Last tested with:

 * docker 17.09.0-ce
 * docker-compose 1.16.1

#### DNS

You'll need these custom entries in your /etc/hosts for the demo setup,
or to adapt the .env files and your DNS entries for a network-wide setup:

```
127.0.0.1       software-factory.lan
127.0.0.1       jenkins.software-factory.lan
127.0.0.1       nexus.software-factory.lan
127.0.0.1       sonarqube.software-factory.lan
127.0.0.1       mailhog.software-factory.lan
```

### Setup

Start the software factory as daemonized containers simply with:

```
docker-compose up -d
```

### Teardown

```
docker-compose down -v --rmi all --remove-orphans
```

Yes, this is purposefully destructive, to ensure the system is easy to destroy
and recreate.


## Systems

| System    | Service Name | Service URL                           |
|-----------|--------------|---------------------------------------|
| Jenkins   | jenkins      | http://jenkins.software-factory.lan   |
| Nexus     | nexus        | http://nexus.software-factory.lan     |
| SonarQube | sonarqube    | http://sonarqube.software-factory.lan |
| MailHog   | mailhog      | http://mailhog.software-factory.lan   |


## Implementation Details

### Volumes

Most sub-systems use data-volumes for persistence, and bind to local host
folders as well for your convenience. If you don't want this, please remove the
volumes.

#### Docker-for-Mac Performance Caveats

Note that on Docker for Mac, host mounts cause very severe performance
degradation, so you may want to either change this, or to ensure your services
are set up in a way that this does not pose issues.

e.g. Configure Jenkins so that the fingerprints, jobs and workspace folders
reside *outside* of the JENKINS_HOME folder shared with the host, so your builds
can have decent performance.
