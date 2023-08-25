#!/bin/bash

_FROM=2000
_TO=2022
_IEEE=N
IEEE_YEARS=(2010 2012 2018)

function print_usage {
    echo "$0 [--from|-f <year>] [--to|-t <year>] [--ieee|--i3e|-i]"
    echo "from: starting year. Default ${_FROM}"
    echo "to  : up to (including) year. Default ${_TO}"
    echo "ieee: download ieee articles (only works on networks allowed to directly access IEEE). Default NO"
    echo "year should be between ${_FROM} and ${_TO}"
}

function validate_year {
    ARG="${1}"
    YEAR=${2}
    err_msg="${1}: Error invalid year (${YEAR}). Valid years [${_FROM},${_TO}]. Aborting!"
    if [[ ${YEAR} -lt ${_FROM} || ${YEAR} -gt ${_TO} ]]; then
        echo "${err_msg}"
        echo ""
        print_usage
        exit 1
    fi
}

function should_download_year {
    YEAR="${1}"
    [[ ${YEAR} -lt ${FROM} || ${YEAR} -gt ${TO} ]] && return 1

    for i3ey in ${IEEE_YEARS[*]}; do
        [[ "${i3ey}" == "${YEAR}" && "x${IEEE^^}" != "xY" ]] && return 1
    done

    return 0
}

function download {
    LINKS="${1}"
    OUTPUT_DIR="${2}"
    if which wget > /dev/null 2>&1 ; then
        wget --no-clobber --continue --show-progress --trust-server-names --content-disposition --input-file="${LINKS}" --directory-prefix="${OUTPUT_DIR}"
    elif which curl > /dev/null 2>&1 ; then
        curl --progress-bar --location --remote-header-name --remote-name-all --output-dir "${OUTPUT_DIR}" $(cat "${LINKS}")
    else
        echo "ERROR: Couldn't locate wget or curl. Aborting!"
        exit 1
    fi
}

while [[ $# > 0 ]]; do
    ARG="${1^^}"
    case "${ARG}" in
        -F | --F | -FROM | --FROM)
            shift
            FROM="${1}"
        ;;
        -T | --T | -TO | --TO)
            shift
            TO="${1}"
            ;;
        -I | --I | -I3E | --I3E | -IEEE | --IEEE)
            IEEE="Y"
            ;;
        -H | --H | HELP | -HELP | --HELP)
            print_usage
            exit 0
            ;;
        *)
            echo ""
            echo "ERROR: Invalid argument (${1}). Aborting!"
            print_usage
            exit 1
            ;;
    esac
    shift
done

[[ -z "${FROM:-}" ]] && FROM=${_FROM}
[[ -z "${TO:-}"   ]] && TO=${_TO}
[[ -z "${IEEE:-}" ]] && IEEE=${_IEEE}

if [[ ${FROM} -gt ${TO} ]]; then
    _AUX=${TO}
    TO=${FROM}
    FROM=${_AUX}
fi


echo ""
echo "Starting download from ${FROM} to ${TO}. IEEE: ${IEEE}"
echo ""

find . -type f -name 'links.txt' -print0 | sort -z | while IFS= read -r -d '' f; do
    links_file=$(readlink -fn "${f}")
    output_dir=$(dirname "${links_file}")
    year_dir=$(basename "${output_dir}")
    year="${year_dir: -4}"
    if should_download_year $year; then
        echo -e "Downloading year: ${year}\n\ton: ${output_dir}"
        download "${links_file}" "${output_dir}"
        echo ""
    fi
done

