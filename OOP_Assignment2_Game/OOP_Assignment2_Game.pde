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
  - #DEFINE -
*/
//Amount of coins to spawn.
int COINSPAWN = 1000;
/*
  - Imports -
*/
import de.ilu.movingletters.*; //Lib for the text format.
import processing.sound.*; //Lib for the sound format.

/* 
  - Array Lists -
*/
ArrayList<MainObjects> mainObjects = new ArrayList<MainObjects>();
/* 
  - Classes -
*/
/*Creating Objects for the Menu. */
MenuButtons StartGame; //Button to start game.
MenuButtons EndGame; //Button to end game.

/*
  - New Objects -
*/
/* Player Object */
Player player = new Player(250,250,5,70,90);

/* Coin Objects */
Coin[] coins = new Coin[COINSPAWN];

/* Text Objects. */
MovingLetters[] Word = new MovingLetters[3]; //<- How many enums.

/* Keys Pressed. */
boolean[] keys = new boolean[COINSPAWN];

/*
  - Images -
*/
//Player sprite.
PImage playerChar;

//Repeating background.
PImage []background = new PImage[2];
float []repeatBg = new float[2];

/* 
  - Global Variables -
*/
//Boolean Variables for MenuButtons Class.
boolean msbtnStr = false; //Variable to check if the mouse is on the box.
boolean mscbtnStr = false; //Variable to highlight if box is pressed.

boolean msbtnEnd = false; //Variable to check if the mouse is on the box.
boolean mscbtnEnd = false; //Variable to highlight if box is pressed.

//Variables for out of bounds (for player).
float blockWidth, blockHeight, blockXPos, blockYPos, blockSpeed;

//Variable for the speed of the player going down.
float gravity = 5;

//Gamestate Variable.
int gameState = 0;

//Speed variables.
int speed = 5;
int speedBg = 2; //Background speed.
int innerSpeed = 2;
int speedc = 7; //Coin Speed.

float coinXPos, coinYPos; //Coin location.

float theta = 0.0f;
float radius;

//Score counter
int score;

void setup()
{
  //Size of screen.
  size(1200,600);
  
  speedSet();
  
  /* Creating new Objects for MenuButtons */
  StartGame = new MenuButtons(width / 2, 250, 50, 5);
  EndGame = new MenuButtons(width / 2, 450, 50, 5);
  
  
  //Setting up the text.
  for(TextForm Amount : TextForm.values())
  {
    Word[Amount.Pos] = new MovingLetters(this, Amount.Size, 0, 0);
  }
  
  loadImages();
  
  movingCoins();
}

void mousePressed()
{
  quitClicked();
  startClicked();
}

void mouseReleased() 
{
  //If mouse released set it back to false.
  mscbtnStr = false;
  mscbtnEnd = false; 
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
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

void startClicked()
{
  if(msbtnStr == true) //If true
  {     
    mscbtnStr = true; //Set variable to true
    fill(255, 255, 255); //To highlight the box.
    gameState = 1;
  } 
  else 
  {
    msbtnStr = false; //If not, set to false.
  }
}

void movingBackground()
{
  background(255);
  //Background scrolling.
  for(int i = 0; i < repeatBg.length; i++)
  {
    image(background[i],repeatBg[i],0);
    repeatBg[i] = repeatBg[i] - speedBg;
    
    if(repeatBg[i] + width <= 0)
    {
      repeatBg[i] = width;
    }  
  }   
}

/* Method to plot the coins */
void movingCoins()
{
  for(int i = 0; i < COINSPAWN; i++)
  {
    float loc = coinYPos + sin(theta) * radius;
    
    coins[i] = new Coin(width + 200 * i, loc, 20, 20); //Coins instances.
    theta = theta + random(1f,280f); //Choosing a random location.
    radius = 100; //Spreading out the coins.
  }
}

/* Method to display the coins */
void coinDisplay()
{
  for(int i = 0; i < COINSPAWN; i++)
  {
    coins[i].update();
  }
}

/* Method to display score */
void scoreDisplay()
{
  stroke(255);
  textDisplay("Score: " + score, TextForm.Normal, 10, 10);
}

/* Method to load up images */
void loadImages()
{
  //Player Character
  playerChar = loadImage("Player.png");
  
  //Loading the background image.
  for(int i = 0; i < 2; i ++)
  {
    background[i] = loadImage("Background.png");
    repeatBg[i] = width * i;
  }
  
}

/* Method to set the speed. */
void speedSet()
{
  blockWidth = 50; //Limit to where player walks.
  blockHeight = blockWidth;
  blockYPos = height - blockWidth;
  blockSpeed = 5;
  
  coinXPos = width * 0.5f;
  coinYPos = height * 0.5f;
}
  
void draw()
{
  switch(gameState)
  {
    case 0:
      MainMenu();
      break;
    case 1:
      clear();
      movingBackground();
      player.update();
      coinDisplay();
      scoreDisplay();
      break;     
  }
  
}