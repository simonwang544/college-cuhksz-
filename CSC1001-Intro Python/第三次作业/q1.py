class Flower:
    def __init__(self, name, number_of_petals, price):
        self.name = name
        self.number_of_petals = number_of_petals
        self.price = price

    def information(self):
        while True:
            try:
                x=float(self.name)
                print('The input of the flower name is incorrect. A string is required.')
                break
            except:
                if type(self.number_of_petals) != int:
                    print('The input of the number of petals is incorrect. An integral is required.')
                    break
                if type(self.price) != float:
                    print('The input of the price is incorrect. A float is required.')
                    break
                if type(self.name) == str and type(self.number_of_petals) == int and type(self.price) == float:
                    print("Here is the information of your flower. Name:",self.name,"Number of petals:",self.number_of_petals,"Price:",self.price)
                    break
flower = Flower('flower', 5, 7.8)
flower.information()