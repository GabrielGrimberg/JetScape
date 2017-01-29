/***************************************** 
*                                        *
*  Author: Gabriel Grimberg.             *
*  Module: Object Oriented Programming.  *
*  Type: Assignment 2.                   *
*  Language: Java (Processing).          *
*  Start Date: 9th of December 2016.     *
*  Due Date: 7th of February 2017.       *
*                                        *
******************************************/

/*
  - Imports -
*/
import de.ilu.movingletters.*; //Lib for the text format.
import processing.sound.*; //Lib for the sound format.


/* 
  - Classes -
*/
/*Creating Objects for the Menu. */
MenuButtons StartGame; //Button to start game.
MenuButtons EndGame; //Button to end game.

/* Text Objects. */
MovingLetters[] Word = new MovingLetters[3]; //<- How many enums.

/* 
  - Global Variables -
*/
//Boolean Variables for MenuButtons Class.
boolean mouseStartButton = false; //Variable to check if the mouse is on the box.
boolean mousePressedStartButton = false; //Variable to highlight if box is pressed.

void setup()
{
  //Size of screen.
  size(1200,600);
  
  /* Creating new Objects for MenuButtons */
  StartGame = new MenuButtons(width / 2, 250, 50, 0);
  EndGame = new MenuButtons(width / 2, 450, 50, 0);
  
  //Setting up the text.
  for(TextForm Amount : TextForm.values())
  {
    Word[Amount.Pos] = new MovingLetters(this, Amount.Size, 0, 0);
  } 
}

void draw()
{
  MainMenu();
  
}

void textDisplay(String text, TextForm size, int x, int y)
{
  Word[size.Pos].text(text, x, y);  
}

void MainMenu()
{
  background(0);
  
  StartGame.StartButton();
  stroke(0);
  textDisplay("Start", TextForm.Big, 540, 230);
  
  EndGame.StartButton();
  stroke(0);
  textDisplay("Quit", TextForm.Big, 560, 430);
}