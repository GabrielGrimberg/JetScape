/***************************************** 
*                                        *
*  Author: Gabriel Grimberg.             *
*  Module: Object Oriented Programming.  *
*  Type: Assignment 2.                   *
*  Language: Java (Processing).          *
*  Start Date: 9th of December 2016.     *
*  Due Date: 5th of February 2017.       *
*                                        *
******************************************/

/* 
  - Classes -
*/
//Creating Objects for the Menu.
MenuButtons StartGame; //Start Game Button.

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
}

void draw()
{
  MainMenu(); 
}

void MainMenu()
{
  StartGame.StartButton();
}