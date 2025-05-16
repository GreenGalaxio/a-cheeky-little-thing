package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class KonohaLantern extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_swingSpeed:Number;
      
      private var m_swingCount:int;
      
      private var m_swingRight:Boolean;
      
      private var m_swingTimer:FrameTimer;
      
      private var m_deathTimer:FrameTimer;
      
      public function KonohaLantern(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("konohalanturn",param1,param2,param3,param4);
         m_width = 20;
         m_height = 20;
         m_gravity = 0;
         m_max_ySpeed = 14;
         this.m_swingRight = true;
         m_attackData.importAttacks(Main.getEnemyAttackData("konohalamp_stats"));
         Attack("idle");
         this.m_action = 0;
         this.m_swingSpeed = 4;
         this.m_swingCount = 4;
         this.m_swingTimer = new FrameTimer(30);
         this.m_deathTimer = new FrameTimer(60);
      }
      
      private function runAI() : void
      {
         if(this.m_action != 0)
         {
            if(this.m_action == 1)
            {
               m_sprite.rotation = Utils.calculateYSpeed(this.m_swingSpeed,360 * (this.m_swingTimer.CurrentTime / this.m_swingTimer.MaxTime));
               if(this.m_swingRight)
               {
                  m_sprite.rotation = 360 - m_sprite.rotation;
               }
               this.m_swingTimer.tick();
               if(this.m_swingTimer.IsComplete)
               {
                  this.m_swingTimer.reset();
                  this.m_swingCount--;
                  this.m_swingSpeed = this.m_swingSpeed / 2;
                  if(this.m_swingCount <= 0)
                  {
                     this.m_action = 0;
                     m_sprite.rotation = 0;
                     this.m_swingSpeed = 4;
                  }
               }
            }
            else if(this.m_action != 2)
            {
               if(this.m_action == 3)
               {
                  this.m_deathTimer.tick();
                  if(this.m_deathTimer.IsComplete && getActiveProjectiles(-1,-1).length == 0)
                  {
                     this.m_deathTimer.reset();
                     destroy();
                  }
               }
            }
         }
      }
      
      override protected function m_groundCollisionTest() : void
      {
         var _loc1_:Boolean = m_collision.ground;
         super.m_groundCollisionTest();
         if(!_loc1_ && m_collision.ground)
         {
            this.m_action = 3;
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(this.m_action > 1 || attackIDArrayContains(param1.AttackID) || !STAGEDATA.HazardsOn)
         {
            return false;
         }
         stackAttackID(param1.AttackID);
         this.m_swingRight = param1.IsForward;
         if(param1.EffectSound)
         {
            STAGEDATA.playSpecificSound(param1.EffectSound);
         }
         if(param1.EffectID != null && param1.EffectID != null)
         {
            attachHurtEffect(param1.EffectID,param2);
         }
         if(this.m_swingSpeed >= 32)
         {
            this.m_action = 2;
            m_gravity = 3;
         }
         else
         {
            this.m_swingSpeed = this.m_swingSpeed * 2;
            this.m_swingCount = 4;
            this.m_swingTimer.reset();
            this.m_swingTimer.MaxTime = this.m_swingTimer.MaxTime;
            this.m_action = 1;
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
               if(this.m_action > 1)
               {
                  this.m_groundCollisionTest();
               }
               performAttackChecks();
               attackCollisionTest();
               checkDeath();
            }
         }
      }
   }
}
