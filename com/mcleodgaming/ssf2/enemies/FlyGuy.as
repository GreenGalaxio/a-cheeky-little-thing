package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.enums.ModeFeatures;
   import com.mcleodgaming.ssf2.items.Item;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class FlyGuy extends Enemy
   {
       
      
      private var SPEED:Number = 4;
      
      private var HEIGHT:Number = 4;
      
      private var m_action:int;
      
      private var m_arcTimer:FrameTimer;
      
      private var m_foodItem:Item;
      
      private var m_damage:Number;
      
      public function FlyGuy(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("flyGuy",param1,param2,param3,param4);
         m_width = 40;
         m_height = 40;
         this.m_action = 0;
         this.m_arcTimer = new FrameTimer(60);
         if(STAGEDATA.ItemsRef.getItemByLinkage("fooditem",true) && STAGEDATA.ItemsRef.ItemsList.length > 0 && STAGEDATA.ItemsRef.Frequency > 0 && !ModeFeatures.hasFeature(ModeFeatures.FORCE_NO_ITEM_AUTO_SPAWN,STAGEDATA.GameRef.GameMode))
         {
            this.m_foodItem = STAGEDATA.ItemsRef.generateItemObj(STAGEDATA.ItemsRef.getItemByLinkage("fooditem",true),m_sprite.x,m_sprite.y);
            this.m_foodItem.setGravity(0);
         }
         m_xSpeed = this.SPEED;
         m_ySpeed = 0;
         this.m_damage = 0;
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            m_ySpeed = Utils.calculateYSpeed(this.HEIGHT,360 * this.m_arcTimer.CurrentTime / this.m_arcTimer.MaxTime);
            this.m_arcTimer.tick();
            if(this.m_arcTimer.IsComplete)
            {
               this.m_arcTimer.reset();
            }
         }
         else if(this.m_action == 1)
         {
            if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
            {
               playFrame("idle");
               if(m_facingForward)
               {
                  m_faceLeft();
               }
               else
               {
                  m_faceRight();
               }
               m_xSpeed = -this.SPEED;
               this.m_arcTimer.reset();
               this.m_action = 0;
            }
         }
         else if(this.m_action == 2)
         {
         }
      }
      
      private function turn() : void
      {
         m_xSpeed = 0;
         m_ySpeed = 0;
         playFrame("turn");
         this.m_action = 1;
      }
      
      override protected function move() : void
      {
         m_attemptToMove(m_xSpeed,0);
         if(m_hitPlatform != null && m_xSpeed > 0 && this.m_action == 0)
         {
            this.turn();
         }
         m_attemptToMove(0,m_ySpeed);
         if(this.m_foodItem)
         {
            if(this.m_foodItem.Dead)
            {
               this.m_foodItem = null;
            }
            else
            {
               this.m_foodItem.X = m_sprite.x + 4;
               this.m_foodItem.Y = m_sprite.y + 9;
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(param1.BypassEnemies || attackIDArrayContains(param1.AttackID))
         {
            return false;
         }
         stackAttackID(param1.AttackID);
         if(this.m_foodItem)
         {
            this.m_foodItem.setGravity(1);
            this.m_foodItem = null;
         }
         this.m_damage = this.m_damage + Utils.calculateChargeDamage(param1);
         if(param1.EffectSound)
         {
            STAGEDATA.playSpecificSound(param1.EffectSound);
         }
         if(param1.EffectID != null && param1.EffectID != null)
         {
            attachHurtEffect(param1.EffectID,param2);
         }
         if(this.m_damage < 11 && m_xSpeed > 0)
         {
            this.turn();
         }
         else if(this.m_damage >= 11 && this.m_action != 2)
         {
            playFrame("die");
            m_xSpeed = !!param1.IsForward?Number(7):Number(-7);
            m_ySpeed = -12;
            this.m_action = 2;
         }
         return true;
      }
      
      override protected function m_groundCollisionTest() : void
      {
         var _loc1_:Boolean = m_collision.ground;
         super.m_groundCollisionTest();
         if(!_loc1_ && m_collision.ground)
         {
            unnattachFromGround();
            this.m_arcTimer.CurrentTime = this.m_arcTimer.MaxTime * 0.75;
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
               checkDeath();
            }
         }
      }
   }
}
