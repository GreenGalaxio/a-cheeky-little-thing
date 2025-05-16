package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.Projectile;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.*;
   import flash.display.MovieClip;
   
   public class Birdo extends Enemy
   {
       
      
      private var m_action:uint;
      
      private var m_walkTimer:FrameTimer;
      
      private var m_initFacingForward:Boolean;
      
      private var m_strafeSwitch:Boolean;
      
      private var m_strafeCount:uint;
      
      private var m_eggCount:Number;
      
      public function Birdo(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("birdo",param1,param2,param3,param4);
         m_gravity = 1;
         m_max_ySpeed = 10;
         this.m_action = 0;
         this.m_walkTimer = new FrameTimer(70);
         this.m_initFacingForward = true;
         this.m_strafeSwitch = false;
         this.m_strafeCount = 0;
         m_attackData.importProjectiles(Main.getEnemyAttackData("birdo_projectiles"));
         m_projectile = new Vector.<Projectile>();
         m_projectile_max = 3;
         var _loc5_:Number = 0;
         _loc5_ = 0;
         while(_loc5_ < m_projectile_max)
         {
            m_projectile[_loc5_] = null;
            _loc5_++;
         }
         m_width = 13;
         m_height = 20;
         this.m_eggCount = 0;
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
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            playFrame("walk");
            m_xSpeed = !!this.m_initFacingForward?Number(2):Number(-2);
            this.m_walkTimer.tick();
            if(this.m_walkTimer.IsComplete)
            {
               this.m_walkTimer.reset();
               this.m_walkTimer.MaxTime = 20;
               this.m_action = 2;
               this.m_strafeCount = 0;
               this.m_strafeSwitch = false;
               playFrame("walk");
            }
         }
         else if(this.m_action == 1)
         {
            m_xSpeed = 0;
            playFrame("stand");
            this.m_walkTimer.tick();
            if(this.m_walkTimer.IsComplete)
            {
               m_xSpeed = !!this.m_initFacingForward?Number(2):Number(-2);
               this.m_walkTimer.reset();
               this.m_walkTimer.MaxTime = 100;
               if(m_facingForward)
               {
                  m_faceLeft();
               }
               else
               {
                  m_faceRight();
               }
               this.m_action = 3;
            }
         }
         else if(this.m_action == 2)
         {
            playFrame("walk");
            if(this.m_strafeSwitch)
            {
               m_xSpeed = !!this.m_initFacingForward?Number(1):Number(-1);
            }
            else
            {
               m_xSpeed = !!this.m_initFacingForward?Number(-1):Number(1);
            }
            this.m_walkTimer.tick();
            if(this.m_walkTimer.IsComplete)
            {
               this.m_strafeCount++;
               if(this.m_strafeCount >= 2)
               {
                  if(Utils.random() < 0.25)
                  {
                     this.m_walkTimer.MaxTime = 90;
                     m_xSpeed = 0;
                     this.m_action = 1;
                     playFrame("stand");
                  }
                  else
                  {
                     this.m_walkTimer.reset();
                     this.m_walkTimer.MaxTime = 20;
                     playFrame("spit");
                     fireProjectile("egg");
                     m_xSpeed = 0;
                     this.m_action = 4;
                     this.m_eggCount = Utils.random() > 0.5?Number(2):Number(0);
                  }
               }
               else
               {
                  this.m_walkTimer.reset();
                  this.m_strafeSwitch = !this.m_strafeSwitch;
               }
            }
         }
         else if(this.m_action == 3)
         {
            if(!this.m_walkTimer.IsComplete)
            {
               m_xSpeed = !!this.m_initFacingForward?Number(-2):Number(2);
               this.m_walkTimer.tick();
               playFrame("walk");
            }
            if(this.m_walkTimer.IsComplete && m_projectile[m_lastProjectile] == null)
            {
               destroyAllProjectiles();
               destroy();
            }
         }
         else if(this.m_action == 4)
         {
            m_xSpeed = 0;
            this.m_walkTimer.tick();
            if(this.m_eggCount > 0 && this.m_walkTimer.CurrentTime > this.m_walkTimer.MaxTime / 2)
            {
               this.m_eggCount--;
               this.m_walkTimer.reset();
               fireProjectile("egg");
            }
            if(this.m_walkTimer.IsComplete)
            {
               this.m_walkTimer.reset();
               this.m_walkTimer.MaxTime = 121;
               this.m_action = 3;
               if(m_facingForward)
               {
                  m_faceLeft();
               }
               else
               {
                  m_faceRight();
               }
            }
         }
      }
      
      override protected function move() : void
      {
         if(!m_collision.ground)
         {
            m_attemptToMove(m_xSpeed,m_ySpeed);
         }
         else
         {
            m_sprite.x = m_sprite.x + m_xSpeed;
            attachToGround();
         }
      }
      
      private function m_pushAwayOpponents() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < m_opponents.length)
         {
            if(HasHitBox && STAGEDATA.getPlayer(m_opponents[_loc1_]).HasHitBox && m_sprite.stance.hitBox.hitTestObject(MovieClip(STAGE.getChildByName("p" + STAGEDATA.getPlayer(m_opponents[_loc1_]).ID)).stance.hitBox))
            {
               if(m_sprite.x < STAGEDATA.getPlayer(m_opponents[_loc1_]).X)
               {
                  STAGEDATA.getPlayer(m_opponents[_loc1_]).pushAway(true,Math.abs(m_xSpeed));
               }
               else
               {
                  STAGEDATA.getPlayer(m_opponents[_loc1_]).pushAway(false,Math.abs(m_xSpeed));
               }
            }
            _loc1_++;
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
               this.move();
               gravity();
               m_groundCollisionTest();
               this.m_pushAwayOpponents();
            }
         }
      }
   }
}
