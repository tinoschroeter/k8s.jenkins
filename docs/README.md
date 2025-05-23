# Jenkins

[![jenkins](https://www.jenkins.io/sites/default/files/jenkins_logo.png)](https://www.jenkins.io/)

[![k3s](https://img.shields.io/badge/run%20on%20-Raspberry%20Pi-red)](https://github.com/tinoschroeter/k8s.homelab)
![](https://img.shields.io/github/last-commit/tinoschroeter/k8s.jenkins.svg?style=flat)
[![GitHub Super-Linter](https://github.com/tinoschroeter/k8s.jenkins/workflows/Lint%20Code%20Base/badge.svg)](https://github.com/tinoschroeter/k8s.jenkins/actions/workflows/linter.yml)

Use Jenkins to automate your development workflow, so you can focus on work that matters most. Jenkins is commonly used for:

- Building projects
- Running tests to detect bugs and other issues as soon as they are introduced
- Static code analysis
- Deployment

## Jenkins Simple Theme Plugin

[jenkins-material-theme](https://github.com/afonsof/jenkins-material-theme)

## Plugins

- Blue Ocean
- Embeddable Build Status
- greenballs
- prometheus
- Slack Notification
- configuration-as-code

## playbook Jenkins Agent

```shell
ansible-playbook jenkins-agent.yaml -i inventory.yaml
```

## Jenkins Agent Case

- [Raspberry Pi Cloud Case](https://www.thingiverse.com/thing:2267702)
- [blink.sh](https://github.com/tinoschroeter/k8s.jenkins/blob/master/playbook/templates/blink.sh.j2)

Running Build jobs trigger thunderstorm simulation.

![jenkinsAgent](https://raw.githubusercontent.com/tinoschroeter/k8s.jenkins/master/docs/cloud.gif)
