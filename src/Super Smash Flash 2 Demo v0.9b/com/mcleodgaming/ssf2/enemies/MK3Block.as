package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class MK3Block extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_damage:Number;
      
      private var m_deadTimer:FrameTimer;
      
      private var m_shakeToggle:Boolean;
      
      private var m_shakeTimer:FrameTimer;
      
      public function MK3Block(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("mk3Brick",param1,param2,param3,param4);
         this.m_deadTimer = new FrameTimer(30 * 18);
         m_width = 30;
         m_height = 35;
         this.m_action = 0;
         this.m_damage = 0;
         createSelfPlatform(0,0,m_width,m_height);
         this.m_shakeToggle = false;
         this.m_shakeTimer = new FrameTimer(10);
         this.m_shakeTimer.finish();
      }
      
      public function breakBlock() : void
      {
         if(this.m_action == 0)
         {
            this.m_damage = 0;
            playFrame("break");
            m_selfPlatform.fallthrough = true;
            this.m_action = 1;
            m_sprite.x = m_x_start;
            this.m_shakeTimer.finish();
         }
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            if(!this.m_shakeTimer.IsComplete)
            {
               this.m_shakeToggle = !this.m_shakeToggle;
               m_sprite.x = !!this.m_shakeToggle?Number(m_x_start + 1):Number(m_x_start - 1);
               this.m_shakeTimer.tick();
               if(this.m_shakeTimer.IsComplete)
               {
                  m_sprite.x = m_x_start;
               }
            }
         }
         else if(this.m_action == 1)
         {
            if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
            {
               this.m_action = 2;
               playFrame("dead");
            }
         }
         else if(this.m_action == 2)
         {
            this.m_deadTimer.tick();
            if(this.m_deadTimer.IsComplete)
            {
               this.m_deadTimer.reset();
               playFrame("appear");
               this.m_action = 3;
            }
         }
         else if(this.m_action == 3)
         {
            if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames - 1)
            {
               this.m_action = 0;
               playFrame("idle");
               m_selfPlatform.fallthrough = false;
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(attackIDArrayContains(param1.AttackID) || this.m_action > 0)
         {
            return false;
         }
         stackAttackID(param1.AttackID);
         this.m_damage = this.m_damage + Utils.calculateChargeDamage(param1);
         if(param1.EffectSound)
         {
            STAGEDATA.playSpecificSound(param1.EffectSound);
         }
         if(param1.EffectID != null && param1.EffectID != null)
         {
            attachHurtEffect(param1.EffectID,param2);
         }
         this.m_shakeTimer.reset();
         if(this.m_damage >= 5)
         {
            this.breakBlock();
         }
         return true;
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
               performAttackChecks();
               attackCollisionTest();
               updateSelfPlatform();
            }
         }
      }
   }
}
