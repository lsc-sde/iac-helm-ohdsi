{{- define "ohdsi.atlas.name" -}}
{{- printf "%s-atlas" .Release.Name }}
{{- end }}

{{- define "ohdsi.atlasdb.name" -}}
{{- printf "broadsea-atlasdb" }}
{{- end }}

{{- define "ohdsi.hades.name" -}}
{{- printf "%s-hades" .Release.Name }}
{{- end }}


{{- define "ohdsi.datasource.type" -}}
{{- if not .Values.webapi.db.isExternal }}
{{- printf "org.postgresql.Driver" }}
{{- else if eq .Values.datasource.type "postgres" }}
{{- printf "org.postgresql.Driver" }}
{{- else }}
{{- printf "%s" .Values.datasource.type }}
{{- end }}
{{- end }}

{{- define "ohdsi.datasource.password.secret" -}}
{{- if eq .Values.datasource.password.secret "" }}
{{- printf "%s" .Release.Name }}
{{- else }}
{{- printf "%s" .Values.datasource.password.secret }}
{{- end }}
{{- end }}

{{- define "ohdsi.datasource.url.type" -}}
{{- if eq .Values.datasource.type "postgres" }}
{{- printf "postgresql" }}
{{- else }}
{{- .Values.datasource.type }}
{{- end }}
{{- end }}

{{- define "ohdsi.datasource.hostname" -}}
{{- if not .Values.webapi.db.isExternal }}
{{- printf "%s" (include "ohdsi.atlasdb.name" .) }}
{{- else }}
{{- .Values.datasource.hostname }}
{{- end }}
{{- end }}

{{- define "ohdsi.datasource.database" -}}
{{- if not .Values.webapi.db.isExternal }}
{{- printf "postgres" }}
{{- else }}
{{ .Values.datasource.database }}
{{- end}}
{{- end}}

{{- define "ohdsi.datasource.port" -}}
{{- if not .Values.webapi.db.isExternal }}
{{- printf "5432" }}
{{- else }}
{{ .Values.datasource.port }}
{{- end}}
{{- end}}

{{- define "ohdsi.datasource.url" -}}
{{- printf "jdbc:%s://%s:%s/%s" (include "ohdsi.datasource.url.type" .) (include "ohdsi.datasource.hostname" .) (include "ohdsi.datasource.port" .) (include "ohdsi.datasource.database" .) }}
{{- end }}

{{- define "ohdsi.flyway.datasource.type" -}}
{{- if eq .Values.flyway.datasource.type "postgres" }}
{{- printf "org.postgresql.Driver" }}
{{- else }}
{{- printf "%s" .Values.datasource.type }}
{{- end }}
{{- end }}

{{- define "ohdsi.flyway.datasource.password.secret" -}}
{{- if eq .Values.flyway.datasource.password.secret "" }}
{{- printf "%s" .Release.Name }}
{{- else }}
{{- printf "%s" .Values.flyway.datasource.password.secret }}
{{- end }}
{{- end }}

{{- define "ohdsi.flyway.datasource.url.type" -}}
{{- if not .Values.webapi.db.isExternal }}
{{- printf "postgresql" }}
{{- else if eq .Values.flyway.datasource.type "postgres" }}
{{- printf "postgresql" }}
{{- else }}
{{- .Values.flyway.datasource.type }}
{{- end }}
{{- end }}


{{- define "ohdsi.flyway.datasource.hostname" -}}
{{- if not .Values.webapi.db.isExternal }}
{{- printf "%s" (include "ohdsi.atlasdb.name" .) }}
{{- else }}
{{- .Values.flyway.datasource.hostname }}
{{- end }}
{{- end }}

{{- define "ohdsi.flyway.datasource.database" -}}
{{- if not .Values.webapi.db.isExternal }}
{{- printf "postgres" }}
{{- else }}
{{ .Values.flyway.datasource.database }}
{{- end}}
{{- end}}

{{- define "ohdsi.flyway.datasource.port" -}}
{{- if not .Values.webapi.db.isExternal }}
{{- printf "5432" }}
{{- else }}
{{ .Values.flyway.datasource.port }}
{{- end}}
{{- end}}

{{- define "ohdsi.flyway.datasource.url" -}}
{{- printf "jdbc:%s://%s:%s/%s" (include "ohdsi.flyway.datasource.url.type" .) (include "ohdsi.flyway.datasource.hostname" .) (include "ohdsi.flyway.datasource.port" .) (include "ohdsi.flyway.datasource.database" .) }}
{{- end }}

{{- define "ohdsi.hades.password.secret" -}}
{{- if eq .Values.hades.password.secret "" }}
{{- printf "%s" .Release.Name }}
{{- else }}
{{- printf "%s" .Values.hades.password.secret }}
{{- end }}
{{- end }}
