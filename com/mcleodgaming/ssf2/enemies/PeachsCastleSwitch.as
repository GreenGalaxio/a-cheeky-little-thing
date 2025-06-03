package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.HitBoxCollisionResult;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.enums.CState;
   import com.mcleodgaming.ssf2.platforms.ButtonPlatform;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   
   public class PeachsCastleSwitch extends Enemy
   {
      
      public static var RED:String = "red";
      
      public static var BLUE:String = "blue";
      
      public static var GREEN:String = "green";
       
      
      private var m_action:int;
      
      private var m_type:String;
      
      private var m_deathTimer:FrameTimer;
      
      private var m_hitTimer:FrameTimer;
      
      private var m_blinkTimer:FrameTimer;
      
      private var m_blinkToggle:Boolean;
      
      public function PeachsCastleSwitch(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("peachCastleButton",param1,param2,param3,param4);
         var _loc5_:int = Utils.randomInteger(1,3);
         this.m_type = _loc5_ == 3?PeachsCastleSwitch.GREEN:_loc5_ == 2?PeachsCastleSwitch.BLUE:PeachsCastleSwitch.RED;
         playFrame(this.m_type);
         this.m_action = 0;
         forceOnGround();
         this.m_deathTimer = new FrameTimer(30 * 17);
         this.m_blinkTimer = new FrameTimer(30 * 3);
         this.m_hitTimer = new FrameTimer(30 * 1);
         this.m_blinkToggle = true;
         m_calcGroundAngle();
      }
      
      public function hit() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Array = null;
         var _loc3_:Point = null;
         var _loc4_:PeachsCastleBlock = null;
         if(this.m_action == 0)
         {
            this.m_action = 1;
            playFrame(this.m_type + "Hit");
            _loc1_ = 0;
            _loc2_ = null;
            _loc3_ = null;
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.MovingPlatforms.length)
            {
               if(STAGEDATA.MovingPlatforms[_loc1_] is ButtonPlatform && ButtonPlatform(STAGEDATA.MovingPlatforms[_loc1_]).Type == this.m_type)
               {
                  ButtonPlatform(STAGEDATA.MovingPlatforms[_loc1_]).activate();
               }
               _loc1_++;
            }
            if(STAGEDATA.hasEnemy(PeachsCastleBlock))
            {
               _loc1_ = 0;
               while(_loc1_ < STAGEDATA.Enemies.length)
               {
                  if(STAGEDATA.Enemies[_loc1_] is PeachsCastleBlock)
                  {
                     STAGEDATA.Enemies[_loc1_--].destroy();
                  }
                  _loc1_++;
               }
            }
            if(this.m_type == PeachsCastleSwitch.RED)
            {
               _loc2_ = [new Point(80,-48),new Point(385,-48)];
            }
            else if(this.m_type == PeachsCastleSwitch.BLUE)
            {
               _loc2_ = [new Point(236.8,-213.4)];
            }
            else if(this.m_type == PeachsCastleSwitch.GREEN)
            {
               _loc2_ = [new Point(-190,83),new Point(-225,83)];
            }
            _loc1_ = 0;
            while(_loc1_ < _loc2_.length)
            {
               _loc3_ = _loc2_[_loc1_];
               _loc4_ = PeachsCastleBlock(STAGEDATA.spawnEnemy(PeachsCastleBlock,_loc3_.x,_loc3_.y));
               _loc4_.setType(this.m_type);
               if(this.m_type == PeachsCastleBlock.RED && _loc1_ == _loc2_.length - 1)
               {
                  _loc4_.faceLeft();
               }
               _loc1_++;
            }
            m_sprite.alpha = 1;
            this.m_action = 2;
         }
      }
      
      private function runAI() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Character = null;
         var _loc3_:Vector.<HitBoxCollisionResult> = null;
         var _loc4_:Array = null;
         if(this.m_action == 0)
         {
            _loc1_ = 0;
            _loc2_ = null;
            _loc3_ = null;
            _loc4_ = null;
            _loc1_ = 0;
            while(_loc1_ < m_opponents.length)
            {
               _loc2_ = STAGEDATA.getPlayer(m_opponents[_loc1_]);
               if(HasStance && _loc2_ != null && !_loc2_.StandBy && !_loc2_.Dead && !_loc2_.inState(CState.STAR_KO) && !_loc2_.inState(CState.SCREEN_KO) && !_loc2_.inState(CState.REVIVAL))
               {
                  if((_loc3_ = HitBoxSprite.hitTestArray(CurrentAnimation.getHitBoxes(CurrentFrameNum,HitBoxSprite.HIT),_loc2_.CurrentAnimation.getHitBoxes(_loc2_.CurrentFrameNum,HitBoxSprite.HIT),Location,_loc2_.Location,!m_facingForward,!_loc2_.FacingForward,CurrentScale,_loc2_.CurrentScale,CurrentRotation,_loc2_.CurrentRotation)).length > 0)
                  {
                     this.hit();
                  }
               }
               _loc1_++;
            }
            this.m_deathTimer.tick();
            if(this.m_deathTimer.IsComplete)
            {
               this.m_action = 1;
            }
         }
         else if(this.m_action == 1)
         {
            this.m_blinkToggle = !this.m_blinkToggle;
            m_sprite.alpha = !!this.m_blinkToggle?Number(0.8):Number(0);
            this.m_blinkTimer.tick();
            if(this.m_blinkTimer.IsComplete)
            {
               destroy();
            }
         }
         else if(this.m_action == 2)
         {
            this.m_hitTimer.tick();
            if(this.m_hitTimer.IsComplete)
            {
               destroy();
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(this.m_action == 0)
         {
            this.hit();
            return true;
         }
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
               move();
               gravity();
               performAttackChecks();
               attackCollisionTest();
            }
         }
      }
   }
}
