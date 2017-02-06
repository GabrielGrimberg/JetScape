class SpeedControl
{
  
  public void cSpeedChange()
  {
    int now = millis();
    timeDelta = (now - last) / 1000.0f;  
    last = now;
    
    timeAccumulator += timeDelta;
    
    //println(timeDelta);
    //println(timeAccumulator);
    
    if (timeAccumulator >= 5 && timeAccumulator < 6)
    {
      speedBg = 7;
      speedc = 7;
      speedDanger = 7;
    }
    if (timeAccumulator >= 10 && timeAccumulator < 11)
    {
      speedBg = 10;
      speedc = 10;
      speedDanger = 10;
    }
    if (timeAccumulator >= 15)
    {
      speedBg = 20;
      speedc = 20;
      speedDanger = 20;
    } 
    
  }
  
}