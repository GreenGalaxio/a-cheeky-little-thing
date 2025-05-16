package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class TingleBalloon extends Enemy
   {
       
      
      private var Y_DISTANCE:int = 1;
      
      private var m_action:int;
      
      private var m_fallDelayTimer:FrameTimer;
      
      private var m_floatTimer:FrameTimer;
      
      public function TingleBalloon(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("tingle",param1,param2,param3,param4);
         m_gravity = 0;
         m_ySpeed = -3;
         m_max_ySpeed = 14;
         m_width = 20;
         m_height = 30;
         this.m_action = 0;
         this.m_fallDelayTimer = new FrameTimer(30 * 1);
         this.m_floatTimer = new FrameTimer(30 * 2);
         createSelfPlatform(-38,-99,73,18,false);
         STAGE.setChildIndex(m_sprite,0);
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            if(m_sprite.y < 200)
            {
               this.m_action = 1;
               m_ySpeed = 0;
            }
         }
         else if(this.m_action == 1)
         {
            this.m_floatTimer.tick();
            m_sprite.y = m_sprite.y + Utils.calculateYSpeed(this.Y_DISTANCE,360 * (this.m_floatTimer.CurrentTime / this.m_floatTimer.MaxTime));
            if(this.m_floatTimer.IsComplete)
            {
               this.m_floatTimer.reset();
            }
         }
         else if(this.m_action == 2)
         {
            this.m_fallDelayTimer.tick();
            if(this.m_fallDelayTimer.IsComplete)
            {
               this.m_fallDelayTimer.reset();
               m_gravity = 1;
               this.m_action = 3;
            }
         }
         else if(this.m_action == 3)
         {
            if(m_sprite.y > STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height)
            {
               destroy();
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(this.m_action <= 1)
         {
            if(param1.EffectSound)
            {
               STAGEDATA.playSpecificSound(param1.EffectSound);
            }
            if(param1.EffectID != null && param1.EffectID != null)
            {
               attachHurtEffect(param1.EffectID,param2);
            }
            playFrame("die");
            this.m_action = 2;
            m_ySpeed = 0;
            removeSelfPlatform();
            return true;
         }
         return false;
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
               updateSelfPlatform();
            }
         }
      }
   }
}
