#!/bin/bash

# iOS 框架下载解压
IOS_URL="https://github.com/Sotatek-HungNguyen14/ffmpeg-kit/releases/download/v6.0/ffmpeg-kit-full-gpl-6.0-ios-xcframework.zip"
mkdir -p Frameworks
curl -L $IOS_URL -o frameworks.zip
unzip -o frameworks.zip -d Frameworks
rm frameworks.zip

# 移除所有框架中的bitcode
xcrun bitcode_strip -r Frameworks/ffmpegkit.xcframework/ffmpegkit -o Frameworks/ffmpegkit.xcframework/ffmpegkit
xcrun bitcode_strip -r Frameworks/libavcodec.xcframework/libavcodec -o Frameworks/libavcodec.xcframework/libavcodec
xcrun bitcode_strip -r Frameworks/libavdevice.xcframework/libavdevice -o Frameworks/libavdevice.xcframework/libavdevice
xcrun bitcode_strip -r Frameworks/libavfilter.xcframework/libavfilter -o Frameworks/libavfilter.xcframework/libavfilter
xcrun bitcode_strip -r Frameworks/libavformat.xcframework/libavformat -o Frameworks/libavformat.xcframework/libavformat
xcrun bitcode_strip -r Frameworks/libavutil.xcframework/libavutil -o Frameworks/libavutil.xcframework/libavutil
xcrun bitcode_strip -r Frameworks/libswresample.xcframework/libswresample -o Frameworks/libswresample.xcframework/libswresample
xcrun bitcode_strip -r Frameworks/libswscale.xcframework/libswscale -o Frameworks/libswscale.xcframework/libswscale