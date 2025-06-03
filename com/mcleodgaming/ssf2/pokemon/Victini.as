package com.mcleodgaming.ssf2.pokemon
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class Victini extends Pokemon
   {
       
      
      private var m_action:uint;
      
      private var m_chargeTimer:FrameTimer;
      
      private var m_changeTargetTimer:FrameTimer;
      
      private var m_fireSFXTimer:FrameTimer;
      
      private var m_readyTimer:FrameTimer;
      
      private var m_finishTimer:FrameTimer;
      
      private var m_target:Target;
      
      private var m_dashCount:Number;
      
      private var m_targetX:Number;
      
      private var m_targetY:Number;
      
      private var m_toggle:Boolean;
      
      private const MAXSPEED:Number = 30;
      
      private const ACCEL:Number = 4;
      
      public function Victini(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("victini",param1,param2,param3,param4);
         m_gravity = 0;
         m_max_ySpeed = 0;
         this.m_action = 0;
         this.m_readyTimer = new FrameTimer(19);
         this.m_changeTargetTimer = new FrameTimer(30 * 5);
         this.m_finishTimer = new FrameTimer(30 * 15);
         this.m_fireSFXTimer = new FrameTimer(30 * 3.5);
         m_width = 35;
         m_height = 35;
         this.m_target = new Target();
         this.m_dashCount = 0;
         this.m_targetX = 0;
         this.m_targetY = 0;
         this.m_toggle = false;
         m_attackData.importAttacks(Main.getEnemyAttackData("victini_stats"));
         STAGEDATA.playSpecificVoice("victini_spawn");
      }
      
      override protected function attackCollisionTest() : void
      {
         super.attackCollisionTest();
      }
      
      private function runAI() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Number = NaN;
         if(this.m_action == 0)
         {
            fadeIn();
            playFrame("start");
            this.m_readyTimer.tick();
            if(this.m_readyTimer.IsComplete)
            {
               m_attack.IsAttacking = true;
               Attack("attack");
               this.m_action = 1;
               this.m_target = getNearestTarget();
               STAGEDATA.playSpecificSound("victini_fire");
            }
         }
         else if(this.m_action == 1)
         {
            this.m_fireSFXTimer.tick();
            if(this.m_fireSFXTimer.IsComplete && this.m_finishTimer.MaxTime - this.m_finishTimer.CurrentTime > 30 * 2)
            {
               this.m_fireSFXTimer.reset();
               STAGEDATA.playSpecificSound("victini_fire");
            }
            if(this.m_target == null || m_player_id <= 0 || this.m_target.PlayerSprite != null && this.m_target.PlayerSprite.Dead)
            {
               destroy();
            }
            else
            {
               this.m_changeTargetTimer.tick();
               if(this.m_changeTargetTimer.IsComplete)
               {
                  getNearestOpponent();
                  this.m_changeTargetTimer.reset();
               }
               else
               {
                  _loc1_ = this.m_target.CurrentTarget.X >= m_sprite.x;
                  _loc2_ = this.m_target.CurrentTarget.X < m_sprite.x;
                  _loc3_ = this.m_target.CurrentTarget.Y < m_sprite.y;
                  _loc4_ = this.m_target.CurrentTarget.Y >= m_sprite.y;
                  _loc5_ = 0;
                  if(_loc1_)
                  {
                     _loc5_ = m_xSpeed;
                     m_faceRight();
                     m_xSpeed = m_xSpeed + (m_xSpeed < this.MAXSPEED?this.ACCEL:0);
                     m_attack.IsForward = true;
                  }
                  else if(_loc2_)
                  {
                     _loc5_ = m_xSpeed;
                     m_faceLeft();
                     m_xSpeed = m_xSpeed - (m_xSpeed > -this.MAXSPEED?this.ACCEL:0);
                     m_attack.IsForward = false;
                  }
                  if(_loc3_)
                  {
                     m_ySpeed = m_ySpeed - (m_ySpeed > -this.MAXSPEED?this.ACCEL:0);
                  }
                  else if(_loc4_)
                  {
                     m_ySpeed = m_ySpeed + (m_ySpeed < this.MAXSPEED?this.ACCEL:0);
                  }
               }
            }
            this.m_finishTimer.tick();
            if(this.m_finishTimer.IsComplete)
            {
               m_xSpeed = 0;
               m_ySpeed = 0;
               this.m_action = 2;
               playFrame("end");
               m_fadeTimer.reset();
            }
         }
         else if(this.m_action == 2)
         {
            fadeOut();
            if(m_fadeTimer.IsComplete)
            {
               destroy();
            }
         }
      }
      
      override protected function move() : void
      {
         applyGroundInfluence();
         m_sprite.x = m_sprite.x + m_xSpeed;
         m_sprite.y = m_sprite.y + m_ySpeed;
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            this.runAI();
            if(!m_dead)
            {
               performAttackChecks();
               this.attackCollisionTest();
               this.move();
            }
         }
      }
   }
}
