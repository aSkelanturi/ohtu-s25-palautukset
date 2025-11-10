class Player:
    def __init__(self, dict):
        self.nationality = dict['nationality']
        self.name = dict['name']
        self.team = dict['team']
        self.goals = dict['goals']
        self.assists = dict['assists']
        self.yhteenlasku = self.goals + self.assists

    
    def __str__(self):
        return f"{self.name:10} {self.team} {self.goals} + {self.assists} = {self.yhteenlasku}"
