import math
class Rect:

    def __init__(self, x, y, width, height):
        self.x = x
        self.y = y
        self.width = width
        self.height = height

    def intersect(self, rect: 'Rect') -> bool:
        # 计算两个矩形中心点之间的距离
        length_center_point = 1/2 * math.sqrt((self.x+self.width-rect.x-rect.width) ** 2+(self.y-self.height-rect.y+rect.height)**2)

        # 距离小于两矩形宽（高）之和的一半，相交
        if length_center_point < 1/2 * (self.width+rect.width) and length_center_point < 1/2 * (self.height+rect.height):
            return True
        
        return False
