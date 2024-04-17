#!/bin/bash

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "Error: ffmpeg is not installed. Please install it first."
    exit 1
fi

# Enable auto-completion for file paths
read -e -p "Enter the input audio file path: " input_file

# Check if the file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found."
    exit 1
fi

# Extract file name without extension
filename=$(basename -- "$input_file")
filename_noext="${filename%.*}"

# Set output MP3 file name
output_name="${filename_noext}_mp3converted"

# Convert the audio file to MP3
ffmpeg -i "$input_file" -b:a 192K -vn "$output_name.mp3"

echo "Conversion complete. MP3 file saved as $output_name.mp3"

