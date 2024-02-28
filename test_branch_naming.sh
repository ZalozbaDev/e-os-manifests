#!/bin/bash


BRANCH_NAME=v1.17-q-devel-q
DEVICE_LIST=FP3

# Treat DEVICE_LIST as DEVICE_LIST_<first_branch>
first_branch=$(cut -d ',' -f 1 <<< "$BRANCH_NAME")
if [ -n "$DEVICE_LIST" ]; then
  device_list_first_branch="DEVICE_LIST_$(sed 's/.*-\([a-zA-Z]*\)$/\1/' <<< $first_branch)"
  device_list_first_branch=${device_list_first_branch^^}
  read $device_list_first_branch <<< "$DEVICE_LIST,${!device_list_first_branch}"
fi

for branch in ${BRANCH_NAME//,/ }; do
	
  branch_dir=$(sed 's/.*-\([a-zA-Z]*\)$/\1/' <<< $branch)
  branch_dir=${branch_dir^^}
  device_list_cur_branch="DEVICE_LIST_$branch_dir"
  devices=${!device_list_cur_branch}

  echo "branch = $branch"
  echo "devices = $devices"
  
  if [ -n "$branch" ] && [ -n "$devices" ]; then
    vendor=lineage
    regex_part1="^v[0-9](\.[0-9]*){0,2}(-(beta|alpha|rc)(\.[0-9]*){0,1}){0,1}-("
    regex_part2=")(-[a-zA-Z0-9_]*)*$"
    
    if [[ "${BRANCH_NAME}" =~ $regex_part1"nougat"$regex_part2 ]]; then
      vendor="cm"
        themuppets_branch="cm-14.1"
        android_version="7.1.2"
        use_openjdk_from_ubuntu=true
    elif [[ "${BRANCH_NAME}" =~ $regex_part1"oreo"$regex_part2 ]]; then
        themuppets_branch="lineage-15.1"
        android_version="8.1"
        use_openjdk_from_ubuntu=true
    elif [[ "${BRANCH_NAME}" =~ $regex_part1"pie"$regex_part2 ]]; then
        themuppets_branch="lineage-16.0"
        android_version="9"
    elif [[ "${BRANCH_NAME}" =~ $regex_part1"q"$regex_part2 ]]; then
        themuppets_branch="lineage-17.1"
        android_version="10"
    elif [[ "${BRANCH_NAME}" =~ $regex_part1"r"$regex_part2 ]]; then
        themuppets_branch="lineage-18.1"
        android_version="11"
    elif [[ "${BRANCH_NAME}" =~ $regex_part1"s"$regex_part2 ]]; then
        themuppets_branch="lineage-19.1"
        android_version="12"
    elif [[ "${BRANCH_NAME}" =~ $regex_part1"t"$regex_part2 ]]; then
        themuppets_branch="lineage-20.0"
        android_version="13"
    else
        echo ">> [$(date)] Building branch $branch is not (yet) suppported"
        exit 1
    fi

    android_version_major=$(cut -d '.' -f 1 <<< $android_version)

    echo "android_version_major = $android_version_major"
    
    # mkdir -p "$SRC_DIR/$branch_dir"
    echo "BRANCH_DIR = $branch_dir"

    echo ">> [$(date)] Branch:  $branch"
    echo ">> [$(date)] Devices: $devices"

  fi
done
