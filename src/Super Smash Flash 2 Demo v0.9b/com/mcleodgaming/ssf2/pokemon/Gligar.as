package com.mcleodgaming.ssf2.pokemon
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class Gligar extends Pokemon
   {
       
      
      private var m_action:uint;
      
      private var m_walkTimer:FrameTimer;
      
      private var m_target:Target;
      
      private var m_dashCount:Number;
      
      private var m_targetX:Number;
      
      private var m_targetY:Number;
      
      private var m_toggle:Boolean;
      
      public function Gligar(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("gligar",param1,param2,param3,param4);
         m_gravity = 0;
         m_max_ySpeed = 0;
         this.m_action = 0;
         this.m_walkTimer = new FrameTimer(19);
         m_width = 35;
         m_height = 35;
         this.m_target = new Target();
         this.m_dashCount = 0;
         this.m_targetX = 0;
         this.m_targetY = 0;
         this.m_toggle = false;
         m_attack.Frame = "furycutter";
         m_attackData.importAttacks(Main.getEnemyAttackData("gligar_stats"));
         STAGEDATA.playSpecificVoice("gligar_enter");
      }
      
      private function runAI() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:AttackDamage = null;
         if(this.m_action == 0)
         {
            playFrame("idle");
            this.m_walkTimer.tick();
            if(this.m_walkTimer.IsComplete)
            {
               m_attack.IsAttacking = true;
               this.m_action = 1;
               this.m_target = getNearestTarget();
            }
         }
         else if(this.m_action == 1)
         {
            playFrame("furycutter");
            this.m_action = 2;
            STAGEDATA.playSpecificSound("gligar_dash");
         }
         else if(this.m_action == 2)
         {
            if(this.m_target == null || m_player_id <= 0 || this.m_target.PlayerSprite != null && this.m_target.PlayerSprite.Dead)
            {
               destroy();
            }
            else
            {
               this.m_dashCount++;
               _loc1_ = this.m_target.CurrentTarget.X - m_sprite.x;
               _loc2_ = this.m_target.CurrentTarget.Y - m_sprite.y;
               _loc1_ = _loc1_ * 2;
               _loc2_ = _loc2_ * 2;
               if(_loc1_ < 0)
               {
                  m_attack.IsForward = false;
                  m_faceLeft();
               }
               else
               {
                  m_attack.IsForward = true;
                  m_faceRight();
               }
               this.m_targetX = m_sprite.x + _loc1_;
               this.m_targetY = m_sprite.y + _loc2_;
               this.m_action = 3;
            }
         }
         else if(this.m_action == 3)
         {
            if(this.m_target == null || m_player_id <= 0)
            {
               destroy();
            }
            else
            {
               _loc3_ = this.m_targetX - m_sprite.x;
               _loc4_ = this.m_targetY - m_sprite.y;
               m_xSpeed = _loc3_ / 6;
               m_ySpeed = _loc4_ / 6;
               if(Utils.fastAbs(_loc3_) < 10 && Utils.fastAbs(_loc4_) < 10)
               {
                  m_xSpeed = 0;
                  m_ySpeed = 0;
                  this.m_walkTimer.reset();
                  this.m_walkTimer.MaxTime = 15;
                  this.m_action = 4;
               }
               else if(Utils.fastAbs(_loc3_) < 30 && Utils.fastAbs(_loc4_) < 30)
               {
                  this.m_toggle = !this.m_toggle;
                  m_sprite.alpha = !!this.m_toggle?Number(0.75):Number(0.35);
               }
            }
         }
         else if(this.m_action == 4)
         {
            if(this.m_target == null || m_player_id <= 0)
            {
               destroy();
            }
            else
            {
               this.m_walkTimer.tick();
               this.m_toggle = !this.m_toggle;
               m_sprite.alpha = !!this.m_toggle?Number(0.75):Number(0.35);
               if(this.m_walkTimer.CurrentTime == 10)
               {
                  if(m_didDamage)
                  {
                     m_didDamage = false;
                     _loc5_ = m_attackData.getAttackBoxData(m_attack.Frame,"attackBox").syncState(m_attack);
                     m_attackData.getAttack(m_attack.Frame).OverrideMap.setKey("attackBox",{"damage":_loc5_.Damage * 2});
                     if(this.m_dashCount < 6)
                     {
                        if(m_facingForward)
                        {
                           m_faceLeft();
                           m_sprite.x = this.m_target.CurrentTarget.X + 200;
                           m_sprite.y = Utils.random() * (this.m_target.CurrentTarget.Y + 160 - (this.m_target.CurrentTarget.Y - 160)) + (this.m_target.CurrentTarget.X - 160);
                        }
                        else
                        {
                           m_faceRight();
                           m_sprite.x = this.m_target.CurrentTarget.X - 200;
                           m_sprite.y = Utils.random() * (this.m_target.CurrentTarget.Y + 160 - (this.m_target.CurrentTarget.Y - 160)) + (this.m_target.CurrentTarget.X - 160);
                        }
                     }
                     else
                     {
                        destroy();
                     }
                  }
                  else
                  {
                     destroy();
                  }
               }
               else if(this.m_walkTimer.IsComplete)
               {
                  this.m_action = 2;
                  m_sprite.alpha = 1;
                  m_attack.AttackID++;
               }
            }
         }
      }
      
      override protected function move() : void
      {
         applyGroundInfluence();
         m_sprite.x = m_sprite.x + m_xSpeed;
         m_sprite.y = m_sprite.y + m_ySpeed;
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            this.runAI();
            if(!m_dead)
            {
               fadeIn();
               performAttackChecks();
               attackCollisionTest();
               this.move();
               gravity();
            }
         }
      }
   }
}
