import random

class ecosystem():
    def __init__(self, river_length, fish_num, bear_num, steps):
        self.river = []
        fish_num = fish_num if fish_num > 0 else 0
        bear_num = bear_num if bear_num > 0 else 0
        N_num = river_length - fish_num - bear_num
        N_num = N_num if N_num > 0 else 0
        self.steps = steps if steps > 0 else 0

        fish_in_river = ['F'] * fish_num
        bear_in_river = ['B'] * bear_num
        NA_in_river = ['N'] * N_num

        self.river = fish_in_river + bear_in_river + NA_in_river
        random.shuffle(self.river)

    def random_add_animal(self, animal_type):
        if animal_type != 'F' and animal_type != 'B':
            animal_type = 'F'
        empty_index = []
        for index in range(len(self.river)):
            if self.river[index] == 'N':
                empty_index.append(index)
        if len(empty_index) > 0:
            index = random.choice(empty_index)
            self.river[index] = animal_type
        return

    def get_action(self, index, river_len):
        action = 0
        if index == 0:
            action = random.randint(0, 1)
        elif index == river_len - 1:
            action = random.randint(-1, 0)
        else:
            action = random.randint(-1, 1)
        return action

    def move_animal(self, index, action):
        this_animal = self.river[index]
        if action != 0:
            target_animal = self.river[index + action]
            if this_animal == target_animal:
                self.random_add_animal(this_animal)
            elif target_animal == 'N':
                self.river[index] = 'N'
                self.river[index + action] = this_animal
            else:
                self.river[index] = 'N'
                self.river[index + action] = 'B'
        print(f"Animal: {this_animal}, Action: {action}")
        print("The current ecosystem after the action:")
        print(self.river)

    def simulation(self):
        river_length = len(self.river)
        for step in range(self.steps):
            print(f'The ecosystem at the beginning of the step {step + 1}')
            print(self.river)
            empty_index = []
            for index in range(len(self.river)):
                if self.river[index] == 'N':
                    empty_index.append(index)
            for river_index in range(river_length):
                if river_index in empty_index:
                    continue
                else:
                    action = self.get_action(river_index, river_length)
                    self.move_animal(river_index, action)

eco = ecosystem(5,2,3,3)

river = eco.simulation()