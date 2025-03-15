#!/bin/bash

# Directory containing the images
image_dir="."

# Minimum width
min_width=600

# Process each PNG image in the directory
for image in "$image_dir"/*.png; do
  # Get the image width using ImageMagick's identify command
  width=$(identify -format "%w" "$image")
  
  # Check if the image width is less than the minimum width
  if [ "$width" -lt "$min_width" ]; then
    # Calculate the padding needed
    padding=$(( (min_width - width) / 2 ))
    
    # Add padding to the image
    convert "$image" -background white -gravity center -extent "${min_width}x" "$image"
    
    echo "Processed: $image"
  else
    echo "Skipped (width >= $min_width): $image"
  fi
done
