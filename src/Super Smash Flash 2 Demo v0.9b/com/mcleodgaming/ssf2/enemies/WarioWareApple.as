package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class WarioWareApple extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_deathTimer:FrameTimer;
      
      private var m_blinkTimer:FrameTimer;
      
      private var m_blinkToggle:Boolean;
      
      private var m_shakeTimer:FrameTimer;
      
      public function WarioWareApple(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("warioware_apple",param1,param2,param3,param4);
         this.m_action = -1;
         this.m_blinkToggle = false;
         this.m_deathTimer = new FrameTimer(30 * 1);
         this.m_blinkTimer = new FrameTimer(3);
         this.m_shakeTimer = new FrameTimer(6);
         this.m_shakeTimer.finish();
      }
      
      public function shake() : void
      {
         this.m_shakeTimer.reset();
      }
      
      public function drop() : void
      {
         this.m_action = 0;
         m_ySpeed = -2;
         m_max_ySpeed = 14;
         m_gravity = 2;
      }
      
      private function runAI() : void
      {
         if(this.m_action == -1)
         {
            if(!this.m_shakeTimer.IsComplete)
            {
               this.m_shakeTimer.tick();
               m_sprite.x = m_x_start + Utils.calculateYSpeed(2,360 * (this.m_shakeTimer.CurrentTime / (this.m_shakeTimer.MaxTime / 2)));
               m_sprite.y = m_y_start + Utils.calculateYSpeed(2,360 * (this.m_shakeTimer.CurrentTime / (this.m_shakeTimer.MaxTime / 2)));
            }
         }
         else if(this.m_action == 0)
         {
            if(m_collision.ground)
            {
               this.m_action = 1;
            }
         }
         else if(this.m_action == 1)
         {
            this.m_blinkTimer.tick();
            if(this.m_blinkTimer.IsComplete)
            {
               this.m_blinkToggle = !this.m_blinkToggle;
               this.m_blinkTimer.reset();
               m_sprite.alpha = !!this.m_blinkToggle?Number(0):Number(0.75);
            }
            this.m_deathTimer.tick();
            if(this.m_deathTimer.IsComplete)
            {
               destroy();
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
               m_groundCollisionTest();
               performAttackChecks();
               attackCollisionTest();
               checkDeath();
            }
         }
      }
   }
}
