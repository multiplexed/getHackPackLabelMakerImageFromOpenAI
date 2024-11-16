# getHackPackLabelMakerImageFromOpenAI
Uses the openAI API to grab an image that might be suitable for plotting/drawing by the Mark Rober HackPack label maker build

You must have an openAI key retrived from your OpenAI account (code retrives the key from the environment variable "OPEN_API_KEY")

Two files are included:
* retrieveImageFromPromptOpenAI.py - Takes a single argument for the desired image and stores "local_image.png" corresponding to the image retrived from the API.
* generateLabelMakerImage.sh - Bash script that takes a single argument for the desired image and runs the retrieveImageFromPromptOpenAI.py script, does a despeckle operation using a 'convert' imagemagick library, and then runs a python script 'hackPackLabelMakerCustomImage.py' from https://github.com/HeavyFalcon678/LabelMakerCustomImage to generate the ino file that can be uploaded to teh arduino based microcontroller on the HackPack label maker


Image Prompt:

  The python script (retrieveImageFromPromptOpenAI.py) takes a single argument for the image prompt and returns a 256x256 image.  It probably works best for single simple recognizable objects but feel free to experiment.  
  
  The current script asks the openAI API to "Generate a cartoon black and white outline pixel art illustration featuring a " + image_prompt + ", featuring a central centered object on a white background."

  There is a lot of room to experiment with the prompt to get the best images.

