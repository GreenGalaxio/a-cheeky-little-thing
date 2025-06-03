package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.platforms.MovingPlatform;
   
   public class YggrasilRay extends Enemy
   {
       
      
      private var X_CENTER:Number = 242;
      
      private var Y_DIFF:Number = 20;
      
      private var m_action:int;
      
      private var m_linkedPlatform:MovingPlatform;
      
      public function YggrasilRay(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("rayEnemy",param1,param2,param3,param4);
         m_attackData.importAttacks(Main.getEnemyAttackData("yggrasil_stats"));
         Attack("ray");
         this.m_action = 0;
         this.m_linkedPlatform = null;
         var _loc5_:int = 0;
         while(_loc5_ < STAGEDATA.MovingPlatforms.length)
         {
            if(STAGEDATA.MovingPlatforms[_loc5_])
            {
               this.m_linkedPlatform = STAGEDATA.MovingPlatforms[_loc5_];
               break;
            }
            _loc5_++;
         }
         if(!this.m_linkedPlatform)
         {
            destroy();
         }
         else
         {
            m_sprite.x = this.X_CENTER;
            m_sprite.y = this.m_linkedPlatform.Y + this.Y_DIFF;
         }
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            m_sprite.x = this.X_CENTER;
            m_sprite.y = this.m_linkedPlatform.Y + this.Y_DIFF;
            if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames - 1)
            {
               destroy();
            }
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            checkTimers();
            this.runAI();
            if(!m_dead)
            {
               move();
               gravity();
               performAttackChecks();
               attackCollisionTest();
            }
         }
      }
   }
}
