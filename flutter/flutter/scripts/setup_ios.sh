#!/bin/bash
mkdir -p Frameworks

# Download and extract frameworks
IOS_URL="https://github.com/Sotatek-HungNguyen14/ffmpeg-kit/releases/download/v6.0/ffmpeg-kit-full-gpl-6.0-ios-xcframework.zip"
curl -L $IOS_URL -o frameworks.zip
unzip -o frameworks.zip -d Frameworks

# Move frameworks to correct location and cleanup
mv Frameworks/ffmpeg-kit-ios-full-gpl/*.xcframework Frameworks/
rm -rf Frameworks/ffmpeg-kit-ios-full-gpl
rm -rf Frameworks/__MACOSX
rm frameworks.zip

# Remove bitcode from iOS binaries
FRAMEWORKS=(
    "ffmpegkit"
    "libavcodec"
    "libavdevice"
    "libavfilter"
    "libavformat"
    "libavutil"
    "libswresample"
    "libswscale"
)

for framework in "${FRAMEWORKS[@]}"; do
    for arch_dir in Frameworks/${framework}.xcframework/ios-*; do
        if [ -d "$arch_dir" ]; then
            binary_path="${arch_dir}/${framework}.framework/${framework}"
            if [ -f "$binary_path" ]; then
                xcrun bitcode_strip -r "$binary_path" -o "$binary_path"
            fi
        fi
    done
done

echo "FFmpeg frameworks setup completed"
