package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.hazards.BombFactoryHazard;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class BombFactoryBlock extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_x_cell:int;
      
      private var m_y_cell:int;
      
      private var m_damage:Number;
      
      private var m_shakeToggle:Boolean;
      
      private var m_shakeTimer:FrameTimer;
      
      public function BombFactoryBlock(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("bombfactory_block",param1,param2,param3,param4);
         m_width = 42;
         m_height = 44;
         playFrame("dead");
         this.m_damage = 0;
         this.m_shakeToggle = false;
         this.m_shakeTimer = new FrameTimer(10);
         this.m_shakeTimer.finish();
         this.m_action = 0;
      }
      
      private function makeTerrain() : void
      {
         createSelfPlatform(0,0,42,44);
      }
      
      public function startBrick() : void
      {
         this.m_damage = 0;
         this.m_action = 1;
         playFrame("appear");
         this.makeTerrain();
      }
      
      public function startBomb() : void
      {
         this.m_action = 5;
         playFrame("bomb");
         this.makeTerrain();
      }
      
      public function isDead() : Boolean
      {
         return this.m_action == 0;
      }
      
      public function isBrick() : Boolean
      {
         return this.m_action >= 1 && this.m_action <= 3;
      }
      
      public function isBomb() : Boolean
      {
         return this.m_action >= 4 && this.m_action <= 6;
      }
      
      public function isFree() : Boolean
      {
         return this.m_action == 2;
      }
      
      public function breakBrick() : void
      {
         this.m_action = 3;
         playFrame("break");
         removeSelfPlatform();
      }
      
      public function setCell(param1:int, param2:int) : void
      {
         this.m_x_cell = param1;
         this.m_y_cell = param2;
      }
      
      override protected function attackCollisionTest() : void
      {
      }
      
      public function explode() : void
      {
         var _loc1_:BombFactoryExplosion = null;
         if(this.m_action == 5)
         {
            playFrame("dead");
            _loc1_ = BombFactoryExplosion(STAGEDATA.spawnEnemy(BombFactoryExplosion,BombFactoryHazard(STAGEDATA.getHazard(BombFactoryHazard)).getXCellLoc(this.m_x_cell),BombFactoryHazard(STAGEDATA.getHazard(BombFactoryHazard)).getXCellLoc(this.m_y_cell)));
            _loc1_.setCell(this.m_x_cell,this.m_y_cell);
            this.m_shakeTimer.finish();
            m_sprite.x = m_x_start;
            this.m_action = 6;
            removeSelfPlatform();
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
                  this.m_action = 2;
                  playFrame("idle");
               }
            }
            else if(this.m_action == 2)
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
            else if(this.m_action == 3)
            {
               if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
               {
                  this.m_action = 0;
                  playFrame("dead");
               }
            }
            else if(this.m_action != 4)
            {
               if(this.m_action == 5)
               {
                  if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
                  {
                     this.explode();
                  }
               }
               else if(this.m_action == 6)
               {
                  if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
                  {
                     this.m_action = 0;
                     playFrame("dead");
                  }
               }
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(param1.BypassEnemies || attackIDArrayContains(param1.AttackID) || !m_selfPlatform || this.m_action == 6)
         {
            return false;
         }
         stackAttackID(param1.AttackID);
         if(param1.EffectSound)
         {
            STAGEDATA.playSpecificSound(param1.EffectSound);
         }
         if(param1.EffectID != null && param1.EffectID != null)
         {
            attachHurtEffect(param1.EffectID,param2);
         }
         this.m_shakeTimer.reset();
         if(this.isBrick())
         {
            this.m_damage = this.m_damage + Utils.calculateChargeDamage(param1);
            if(this.m_damage >= 20)
            {
               this.m_shakeTimer.finish();
               m_sprite.x = m_x_start;
               this.m_action = 3;
               playFrame("break");
               removeSelfPlatform();
            }
         }
         else if(this.isBomb())
         {
            this.explode();
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
               this.attackCollisionTest();
               updateSelfPlatform();
            }
         }
      }
   }
}
