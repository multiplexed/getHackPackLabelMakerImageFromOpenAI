#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <input_image_prompt>"
  exit 1
fi

input_image_prompt="$1"
input_png="local_image.png"
output_png="toLabelMaker.png"

#Step 1: get image
python3 retrieveImageFromPromptOpenAI.py "$input_image_prompt"

# Step 2 (optinal): OPtional despeckle using convert function from python https://imagemagick.org/ libraries
convert "$input_png" -background White -gravity center -despeckle -threshold 60% "$output_png"

#Uses python script from https://github.com/HeavyFalcon678/LabelMakerCustomImage to generate ino file to send to label maker arduino (script renamed hackPackLabelMakerCustomImage.py)
python3 hackPackLabelMakerCustomImage.py "$output_png" 1
