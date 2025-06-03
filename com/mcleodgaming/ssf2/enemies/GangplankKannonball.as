package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.platforms.GangplankBoat;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class GangplankKannonball extends Enemy
   {
       
      
      private var WEIGHT:Number = 100;
      
      private var m_action:int;
      
      private var m_bounced:Boolean;
      
      private var m_destroyTimer:FrameTimer;
      
      public function GangplankKannonball(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("gangplankkannonball",param1,param2,param3,param4);
         m_gravity = 2;
         m_max_ySpeed = 40;
         m_attackData.importAttacks(Main.getEnemyAttackData("gangplank_kannonball_stats"));
         m_width = 50;
         m_height = 50;
         Attack("attack");
         this.m_destroyTimer = new FrameTimer(Utils.randomInteger(30 * 15,30 * 30));
         this.m_action = 0;
         this.m_bounced = false;
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(!m_collision.ground || attackIDArrayContains(param1.AttackID))
         {
            return false;
         }
         Attack("attack");
         unnattachFromGround();
         _loc3_ = Utils.calculateVelocity(Utils.calculateKnockback(param1.KBConstant,param1.Power,param1.WeightKB,Utils.calculateChargeDamage(param1),0,this.WEIGHT,false,1)) * 3;
         _loc4_ = Utils.calculateAttackDirection(param1,this,STAGEDATA.getPlayer(param1.PlayerID));
         _loc4_ = Utils.forceBase360(_loc4_);
         m_xSpeed = Utils.calculateXSpeed(_loc3_,_loc4_);
         m_ySpeed = -Utils.calculateYSpeed(_loc3_,_loc4_);
         m_attack.IsAttacking = true;
         setPlayerID(param1.PlayerID);
         this.m_action = 0;
         stackAttackID(param1.AttackID);
         if(param1.EffectSound)
         {
            STAGEDATA.playSpecificSound(param1.EffectSound);
         }
         if(param1.EffectID != null && param1.EffectID != null)
         {
            attachHurtEffect(param1.EffectID,param2);
         }
         return true;
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            m_sprite.stance.rotation = m_sprite.stance.rotation + m_xSpeed;
            decel(-1);
            if(m_collision.ground)
            {
               if(this.m_bounced)
               {
                  m_xSpeed = 0;
                  m_attack.IsAttacking = false;
                  this.m_action = 1;
                  setPlayerID(-1);
               }
               else
               {
                  unnattachFromGround();
                  m_attack.IsAttacking = false;
                  m_ySpeed = -5;
                  this.m_action = 2;
               }
            }
         }
         else if(this.m_action == 1)
         {
            if(!m_collision.ground)
            {
               m_attack.IsAttacking = true;
               this.m_action = 0;
            }
         }
         else if(this.m_action == 2)
         {
            if(m_collision.ground)
            {
               m_xSpeed = 0;
               playFrame("idle");
               this.m_action = 1;
               setPlayerID(-1);
               this.m_bounced = true;
            }
         }
         this.m_destroyTimer.tick();
         if(this.m_destroyTimer.IsComplete)
         {
            destroy();
         }
      }
      
      override protected function move() : void
      {
         m_attemptToMove(m_xSpeed,0);
         if(m_hitPlatform && !m_collision.ground)
         {
            m_xSpeed = m_xSpeed * -1;
         }
         m_attemptToMove(0,m_ySpeed);
      }
      
      override protected function m_groundCollisionTest() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Boolean = m_collision.ground;
         super.m_groundCollisionTest();
         if(m_collision.ground && !_loc1_)
         {
            playFrame("idle");
            STAGEDATA.CamRef.shake(6);
            if(m_currentPlatform is GangplankBoat)
            {
               _loc2_ = 0;
               _loc2_ = 0;
               while(_loc2_ < STAGEDATA.Terrains.length)
               {
                  if(STAGEDATA.Terrains[_loc2_] is GangplankBoat)
                  {
                     GangplankBoat(STAGEDATA.Terrains[_loc2_]).dip();
                  }
                  _loc2_++;
               }
               _loc2_ = 0;
               while(_loc2_ < STAGEDATA.Platforms.length)
               {
                  if(STAGEDATA.Platforms[_loc2_] is GangplankBoat)
                  {
                     GangplankBoat(STAGEDATA.Platforms[_loc2_]).dip();
                  }
                  _loc2_++;
               }
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
               this.move();
               gravity();
               this.m_groundCollisionTest();
               performAttackChecks();
               attackCollisionTest();
            }
         }
      }
   }
}
