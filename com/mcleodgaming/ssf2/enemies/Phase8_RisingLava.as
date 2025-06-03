package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class Phase8_RisingLava extends Enemy
   {
       
      
      private var SLOW_RISE:Number = 3;
      
      private var SLOW_FALL:Number = 2;
      
      private var ACCEL:Number = 0.5;
      
      private var m_action:int;
      
      private var m_depthLevels:Array;
      
      private var m_order:Array;
      
      private var m_currentIndex:int;
      
      private var m_lava_start_y:Number;
      
      public function Phase8_RisingLava(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("phase8risinglava",param1,param2,param3,param4);
         this.m_action = 0;
         m_attackData.importAttacks(Main.getEnemyAttackData("phase8_lava_stats"));
         Attack("risinglava");
         this.m_depthLevels = [126,27,-108];
         this.m_order = [0,1,0,2,0,1,2,0];
         this.m_currentIndex = 0;
         m_sprite.visible = false;
         this.m_lava_start_y = STAGEDATA.StageFG.lava.y;
      }
      
      private function runAI() : void
      {
         if(this.m_currentIndex < this.m_order.length)
         {
            if(this.m_currentIndex == 0 || this.m_depthLevels[this.m_order[this.m_currentIndex - 1]] > this.m_depthLevels[this.m_order[this.m_currentIndex]])
            {
               if(m_ySpeed > -this.SLOW_RISE)
               {
                  m_ySpeed = m_ySpeed - this.ACCEL;
               }
               if(m_sprite.y < this.m_depthLevels[this.m_order[this.m_currentIndex]])
               {
                  this.m_currentIndex++;
               }
            }
            else
            {
               if(m_ySpeed < this.SLOW_FALL)
               {
                  m_ySpeed = m_ySpeed + this.ACCEL;
               }
               if(m_sprite.y > this.m_depthLevels[this.m_order[this.m_currentIndex]])
               {
                  this.m_currentIndex++;
               }
            }
         }
         else
         {
            if(m_ySpeed < this.SLOW_FALL)
            {
               m_ySpeed = m_ySpeed + this.ACCEL;
            }
            checkDeath();
            if(m_dead)
            {
               STAGEDATA.StageFG.lava.y = this.m_lava_start_y;
            }
         }
      }
      
      override protected function move() : void
      {
         super.move();
         STAGEDATA.StageFG.lava.x = STAGEDATA.StageFG.lava.x + m_xSpeed / STAGEDATA.StageFG.scaleX;
         STAGEDATA.StageFG.lava.y = STAGEDATA.StageFG.lava.y + m_ySpeed / STAGEDATA.StageFG.scaleY;
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            checkTimers();
            this.runAI();
            if(!m_dead)
            {
               this.move();
               gravity();
               performAttackChecks();
               attackCollisionTest();
            }
         }
      }
   }
}
