package com.mcleodgaming.ssf2.pokemon
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class Electrode extends Pokemon
   {
       
      
      private var m_action:uint;
      
      private var m_target:Target;
      
      private var m_attackTimer:FrameTimer;
      
      public function Electrode(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("electrode",param1,param2,param3,-1);
         m_gravity = 1.5;
         m_max_ySpeed = 30;
         m_attackData.importAttacks(Main.getEnemyAttackData("electrode_stats"));
         this.m_action = 0;
         this.m_attackTimer = new FrameTimer(30);
         if(Utils.random() > 0.5)
         {
            m_faceLeft();
         }
         else
         {
            m_faceRight();
         }
         STAGEDATA.playSpecificSound("electrode_spawn");
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            fadeIn();
            this.m_attackTimer.tick();
            if(this.m_attackTimer.IsComplete)
            {
               STAGEDATA.playSpecificSound("electrode_charging");
               playFrame("charging");
               this.m_attackTimer.reset();
               this.m_action = 1;
            }
         }
         else if(this.m_action == 1)
         {
            if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames - 1)
            {
               if(Utils.random() > 0.05)
               {
                  Attack("explosion");
                  this.m_action = 2;
                  STAGEDATA.playSpecificSound("bombexplode");
               }
               else
               {
                  m_fadeTimer.reset();
                  playFrame("fail");
                  STAGEDATA.playSpecificSound("electrode_fail");
                  this.m_action = 3;
               }
            }
         }
         else if(this.m_action == 2)
         {
            if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
            {
               destroy();
            }
         }
         else if(this.m_action == 3)
         {
            if(m_sprite.stance.currentFrame >= 18)
            {
               fadeOut();
               if(m_fadeTimer.IsComplete)
               {
                  destroy();
               }
            }
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            this.runAI();
            if(!m_dead)
            {
               performAttackChecks();
               attackCollisionTest();
               move();
               gravity();
               m_groundCollisionTest();
            }
         }
      }
   }
}
