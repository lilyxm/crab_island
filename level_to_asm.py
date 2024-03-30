from PIL import Image
from pathlib import Path
import os

IMAGE_NAME = "crab.png"
SCRIPT_FOLDER = str(Path(os.path.realpath(__file__)).parent)
IMAGE_FOLDER = os.path.join(SCRIPT_FOLDER, "images")
IMAGE_PATH = os.path.join(IMAGE_FOLDER, IMAGE_NAME)

def main():
    output = "{0}: .word ".format(IMAGE_NAME.split(".")[0])
    image = Image.open(IMAGE_PATH)
    image = image.convert('RGB')
    width, height = image.size
    i = 0
    for y in range(height):
        for x in range(width):
            r, g, b = image.getpixel((x, y))
            r = f'{r:x}'
            g = f'{g:x}'
            b = f'{b:x}'
            if len(r) < 2:
                r = '0{0}'.format(r)
            if len(g) < 2:
                g = '0{0}'.format(g)
            if len(b) < 2:
                b = '0{0}'.format(b)
            output += "0x00{0}{1}{2}, ".format(r, g, b)
            
            i += 1
    output = output[:-2]
    output += "\nCount: {0}".format(i)

    with open("./output.txt", "w") as file:
        file.write(output)

if __name__ == '__main__':
    main()