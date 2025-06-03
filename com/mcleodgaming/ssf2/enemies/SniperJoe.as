package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class SniperJoe extends Enemy
   {
       
      
      private var JUMP_SPEED:int = -12;
      
      private var m_action:int = 0;
      
      private var m_xSpeedIndex:int;
      
      private var m_xSpeedList:Vector.<int>;
      
      private var m_idleTimer:FrameTimer;
      
      private var m_idleTimer2:FrameTimer;
      
      public function SniperJoe(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("sniperjoe",param1,param2,param3,param4);
         m_attackData.importProjectiles(Main.getEnemyAttackData("sniperjoe_projectiles"));
         m_gravity = 1.2;
         m_max_ySpeed = 10;
         this.m_action = 0;
         this.m_xSpeedIndex = 0;
         this.m_xSpeedList = new Vector.<int>();
         this.m_xSpeedList.push(0);
         this.m_xSpeedList.push(7);
         this.m_xSpeedList.push(6);
         this.m_xSpeedList.push(5);
         this.m_xSpeedList.push(5);
         this.m_xSpeedList.push(7);
         m_xSpeed = this.m_xSpeedList[0];
         this.m_idleTimer = new FrameTimer(30 * 1);
         this.m_idleTimer2 = new FrameTimer(30 * 1);
         playFrame("jump");
         stancePlayFrame("loop");
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            if(m_collision.ground)
            {
               if(this.m_xSpeedIndex < this.m_xSpeedList.length - 1)
               {
                  this.m_xSpeedIndex++;
               }
               m_xSpeed = 0;
               playFrame("land");
               this.m_action = 1;
            }
         }
         else if(this.m_action == 1)
         {
            if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
            {
               playFrame("idle");
               this.m_action = 2;
            }
         }
         else if(this.m_action == 2)
         {
            this.m_idleTimer.tick();
            if(this.m_idleTimer.IsComplete)
            {
               this.m_idleTimer.reset();
               this.m_action = 3;
               playFrame("shoot");
            }
         }
         else if(this.m_action == 3)
         {
            if(m_sprite.stance.currentFrame == 9)
            {
               fireProjectile("shot");
            }
            else if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
            {
               this.m_action = 4;
               playFrame("idle");
            }
         }
         else if(this.m_action == 4)
         {
            this.m_idleTimer2.tick();
            if(this.m_idleTimer2.IsComplete)
            {
               this.m_idleTimer2.reset();
               this.m_action = 5;
               playFrame("jump");
            }
         }
         else if(this.m_action == 5)
         {
            if(m_sprite.stance.currentFrame >= 3)
            {
               this.m_action = 0;
               m_xSpeed = !!m_facingForward?Number(this.m_xSpeedList[this.m_xSpeedIndex]):Number(-this.m_xSpeedList[this.m_xSpeedIndex]);
               unnattachFromGround();
               m_ySpeed = this.JUMP_SPEED;
            }
         }
         if(m_sprite.x > STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width && m_facingForward || m_sprite.x < STAGEDATA.DeathBounds.x && !m_facingForward || m_sprite.y > STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height)
         {
            destroy();
         }
      }
      
      override protected function move() : void
      {
         if(!m_collision.ground && !isHitStunOrParalysis())
         {
            m_attemptToMove(m_xSpeed,0);
            m_attemptToMove(0,m_ySpeed);
         }
         else if(!isHitStunOrParalysis())
         {
            applyGroundInfluence();
            if(m_ySpeed < 0)
            {
               unnattachFromGround();
               m_attemptToMove(0,m_ySpeed);
            }
            else
            {
               m_sprite.x = m_sprite.x + m_xSpeed;
               attachToGround();
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
               this.move();
               gravity();
               m_groundCollisionTest();
               performAttackChecks();
               attackCollisionTest();
            }
         }
      }
   }
}
