{{- define "ohdsi.atlas.name" -}}
{{- printf "%s-atlas" .Release.Name }}
{{- end }}

{{- define "ohdsi.webapi.name" -}}
{{- printf "%s-webapi" .Release.Name }}
{{- end }}

{{- define "ohdsi.webapi.port" -}}
{{- if .Values.ingress.tls.enabled }}
{{- printf "8443" }}
{{- else }}
{{- printf .Values.webapi.port }}
{{- end}}
{{- end}}

{{- define "ohdsi.webapi.portName" -}}
{{- if .Values.ingress.tls.enabled }}
{{- printf "https" }}
{{- else }}
{{- printf "http" }}
{{- end}}
{{- end}}


{{- define "ohdsi.webapi.javaopts" -}}
{{- if .Values.ingress.tls.enabled }}
{{- printf "-Dserver.ssl.enabled=true " }}
{{- printf "-Dserver.ssl.key-store=/mnt/keystore/keystore.jks " }}
{{- printf "-Dserver.ssl.keyStoreType=JKS " }}
{{- printf "-Dserver.ssl.key-alias=tomcat " }}
{{- printf "-Dserver.ssl.key-store-password=Ref4ct0r " }}
{{- printf "-Dserver.ssl.key-password=Ref4ct0r " }}
{{- printf "-Dserver.port=%s " (include "ohdsi.webapi.port" .)}}
{{- end}}
{{- if ne .Values.webapi.truststore.path "" }}
{{- printf "-Dserver.ssl.trust-store=%s -Dserver.ssl.trust-store-password=changeit " .Values.webapi.truststore.path }}
{{- end}}
{{- if ne .Values.security.oid.redirectUrl "" }}          
{{- printf "-Dsecurity.oid.redirectUrl=%s " .Values.security.oid.redirectUrl }}
{{- end}}
{{- end}}


{{- define "ohdsi.hades.name" -}}
{{- printf "%s-hades" .Release.Name }}
{{- end }}


{{- define "ohdsi.webapi.protocol" -}}
{{- if .Values.ingress.tls.enabled }}
{{- printf "https" }}
{{- else }}
{{- printf "http" }}
{{- end }}
{{- end }}


{{- define "ohdsi.webapi.upstream-vhost" -}}
{{- printf "%s:%s" .Values.ingress.host (include "ohdsi.webapi.port" .) }}
{{- end }}

{{- define "ohdsi.webapi.url" -}}
{{- printf "%s://%s/WebAPI/" (include "ohdsi.webapi.protocol" .) .Values.ingress.host }}
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
