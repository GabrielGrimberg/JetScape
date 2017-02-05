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
      speedBg = 5;
      speedc = 5;
    }
    if (timeAccumulator >= 10 && timeAccumulator < 11)
    {
      speedBg = 5;
      speedc = 5;
    }
    if (timeAccumulator >= 15)
    {
      speedBg = 6;
      speedc = 6;
    } 
    
  }
  
}