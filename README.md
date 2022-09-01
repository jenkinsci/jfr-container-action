# jfr-container-action

This is a brief introduction of `jfr-container-action`.
It aims at running the Jenkins pipeline inside the predefined container.
If you want to learn more about the usage of this action,
you can check the [central documentation page](https://jenkinsci.github.io/jfr-action-doc).

## Inputs

| Name | Type | Default Value | Description |
| ----------- | ----------- | ----------- | ----------- |
| `command` | String | run | The command to run the [jenkinsfile-runner](https://github.com/jenkinsci/jenkinsfile-runner). The supported commands are `run` and `lint`. |
| `jenkinsfile` | String | Jenkinsfile | The relative path to Jenkinsfile. You can check [the official manual about Jenkinsfile](https://www.jenkins.io/doc/book/pipeline/syntax/). |
| `pluginstxt` | String | plugins.txt | The relative path to plugins list file. You can check [the valid plugin input format](https://github.com/jenkinsci/plugin-installation-manager-tool#plugin-input-format). You can also refer to the [plugins.txt](plugins.txt) in this repository. |
| `jcasc` | String | N/A | The relative path to Jenkins Configuration as Code YAML file. You can refer to the [demos](https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos) provided by `configuration-as-code-plugin` and learn how to configure the Jenkins instance without using UI page. |
| `isPluginCacheHit` | boolean | false | You can choose whether or not to cache new installed plugins outside. If users want to use `actions/cache` in the workflow, they can give the cache hit status as input in `isPluginCacheHit`. |

## Example

You need to declare the image usage of `ghcr.io/jenkinsci/jenkinsfile-runner:master` at the start of the job.
Then you can call this action by using `jenkinsci/jfr-container-action@master`.
Because the runner declares the container environment at the start, 
other GitHub Actions can also run with `jfr-container-action` theoretically.
```yaml
name: CI
on: [push]
jobs:
  jfr-container-action-pipeline:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/jenkinsci/jenkinsfile-runner:master
    steps:
      - uses: actions/checkout@v2
      - name: Jenkins pipeline in the container
        uses:
          jenkinsci/jfr-container-action@master
        with:
          command: run
          jenkinsfile: Jenkinsfile
          pluginstxt: plugins.txt
          jcasc: jcasc.yml 
```
