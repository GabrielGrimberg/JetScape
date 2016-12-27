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
MenuButtons StartGame; //Start Game Button.
MenuButtons EndGame;   //End Game Button.
MenuButtons Settings;  //Settings Button.

/* 
  - Global Variables -
*/
//Boolean Variables for MenuButtons Class.
boolean mouseStartButton = false; //Variable to check if the mouse is on the box.
boolean mousePressedStartButton = false; //Variable to highlight if box is pressed.

boolean mouseEndButton = false; //Variable to check if the mouse is on the box.
boolean mousePressedEndButton = false; //Variable to highlight if box is pressed.

boolean mouseSettingButton = false; //Variable to check if the mouse is on the box.
boolean mousePSettingButton = false; //Variable to highlight if box is pressed.

void setup()
{
  //Size of screen.
  size(1200,600);
  
  /* Creating new Objects for MenuButtons */
  StartGame = new MenuButtons(width / 2, 150, 50, 0);
  EndGame = new MenuButtons(width / 2, 300, 50, 0);
  Settings = new MenuButtons(width / 2, 450, 50, 0);
}

void draw()
{
  MainMenu(); 
}

void MainMenu()
{
  StartGame.StartButton();
  EndGame.EndButton(); 
  Settings.SettingsButton();
}