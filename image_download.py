import requests
from matplotlib import pyplot as plt
from PIL import Image


def download():
    src = 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png'

    r = requests.get(src)

    with open('baidu.jpg', 'wb') as f:
        f.write(r.content)

    print('下载完成') 

def show():
    im = Image.open('baidu.jpg')
    plt.imshow(im)
    plt.show()

if __name__ == "__main__":
    download()
    show()
