![](Elevens%20Solitaire/other_images/example1.jpg?raw=true)
# Elevens-Solitaire
Solitaire game for iOS
## Rules
### Classic Mode
To play the game, the player must select two cards from the layout whose is 11. Ace cards have a value of 1 and face cards (Kings, Queens, Jacks) must be paired with eachother. When a valid pair is selected, the two cards are removed from the layout and replaced with the next two cards in the deck. In Classic Mode, the objective is to finish an entire standard 52-card deck as quickly as possible. In the event there are no possible moves with the cards in the layout, the player loses and must start over. Because there are never more than 9 cards in the layout, a brute force algorithm is used to determine if there is any pair of cards whose sum is 11. 
### Arcade Mode
In Arcade Mode, the deck contains an infinite number of cards and the player has 1 minute to score as many points as possible. Each pair is worth 1 point, but selecting an invalid pair results in a deduction of 1 point. In this mode, there is always at least one possible move in the layout. To accomplish this, everytime a pair of cards is removed, the game chooses two random positions in the layout. These positions each may or may not already have a card. If both positions have a card, then a new second position is chosen. If only one of the two chosen positions have a card, a new card is made to complement the existing card. If neither psotions have a card, then two new random cards are made ot complement eachother. After creating this possible move, if there are any other emtpy positions in the layout, they are filed with random cards. 
## Additional Options
In the options menu of the game, the user can select from 5 different deck designs and 5 different background colors. This will only affect appearance, not gameplay.
![](Elevens%20Solitaire/other_images/example2.jpg?raw=true)
