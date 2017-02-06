private class MovingBackground
{
  
  private void mvBack()
  {
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
  
  
}