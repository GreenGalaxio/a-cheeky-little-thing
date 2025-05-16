package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.InteractiveSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   
   public class AngryCucco extends Enemy
   {
       
      
      private var m_action:uint;
      
      private var m_walkTimer:FrameTimer;
      
      private var m_initFacingForward:Boolean;
      
      private var m_target:Target;
      
      private var m_destroyTimer:FrameTimer;
      
      protected var m_isGold:Boolean = false;
      
      public function AngryCucco(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super(!!this.m_isGold?"angrycucco_gold":"angrycucco",param1,param2,param3,param4);
         m_gravity = 0;
         m_max_ySpeed = 6;
         this.m_action = 0;
         this.m_walkTimer = new FrameTimer(70);
         this.m_initFacingForward = true;
         m_attackData.importAttacks(!!this.m_isGold?Main.getEnemyAttackData("goldcucco_stats"):Main.getEnemyAttackData("cucco_stats"));
         m_width = 20;
         m_height = 20;
         this.m_target = new Target();
         Attack("attack");
         this.m_destroyTimer = new FrameTimer(240);
         if(Utils.random() > 0.9)
         {
            STAGEDATA.SoundQueueRef.playVoiceEffect("cucco2");
         }
      }
      
      public function setFacingForward(param1:Boolean) : void
      {
         if(param1)
         {
            m_faceRight();
         }
         else
         {
            m_faceLeft();
         }
         this.m_initFacingForward = param1;
      }
      
      public function setTarget(param1:InteractiveSprite) : void
      {
         this.m_target.CurrentTarget = param1;
      }
      
      private function runAI() : void
      {
         if(this.m_target.CurrentTarget != null)
         {
            if(this.m_action == 0)
            {
               this.m_target.setDistance(new Point(m_sprite.x,m_sprite.y));
               if(this.m_target.XDistance > 10)
               {
                  m_xSpeed = this.m_target.CurrentTarget.X > m_sprite.x?Number(m_xSpeed + 0.5):Number(m_xSpeed - 0.5);
                  if(m_xSpeed > 8)
                  {
                     m_xSpeed = 8;
                  }
                  else if(m_xSpeed < -8)
                  {
                     m_xSpeed = -8;
                  }
               }
               if(this.m_target.YDistance > 10)
               {
                  m_ySpeed = this.m_target.CurrentTarget.Y < m_sprite.y?Number(m_ySpeed - 1):Number(m_ySpeed + 1);
               }
               if(m_ySpeed > m_max_ySpeed)
               {
                  m_ySpeed = m_max_ySpeed;
               }
               else if(m_ySpeed < -4)
               {
                  m_ySpeed = -4;
               }
               if(m_collision.ground && m_ySpeed < 0)
               {
                  unnattachFromGround();
               }
               if(this.m_target.Distance < 10)
               {
                  this.m_action = 1;
               }
               if(m_xSpeed > 0)
               {
                  m_faceRight();
               }
               else
               {
                  m_faceLeft();
               }
            }
            else if(this.m_action == 1)
            {
               if(HasStance && m_sprite.stance.currentLabel != "peck")
               {
                  stancePlayFrame("peck");
               }
               this.m_action = 0;
            }
         }
         this.m_destroyTimer.tick();
         if(this.m_destroyTimer.IsComplete)
         {
            destroy();
         }
      }
      
      override protected function move() : void
      {
         m_attemptToMove(m_xSpeed,0);
         m_attemptToMove(0,m_ySpeed);
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
               m_groundCollisionTest();
               performAttackChecks();
               attackCollisionTest();
            }
         }
      }
   }
}
