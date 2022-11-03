#!/bin/bash

execute_vip() {
  local -r input_path="${1}"
  local -r output_path="${2}"
  local -r script_dir="${3}"

  module load nextflow/21.10.6-Java-11-LTS

  export NXF_OFFLINE=true
  export NXF_HOME="${output_path}/.nextflow"

  mkdir -p "${output_path}"

  export NXF_WORK="${output_path}/.nxf_work"
  export NXF_TEMP="${output_path}/.nxf_temp"

  local -r NXF_VERSION="21.10.6"
  local args=()
  args+=("-log" "${output_path}/nextflow.log")
  args+=("run")
  args+=("-with-report" "${output_path}/report.html")
  args+=("-profile" "cluster")
  args+=("--assembly" "GRCh37")
  args+=("--input" "${input_path}")
  args+=("--output" "${output_path}")
  args+=("--keep" "true")
  args+=("${script_dir}/main.nf")
  SINGULARITY_BIND=/apps,/groups,/tmp NXF_VER="${NXF_VERSION}" nextflow "${args[@]}"
  module purge
}