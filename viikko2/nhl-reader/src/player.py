class Player:
    def __init__(self, dict):
        self.nationality = dict['nationality']
        self.name = dict['name']
        self.team = dict['team']
    
    def __str__(self):
        return f"{self.name} team {self.team}"
