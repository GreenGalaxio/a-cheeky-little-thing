package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.HitBoxCollisionResult;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.enums.CState;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   
   public class JungleHijinxBarrel2 extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_xLocation:FrameTimer;
      
      private var m_yLocation:FrameTimer;
      
      private var m_fillDelay:FrameTimer;
      
      private var m_shootDelay:FrameTimer;
      
      private var m_capturedOpponent:Character;
      
      private var m_shootLetGo:Boolean;
      
      private var m_timeLimit:FrameTimer;
      
      private var m_lastCaptureTimer:FrameTimer;
      
      private var m_lastCapture:Character;
      
      private const ARC_WIDTH:Number = 400;
      
      private const ARC_HEIGHT:Number = 140;
      
      public function JungleHijinxBarrel2(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("junglehijinx_barrel",param1,param2,param3,param4);
         this.m_action = 0;
         this.m_xLocation = new FrameTimer(40 * 24);
         this.m_yLocation = new FrameTimer(40 * 12);
         this.m_yLocation.CurrentTime = this.m_yLocation.MaxTime / 4;
         m_attackData.importAttacks(Main.getEnemyAttackData("junglehijinxbarrel_stats"));
         m_attack.XLoc = m_sprite.x;
         m_attack.YLoc = m_sprite.y;
         this.m_fillDelay = new FrameTimer(3);
         this.m_shootDelay = new FrameTimer(10);
         this.m_lastCaptureTimer = new FrameTimer(5);
         this.m_lastCapture = null;
         this.m_capturedOpponent = null;
         this.m_shootLetGo = false;
         this.m_timeLimit = new FrameTimer(30 * 5);
         if(!STAGEDATA.HazardsOn)
         {
            m_sprite.visible = false;
            this.m_action = -1;
         }
         this.runAI();
      }
      
      private function runAI() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:AttackDamage = null;
         if(this.m_action == 0)
         {
            m_sprite.x = m_x_start + this.ARC_WIDTH * Math.cos(this.m_xLocation.CurrentTime / this.m_xLocation.MaxTime * (2 * Math.PI));
            m_sprite.y = m_y_start + this.ARC_HEIGHT * Math.sin(this.m_yLocation.CurrentTime / this.m_yLocation.MaxTime * (2 * Math.PI));
            _loc1_ = Utils.getAngleBetween(new Point(m_sprite.x,m_sprite.y),new Point(m_x_start,m_y_start + this.ARC_HEIGHT));
            _loc2_ = m_attackData.getAttackBoxData("barrel_shoot","attackBox").syncState(m_attack);
            if(m_attackData.getAttack("barrel_shoot").OverrideMap.containsKey("attackBox"))
            {
               m_attackData.getAttack("barrel_shoot").OverrideMap.getKey("attackBox").direction = _loc1_;
            }
            else
            {
               m_attackData.getAttack("barrel_shoot").OverrideMap.setKey("attackBox",{"direction":_loc1_});
            }
            m_sprite.rotation = Utils.forceBase360(-_loc1_ - 90);
            this.m_xLocation.tick();
            this.m_yLocation.tick();
            if(this.m_xLocation.IsComplete)
            {
               this.m_xLocation.reset();
            }
            if(this.m_yLocation.IsComplete)
            {
               this.m_yLocation.reset();
            }
            m_attack.XLoc = m_sprite.x;
            m_attack.YLoc = m_sprite.y;
            if(this.m_capturedOpponent == null && this.m_fillDelay.IsComplete)
            {
               if(this.m_lastCapture)
               {
                  this.m_lastCaptureTimer.tick();
                  if(this.m_lastCaptureTimer.IsComplete)
                  {
                     this.m_lastCaptureTimer.reset();
                     this.m_lastCapture = null;
                  }
               }
               this.checkAmmo();
            }
            if(this.m_capturedOpponent != null)
            {
               this.m_capturedOpponent.X = m_sprite.x - 23;
               this.m_capturedOpponent.Y = m_sprite.y;
               this.m_shootDelay.tick();
               if(this.m_shootDelay.IsComplete && this.m_capturedOpponent.getControls()["BUTTON2"] == false)
               {
                  this.m_shootLetGo = true;
               }
               if(this.m_shootDelay.IsComplete && this.m_shootLetGo)
               {
                  this.m_timeLimit.tick();
                  if(this.m_capturedOpponent.StandBy || this.m_capturedOpponent.Revival || this.m_capturedOpponent.Dead)
                  {
                     this.m_fillDelay.reset();
                     this.m_capturedOpponent = null;
                  }
                  else if(this.m_capturedOpponent.getControls()["BUTTON2"] == true || this.m_timeLimit.IsComplete)
                  {
                     this.m_fillDelay.reset();
                     this.m_capturedOpponent.Uncapture();
                     this.m_capturedOpponent.takeDamage(m_attackData.getAttackBoxData("barrel_shoot","attackBox").syncState(m_attack));
                     this.m_capturedOpponent.MC.visible = true;
                     this.m_capturedOpponent.setState(CState.FLYING);
                     this.m_capturedOpponent = null;
                     stancePlayFrame("shoot");
                     STAGEDATA.playSpecificSound("barrel_shoot");
                  }
               }
            }
            else
            {
               this.m_fillDelay.tick();
            }
         }
      }
      
      private function checkAmmo() : void
      {
         var _loc3_:Character = null;
         var _loc1_:Vector.<HitBoxCollisionResult> = null;
         var _loc2_:int = 0;
         while(_loc2_ < m_opponents.length)
         {
            _loc3_ = STAGEDATA.getPlayer(m_opponents[_loc2_]);
            if(this.m_lastCapture != _loc3_ && _loc3_.CanBarrel && !_loc3_.Dead && !_loc3_.inState(CState.STAR_KO) && !_loc3_.inState(CState.SCREEN_KO) && !_loc3_.AttackingFinalSmash && !_loc3_.TransformingFinalSmash && !_loc3_.IsCaught)
            {
               if((_loc1_ = HitBoxSprite.hitTestArray(CurrentAnimation.getHitBoxes(CurrentFrameNum,HitBoxSprite.HIT),_loc3_.CurrentAnimation.getHitBoxes(_loc3_.CurrentFrameNum,HitBoxSprite.HIT),Location,_loc3_.Location,!m_facingForward,!_loc3_.FacingForward,CurrentScale,_loc3_.CurrentScale,CurrentRotation,_loc3_.CurrentRotation)).length > 0)
               {
                  _loc3_.Capture(-1,false,true);
                  _loc3_.MC.visible = false;
                  stancePlayFrame("fill");
                  STAGEDATA.playSpecificSound("barrel_fill");
                  this.m_shootDelay.reset();
                  this.m_capturedOpponent = _loc3_;
                  this.m_capturedOpponent.Uncapture();
                  this.m_capturedOpponent.setState(CState.BARREL);
                  this.m_shootLetGo = false;
                  this.m_timeLimit.reset();
                  this.m_lastCapture = this.m_capturedOpponent;
                  return;
               }
            }
            _loc2_++;
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
