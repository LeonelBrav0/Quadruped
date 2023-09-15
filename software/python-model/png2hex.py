#!/usr/bin/python3
import sys
from PIL import Image

def image_to_txt(input_path, output_path):
    # Open the image
    img = Image.open(input_path)
    
    # Resize the image to 640x480
    img = img.resize((640, 480))
    
    # Convert the image to grayscale
    img_gray = img.convert('L')
    
    # Open the output file for writing
    with open(output_path, 'w') as f:
        address = 0
        for y in range(img_gray.height):
            for x in range(img_gray.width):
                pixel_value = img_gray.getpixel((x, y))
                f.write(f'0x{address:08X} {pixel_value}\n')
                address += 1

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script_name.py <input_png_path> <output_txt_path>")
        sys.exit(1)

    input_png_path = sys.argv[1]
    output_txt_path = sys.argv[2]

    image_to_txt(input_png_path, output_txt_path)