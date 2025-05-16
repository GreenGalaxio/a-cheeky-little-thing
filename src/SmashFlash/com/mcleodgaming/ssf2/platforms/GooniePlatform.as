package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class GooniePlatform extends MovingPlatform
   {
       
      
      private const SPEED:Number = 2;
      
      private const SLOW_SPEED:Number = 1.5;
      
      private const EXIT_SPEED:Number = 4;
      
      private var m_active:Boolean;
      
      private var m_action:int;
      
      private var m_startLocation:Point;
      
      private var m_targetLocation:Point;
      
      private var m_pathIndex:int;
      
      private var m_pathList:Vector.<Point>;
      
      private var m_angle:Number;
      
      private var m_waitTimer:FrameTimer;
      
      public function GooniePlatform(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         this.m_action = 0;
         this.m_startLocation = new Point();
         this.m_targetLocation = new Point();
         this.m_pathIndex = 0;
         this.m_pathList = new Vector.<Point>();
         this.m_angle = 0;
         this.m_waitTimer = new FrameTimer(1);
         fallthrough = true;
      }
      
      public function get Active() : Boolean
      {
         return this.m_active;
      }
      
      private function randomStartLocation() : void
      {
         var _loc1_:int = Utils.randomInteger(1,4);
         if(_loc1_ == 1)
         {
            this.m_startLocation.x = STAGEDATA.DeathBounds.x - 100;
            this.m_startLocation.y = Utils.randomInteger(STAGEDATA.DeathBounds.y,STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height);
         }
         else if(_loc1_ == 2)
         {
            this.m_startLocation.x = Utils.randomInteger(STAGEDATA.DeathBounds.x,STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width);
            this.m_startLocation.y = STAGEDATA.DeathBounds.y - 100;
         }
         else if(_loc1_ == 3)
         {
            this.m_startLocation.x = STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width + 100;
            this.m_startLocation.y = Utils.randomInteger(STAGEDATA.DeathBounds.y,STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height);
         }
         else if(_loc1_ == 4)
         {
            this.m_startLocation.x = Utils.randomInteger(STAGEDATA.DeathBounds.x,STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width);
            this.m_startLocation.y = STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height + 100;
         }
      }
      
      private function randomTargetLocation() : void
      {
         this.m_targetLocation.x = Utils.randomInteger(-114,592);
         this.m_targetLocation.y = Utils.randomInteger(28,163);
      }
      
      private function adjustSpeeds(param1:Number, param2:Point) : void
      {
         this.m_angle = Utils.getAngleBetween(new Point(m_platform.x,m_platform.y),param2);
         m_xSpeed = Utils.calculateXSpeed(param1,this.m_angle);
         m_ySpeed = -Utils.calculateYSpeed(param1,this.m_angle);
      }
      
      public function activate() : void
      {
         this.m_active = true;
         this.randomStartLocation();
         this.randomTargetLocation();
         m_platform.x = this.m_startLocation.x;
         m_platform.y = this.m_startLocation.y;
         this.adjustSpeeds(this.SPEED,this.m_targetLocation);
         if(this.m_pathList.length > 0)
         {
            this.m_pathList.splice(0,this.m_pathList.length);
         }
         var _loc1_:int = Utils.randomInteger(4,8);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.m_pathList.push(new Point(Utils.randomInteger(this.m_targetLocation.x - 50,this.m_targetLocation.x + 50),Utils.randomInteger(this.m_targetLocation.y - 50,this.m_targetLocation.y + 50)));
            _loc2_++;
         }
         this.m_pathList.push(this.m_targetLocation.clone());
         this.m_waitTimer.reset();
         this.m_waitTimer.MaxTime = Utils.randomInteger(30 * 3,30 * 6);
         this.m_pathIndex = 0;
         fallthrough = false;
         this.m_action = 1;
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         if(m_xSpeed > 0)
         {
            faceRight();
         }
         else if(m_xSpeed < 0)
         {
            faceLeft();
         }
         if(this.m_action != 0)
         {
            if(this.m_action == 1)
            {
               m_platform.x = m_platform.x + m_xSpeed;
               m_platform.y = m_platform.y + m_ySpeed;
               this.adjustSpeeds(this.SPEED,this.m_targetLocation);
               if(Utils.getDistance(this.m_targetLocation,new Point(m_platform.x,m_platform.y)) < 5)
               {
                  this.m_action = 2;
               }
            }
            else if(this.m_action == 2)
            {
               this.m_waitTimer.tick();
               if(this.m_waitTimer.IsComplete)
               {
                  this.adjustSpeeds(this.SLOW_SPEED,this.m_pathList[this.m_pathIndex]);
                  this.m_waitTimer.reset();
                  this.m_waitTimer.MaxTime = Utils.randomInteger(30 * 6,30 * 9);
                  this.m_action = 3;
               }
            }
            else if(this.m_action == 3)
            {
               m_platform.x = m_platform.x + m_xSpeed;
               m_platform.y = m_platform.y + m_ySpeed;
               if(Utils.getDistance(new Point(m_platform.x,m_platform.y),this.m_pathList[this.m_pathIndex]) < 5)
               {
                  this.m_pathIndex++;
                  if(this.m_pathIndex >= this.m_pathList.length)
                  {
                     this.m_pathIndex = 0;
                  }
               }
               this.adjustSpeeds(this.SLOW_SPEED,this.m_pathList[this.m_pathIndex]);
               this.m_waitTimer.tick();
               if(this.m_waitTimer.IsComplete)
               {
                  this.m_waitTimer.reset();
                  this.randomStartLocation();
                  this.adjustSpeeds(this.EXIT_SPEED,this.m_startLocation);
                  this.m_action = 4;
               }
            }
            else if(this.m_action == 4)
            {
               m_platform.x = m_platform.x + m_xSpeed;
               m_platform.y = m_platform.y + m_ySpeed;
               this.adjustSpeeds(this.EXIT_SPEED,this.m_startLocation);
               if(Utils.getDistance(this.m_startLocation,new Point(m_platform.x,m_platform.y)) < 5)
               {
                  this.m_action = 0;
                  this.m_active = false;
                  fallthrough = true;
               }
            }
         }
         super.move();
      }
   }
}
