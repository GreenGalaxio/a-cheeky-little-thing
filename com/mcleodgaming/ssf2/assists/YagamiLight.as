package com.mcleodgaming.ssf2.assists
{
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   
   public class YagamiLight extends AssistTrophy
   {
       
      
      private var m_action:uint;
      
      private var m_deathTarget:Target;
      
      private var m_nextActionTimer:FrameTimer;
      
      private var m_deathTimerMC:MovieClip;
      
      public function YagamiLight(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("yagamilight",param1,param2,param3,param4);
         m_gravity = 1.5;
         m_max_ySpeed = 30;
         m_width = 50;
         m_height = 50;
         this.m_action = 0;
         this.m_nextActionTimer = new FrameTimer(60);
         this.m_deathTarget = null;
         this.m_deathTimerMC = null;
      }
      
      private function runAI() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         if(this.m_action == 0)
         {
            this.m_nextActionTimer.tick();
            if(this.m_nextActionTimer.IsComplete)
            {
               this.m_nextActionTimer.reset();
               this.m_nextActionTimer.MaxTime = 300;
               this.m_action = 1;
               playFrame("search");
            }
         }
         else if(this.m_action == 1)
         {
            this.m_nextActionTimer.tick();
            this.m_deathTarget = this.getNearestTarget();
            if(this.m_deathTarget != null)
            {
               this.m_nextActionTimer.reset();
               this.m_nextActionTimer.MaxTime = 60;
               this.m_action = 2;
               _loc1_ = STAGEDATA.attachEffectOverlay("yagamilight_shinigamieye");
               _loc1_.x = OverlayX;
               _loc1_.y = OverlayY - m_height - 10;
               playFrame("found");
               if(this.m_deathTarget.CurrentTarget.X >= this.X + 15)
               {
                  stancePlayFrame("look_right");
               }
               else
               {
                  stancePlayFrame("look_left");
               }
            }
            else if(this.m_nextActionTimer.IsComplete)
            {
               this.m_nextActionTimer.reset();
               this.m_nextActionTimer.MaxTime = 60;
               this.m_action = 4;
               playFrame("miss");
            }
         }
         else if(this.m_action == 2)
         {
            this.m_nextActionTimer.tick();
            if(this.m_nextActionTimer.IsComplete)
            {
               this.m_nextActionTimer.reset();
               this.m_nextActionTimer.MaxTime = 340;
               this.m_action = 3;
               playFrame("write");
               m_fadeTimer.reset();
            }
         }
         else if(this.m_action == 3)
         {
            this.m_nextActionTimer.tick();
            if(this.m_nextActionTimer.CurrentTime > this.m_nextActionTimer.MaxTime - 15)
            {
               fadeOut();
            }
            if(m_sprite.stance.currentFrame == 112)
            {
               STAGEDATA.playSpecificVoice("kira_laugh");
            }
            if(this.m_nextActionTimer.IsComplete)
            {
               this.m_nextActionTimer.reset();
               this.m_nextActionTimer.MaxTime = 30 * 10;
               this.m_action = 5;
               m_sprite.visible = false;
               this.m_deathTimerMC = STAGEDATA.attachEffectOverlay("deathnote_countdown");
               this.m_deathTimerMC.x = OverlayX;
               this.m_deathTimerMC.y = OverlayY;
               this.moveTimer();
            }
         }
         else if(this.m_action == 4)
         {
            this.m_nextActionTimer.tick();
            if(this.m_nextActionTimer.IsComplete)
            {
               destroy();
            }
         }
         else if(this.m_action == 5)
         {
            this.moveTimer();
            this.m_nextActionTimer.tick();
            if(this.m_nextActionTimer.IsComplete && !m_dead)
            {
               if(!this.m_deathTarget.PlayerSprite.StandBy)
               {
                  _loc2_ = false;
                  _loc3_ = 0;
                  while(_loc3_ < STAGEDATA.PlayerList.length && !_loc2_)
                  {
                     if(STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc3_]).Grabbed.indexOf(this.m_deathTarget.PlayerSprite) >= 0)
                     {
                        STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc3_]).releaseOpponent();
                        _loc2_ = true;
                     }
                     _loc3_++;
                  }
                  this.m_deathTarget.PlayerSprite.X = STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width / 2;
                  this.m_deathTarget.PlayerSprite.Y = STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height + 50;
               }
               destroy();
            }
         }
      }
      
      private function moveTimer() : void
      {
         if(this.m_deathTarget.CurrentTarget != null && this.m_deathTimerMC.parent != null)
         {
            if(this.m_deathTarget.PlayerSprite.Revival || this.m_deathTarget.PlayerSprite.StandBy)
            {
               this.m_deathTimerMC.parent.removeChild(this.m_deathTimerMC);
               destroy();
            }
            else
            {
               this.m_deathTimerMC.x = this.m_deathTarget.CurrentTarget.OverlayX;
               this.m_deathTimerMC.y = this.m_deathTarget.CurrentTarget.OverlayY;
               this.m_deathTimerMC.y = this.m_deathTimerMC.y - this.m_deathTarget.CurrentTarget.SizeRatio * this.m_deathTarget.CurrentTarget.Height;
            }
         }
      }
      
      override protected function getNearestTarget() : Target
      {
         var _loc5_:* = undefined;
         var _loc1_:Array = STAGEDATA.getPlayerArray();
         var _loc2_:Target = new Target();
         _loc2_.Distance = Number.MAX_VALUE;
         var _loc3_:Number = 0;
         var _loc4_:Boolean = getStanceVar("facingRight",true);
         for(_loc5_ in _loc1_)
         {
            if(Character(_loc1_[_loc5_]).ID != m_player_id && !(m_team_id > 0 && Character(_loc1_[_loc5_]).Team == m_team_id) && !Character(_loc1_[_loc5_]).StandBy)
            {
               _loc3_ = Utils.getDistanceFrom(STAGEDATA.getPlayer(m_player_id),Character(_loc1_[_loc5_]));
               if(_loc3_ < _loc2_.Distance && checkLinearPath(Character(_loc1_[_loc5_])) && Utils.fastAbs(m_sprite.y - Character(_loc1_[_loc5_]).Y) < 50 && Utils.fastAbs(m_sprite.x - Character(_loc1_[_loc5_]).X) < 250 && (_loc4_ && Character(_loc1_[_loc5_]).X > m_sprite.x || !_loc4_ && Character(_loc1_[_loc5_]).X < m_sprite.x))
               {
                  _loc2_.CurrentTarget = _loc1_[_loc5_];
                  _loc2_.Distance = _loc3_;
               }
            }
         }
         return _loc2_.CurrentTarget == null?null:_loc2_;
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            checkTimers();
            this.runAI();
            if(!m_dead)
            {
               if(this.m_action == 0)
               {
                  fadeIn();
               }
               performAttackChecks();
               attackCollisionTest();
               move();
               gravity();
               m_groundCollisionTest();
               checkDeath();
            }
         }
      }
   }
}
