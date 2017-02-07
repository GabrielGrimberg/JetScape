/***************************************** 
*                                        *
*  Author: Gabriel Grimberg.             *
*  Module: Object Oriented Programming.  *
*  Type: Assignment 2.                   *
*  Language: Java (Processing).          *
*  Start Date: 9th of December 2016.     *
*  Due Date: 8th of February 2017.       *
*                                        *
******************************************/

/* 
  - #DEFINE -
*/
//Amount of coins to spawn.
int COINSPAWN = 500;
int DANGERSPWAN = 500;
int PRESSED = 5000;
float SPEEDCHANGE = 0.3;
/*
  - Imports -
*/
import de.ilu.movingletters.*; //Lib for the text format.
import processing.sound.*; //Lib for the sound format.
import ddf.minim.*;

/* Sound Files */
Minim minim;
AudioPlayer bClick;    // Button Click.
AudioPlayer cCollect;  // Coin Collecting.
AudioPlayer gameMusic; // In game Music.
AudioPlayer dead;      // When dying.

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
MenuButtons Help; //Button to display intructions.
MenuButtons HighScore; //Button to display highscore.

/*
  - New Objects -
*/
/* Player Object */
Player player = new Player(250,250,4,70,90,' ');

/* Jetflame Object */
Jetflame jetflame = new Jetflame();

/* Coin Objects */
Coin[] coins = new Coin[COINSPAWN];

/* Background Object */
MovingBackground moveBk = new MovingBackground();

Danger[] danger = new Danger[DANGERSPWAN];

/* Text Objects. */
MovingLetters[] Word = new MovingLetters[4]; //<- How many enums.

/* Keys Pressed. */
boolean[] keys = new boolean[PRESSED];

/*
  - Images -
*/
//Player sprite.
PImage playerChar;

//Jetpack sprite.
PImage jetpackImg;

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

boolean msbtnH = false; //Variable to check if the mouse is on the box.
boolean mscbtnH = false; //Variable to highlight if box is pressed.

boolean msbtnHigh = false; //Variable to check if the mouse is on the box.
boolean mscbtnHigh = false; //Variable to highlight if box is pressed.

//Variables for out of bounds (for player).
float blockWidth, blockHeight, blockXPos, blockYPos;

//Variable for the speed of the player going down.
float gravity = 5;

//Gamestate Variable.
int gameState = 0;

//Speed variables.
float speed = 3;
float speedBg = 4; //Background speed.
float speedc = 4; //Coin Speed.
float speedDanger = 4;

//Scores
int score;
int highScore = 0;
int recentScore = 0;


//Level counter
int level = 1;

/* Music Stop */
int phaseCheck = 0;

public void setup()
{
  //Size of screen.
  size(1200,600,P2D);
  
  //frameRate(120);
  
  /* Creating new Objects for MenuButtons */
  StartGame = new MenuButtons(width / 2, 250, 50, 5);
  EndGame = new MenuButtons(width / 2, 450, 50, 5);
  Help = new MenuButtons(height / 2.5 , 350, 50,5);
  HighScore = new MenuButtons(width / 1.25, 350, 50, 5);
  
  mainObjects.add(player);
  
  //Setting up the text.
  for(TextForm Amount : TextForm.values())
  {
    Word[Amount.Pos] = new MovingLetters(this, Amount.Size, 0, 0);
  }
  
  minim = new Minim(this);
  
  bClick = minim.loadFile("Click.mp3");
  gameMusic = minim.loadFile("gameMusic.mp3");
  cCollect = minim.loadFile("coin.wav");
  dead = minim.loadFile("dead.mp3");
  
  //Loading the images.
  loadImages();
  
  //Loading the danger and coins objects.
  movingObjects();
}

public void mousePressed()
{
  quitClicked();
  startClicked();
  hClicked();
  highClicked();
}

public void mouseReleased() 
{
  //If mouse released set it back to false.
  mscbtnStr = false;
  mscbtnEnd = false; 
  mscbtnH = false;
  mscbtnHigh = false;
}

public void keyPressed()
{
  keys[keyCode] = true;
  
  //Up arrow to go to main menu when dead.
  if(keyCode == UP && gameState == 2 || gameState == 3 || gameState == 4)
  {
    reset();
    cursor();
  }
  
}

public void keyReleased()
{
  keys[keyCode] = false;
}

public boolean keyCheck(int x)
{
  if (keys.length >= x) 
  {
    return keys[x] || keys[Character.toUpperCase(x)];  
  }
  return false;
}

public void textDisplay(String text, TextForm size, int x, int y)
{
  Word[size.Pos].text(text, x, y);  
}

void playSound(AudioPlayer sound)
{
  if(sound == null)
  {
    return;
  }
  
  sound.rewind();
  sound.play(); 
}

public void MainMenu()
{
  background(0);
  
  //Main title for the game.
  stroke(255,255,0);
  textDisplay("JetScape", TextForm.VBig, 400, 75);

  //Start button with the start text.
  StartGame.StartButton();
  stroke(0);
  textDisplay("Start", TextForm.Big, 540, 230);
  
  //End button with the end text.
  EndGame.EndButton();
  stroke(0);
  textDisplay("Quit", TextForm.Big, 560, 430);
  
  //Help button with the help text
  Help.HelpButton();
  stroke(0);
  textDisplay("Help", TextForm.Big, 190, 330);
  
  //Highscore button to display the highest score.
  HighScore.HighscoreButton();
  stroke(0);
  textDisplay("Highscore", TextForm.Big, 870, 330);
  
}

public void startClicked()
{
  if(msbtnStr == true) //If true
  {
    if(phaseCheck == 0) //Stops the button music playing.
    {
      mscbtnStr = true; //Set variable to true
      playSound(bClick);
      playSound(gameMusic);
      gameState = 1;
      phaseCheck = 1;
    }
  } 
  else 
  {
    msbtnStr = false; //If not, set to false.
  }
}

public void quitClicked()
{
  if(msbtnEnd == true) //If true
  {
    playSound(bClick);
    mscbtnEnd = true; //Set variable to true
    exit(); //Terminating the program
  } 
  else 
  {
    mscbtnEnd = false; //If not, set to false.
  }
}

public void hClicked()
{
  if(msbtnH == true) //If true
  {
    playSound(bClick);
    noCursor();
    gameState = 3; //Changing gamestate.
    fill(255,255,0); //Yellow colour.
    
    String lines[] = loadStrings("help.txt"); //Loading up the file.
    stroke(255); //White outline for the words.
    
    //Not in a loop duo to position problems.
    textDisplay(lines[0], TextForm.Big, 375, 50);
    textDisplay(lines[1], TextForm.Normal, 475, 150);
    textDisplay(lines[2], TextForm.Normal, 350, 200);
    textDisplay(lines[3], TextForm.Normal, 350, 250);
    textDisplay(lines[4], TextForm.Normal, 250, 300);
    textDisplay(lines[5], TextForm.Normal, 275, 350);
    textDisplay(lines[6], TextForm.Normal, 275, 400);
    backtoMain();
  } 
  else 
  {
    mscbtnH = false; //If not, set to false.
  }
}

public void highClicked()
{
  if(msbtnHigh == true) //If true
  { 
    playSound(bClick);
    noCursor();
    gameState = 4; //Changing gamestate.
    fill(255,255,0); //Yellow colour.
        
    stroke(255);
    textDisplay("Highest Score", TextForm.VBig, 290, 50);
    
    stroke(255,255,0);
    textDisplay("Top Score - " + highScore, TextForm.Big, 450, 200);
    
    stroke(255,0,0);
    textDisplay("Recent Score - " + recentScore, TextForm.Big, 410, 350);
 
    backtoMain();  
  } 
  else 
  {
    mscbtnHigh = false; //If not, set to false.
  }
}

/* Method to plot the coins */
public void movingObjects()
{
  float coinYPos; //Coin location.
  float dangerYPos; //Coin location.

  float theta = 0.0f;
  float thetaDanger = 0.0f;
  float radius = 0.0f;
  float radiusDanger = 0.0f;
  
  blockWidth = 50; //Limit to where player walks.
  blockHeight = blockWidth;
  blockYPos = height - blockWidth;
  
  coinYPos = height * 0.5f;
  
  dangerYPos = height * 0.5f;
  
  for(int i = 0; i < COINSPAWN; i++)
  {
    float loc = coinYPos + sin(theta) * radius;
    
    coins[i] = new Coin(width + 400 * i, loc, 20, 20); //Coins instances.
    theta = theta + random(0f,500f); //Choosing a random location.
    radius = 150; //Spreading out the coins.
  }
  
  for(int i = 0; i < DANGERSPWAN; i++)
  {
    float location = dangerYPos + sin(thetaDanger) * radiusDanger;
    
    danger[i] = new Danger(width + 300 * i, location, 80, 80); //Coins instances.
    thetaDanger = thetaDanger + random(0f,600f); //Choosing a random location.
    radiusDanger = 200; //Spreading out the dangers
  }
}

/* Method to display the coins */
public void displayObjects()
{
  for(int i = 0; i < COINSPAWN; i++)
  {
    fill(255,255,0);
    coins[i].update();
  }
  
  for(int i = 0; i < DANGERSPWAN; i++)
  {
    fill(random(200,255),0,0);
    danger[i].update();
  }
}

/* Method to display score */
public void scoreDisplay()
{
  stroke(255);
  textDisplay("Score - " + score, TextForm.Normal, 10, 15);
    
  stroke(255);
  textDisplay("Level - " + level, TextForm.Normal, 1000, 15);
  
}

/* Method to load up images */
public void loadImages()
{
  //Player Character
  playerChar = loadImage("Player.png");
  
  jetpackImg = loadImage("Jetflame.png");
  
  //Loading the background image.
  for(int i = 0; i < 2; i ++)
  {
    background[i] = loadImage("Background.png");
    repeatBg[i] = width * i;
  }  
}

void endState()
{
  clear();
  cursor(); //Displaying the mouse.
  gameMusic.pause(); //Pausing the music.
  background(0);
  
  highScore();
  
  stroke(random(0,255), random(0,255), random(0,255), random(0,255) );
  textDisplay("Game Over", TextForm.Biggest, 435, 50);
  
  stroke(255,255,0);
  textDisplay("Score - " + score, TextForm.Big, 475, 200);
  textDisplay("Level Reached - " + level, TextForm.Big, 375, 350);
  
  backtoMain();
  
}

public void backtoMain()
{
  if(frameCount / 30 % 2 == 0)
  {
    stroke(255,0,255);
    textDisplay("Press UP to go to menu", TextForm.Biggest, 200, 500);
  } 
}

public void highScore()
{
  if(gameState == 2)
  {
    if(score > highScore)
    {
      highScore = score;
      return;
    }
    else
    {
      recentScore = score;
    }
    
  }
  
}

public void reset()
{
  gameState = 0; //Reset gamestate.
  score = 0; //Reset score.
  speedBg = 3; //Reset background speed.
  speedc = 3; //Reset coin speed.
  speedDanger = 3; //Reset Danger speed.
  phaseCheck = 0; //Reset Music out of bounds checker.
  level = 1; //Reset level.
}
  
public void draw()
{
  switch(gameState)
  {
    case 0:
      MainMenu();
      break;
    case 1:
      clear();
      noCursor();
      moveBk.mvBack();
      player.update();
      jetflame.update();
      displayObjects();
      scoreDisplay();
      break;
     case 2:
       endState();
       break;
     case 3:
       clear();
       hClicked();
       break;
     case 4: 
       clear();
       highClicked();
       break;
  }

}