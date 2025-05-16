package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class SmashvilleBalloon extends Enemy
   {
       
      
      private var m_action:int;
      
      public function SmashvilleBalloon(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("smashville_balloon",param1,param2,param3,param4);
         this.m_action = 0;
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            m_xSpeed = !!m_facingForward?Number(2):Number(-2);
            checkDeath();
         }
         else if(this.m_action == 1)
         {
            m_xSpeed = 0;
            if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames - 1)
            {
               destroy();
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
         if(param1.EffectSound)
         {
            STAGEDATA.playSpecificSound(param1.EffectSound);
         }
         this.m_action = 1;
         playFrame("pop");
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
