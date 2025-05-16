package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class SectorZLaser extends Enemy
   {
       
      
      private var m_damage:Number;
      
      private var m_action:int;
      
      private var m_bullets:int;
      
      private var m_bulletDelay:FrameTimer;
      
      private var m_chargeTimer:FrameTimer;
      
      public function SectorZLaser(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("sectorz_gun",param1,param2,param3,param4);
         m_attackData.importAttacks(Main.getEnemyAttackData("sectorzlaser_stats"));
         playFrame("idle");
         this.m_action = 0;
         this.m_bullets = 0;
         this.m_bulletDelay = new FrameTimer(3);
         this.m_chargeTimer = new FrameTimer(30 * 3);
         this.m_damage = 0;
         m_sprite.visible = false;
      }
      
      public function activate() : void
      {
         if(this.m_action == 0)
         {
            this.m_action = 1;
            Attack("gun");
            m_sprite.stance.gotoAndPlay(1);
            m_sprite.visible = true;
            m_attack.IsAttacking = true;
         }
      }
      
      private function runAI() : void
      {
         if(this.m_action != 0)
         {
            if(this.m_action == 1)
            {
               if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
               {
                  m_sprite.visible = false;
                  this.m_action = 0;
                  m_attack.IsAttacking = false;
                  playFrame("idle");
               }
            }
            else if(this.m_action == 2)
            {
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(attackIDArrayContains(param1.AttackID) || this.m_action == 2)
         {
            return false;
         }
         stackAttackID(param1.AttackID);
         if(param1.EffectSound)
         {
            STAGEDATA.playSpecificSound(param1.EffectSound);
         }
         this.m_damage = this.m_damage + Utils.calculateChargeDamage(param1);
         if(this.m_damage >= 50)
         {
            this.m_action = 2;
            playFrame("idle");
            STAGE.laser.fallthrough = true;
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
