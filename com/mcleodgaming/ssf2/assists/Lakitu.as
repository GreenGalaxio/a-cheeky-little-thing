package com.mcleodgaming.ssf2.assists
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class Lakitu extends AssistTrophy
   {
       
      
      private var m_action:Number;
      
      private var m_moveTimer:FrameTimer;
      
      private var m_safeTimer:FrameTimer;
      
      private var m_floatTimer:FrameTimer;
      
      private var m_dangerTimer:FrameTimer;
      
      public function Lakitu(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("lakitu",param1,param2,param3,param4);
         m_width = 30;
         m_height = 40;
         this.m_action = 0;
         this.m_moveTimer = new FrameTimer(30);
         this.m_floatTimer = new FrameTimer(60);
         this.m_dangerTimer = new FrameTimer(15);
         this.m_safeTimer = new FrameTimer(30);
         m_sprite.y = m_sprite.y - STAGEDATA.getPlayer(m_player_id).Height;
      }
      
      private function float() : void
      {
         this.m_floatTimer.tick();
         m_ySpeed = -0.5 * Math.cos(Utils.toRadians(this.m_floatTimer.CurrentTime / this.m_floatTimer.MaxTime * 360));
         if(this.m_floatTimer.IsComplete)
         {
            this.m_floatTimer.reset();
         }
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            this.float();
            fadeIn();
            this.m_moveTimer.tick();
            if(m_fadeTimer.IsComplete && this.m_moveTimer.IsComplete)
            {
               this.m_moveTimer.reset();
               this.m_moveTimer.MaxTime = 30 * 15;
               this.m_action = 1;
            }
         }
         else if(this.m_action == 1)
         {
            if(STAGEDATA.getPlayer(m_player_id).Dead || STAGEDATA.getPlayer(m_player_id).Revival)
            {
               this.m_action = 3;
               playFrame("timeup");
               this.m_moveTimer.reset();
               this.m_moveTimer.MaxTime = 30;
            }
            else
            {
               m_sprite.x = m_sprite.x + (STAGEDATA.getPlayer(m_player_id).X - m_sprite.x) / 3;
               m_sprite.y = m_sprite.y + (STAGEDATA.getPlayer(m_player_id).Y - STAGEDATA.getPlayer(m_player_id).Height * 2 - m_sprite.y) / 3;
               this.m_moveTimer.tick();
               if(STAGEDATA.getPlayer(m_player_id).IsHuman)
               {
                  STAGEDATA.getPlayer(m_player_id).updateWarningCollision();
               }
               if(STAGEDATA.getPlayer(m_player_id).CollisionObj.rbound_lower || STAGEDATA.getPlayer(m_player_id).CollisionObj.lbound_lower)
               {
                  this.m_dangerTimer.tick();
               }
               else
               {
                  this.m_dangerTimer.reset();
               }
               if(this.m_dangerTimer.IsComplete)
               {
                  STAGEDATA.getPlayer(m_player_id).killAllSpeeds();
                  this.m_moveTimer.reset();
                  this.m_moveTimer.MaxTime = 30 * 4;
                  this.m_action = 2;
                  playFrame("fish");
               }
               else if(this.m_moveTimer.IsComplete)
               {
                  this.m_action = 3;
                  playFrame("timeup");
                  this.m_moveTimer.reset();
                  this.m_moveTimer.MaxTime = 30;
               }
            }
         }
         else if(this.m_action == 2)
         {
            this.m_moveTimer.tick();
            if(STAGEDATA.getPlayer(m_player_id).Hanging || STAGEDATA.getPlayer(m_player_id).Caught() || STAGEDATA.getPlayer(m_player_id).Revival)
            {
               this.m_action = 3;
               playFrame("timeup");
            }
            else
            {
               m_ySpeed = 6;
               STAGEDATA.getPlayer(m_player_id).m_attemptToMove(0,-8);
               m_sprite.x = STAGEDATA.getPlayer(m_player_id).X - m_width / 2;
               m_sprite.y = STAGEDATA.getPlayer(m_player_id).Y - STAGEDATA.getPlayer(m_player_id).Height * 2;
               STAGEDATA.getPlayer(m_player_id).setYSpeed(0);
               if(STAGEDATA.getPlayer(m_player_id).IsHuman)
               {
                  STAGEDATA.getPlayer(m_player_id).updateWarningCollision();
               }
               if(!(STAGEDATA.getPlayer(m_player_id).CollisionObj.rbound_lower || STAGEDATA.getPlayer(m_player_id).CollisionObj.lbound_lower))
               {
                  this.m_safeTimer.tick();
               }
               else
               {
                  this.m_safeTimer.reset();
               }
               if(this.m_moveTimer.IsComplete || this.m_safeTimer.IsComplete)
               {
                  this.m_action = 3;
                  playFrame("timeup");
               }
            }
         }
         else if(this.m_action == 3)
         {
            this.float();
            this.m_moveTimer.tick();
            if(this.m_moveTimer.IsComplete)
            {
               this.m_action = 4;
               m_fadeTimer.reset();
            }
         }
         else if(this.m_action == 4)
         {
            fadeOut();
            if(m_fadeTimer.IsComplete)
            {
               destroy();
            }
         }
      }
      
      override protected function attachToGround() : Boolean
      {
         return false;
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            checkTimers();
            this.runAI();
            if(!m_dead)
            {
               performAttackChecks();
               attackCollisionTest();
               move();
               checkHitStun();
               gravity();
               checkDeath();
            }
         }
      }
   }
}
