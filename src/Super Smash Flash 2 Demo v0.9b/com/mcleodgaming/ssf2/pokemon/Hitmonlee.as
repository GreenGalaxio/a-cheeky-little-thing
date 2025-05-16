package com.mcleodgaming.ssf2.pokemon
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class Hitmonlee extends Pokemon
   {
       
      
      private var m_action:uint;
      
      private var m_target:Target;
      
      private var m_attackTimer:FrameTimer;
      
      private const POUNCE_XSPEED:uint = 4;
      
      private const POUNCE_YSPEED:int = -20;
      
      private const POUNCE_XACC:uint = 30;
      
      private const POUNCE_YACC:uint = 15;
      
      public function Hitmonlee(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("hitmonlee",param1,param2,param3,param4);
         m_gravity = 1.5;
         m_max_ySpeed = 30;
         m_attackData.importAttacks(Main.getEnemyAttackData("hitmonlee_stats"));
         this.m_action = 0;
         this.m_attackTimer = new FrameTimer(180);
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            playFrame("idle");
            this.m_attackTimer.tick();
            if(this.m_attackTimer.CurrentTime == 5)
            {
               STAGEDATA.SoundQueueRef.playVoiceEffect("hitmonlee_appear");
            }
            if(this.m_attackTimer.CurrentTime >= 45)
            {
               this.m_action = 1;
            }
         }
         else if(this.m_action == 1)
         {
            this.m_attackTimer.tick();
            playFrame("idle");
            this.m_target = getNearestTarget();
            this.m_action = 2;
            STAGEDATA.SoundQueueRef.playVoiceEffect("hitmonlee_kick");
            STAGEDATA.playSpecificSound("hitmonlee_jump");
            if(this.m_target != null)
            {
               if(this.m_target.CurrentTarget.X > m_sprite.x)
               {
                  m_attack.IsForward = true;
                  m_faceRight();
               }
               else
               {
                  m_attack.IsForward = false;
                  m_faceLeft();
               }
               m_xSpeed = !!m_facingForward?Number(this.POUNCE_XSPEED * (Math.abs(this.m_target.CurrentTarget.X - m_sprite.x) / this.POUNCE_XSPEED) / this.POUNCE_XACC):Number(-this.POUNCE_XSPEED * (Math.abs(this.m_target.CurrentTarget.X - m_sprite.x) / this.POUNCE_XSPEED) / this.POUNCE_XACC);
               m_ySpeed = this.POUNCE_YSPEED + (this.m_target.CurrentTarget.Y - m_sprite.y) / this.POUNCE_YACC;
               unnattachFromGround();
               m_attack.IsAttacking = true;
            }
            else
            {
               m_xSpeed = !!m_facingForward?Number(this.POUNCE_XSPEED * (Math.abs(100) / this.POUNCE_XSPEED) / this.POUNCE_XACC):Number(-this.POUNCE_XSPEED * (Math.abs(100) / this.POUNCE_XSPEED) / this.POUNCE_XACC);
               m_ySpeed = this.POUNCE_YSPEED + -100 / this.POUNCE_YACC;
               unnattachFromGround();
               m_attack.IsAttacking = true;
            }
         }
         else if(this.m_action == 2)
         {
            Attack("kick");
            this.m_attackTimer.tick();
            if(this.m_attackTimer.IsComplete)
            {
               destroy();
            }
         }
      }
      
      override protected function move() : void
      {
         if(!m_attack.IsAttacking)
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
         else
         {
            applyGroundInfluence();
            m_sprite.x = m_sprite.x + m_xSpeed;
            m_sprite.y = m_sprite.y + m_ySpeed;
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
               if(!m_attack.IsAttacking)
               {
                  m_groundCollisionTest();
               }
            }
         }
      }
   }
}
