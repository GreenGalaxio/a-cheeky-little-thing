package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class GHZChunk extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_damage:Number;
      
      private var m_type:String;
      
      private var m_reviveTimer:FrameTimer;
      
      public function GHZChunk(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("ghzChunk",param1,param2,param3,param4);
         this.m_action = 0;
         this.m_damage = 0;
         this.m_type = "";
         this.m_reviveTimer = new FrameTimer(30 * 20);
      }
      
      public function setType(param1:String) : void
      {
         this.m_type = param1;
      }
      
      private function runAI() : void
      {
         if(this.m_action != 0)
         {
            if(this.m_action == 1)
            {
               this.m_reviveTimer.tick();
               if(this.m_reviveTimer.CurrentTime == this.m_reviveTimer.MaxTime - 25)
               {
                  STAGEDATA.StageBG[this.m_type].gotoAndPlay("appear");
               }
               else if(this.m_reviveTimer.IsComplete)
               {
                  this.m_reviveTimer.reset();
                  STAGE[this.m_type].fallthrough = false;
                  this.m_action = 0;
               }
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(attackIDArrayContains(param1.AttackID) || this.m_action == 1)
         {
            return false;
         }
         stackAttackID(param1.AttackID);
         this.m_damage = this.m_damage + Utils.calculateChargeDamage(param1);
         if(param1.EffectSound)
         {
            STAGEDATA.playSpecificSound(param1.EffectSound);
         }
         if(this.m_damage > 50 && STAGEDATA.StageBG[this.m_type] && STAGE[this.m_type])
         {
            STAGE[this.m_type].fallthrough = true;
            STAGEDATA.StageBG[this.m_type].gotoAndPlay("break");
            this.m_action = 1;
            this.m_damage = 0;
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
               checkDeath();
            }
         }
      }
   }
}
