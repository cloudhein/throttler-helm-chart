{{/*
Expand the name of the chart.
*/}}
{{- define "throttler.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Fullname of the deployment.
*/}}
{{- define "throttler.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "throttler.labels" -}}
app: {{ include "throttler.name" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "throttler.selectorLabels" -}}
app: {{ include "throttler.name" . }}
{{- end }}
