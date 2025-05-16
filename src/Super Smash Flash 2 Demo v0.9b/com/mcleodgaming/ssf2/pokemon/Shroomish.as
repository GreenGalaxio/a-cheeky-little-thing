package com.mcleodgaming.ssf2.pokemon
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class Shroomish extends Pokemon
   {
       
      
      private var m_action:uint;
      
      private var m_target:Target;
      
      private var m_attackTimer:FrameTimer;
      
      private var m_sporeCount:int;
      
      public function Shroomish(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("shroomish",param1,param2,param3,param4);
         m_gravity = 1.5;
         m_max_ySpeed = 30;
         m_attackData.importAttacks(Main.getEnemyAttackData("shroomish_stats"));
         this.m_action = 0;
         this.m_attackTimer = new FrameTimer(15);
         this.m_sporeCount = 5;
         if(Utils.random() > 0.5)
         {
            m_faceLeft();
         }
         else
         {
            m_faceRight();
         }
         STAGEDATA.playSpecificSound("shroomish_bounce");
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            fadeIn();
            this.m_attackTimer.tick();
            if(this.m_attackTimer.IsComplete)
            {
               this.m_attackTimer.reset();
               this.m_action = Utils.random() < 0.75?uint(1):uint(2);
               if(this.m_action == 1)
               {
                  STAGEDATA.playSpecificSound("shroomish_sleep");
               }
               else
               {
                  STAGEDATA.playSpecificSound("shroomish_poisonpowder");
               }
               this.m_attackTimer.finish();
               if(this.m_action == 1)
               {
                  this.m_attackTimer.reset();
                  this.m_attackTimer.MaxTime = 90;
                  this.m_attackTimer.finish();
               }
            }
         }
         else if(this.m_action == 1)
         {
            this.m_attackTimer.tick();
            if(this.m_attackTimer.IsComplete)
            {
               if(currentFrameIs("idle"))
               {
                  STAGEDATA.playSpecificSound("shroomish_sleep");
                  Attack("spore");
               }
               else if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
               {
                  playFrame("idle");
                  this.m_attackTimer.reset();
                  this.m_sporeCount--;
                  if(this.m_sporeCount <= 0)
                  {
                     this.m_action = 3;
                     this.m_attackTimer.MaxTime = 60;
                     m_fadeTimer.reset();
                  }
               }
            }
         }
         else if(this.m_action == 2)
         {
            this.m_attackTimer.tick();
            if(this.m_attackTimer.IsComplete)
            {
               if(currentFrameIs("idle"))
               {
                  Attack("poisonpowder");
               }
               else if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
               {
                  this.m_attackTimer.reset();
                  playFrame("idle");
                  this.m_action = 3;
                  this.m_attackTimer.MaxTime = 60;
                  m_fadeTimer.reset();
               }
            }
         }
         else if(this.m_action == 3)
         {
            playFrame("idle");
            this.m_attackTimer.tick();
            if(this.m_attackTimer.IsComplete)
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
