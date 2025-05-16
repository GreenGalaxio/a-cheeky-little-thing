package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import flash.display.MovieClip;
   
   public class MuddTerrain extends MovingPlatform
   {
       
      
      private var RISE_HEIGHT:Number = 775;
      
      private var RISE_SPEED:Number = 100;
      
      private var m_action:int;
      
      public function MuddTerrain(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         this.m_action = 0;
      }
      
      public function activate() : void
      {
         this.m_action = 1;
         fallthrough = false;
      }
      
      public function deactivate() : void
      {
         this.m_action = 3;
         fallthrough = true;
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         if(this.m_action != 0)
         {
            if(this.m_action == 1)
            {
               m_platform.y = m_platform.y - this.RISE_SPEED;
               if(m_y_start - m_platform.y > this.RISE_HEIGHT)
               {
                  m_platform.y = m_y_start - this.RISE_HEIGHT;
                  this.m_action = 2;
               }
            }
            else if(this.m_action != 2)
            {
               if(this.m_action == 3)
               {
                  m_platform.y = m_platform.y + this.RISE_SPEED;
                  if(m_platform.y > m_y_start)
                  {
                     m_platform.y = m_y_start;
                     this.m_action = 0;
                  }
               }
            }
         }
         super.move();
      }
   }
}
