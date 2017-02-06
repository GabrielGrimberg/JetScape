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
      speedBg = 6;
      speedc = 6;
      speedDanger = 6;
    }
    if (timeAccumulator >= 10 && timeAccumulator < 11)
    {
      speedBg = 7;
      speedc = 7;
      speedDanger = 7;
    }
    if (timeAccumulator >= 15)
    {
      speedBg = 8;
      speedc = 8;
      speedDanger = 8;
    } 
    
  }
  
}