package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.AttackState;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class NDSTetrisBlock extends Enemy
   {
       
      
      private var BLOCK_WIDTH:int = 0;
      
      private var SIDE_LENGTH:int = 46;
      
      private var m_action:int;
      
      private var m_type:int;
      
      private var m_waitTimer:FrameTimer;
      
      private var m_destroyTimer:FrameTimer;
      
      private var m_bitAttackData:AttackState;
      
      private var m_byteAttackData:AttackState;
      
      private var m_blinkToggle:Boolean;
      
      private var m_points:Vector.<Point>;
      
      public function NDSTetrisBlock(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("tetrisPiece",param1,param2,param3,param4);
         m_attackData.importAttacks(Main.getEnemyAttackData("tetrisPiece_stats"));
         this.m_destroyTimer = new FrameTimer(30 * 1);
         this.m_waitTimer = new FrameTimer(30 * 0.5);
         this.m_action = 0;
         this.m_type = 1;
         m_gravity = 2;
         m_max_ySpeed = 8;
         this.m_points = new Vector.<Point>();
      }
      
      public function get BlockWidth() : Number
      {
         return this.BLOCK_WIDTH;
      }
      
      public function get SideLength() : Number
      {
         return this.SIDE_LENGTH;
      }
      
      public function drawSquare(param1:MovieClip, param2:int, param3:int) : void
      {
         var _loc4_:int = 46;
         param1.graphics.beginFill(16711680,1);
         param1.graphics.drawRect(this.SIDE_LENGTH * param2,-this.SIDE_LENGTH * param3 - this.SIDE_LENGTH,this.SIDE_LENGTH,this.SIDE_LENGTH);
         param1.graphics.endFill();
         this.m_points.push(new Point(this.SIDE_LENGTH * param2 + this.SIDE_LENGTH / 2,-this.SIDE_LENGTH * param3));
      }
      
      public function setPieceType(param1:int) : void
      {
         this.m_points.splice(0,this.m_points.length);
         removeSelfPlatform();
         var _loc2_:MovieClip = new MovieClip();
         if(param1 == 1)
         {
            this.drawSquare(_loc2_,0,0);
            this.drawSquare(_loc2_,1,0);
            this.drawSquare(_loc2_,2,0);
            this.drawSquare(_loc2_,0,1);
            this.BLOCK_WIDTH = 3;
         }
         else if(param1 == 2)
         {
            this.drawSquare(_loc2_,0,0);
            this.drawSquare(_loc2_,1,0);
            this.drawSquare(_loc2_,0,1);
            this.drawSquare(_loc2_,1,1);
            this.BLOCK_WIDTH = 2;
         }
         else if(param1 == 3)
         {
            this.drawSquare(_loc2_,0,0);
            this.drawSquare(_loc2_,1,0);
            this.drawSquare(_loc2_,2,0);
            this.drawSquare(_loc2_,2,1);
            this.BLOCK_WIDTH = 3;
         }
         else if(param1 == 4)
         {
            this.drawSquare(_loc2_,0,1);
            this.drawSquare(_loc2_,0,2);
            this.drawSquare(_loc2_,1,0);
            this.drawSquare(_loc2_,1,1);
            this.BLOCK_WIDTH = 3;
         }
         else if(param1 == 5)
         {
            this.drawSquare(_loc2_,0,1);
            this.drawSquare(_loc2_,1,1);
            this.drawSquare(_loc2_,2,1);
            this.drawSquare(_loc2_,2,0);
            this.BLOCK_WIDTH = 3;
         }
         else if(param1 == 6)
         {
            this.drawSquare(_loc2_,0,1);
            this.drawSquare(_loc2_,1,2);
            this.drawSquare(_loc2_,1,1);
            this.drawSquare(_loc2_,1,0);
            this.BLOCK_WIDTH = 2;
         }
         else if(param1 == 7)
         {
            this.drawSquare(_loc2_,0,0);
            this.drawSquare(_loc2_,0,1);
            this.drawSquare(_loc2_,1,1);
            this.drawSquare(_loc2_,1,2);
            this.BLOCK_WIDTH = 2;
         }
         else if(param1 == 8)
         {
            this.drawSquare(_loc2_,0,0);
            this.drawSquare(_loc2_,1,0);
            this.drawSquare(_loc2_,2,0);
            this.drawSquare(_loc2_,3,0);
            this.BLOCK_WIDTH = 4;
         }
         else if(param1 == 9)
         {
            this.drawSquare(_loc2_,0,1);
            this.drawSquare(_loc2_,1,1);
            this.drawSquare(_loc2_,1,0);
            this.drawSquare(_loc2_,2,1);
            this.BLOCK_WIDTH = 3;
         }
         else if(param1 == 10)
         {
            this.drawSquare(_loc2_,0,0);
            this.drawSquare(_loc2_,0,1);
            this.drawSquare(_loc2_,0,2);
            this.drawSquare(_loc2_,0,3);
            this.BLOCK_WIDTH = 1;
         }
         Attack("piece" + param1);
         createSelfPlatformWithMC(_loc2_,false);
         m_selfPlatform.Container.visible = false;
         m_selfPlatform.fallthrough = true;
         m_selfPlatform.noDropThrough = true;
         m_sprite.parent.setChildIndex(m_sprite,param1);
         this.m_type = param1;
      }
      
      public function deactivate() : void
      {
         this.m_action = 2;
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            if(m_collision.ground)
            {
               m_selfPlatform.fallthrough = false;
               m_attack.IsAttacking = false;
            }
         }
         else if(this.m_action != 1)
         {
            if(this.m_action == 2)
            {
               this.m_waitTimer.tick();
               if(this.m_waitTimer.IsComplete)
               {
                  this.m_waitTimer.reset();
                  this.m_action = 3;
               }
            }
            else if(this.m_action == 3)
            {
               m_sprite.alpha = !!this.m_blinkToggle?Number(0.8):Number(0);
               this.m_blinkToggle = !this.m_blinkToggle;
               this.m_destroyTimer.tick();
               if(this.m_destroyTimer.IsComplete)
               {
                  m_sprite.alpha = 0;
                  destroy();
               }
            }
         }
      }
      
      override protected function m_groundCollisionTest() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         if(this.m_action < 3)
         {
            if(!m_collision.ground)
            {
               _loc1_ = 0;
               while(_loc1_ < this.m_points.length)
               {
                  if(m_collision.ground && !m_ySpeed < 0)
                  {
                     attachToGround();
                  }
                  _loc2_ = (m_currentPlatform = testGroundWithCoord(m_sprite.x + this.m_points[_loc1_].x,m_sprite.y + this.m_points[_loc1_].y + 1)) != null;
                  if(_loc2_ && m_currentPlatform && m_currentPlatform != m_selfPlatform && !(m_currentPlatform.SpriteOwner is NDSTetrisBlock && !NDSTetrisBlock(m_currentPlatform.SpriteOwner).Ground))
                  {
                     m_selfPlatform.fallthrough = false;
                     if(this.m_action < 2)
                     {
                        this.m_action = 1;
                     }
                     m_attack.IsAttacking = false;
                     m_collision.ground = _loc2_;
                     m_ySpeed = 0;
                     while(m_currentPlatform.hitTestPoint(m_sprite.x + this.m_points[_loc1_].x,m_sprite.y + this.m_points[_loc1_].y + 1))
                     {
                        m_sprite.y--;
                     }
                     if(this.m_type == 1 || this.m_type == 4 || this.m_type == 3 || this.m_type == 7)
                     {
                        STAGEDATA.Terrains.push(m_selfPlatform);
                        _loc3_ = STAGEDATA.Platforms.indexOf(m_selfPlatform);
                        if(_loc3_ >= 0)
                        {
                           STAGEDATA.Platforms.splice(_loc3_,1);
                        }
                     }
                     break;
                  }
                  m_currentPlatform = null;
                  _loc1_++;
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
               this.m_groundCollisionTest();
               performAttackChecks();
               if(this.m_action == 0)
               {
                  attackCollisionTest();
               }
               updateSelfPlatform();
            }
         }
      }
   }
}
