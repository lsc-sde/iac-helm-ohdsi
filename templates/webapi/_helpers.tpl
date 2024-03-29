{{- define "ohdsi.webapi.name" -}}
{{- printf "%s-webapi" .Release.Name }}
{{- end }}

{{- define "ohdsi.webapi.port" -}}
{{- if .Values.webapi.tls.enabled }}
{{- printf "8080" }}
{{- else }}
{{- printf .Values.webapi.port }}
{{- end}}
{{- end}}

{{- define "ohdsi.webapi.portName" -}}
{{- if .Values.webapi.tls.enabled }}
{{- printf "https" }}
{{- else }}
{{- printf "http" }}
{{- end}}
{{- end}}


{{- define "ohdsi.webapi.javaopts" -}}
{{- if .Values.webapi.tls.enabled }}
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
{{- if ne .Values.security.oauth.callback.api "" }}          
{{- printf "-Dsecurity.oauth.callback.api=%s " .Values.security.oauth.callback.api }}
{{- end}}
{{- if ne .Values.security.oauth.callback.ui "" }}          
{{- printf "-Dsecurity.oauth.callback.ui=%s " .Values.security.oauth.callback.ui }}
{{- end}}
{{- if ne .Values.security.oauth.callback.urlResolver "" }}          
{{- printf "-Dsecurity.oauth.callback.urlResolver=%s " .Values.security.oauth.callback.urlResolver }}
{{- end}}
{{- if ne .Values.security.shiro.successUrl "" }}          
{{- printf "-Dshiro.successUrl=%s " .Values.security.shiro.successUrl }}
{{- end}}
{{- if ne .Values.security.shiro.loginUrl "" }}          
{{- printf "-Dshiro.loginUrl=%s " .Values.security.shiro.loginUrl }}
{{- end}}
{{- if ne .Values.security.shiro.unauthorizedUrl "" }}          
{{- printf "-Dshiro.unauthorizedUrl=%s " .Values.security.shiro.unauthorizedUrl }}
{{- end}}
{{- if ne .Values.security.shiro.enabled "" }}          
{{- printf "-Dshiro.enabled=%s " .Values.security.shiro.enabled }}
{{- end}}
{{- if ne .Values.security.shiro.web.enabled "" }}          
{{- printf "-Dshiro.web.enabled=%s " .Values.security.shiro.web.enabled }}
{{- end}}
{{- if ne .Values.security.auth.windows.enabled "" }}          
{{- printf "-Dsecurity.auth.windows.enabled=%s " .Values.security.auth.windows.enabled }}
{{- end}}
{{- if ne .Values.security.auth.kerberos.enabled "" }}          
{{- printf "-Dsecurity.auth.kerberos.enabled=%s " .Values.security.auth.kerberos.enabled }}
{{- end}}
{{- if ne .Values.security.auth.openid.enabled "" }}          
{{- printf "-Dsecurity.auth.openid.enabled=%s " .Values.security.auth.openid.enabled }}
{{- end}}
{{- if ne .Values.security.auth.facebook.enabled "" }}          
{{- printf "-Dsecurity.auth.facebook.enabled=%s " .Values.security.auth.facebook.enabled }}
{{- end}}
{{- if ne .Values.security.auth.jdbc.enabled "" }}          
{{- printf "-Dsecurity.auth.jdbc.enabled=%s " .Values.security.auth.jdbc.enabled }}
{{- end}}
{{- if ne .Values.security.auth.ldap.enabled "" }}          
{{- printf "-Dsecurity.auth.ldap.enabled=%s " .Values.security.auth.ldap.enabled }}
{{- end}}
{{- if ne .Values.security.auth.ad.enabled "" }}          
{{- printf "-Dsecurity.auth.ad.enabled=%s " .Values.security.auth.ad.enabled }}
{{- end}}
{{- if ne .Values.security.auth.cas.enabled "" }}          
{{- printf "-Dsecurity.auth.cas.enabled=%s " .Values.security.auth.cas.enabled }}
{{- end}}
{{- if ne .Values.webapi.java_opts "" }}          
{{- printf "%s " .Values.webapi.java_opts }}
{{- end}}

{{- end}}

{{- define "ohdsi.webapi.protocol" -}}
{{- if .Values.webapi.tls.enabled }}
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

