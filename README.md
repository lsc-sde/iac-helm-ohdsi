# iam-helm-ohdsi
Helm Chart for OHDSI


## Developer Guide
This helm release will be called by the [OHDSI Flux Configuration](../../flux/ohdsi/), this is called by [Core LSCSDE Helm Chart](../../helm/lscsde-flux/), which in turn is called by the [Core LSCSDE Flux configuration](../../flux/lscsde/)

When the main branch of this repository is created it will trigger a github action which will:
* Calculate a semver version number
* Create a release branch with the semver version
* Create the helm package and upload to https://github.com/lsc-sde/iac-helm-repository
* Update the submodules on the main repository
* Update the ohdsi_chart_version value on the core [lscsde flux configuration](../../flux/lscsde)

This will in turn trigger github actions that will propagate those changes up the chain