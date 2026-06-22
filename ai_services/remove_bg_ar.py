import os
import cv2
import numpy as np
from PIL import Image
from rembg import remove

INPUT_FOLDER = r"D:\Projects\Zarva-FYP-main\mobile_app\assets"
OUTPUT_FOLDER = r"D:\Projects\Zarva-FYP-main\mobile_app\assets\ar"

FILES_TO_PROCESS = [
    "5E.png", "6C.png", "6E.png", "7E.png", "7N.png", 
    "8E.png", "8N.png", "9E.png", "1C.png", "2L.png", "2N.png"
]

def main():
    if not os.path.exists(OUTPUT_FOLDER):
        os.makedirs(OUTPUT_FOLDER)

    for filename in FILES_TO_PROCESS:
        input_path = os.path.join(INPUT_FOLDER, filename)
        output_path = os.path.join(OUTPUT_FOLDER, filename)

        if not os.path.exists(input_path):
            print(f"File not found: {filename}, skipping.")
            continue

        print(f"Processing: {filename}")
        try:
            input_image = Image.open(input_path)
            output_image = remove(input_image)
            output_image.save(output_path)
            print(f"Done: {filename}")
        except Exception as e:
            print(f"Error processing {filename}: {e}")

    print("ALL DONE")

if __name__ == "__main__":
    main()
