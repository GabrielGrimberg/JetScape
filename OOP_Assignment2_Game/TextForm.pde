enum TextForm
{
   Normal(16, 0), Big(32, 1), Biggest(48, 2);
   
   int Size;
   int Pos;
   
   private TextForm(int Size, int Pos)
   {
     this.Size = Size;
     this.Pos = Pos;
   }
}