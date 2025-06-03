package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   public dynamic class menu_preloader extends MovieClip
   {
       
      
      public var progressBar:MovieClip;
      
      public var pCent:TextField;
      
      public var masker:SimpleButton;
      
      public var percentage:Number;
      
      public function menu_preloader()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         this.masker.useHandCursor = false;
         this.percentage = 0;
      }
   }
}
