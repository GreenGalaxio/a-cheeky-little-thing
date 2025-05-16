package com.mcleodgaming.ssf2.engine
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.platforms.PlatformMovement;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   
   public class TargetTestTarget extends InteractiveSprite
   {
       
      
      protected var m_broken:Boolean;
      
      protected var m_targetMovement:Vector.<PlatformMovement>;
      
      protected var m_moveIndex:int;
      
      protected var m_moveTimer:FrameTimer;
      
      protected var m_waitTimer:FrameTimer;
      
      protected var m_wait:Boolean;
      
      protected var m_xLoc:Number;
      
      protected var m_yLoc:Number;
      
      protected var m_className:String;
      
      public function TargetTestTarget(param1:MovieClip, param2:StageData)
      {
         super(param1,param2,false);
         STAGEDATA = param2;
         m_sprite = param1;
         m_gravity = 0;
         m_max_ySpeed = 0;
         this.m_broken = false;
         this.m_targetMovement = new Vector.<PlatformMovement>();
         this.m_moveIndex = Boolean(m_sprite.startIndex)?int(m_sprite.startIndex):int(0);
         var _loc3_:int = 1;
         while(m_sprite["movement" + _loc3_])
         {
            this.m_targetMovement.push(new PlatformMovement());
            this.m_targetMovement[this.m_targetMovement.length - 1].xAccel = Boolean(m_sprite["movement" + _loc3_].xAccel)?Number(m_sprite["movement" + _loc3_].xAccel):Number(0);
            this.m_targetMovement[this.m_targetMovement.length - 1].xDecel = Boolean(m_sprite["movement" + _loc3_].xDecel)?Number(m_sprite["movement" + _loc3_].xDecel):Number(0);
            this.m_targetMovement[this.m_targetMovement.length - 1].yAccel = Boolean(m_sprite["movement" + _loc3_].yAccel)?Number(m_sprite["movement" + _loc3_].yAccel):Number(0);
            this.m_targetMovement[this.m_targetMovement.length - 1].yDecel = Boolean(m_sprite["movement" + _loc3_].yDecel)?Number(m_sprite["movement" + _loc3_].yDecel):Number(0);
            this.m_targetMovement[this.m_targetMovement.length - 1].moveTime = Boolean(m_sprite["movement" + _loc3_].moveTime)?int(m_sprite["movement" + _loc3_].moveTime):int(0);
            this.m_targetMovement[this.m_targetMovement.length - 1].waitTime = Boolean(m_sprite["movement" + _loc3_].waitTime)?int(m_sprite["movement" + _loc3_].waitTime):int(0);
            this.m_targetMovement[this.m_targetMovement.length - 1].xSpeed = Boolean(m_sprite["movement" + _loc3_].xSpeed)?Number(m_sprite["movement" + _loc3_].xSpeed):Number(0);
            this.m_targetMovement[this.m_targetMovement.length - 1].ySpeed = Boolean(m_sprite["movement" + _loc3_].ySpeed)?Number(m_sprite["movement" + _loc3_].ySpeed):Number(0);
            _loc3_++;
         }
         if(this.m_targetMovement.length == 0)
         {
            this.m_targetMovement.push(new PlatformMovement());
            this.m_targetMovement[0].xAccel = 0;
            this.m_targetMovement[0].xDecel = 0;
            this.m_targetMovement[0].yAccel = 0;
            this.m_targetMovement[0].yDecel = 0;
            this.m_targetMovement[0].moveTime = 0;
            this.m_targetMovement[0].waitTime = 0;
            this.m_targetMovement[0].xSpeed = 0;
            this.m_targetMovement[0].ySpeed = 0;
         }
         this.m_moveTimer = new FrameTimer(this.m_targetMovement[this.m_moveIndex].moveTime);
         this.m_waitTimer = new FrameTimer(this.m_targetMovement[this.m_moveIndex].waitTime);
         m_xSpeed = this.m_targetMovement[this.m_moveIndex].xAccel > 0?Number(0):Number(this.m_targetMovement[this.m_moveIndex].xSpeed);
         m_ySpeed = this.m_targetMovement[this.m_moveIndex].yAccel > 0?Number(0):Number(this.m_targetMovement[this.m_moveIndex].ySpeed);
         this.m_wait = false;
         this.m_xLoc = m_sprite.x;
         this.m_yLoc = m_sprite.y;
         this.m_className = Main.getClassName(m_sprite);
         this.buildHitBoxData();
      }
      
      private function buildHitBoxData() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:MovieClip = null;
         if(HitBoxManager.HitBoxManageList[this.m_className] != null)
         {
            m_hitBoxManager = HitBoxManager.HitBoxManageList[this.m_className];
         }
         else
         {
            m_hitBoxManager = new HitBoxManager(this.m_className);
            _loc2_ = 0;
            _loc3_ = 0;
            _loc1_ = Main.getLibraryMC(this.m_className);
            Utils.removeActionScript(_loc1_);
            _loc2_ = 0;
            while(_loc2_ < _loc1_.totalFrames)
            {
               _loc1_.gotoAndStop(_loc2_ + 1);
               if(_loc1_)
               {
                  if(_loc1_.stance)
                  {
                     Utils.removeActionScript(_loc1_.stance);
                     m_hitBoxManager.addHitBoxAnimation(HitBoxAnimation.createHitBoxAnimation(this.m_className + "_" + _loc1_.currentLabel,_loc1_.stance,_loc1_));
                  }
               }
               _loc2_++;
            }
         }
      }
      
      override public function get CurrentAnimation() : HitBoxAnimation
      {
         return m_hitBoxManager == null?null:m_hitBoxManager.HitBoxAnimationList.length <= 0 || !m_sprite.currentLabel?null:m_hitBoxManager.getHitBoxAnimation(this.m_className + "_" + m_sprite.currentLabel);
      }
      
      public function get Broken() : Boolean
      {
         return this.m_broken;
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(!(!param1.HasEffect && param1.Damage == 0) && !this.Broken)
         {
            this.breakTarget();
            return true;
         }
         return false;
      }
      
      public function breakTarget() : void
      {
         if(!this.m_broken)
         {
            this.m_broken = true;
            stancePlayFrame("break");
            STAGEDATA.targetDestroyed();
            STAGEDATA.playSpecificSound("targetbreak");
         }
      }
      
      override protected function move() : void
      {
         if(!this.m_wait)
         {
            if(!this.m_moveTimer.IsComplete)
            {
               if(this.m_targetMovement[this.m_moveIndex].xAccel > 0)
               {
                  if(this.m_targetMovement[this.m_moveIndex].xSpeed > 0 && m_xSpeed < this.m_targetMovement[this.m_moveIndex].xSpeed)
                  {
                     m_xSpeed = m_xSpeed + this.m_targetMovement[this.m_moveIndex].xAccel;
                  }
                  else if(this.m_targetMovement[this.m_moveIndex].xSpeed < 0 && m_xSpeed > this.m_targetMovement[this.m_moveIndex].xSpeed)
                  {
                     m_xSpeed = m_xSpeed - this.m_targetMovement[this.m_moveIndex].xAccel;
                  }
               }
               if(this.m_targetMovement[this.m_moveIndex].yAccel > 0)
               {
                  if(this.m_targetMovement[this.m_moveIndex].ySpeed > 0 && m_ySpeed < this.m_targetMovement[this.m_moveIndex].ySpeed)
                  {
                     m_ySpeed = m_ySpeed + this.m_targetMovement[this.m_moveIndex].yAccel;
                  }
                  else if(this.m_targetMovement[this.m_moveIndex].ySpeed < 0 && m_ySpeed > this.m_targetMovement[this.m_moveIndex].ySpeed)
                  {
                     m_ySpeed = m_ySpeed - this.m_targetMovement[this.m_moveIndex].yAccel;
                  }
               }
            }
            else if(this.m_moveTimer.IsComplete)
            {
               if(this.m_targetMovement[this.m_moveIndex].xDecel > 0)
               {
                  if(this.m_targetMovement[this.m_moveIndex].xSpeed > 0)
                  {
                     m_xSpeed = m_xSpeed - this.m_targetMovement[this.m_moveIndex].xDecel;
                     if(m_xSpeed <= 0)
                     {
                        this.m_moveTimer.reset();
                        this.m_wait = true;
                     }
                  }
                  else if(this.m_targetMovement[this.m_moveIndex].xSpeed < 0)
                  {
                     m_xSpeed = m_xSpeed + this.m_targetMovement[this.m_moveIndex].xDecel;
                     if(m_xSpeed >= 0)
                     {
                        this.m_moveTimer.reset();
                        this.m_wait = true;
                     }
                  }
               }
               if(this.m_targetMovement[this.m_moveIndex].yDecel > 0)
               {
                  if(this.m_targetMovement[this.m_moveIndex].ySpeed > 0)
                  {
                     m_ySpeed = m_ySpeed - this.m_targetMovement[this.m_moveIndex].yDecel;
                     if(m_ySpeed < 0)
                     {
                        this.m_moveTimer.reset();
                        this.m_wait = true;
                     }
                  }
                  else if(this.m_targetMovement[this.m_moveIndex].ySpeed < 0)
                  {
                     m_ySpeed = m_ySpeed + this.m_targetMovement[this.m_moveIndex].yDecel;
                     if(m_ySpeed > 0)
                     {
                        this.m_moveTimer.reset();
                        this.m_wait = true;
                     }
                  }
                  else
                  {
                     this.m_moveTimer.reset();
                     this.m_wait = true;
                  }
               }
               if(this.m_targetMovement[this.m_moveIndex].xDecel <= 0 && this.m_targetMovement[this.m_moveIndex].yDecel <= 0)
               {
                  this.m_moveTimer.reset();
                  this.m_wait = true;
               }
            }
         }
         else
         {
            this.m_waitTimer.tick();
            if(this.m_waitTimer.IsComplete)
            {
               this.m_moveTimer.reset();
               this.m_waitTimer.reset();
               this.incrementMovement();
               this.m_moveTimer.MaxTime = this.m_targetMovement[this.m_moveIndex].moveTime;
               this.m_waitTimer.MaxTime = this.m_targetMovement[this.m_moveIndex].waitTime;
               m_xSpeed = this.m_targetMovement[this.m_moveIndex].xAccel > 0?Number(0):Number(this.m_targetMovement[this.m_moveIndex].xSpeed);
               m_ySpeed = this.m_targetMovement[this.m_moveIndex].yAccel > 0?Number(0):Number(this.m_targetMovement[this.m_moveIndex].ySpeed);
               this.m_wait = false;
            }
         }
      }
      
      private function incrementMovement() : void
      {
         this.m_moveIndex++;
         if(this.m_moveIndex >= this.m_targetMovement.length)
         {
            this.m_moveIndex = 0;
         }
      }
      
      public function stop() : void
      {
         m_sprite.stop();
      }
      
      public function play() : void
      {
         m_sprite.play();
      }
      
      override public function PERFORMALL() : void
      {
         if(!STAGEDATA.Paused && !STAGEDATA.StageEvent && !this.m_broken)
         {
            this.move();
         }
      }
   }
}
