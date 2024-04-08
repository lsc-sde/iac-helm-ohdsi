# iam-helm-ohdsi
Helm Chart for OHDSI


## Developer Guide

This helm release will be called by the [ohdsi flux configuration](https://github.com/lsc-sde/iac-flux-ohdsi/) which is called by the [Core LSCSDE Helm Chart](https://github.com/lsc-sde/iac-helm-lscsde-flux), which in turn is called by the [Core LSCSDE Flux configuration](https://github.com/lsc-sde/iac-flux-lscsde)

When the main branch of this repository is created it will trigger a github action which will:
* Calculate a semver version number
* Create a release branch with the semver version
* Create the helm package and upload to https://github.com/lsc-sde/iac-helm-repository
* Update the submodules on the main repository
* Update the ohdsi_chart_version value on the core [lscsde flux configuration](https://github.com/lsc-sde/iac-flux-lscsde)

This will in turn trigger github actions that will propagate those changes up the chain