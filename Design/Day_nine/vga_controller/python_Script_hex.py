import sys
from PIL import Image


def convert_image_to_hex(input_path, output_path):
    img = Image.open(input_path).convert("RGB")
    img = img.resize((320, 240))
    pixels = img.load()

    with open(output_path, "w") as f:
        for y in range(240):
            for x in range(320):
                r, g, b = pixels[x, y]
                hex_val = f"{r:02x}{g:02x}{b:02x}"
                f.write(f"{hex_val}\n")

    print(f"Successfully generated {output_path} from {input_path}")


if __name__ == "__main__":
    input_file = sys.argv[1] if len(sys.argv) > 1 else "my_picture.jpg"
    output_file = sys.argv[2] if len(sys.argv) > 2 else "my_picture.hex"
    convert_image_to_hex(input_file, output_file)
