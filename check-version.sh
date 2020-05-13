#!/bin/bash

VENDOR="android_vendor_lineage"

if [[ $CI_COMMIT_TAG == *"nougat"* ]]
then
  VENDOR="android_vendor_cm"
fi

VENDOR_COMMIT_ID=$(cat default.xml | grep $VENDOR | sed -E 's/.*revision="(.*)" .*/\1/')

curl -s https://gitlab.e.foundation/e/os/$VENDOR/-/raw/$VENDOR_COMMIT_ID/config/common.mk -o common.mk
PRODUCT_VERSION_MAJOR=$(cat common.mk | grep "PRODUCT_VERSION_MAJOR = " | sed -E 's/PRODUCT_VERSION_MAJOR = (.*)/\1/')
PRODUCT_VERSION_MINOR=$(cat common.mk | grep "PRODUCT_VERSION_MINOR = " | sed -E 's/PRODUCT_VERSION_MINOR = (.*)/\1/')
PRODUCT_VERSION_MAINTENANCE=$(cat common.mk | grep "PRODUCT_VERSION_MAINTENANCE := " | sed -E 's/PRODUCT_VERSION_MAINTENANCE := (.*)/\1/')
PRODUCT_VERSION="$PRODUCT_VERSION_MAJOR.$PRODUCT_VERSION_MINOR.$PRODUCT_VERSION_MAINTENANCE"
echo "Product version: $PRODUCT_VERSION"

COMMIT_TAG_VERSION=$(echo $CI_COMMIT_TAG | sed -E 's/v(.\..\..).*/\1/')
echo "Tag version:     $COMMIT_TAG_VERSION"


if [ $PRODUCT_VERSION != $COMMIT_TAG_VERSION ]
then
  exit 1
fi
