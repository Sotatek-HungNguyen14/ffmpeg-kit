#!/bin/bash

# Android AAR 下载
ANDROID_URL="https://github.com/Sotatek-HungNguyen14/ffmpeg-kit/releases/download/v6.0/ffmpeg-kit-full-gpl-6.0.LTS.aar"
mkdir -p libs
curl -L $ANDROID_URL -o libs/com.arthenica.ffmpegkit-flutter-5.1.aar