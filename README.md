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
 * SonarQube (latest LTS) (UPDATE: actually a 6.4 for convenience for now).

The services are made available by a customized NGINX reverse-proxy,
using https://github.com/jwilder/nginx-proxy/.

## Installation

### Prerequisites

#### Packages

Last tested with:

 * docker 17.06
 * docker-compose 1.15.0

#### DNS

You'll need these custom entries in your /etc/hosts for the demo setup,
or to adapt the .env files and your DNS entries for a network-wide setup:

```
127.0.0.1       software-factory.lan
127.0.0.1       jenkins.software-factory.lan
127.0.0.1       jrebel.software-factory.lan
127.0.0.1       nexus.software-factory.lan
127.0.0.1       sonar.software-factory.lan
127.0.0.1       sonarqube.software-factory.lan
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

|| System   | Service Name | Service URL                          ||
| Jenkins   | jenkins      | http://jenkins.software-factory.lan   |
| Nexus     | nexus        | http://nexus.software-factory.lan     |
| SonarQube | sonarqube    | http://sonarqube.software-factory.lan |

## Implementation Details

### Volumes

Each sub-system uses data-volumes for persistence, and binds to a
local folders as well for your convenience. If you don't want this,
please remove the volumes.
