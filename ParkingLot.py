from Car import Car


class ParkingLot:
    def __init__(self, capacity):
        # todo: 构造停车场所需的字段
        self.capacity = capacity
        self.cars = []
        

    def park_car(self, car: Car):
        # todo: 实现停车功能，成功停车后返回一个不重复的物体（object/uuid/……）作为停车票
        if len(self.cars) > self.capacity:
            return '无空余车位'
        
        self.cars.append(car.car_number)
        return car.car_number


    def take_car(self, ticket):
        # todo: 实现通过车票取车的功能
        if ticket in self.cars:
            self.cars.pop(ticket)
            return '已取车'
        else:
            return '车没在这'


class ParkingBoy:
    def boy_park(self, cars, parks):
        for i in range(len(cars)):
            if len(cars[i].cars) < cars[i].capacity:
                parks[i].park_car(cars[i].car_number)
            else:
                i += 1
                parks[i].park_car(cars[i].car_number)

    def boy_take_car(self, park, ticket):
        park.take_car(ticket)


class SmartParkingBoy:

    def smart_boy_choice(self, parks):
        # 选择空车位最多的停车场
        empty_list = []
        for i in range(len(parks)):
            empty_lot = parks[i].capacity - len(parks[i].cars)
            empty_list.append(empty_lot)
        
        empty_max_index = empty_list.index(max(empty_list))
        
        return parks[empty_max_index]

    def smart_boy_park(self, parks, cars):
        for i in range(len(cars)):
            lot = self.smart_boy_choice(parks)
            lot.park_car(cars[i])
    
    def smart_boy_take_car(self, park, ticket):
        park.take_car(ticket)

class SuperParkingBoy:
    
    def super_boy_choice(self, parks):
        empty_list = []
        for i in range(len(parks)):
            empty_lot = (parks[i].capacity - len(parks[i].cars)) / parks[i].capacity
            empty_list.append(empty_lot)
            
        empty_max_index = empty_list.index(max(empty_list))
        
        return parks[empty_max_index]

    def super_boy_park(self, parks, cars):
         for i in range(len(cars)):
            lot = self.super_boy_choice(parks)
            lot.park_car(cars[i])

    def super_boy_take_car(self, park, ticket):
        park.take_car(ticket)


class ParkingManager:
    
    def manage_boy(self, boys):
        for boy in boys:
            boy.park_car()

    def manager_park(self, cars, parks):
        for i in range(len(cars)):
            if len(cars[i].cars) < cars[i].capacity:
                parks[i].park_car(cars[i].car_number)
            else:
                i += 1
                parks[i].park_car(cars[i].car_number)

    def manager_take_car(self, park, ticket):
        park.take_car(ticket) 

if __name__ == "__main__":
    parking_lot = ParkingLot(1)
    car = Car('333')
    ticket = parking_lot.park_car(car)
    car = parking_lot.take_car(ticket)
