class TennisGame:
    def __init__(self, player1_name, player2_name):
        self.player1_name = player1_name
        self.player2_name = player2_name
        self.player1_score = 0
        self.player2_score = 0

    def won_point(self, player_name):
        if player_name == "player1":
            self.player1_score = self.player1_score + 1
        else:
            self.player2_score = self.player2_score + 1

    def get_score(self):
        if self.is_equal():
            return self.get_equal_score()
        elif self.advantage_or_win():
            return self.get_advantage_score()
        else:
            return self.get_normal_score()
        
    def is_equal(self):
        return self.player1_score == self.player2_score
    
    def get_equal_score(self):
        if self.player1_score == 0:
            return "Love-All"
        elif self.player1_score == 1:
            return "Fifteen-All"
        elif self.player1_score == 2:
            return "Thirty-All"
        else:
            return "Deuce"
        
    def advantage_or_win(self):
        return self.player1_score >= 4 or self.player2_score >= 4
    
    def get_advantage_score(self):
        difference = self.player1_score - self.player2_score
        if difference == 1:
            return "Advantage player1"
        elif difference == -1:
            return "Advantage player2"
        elif difference >= 2:
            return "Win for player1"
        else:
            return "Win for player2"  

    Scores = {0: "Love", 1: "Fifteen", 2: "Thirty", 3: "Forty"}
    def get_normal_score(self):
        return f"{self.Scores[self.player1_score]}-{self.Scores[self.player2_score]}"
