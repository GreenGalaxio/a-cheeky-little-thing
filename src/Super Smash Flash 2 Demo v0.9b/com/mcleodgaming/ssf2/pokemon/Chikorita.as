package com.mcleodgaming.ssf2.pokemon
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.Projectile;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class Chikorita extends Pokemon
   {
       
      
      private var m_action:uint;
      
      private var m_target:Target;
      
      private var m_attackTimer:FrameTimer;
      
      private var m_leafCount:Number;
      
      public function Chikorita(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("chikorita",param1,param2,param3,param4);
         m_gravity = 1;
         m_max_ySpeed = 10;
         m_attackData.importAttacks(Main.getEnemyAttackData("chikorita_stats"));
         m_attackData.importProjectiles(Main.getEnemyAttackData("chikorita_projectiles"));
         this.m_attackTimer = new FrameTimer(20);
         this.m_action = 0;
         this.m_target = new Target();
         this.m_leafCount = 0;
         m_projectile = new Vector.<Projectile>();
         m_projectile_max = 12;
         var _loc5_:Number = 0;
         _loc5_ = 0;
         while(_loc5_ < m_projectile_max)
         {
            m_projectile[_loc5_] = null;
            _loc5_++;
         }
         m_width = 30;
         m_height = 30;
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            playFrame("idle");
            if(this.m_attackTimer.CurrentTime == 0)
            {
               this.m_target = getNearestTarget();
               if(this.m_target != null)
               {
                  if(this.m_target.CurrentTarget.X < m_sprite.x)
                  {
                     m_attack.IsForward = false;
                     m_faceLeft();
                  }
                  else
                  {
                     m_attack.IsForward = true;
                     m_faceRight();
                  }
               }
            }
            this.m_attackTimer.tick();
            if(this.m_attackTimer.IsComplete)
            {
               this.m_action = 1;
               this.m_attackTimer.reset();
               this.m_attackTimer.MaxTime = 8;
               Attack("attack");
            }
            else if(this.m_attackTimer.CurrentTime == 5)
            {
               STAGEDATA.SoundQueueRef.playVoiceEffect("chikorita_appear");
            }
         }
         else if(this.m_action == 1)
         {
            this.m_attackTimer.tick();
            if(this.m_attackTimer.CurrentTime == 5)
            {
               STAGEDATA.SoundQueueRef.playSoundEffect("chikorita_shoot");
               fireProjectile("leaf");
               this.m_leafCount++;
            }
            else if(this.m_attackTimer.IsComplete)
            {
               if(this.m_leafCount >= 20)
               {
                  this.m_action = 2;
                  m_sprite.visible = false;
                  this.m_attackTimer.reset();
                  this.m_attackTimer.MaxTime = 21;
                  m_attack.IsAttacking = false;
               }
               else
               {
                  this.m_attackTimer.reset();
               }
            }
         }
         else if(this.m_action == 2)
         {
            this.m_attackTimer.tick();
            if(this.m_attackTimer.IsComplete)
            {
               destroy();
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
            applyGroundInfluence();
            m_sprite.x = m_sprite.x + m_xSpeed;
            attachToGround();
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            this.runAI();
            if(!m_dead)
            {
               fadeIn();
               performAttackChecks();
               attackCollisionTest();
               this.move();
               gravity();
               m_groundCollisionTest();
               checkDeath();
            }
         }
      }
   }
}
