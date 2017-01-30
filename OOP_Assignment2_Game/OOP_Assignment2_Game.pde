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

boolean msbtnEnd = false; //Variable to check if the mouse is on the box.
boolean mscbtnEnd = false; //Variable to highlight if box is pressed.

//Gamestate Variable.
int gameState = 0;


void setup()
{
  //Size of screen.
  size(1200,600);
  
  /* Creating new Objects for MenuButtons */
  StartGame = new MenuButtons(width / 2, 250, 50, 5);
  EndGame = new MenuButtons(width / 2, 450, 50, 5);
  
  //Setting up the text.
  for(TextForm Amount : TextForm.values())
  {
    Word[Amount.Pos] = new MovingLetters(this, Amount.Size, 0, 0);
  } 
}

void draw()
{
  switch(gameState)
  {
    case 0:
      MainMenu();
      break;
  }
  
}

void mousePressed()
{
  quitClicked();
}

void mouseReleased() 
{
  //If mouse released set it back to false.
  mousePressedStartButton = false;
  mscbtnEnd = false; 
}

void textDisplay(String text, TextForm size, int x, int y)
{
  Word[size.Pos].text(text, x, y);  
}

void MainMenu()
{
  background(0);
  
  if(frameCount / 30 % 2 == 0)
  {
    stroke(255);
    textDisplay("Running Dangerously", TextForm.Biggest, 300, 75);
  }
  
  //Start button with the start text.
  StartGame.StartButton();
  stroke(0);
  textDisplay("Start", TextForm.Big, 540, 230);
  
  //End button with the end text.
  EndGame.EndButton();
  stroke(0);
  textDisplay("Quit", TextForm.Big, 560, 430);
}

void quitClicked()
{
  if(msbtnEnd == true) //If true
  {     
    mscbtnEnd = true; //Set variable to true
    fill(255, 255, 255); //To highlight the box.
    exit(); //Terminating the program
  } 
  else 
  {
    mscbtnEnd = false; //If not, set to false.
  }
}