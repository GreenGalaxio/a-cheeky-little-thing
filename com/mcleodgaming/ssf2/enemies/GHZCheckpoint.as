package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class GHZCheckpoint extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_deathTimer:FrameTimer;
      
      private var m_spinTimer:FrameTimer;
      
      public function GHZCheckpoint(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("ghzCheckpoint",param1,param2,param3,param4);
         m_attackData.importAttacks(Main.getEnemyAttackData("ghz_stats"));
         playFrame("blue");
         m_gravity = 1;
         m_max_ySpeed = 10;
         this.m_action = 0;
         this.m_spinTimer = new FrameTimer(238);
         this.m_deathTimer = new FrameTimer(30 * 15);
         forceOnGround();
         m_groundCollisionTest();
      }
      
      private function runAI() : void
      {
         this.m_deathTimer.tick();
         if(this.m_action == 0)
         {
            fadeIn();
            if(!m_collision.ground)
            {
               destroy();
            }
            else if(this.m_deathTimer.IsComplete)
            {
               m_fadeTimer.reset();
               this.m_action = 2;
            }
         }
         else if(this.m_action == 1)
         {
            this.m_spinTimer.tick();
            if(!m_collision.ground)
            {
               destroy();
            }
            else if(this.m_spinTimer.IsComplete)
            {
               this.m_spinTimer.reset();
               playFrame("blue");
               m_attack.IsAttacking = false;
               this.m_action = 0;
               m_player_id = -1;
            }
         }
         else if(this.m_action == 2)
         {
            fadeOut();
            if(m_fadeTimer.IsComplete)
            {
               destroy();
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(attackIDArrayContains(param1.AttackID) || this.m_action != 0)
         {
            return false;
         }
         stackAttackID(param1.AttackID);
         if(param1.EffectSound)
         {
            STAGEDATA.playSpecificSound(param1.EffectSound);
         }
         this.m_action = 1;
         m_attack.IsAttacking = true;
         Attack("spin");
         m_player_id = param1.PlayerID;
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
               m_groundCollisionTest();
               performAttackChecks();
               attackCollisionTest();
               checkDeath();
            }
         }
      }
   }
}
