package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.Projectile;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class Met extends Enemy
   {
       
      
      private var RUN_SPEED:Number = 3;
      
      private var JUMP_SPEED:Number = 4;
      
      private var m_action:int;
      
      private var m_startedForward:Boolean;
      
      private var m_shootTimer:FrameTimer;
      
      public function Met(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("met",param1,param2,param3,param4);
         m_gravity = 0.4;
         m_max_ySpeed = 5;
         m_attackData.importAttacks(Main.getEnemyAttackData("met_stats"));
         m_attackData.importProjectiles(Main.getEnemyAttackData("met_projectiles"));
         Attack("walk");
         m_width = 25;
         m_height = 25;
         m_attack.IsAttacking = true;
         this.m_startedForward = true;
         this.m_action = 0;
         this.m_shootTimer = new FrameTimer(Utils.randomInteger(30 * 5,30 * 9));
      }
      
      public function get StartedForward() : Boolean
      {
         return this.m_startedForward;
      }
      
      public function set StartedForward(param1:Boolean) : void
      {
         this.m_startedForward = param1;
      }
      
      private function runAI() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Projectile = null;
         if(this.m_action == 0)
         {
            if(m_collision.ground && currentFrameIs("jump"))
            {
               Attack("walk");
            }
            this.m_shootTimer.tick();
            if(this.m_shootTimer.IsComplete && m_collision.ground)
            {
               m_xSpeed = 0;
               this.m_shootTimer.reset();
               this.m_action = 1;
               Attack("shoot");
            }
            else
            {
               m_xSpeed = !!m_facingForward?Number(this.RUN_SPEED):Number(-this.RUN_SPEED);
               _loc1_ = m_collision.ground && !testCoordCollision(m_xSpeed > 0?Number(m_sprite.x + m_xSpeed + 9):Number(m_sprite.x + m_xSpeed - 5),m_sprite.y + 9);
               m_collision.leftSide = m_xSpeed < 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed - m_width / 2,m_sprite.y + m_ySpeed - 35);
               m_collision.rightSide = m_xSpeed > 0 && testTerrainWithCoord(m_sprite.x + m_xSpeed + m_width / 2,m_sprite.y + m_ySpeed - 35);
               if(_loc1_ || m_collision.rightSide && m_xSpeed > 0 || m_collision.leftSide && m_xSpeed < 0)
               {
                  if(m_collision.ground)
                  {
                     unnattachFromGround();
                     m_ySpeed = -this.JUMP_SPEED;
                     Attack("jump");
                  }
               }
            }
         }
         else if(this.m_action == 1)
         {
            if(m_sprite.stance.currentFrame == 19)
            {
               _loc2_ = null;
               fireProjectile("shot");
               if(fireProjectile("shot"))
               {
                  m_projectile[m_lastProjectile].setYSpeed(-Utils.fastAbs(m_projectile[m_lastProjectile].XSpeed / 2));
               }
               if(fireProjectile("shot"))
               {
                  m_projectile[m_lastProjectile].setYSpeed(Utils.fastAbs(m_projectile[m_lastProjectile].XSpeed / 2));
               }
            }
            if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
            {
               this.m_action = 0;
               Attack("walk");
            }
         }
         if(m_sprite.x > STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width && m_facingForward || m_sprite.x < STAGEDATA.DeathBounds.x && !m_facingForward || m_sprite.y > STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height)
         {
            destroyAllProjectiles();
            destroy();
         }
      }
      
      override protected function move() : void
      {
         m_attemptToMove(m_xSpeed,0);
         m_attemptToMove(0,m_ySpeed);
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
