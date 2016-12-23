/***************************************** 
*                                        *
*  Author: Gabriel Grimberg.             *
*  Module: Object Oriented Programming.  *
*  Type: Assignment 2.                   *
*  Language: Java (Processing).          *
*  Start Date: 9th of December 2016.     *
*  Due Date: TBA.                        *
*                                        *
******************************************/

/* 
  - Classes -
*/
//Creating Objects for the Menu.
MenuButtons StartGame;
MenuButtons EndGame;

/* 
  - Global Variables -
*/
//Boolean Variables for MenuButtons Class.
boolean mouseStartButton = false; //Variable to check if the mouse is on the box.
boolean mousePressedStartButton = false; //Variable to highlight if box is pressed.

boolean mouseEndButton = false; //Variable to check if the mouse is on the box.
boolean mousePressedEndButton = false; //Variable to highlight if box is pressed.

void setup()
{
  //Size of screen.
  size(1000,500);
  
  /* Creating new Objects for MenuButtons */
  StartGame = new MenuButtons(width/3.0, height/2.3, 100, 50);
  EndGame = new MenuButtons(width/1.5, height/2.3, 100, 50);
}

void draw()
{
  MainMenu();
  
}

void MainMenu()
{
  StartGame.StartButton();
  EndGame.EndButton(); 
}