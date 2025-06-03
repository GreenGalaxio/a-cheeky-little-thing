package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class Arwing extends Enemy
   {
       
      
      private var X_SPEED:int = 3;
      
      private var Y_SPEED:int = 4;
      
      private var Y_ACCEL:int = 1;
      
      private var m_action:int;
      
      private var m_decisionTimer:FrameTimer;
      
      private var m_leaveTimer:FrameTimer;
      
      public function Arwing(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("arwing",param1,param2,param3,param4);
         m_width = 80;
         m_height = 20;
         m_attackData.importProjectiles(Main.getEnemyAttackData("arwing_projectiles"));
         m_faceLeft();
         createSelfPlatform(-160 / 2,0,160,26,false);
         this.m_action = 0;
         this.m_decisionTimer = new FrameTimer(Utils.randomInteger(30 * 3,30 * 5));
         this.m_leaveTimer = new FrameTimer(Utils.randomInteger(15,20));
         m_selfPlatform.fallthrough = true;
      }
      
      public function activate() : void
      {
         this.m_action = 1;
         m_selfPlatform.fallthrough = false;
         m_sprite.x = m_x_start;
         m_sprite.y = m_y_start;
         this.m_decisionTimer.MaxTime = Utils.randomInteger(30 * 3,30 * 5);
         this.m_leaveTimer.MaxTime = Utils.randomInteger(30 * 11,30 * 15);
         this.m_leaveTimer.reset();
         m_xSpeed = -this.X_SPEED;
      }
      
      private function runAI() : void
      {
         if(this.m_action > 1)
         {
            this.m_leaveTimer.tick();
         }
         if(this.m_action != 0)
         {
            if(this.m_action == 1)
            {
               if(m_sprite.x < STAGEDATA.CamBounds.x + STAGEDATA.CamBounds.width)
               {
                  this.m_action = 2;
               }
            }
            else if(this.m_action == 2)
            {
               this.m_decisionTimer.tick();
               if(this.m_decisionTimer.IsComplete)
               {
                  this.m_decisionTimer.reset();
                  if(Utils.random() > 0.85)
                  {
                     m_selfPlatform.fallthrough = true;
                     this.m_action = 3;
                     playFrame("barrelroll");
                  }
                  else
                  {
                     this.m_action = 4;
                  }
               }
               else if(this.m_leaveTimer.IsComplete)
               {
                  this.m_action = 5;
               }
            }
            else if(this.m_action == 3)
            {
               if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
               {
                  m_selfPlatform.fallthrough = false;
                  this.m_action = 2;
                  playFrame("idle");
               }
            }
            else if(this.m_action == 4)
            {
               fireProjectile("laser");
               this.m_action = 2;
            }
            else if(this.m_action == 5)
            {
               if(m_ySpeed > -this.Y_SPEED)
               {
                  m_ySpeed = m_ySpeed - this.Y_ACCEL;
               }
               if(m_sprite.y < STAGEDATA.DeathBounds.y - 20)
               {
                  this.m_action = 0;
                  m_selfPlatform.fallthrough = true;
               }
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
               updateSelfPlatform();
            }
         }
      }
   }
}
