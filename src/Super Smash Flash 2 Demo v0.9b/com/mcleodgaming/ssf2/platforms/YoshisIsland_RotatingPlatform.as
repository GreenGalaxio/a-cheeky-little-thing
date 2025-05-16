package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import flash.display.MovieClip;
   
   public class YoshisIsland_RotatingPlatform extends MovingPlatform
   {
       
      
      protected var m_angle:Number;
      
      protected const CENTERX:Number = 237;
      
      protected const CENTERY:Number = 85;
      
      protected const DISTANCE:Number = 112;
      
      public function YoshisIsland_RotatingPlatform(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         this.m_angle = 0;
         findForegroundPieces();
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         m_platform.x = this.CENTERX + this.DISTANCE * Math.cos(this.m_angle * Math.PI / 180) - m_platform.width / 2;
         m_platform.y = this.CENTERY - this.DISTANCE * Math.sin(this.m_angle * Math.PI / 180) - m_platform.height / 2;
         this.m_angle--;
         super.move();
      }
   }
}
