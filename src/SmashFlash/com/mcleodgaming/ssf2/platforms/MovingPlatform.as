package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.enemies.Enemy;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.InteractiveSprite;
   import com.mcleodgaming.ssf2.engine.Projectile;
   import com.mcleodgaming.ssf2.engine.StageData;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class MovingPlatform extends Platform
   {
       
      
      protected var m_foregroundPiece:MovieClip;
      
      protected var m_x_start:Number;
      
      protected var m_y_start:Number;
      
      protected var m_x_prev:Number;
      
      protected var m_y_prev:Number;
      
      protected var m_foregroundPoint:Point;
      
      protected var m_disabled:Boolean;
      
      protected var m_ledges:Vector.<MovieClip>;
      
      protected var m_ledgePoints:Vector.<Point>;
      
      protected var m_ledgePointsPrev:Vector.<Point>;
      
      protected var m_findLedges:Boolean;
      
      protected var m_xSpeed:Number;
      
      protected var m_ySpeed:Number;
      
      public function MovingPlatform(param1:MovieClip, param2:StageData, param3:String = "ground")
      {
         super(param1,param2,param3);
         this.m_x_prev = m_platform.x;
         this.m_y_prev = m_platform.y;
         this.m_x_prev = 0;
         this.m_y_prev = 0;
         this.m_xSpeed = 0;
         this.m_ySpeed = 0;
         this.m_disabled = false;
         this.m_ledges = new Vector.<MovieClip>();
         this.m_ledgePoints = new Vector.<Point>();
         this.m_ledgePointsPrev = new Vector.<Point>();
         this.m_foregroundPiece = null;
         this.m_foregroundPoint = new Point();
         this.m_x_start = m_platform.x;
         this.m_y_start = m_platform.y;
         this.m_findLedges = true;
      }
      
      public function extraHitTests(param1:Number, param2:Number, param3:InteractiveSprite = null) : Boolean
      {
         return false;
      }
      
      public function updateStart(param1:Point) : void
      {
         this.m_x_start = param1.x;
         this.m_y_start = param1.y;
      }
      
      public function setForegroundPiece(param1:MovieClip) : void
      {
         this.m_foregroundPiece = param1;
         this.m_foregroundPoint.x = this.m_foregroundPiece.x;
         this.m_foregroundPoint.y = this.m_foregroundPiece.y;
      }
      
      public function get syncPlatform() : String
      {
         return Boolean(m_collisionClip.syncPlatform)?m_collisionClip.syncPlatform:null;
      }
      
      public function set syncPlatform(param1:String) : void
      {
         m_collisionClip.syncPlatform = param1;
      }
      
      public function findForegroundPieces() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Boolean = false;
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         if(m_platform.foreground)
         {
            _loc1_ = 0;
            _loc2_ = false;
            _loc3_ = STAGEDATA.StageParentRef;
            _loc4_ = null;
            _loc1_ = 0;
            while(_loc1_ < _loc3_.numChildren)
            {
               if(_loc3_.getChildAt(_loc1_) is MovieClip)
               {
                  _loc4_ = MovieClip(_loc3_.getChildAt(_loc1_));
                  if(_loc4_.foreground && _loc4_.foreground == m_platform.foreground)
                  {
                     this.m_foregroundPiece = _loc4_;
                     _loc2_ = true;
                     break;
                  }
               }
               _loc1_++;
            }
            if(!_loc2_)
            {
               _loc3_ = STAGEDATA.StageFG;
               _loc1_ = 0;
               while(_loc3_ != null && _loc1_ < _loc3_.numChildren)
               {
                  if(_loc3_.getChildAt(_loc1_) is MovieClip)
                  {
                     _loc4_ = MovieClip(_loc3_.getChildAt(_loc1_));
                     if(_loc4_.foreground && _loc4_.foreground == m_platform.foreground)
                     {
                        this.m_foregroundPiece = _loc4_;
                        break;
                     }
                  }
                  _loc1_++;
               }
            }
            if(this.m_foregroundPiece != null)
            {
               this.m_foregroundPoint.x = this.m_foregroundPiece.x;
               this.m_foregroundPoint.y = this.m_foregroundPiece.y;
            }
         }
      }
      
      public function findLedges() : void
      {
         var _loc1_:Vector.<MovieClip> = null;
         var _loc2_:Vector.<MovieClip> = null;
         var _loc3_:Point = null;
         var _loc4_:int = 0;
         if(this.m_findLedges)
         {
            _loc1_ = STAGEDATA.getLedges_L();
            _loc2_ = STAGEDATA.getLedges_R();
            _loc3_ = new Point();
            _loc4_ = 0;
            while(_loc4_ < _loc1_.length)
            {
               if(_loc1_[_loc4_].syncPlatform && this.syncPlatform && _loc1_[_loc4_].syncPlatform == this.syncPlatform || !_loc1_[_loc4_].syncPlatform && !this.syncPlatform && hitTestPoint(_loc1_[_loc4_].x,_loc1_[_loc4_].y))
               {
                  this.m_ledges.push(_loc1_[_loc4_]);
                  this.m_ledgePoints.push(new Point(_loc1_[_loc4_].x,_loc1_[_loc4_].y));
                  this.m_ledgePointsPrev.push(new Point(_loc1_[_loc4_].x,_loc1_[_loc4_].y));
               }
               _loc4_++;
            }
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               if(_loc2_[_loc4_].syncPlatform && this.syncPlatform && _loc2_[_loc4_].syncPlatform == this.syncPlatform || !_loc2_[_loc4_].syncPlatform && !this.syncPlatform && hitTestPoint(_loc2_[_loc4_].x,_loc2_[_loc4_].y))
               {
                  this.m_ledges.push(_loc2_[_loc4_]);
                  this.m_ledgePoints.push(new Point(_loc2_[_loc4_].x,_loc2_[_loc4_].y));
                  this.m_ledgePointsPrev.push(new Point(_loc2_[_loc4_].x,_loc2_[_loc4_].y));
               }
               _loc4_++;
            }
         }
      }
      
      public function syncLedges() : void
      {
         var _loc2_:Point = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.m_ledges.length)
         {
            _loc2_ = new Point(m_platform.x - this.m_x_start,m_platform.y - this.m_y_start);
            this.m_ledges[_loc1_].x = this.m_ledgePoints[_loc1_].x + _loc2_.x;
            this.m_ledges[_loc1_].y = this.m_ledgePoints[_loc1_].y + _loc2_.y;
            _loc1_++;
         }
      }
      
      public function syncForeground() : void
      {
         var _loc1_:Point = null;
         if(this.m_foregroundPiece != null)
         {
            _loc1_ = new Point(m_platform.x - this.m_x_start,m_platform.y - this.m_y_start);
            this.m_foregroundPiece.x = this.m_foregroundPoint.x + _loc1_.x * (m_platform.parent.scaleX / this.m_foregroundPiece.parent.scaleX);
            this.m_foregroundPiece.y = this.m_foregroundPoint.y + _loc1_.y * (m_platform.parent.scaleY / this.m_foregroundPiece.parent.scaleY);
         }
      }
      
      public function get LedgeList() : Vector.<MovieClip>
      {
         return this.m_ledges;
      }
      
      public function get PreviousX() : Number
      {
         return this.m_x_prev;
      }
      
      public function get PreviousY() : Number
      {
         return this.m_y_prev;
      }
      
      public function storeOldLocation() : void
      {
         this.m_x_prev = m_platform.x;
         this.m_y_prev = m_platform.y;
      }
      
      protected function move() : void
      {
         this.syncLedges();
         this.syncForeground();
      }
      
      override public function stop() : void
      {
         super.stop();
         if(this.m_foregroundPiece != null)
         {
            this.m_foregroundPiece.stop();
         }
      }
      
      override public function play() : void
      {
         super.play();
         if(this.m_foregroundPiece != null)
         {
            this.m_foregroundPiece.play();
         }
      }
      
      protected function syncPlayers() : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc1_:Array = STAGEDATA.getPlayerArray();
         for(_loc2_ in _loc1_)
         {
            (_loc1_[_loc2_] as Character).checkMovingPlatforms(this);
         }
         for(_loc3_ in STAGEDATA.Projectiles)
         {
            (STAGEDATA.Projectiles[_loc3_] as Projectile).checkMovingPlatforms(this);
         }
         for(_loc4_ in STAGEDATA.Enemies)
         {
            if(STAGEDATA.Enemies[_loc4_] != null)
            {
               (STAGEDATA.Enemies[_loc4_] as Enemy).checkMovingPlatforms(this);
            }
         }
         for(_loc5_ in STAGEDATA.ItemsRef.ItemsInUse)
         {
            if(STAGEDATA.ItemsRef.ItemsInUse[_loc5_] != null && !STAGEDATA.ItemsRef.ItemsInUse[_loc5_].Dead)
            {
               STAGEDATA.ItemsRef.ItemsInUse[_loc5_].checkMovingPlatforms(this);
            }
         }
      }
      
      public function PERFORMALL() : void
      {
         if(!STAGEDATA.Paused && !this.m_disabled)
         {
            this.move();
            this.syncPlayers();
         }
      }
      
      public function PREPERFORM() : void
      {
         if(!this.m_disabled)
         {
            if(!STAGEDATA.Paused)
            {
               if(m_platform.currentFrame == m_platform.totalFrames)
               {
                  m_platform.gotoAndStop(1);
               }
               else
               {
                  m_platform.nextFrame();
               }
               if(this.m_foregroundPiece != null)
               {
                  if(this.m_foregroundPiece.currentFrame == this.m_foregroundPiece.totalFrames)
                  {
                     this.m_foregroundPiece.gotoAndStop(1);
                  }
                  else
                  {
                     this.m_foregroundPiece.nextFrame();
                  }
               }
            }
         }
      }
      
      override public function setAlpha(param1:Number) : void
      {
         super.setAlpha(param1);
         if(this.m_foregroundPiece != null)
         {
            this.m_foregroundPiece.alpha = param1;
         }
      }
      
      public function killPlatform() : void
      {
         m_platform.visible = false;
         if(this.m_foregroundPiece != null)
         {
            this.m_foregroundPiece.visible = false;
         }
         if(m_platform.ground)
         {
            MovieClip(m_platform.ground).fallthrough = true;
         }
         else
         {
            m_platform.fallthrough = true;
         }
         m_platform.visible = false;
         this.m_disabled = true;
      }
      
      public function POSTPERFORM() : void
      {
         if(!this.m_disabled)
         {
            this.stop();
         }
      }
   }
}
