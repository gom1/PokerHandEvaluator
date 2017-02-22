# PokerHandEvaluator
My Poker Hand Evaluator Implementation in Swift (command line application tool)

### How to Run:
In the terminal, navigate to the main PokerHandEvaluator directory and then perform the following commands:
```
cd PokerHandEvaluator
swift main.swift
```
The following output will display on the terminal window:
```
<<< WELCOME TO THE POKER HAND EVALUATOR!>>>

Please enter your poker hand following the following format:
Valid value: A, K, Q, J, 10, 9, 8, 7, 6, 5, 4, 3, 2
Valid suits: H, D, S, C
FORMAT: value,suit
EXAMPLE: 'A,H' (for Ace of Hearts), or '10,D' (for 10 of Diamonds)
>> Please enter card 1:
```
The program will wait for you to input details of your first card.
For example, if you want to enter the 10 of Hearts as your first card, type in the following:
```
10,H
```
If successful input of card details, the following with appear:
```
Successful card addition to the Hand!
Your hand consists of the following cards so far:
Card #1: ten of hearts
```
Continue to add cards to your Poker Hand. When you have entered 5 cards successfully, the program will then output a line with your Poker Hand Evaluation.

Example output:
```
Card #1: ten of hearts
Card #2: two of hearts
Card #3: four of hearts
Card #4: eight of hearts
Card #5: six of hearts

You have a: flush
```
