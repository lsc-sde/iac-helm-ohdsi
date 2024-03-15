{{- define "ohdsi.atlas.name" -}}
{{- printf "%s-atlas" .Release.Name }}
{{- end }}

{{- define "ohdsi.hades.name" -}}
{{- printf "%s-hades" .Release.Name }}
{{- end }}


{{- define "ohdsi.datasource.type" -}}
{{- if eq .Values.datasource.type "postgres" }}
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

{{- define "ohdsi.datasource.url" -}}
{{- printf "jdbc:%s://%s:%s/%s" (include "ohdsi.datasource.url.type" .) .Values.datasource.hostname .Values.datasource.port .Values.datasource.database }}
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
{{- if eq .Values.flyway.datasource.type "postgres" }}
{{- printf "postgresql" }}
{{- else }}
{{- .Values.flyway.datasource.type }}
{{- end }}
{{- end }}

{{- define "ohdsi.flyway.datasource.url" -}}
{{- printf "jdbc:%s://%s:%s/%s" (include "ohdsi.flyway.datasource.url.type" .) .Values.flyway.datasource.hostname .Values.flyway.datasource.port .Values.flyway.datasource.database }}
{{- end }}

{{- define "ohdsi.hades.password.secret" -}}
{{- if eq .Values.hades.password.secret "" }}
{{- printf "%s" .Release.Name }}
{{- else }}
{{- printf "%s" .Values.hades.password.secret }}
{{- end }}
{{- end }}
