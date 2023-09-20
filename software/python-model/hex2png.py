#!/usr/bin/python3
import sys
from PIL import Image

def txt_to_image(input_path, output_path):
    # Create an empty grayscale image of size 640x480
    img_gray = Image.new('L', (640, 480))
    
    # Open the hex file for reading
    with open(input_path, 'r') as f:
        lines = f.readlines()
        for line in lines:
            hex_address, hex_value = line.split()
            address = int(hex_address, 16)
            x = address % 640
            y = address // 640
            img_gray.putpixel((x, y), int(hex_value))

    # Save the reconstructed image
    img_gray.save(output_path)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script_name.py <input_hex_path> <output_png_path>")
        sys.exit(1)

    input_hex_path = sys.argv[1]
    output_png_path = sys.argv[2]

    txt_to_image(input_hex_path, output_png_path)