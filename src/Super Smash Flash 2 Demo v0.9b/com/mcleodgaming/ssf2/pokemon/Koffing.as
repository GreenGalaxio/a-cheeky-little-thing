package com.mcleodgaming.ssf2.pokemon
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.Projectile;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class Koffing extends Pokemon
   {
       
      
      private var m_action:uint;
      
      private var m_attackTimer:FrameTimer;
      
      private var m_floatTimer:FrameTimer;
      
      private var m_smokeCount:Number;
      
      public function Koffing(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("koffing",param1,param2,param3,param4);
         m_gravity = 0;
         m_max_ySpeed = 0;
         m_projectile = new Vector.<Projectile>();
         m_projectile_max = 60;
         var _loc5_:Number = 0;
         _loc5_ = 0;
         while(_loc5_ < m_projectile_max)
         {
            m_projectile[_loc5_] = null;
            _loc5_++;
         }
         this.m_attackTimer = new FrameTimer(30);
         this.m_floatTimer = new FrameTimer(60);
         this.m_action = 0;
         m_width = 30;
         m_height = 30;
         this.m_smokeCount = 0;
         m_attackData.importProjectiles(Main.getEnemyAttackData("koffing_projectiles"));
      }
      
      private function runAI() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this.m_action == 0)
         {
            playFrame("idle");
            this.m_attackTimer.tick();
            if(this.m_attackTimer.CurrentTime == 5)
            {
               STAGEDATA.SoundQueueRef.playVoiceEffect("koffing_appear");
            }
            else if(this.m_attackTimer.IsComplete)
            {
               this.m_attackTimer.reset();
               this.m_attackTimer.MaxTime = 90;
               this.m_action = 1;
            }
         }
         else if(this.m_action == 1)
         {
            playFrame("inhale");
            this.m_attackTimer.tick();
            if(this.m_attackTimer.IsComplete)
            {
               this.m_action = 2;
               this.m_attackTimer.reset();
               this.m_attackTimer.MaxTime = 30;
            }
         }
         else if(this.m_action == 2)
         {
            playFrame("shake");
            this.m_attackTimer.tick();
            if(this.m_attackTimer.IsComplete)
            {
               this.m_action = 3;
               this.m_attackTimer.reset();
               this.m_attackTimer.MaxTime = 60;
               STAGEDATA.playSpecificSound("koffing_smokescreen");
            }
         }
         else if(this.m_action == 3)
         {
            playFrame("exhale");
            this.m_attackTimer.tick();
            if(this.m_smokeCount < 60)
            {
               this.m_smokeCount++;
               if(fireProjectile("smokecloud"))
               {
                  m_projectile[m_lastProjectile].X = m_x_start + Utils.random() * 200 - 100;
                  m_projectile[m_lastProjectile].Y = m_y_start - Utils.random() * 150;
                  _loc1_ = m_projectile[m_lastProjectile].OverlayX;
                  _loc2_ = m_projectile[m_lastProjectile].OverlayY;
                  m_projectile[m_lastProjectile].MC.parent.removeChild(m_projectile[m_lastProjectile].MC);
                  STAGEPARENT.addChild(m_projectile[m_lastProjectile].MC);
                  m_projectile[m_lastProjectile].X = _loc1_;
                  m_projectile[m_lastProjectile].Y = _loc2_;
                  m_projectile[m_lastProjectile].BypassCollisionTesting = true;
               }
            }
            if(this.m_attackTimer.IsComplete)
            {
               this.m_action = 4;
               m_sprite.visible = false;
               this.m_attackTimer.reset();
               this.m_attackTimer.MaxTime = 241;
            }
         }
         else if(this.m_action == 4)
         {
            this.m_attackTimer.tick();
            if(this.m_attackTimer.IsComplete)
            {
               destroyAllProjectiles();
               destroy();
            }
         }
      }
      
      private function float() : void
      {
         this.m_floatTimer.tick();
         m_ySpeed = -1 * Math.cos(Utils.toRadians(this.m_floatTimer.CurrentTime / this.m_floatTimer.MaxTime * 360));
         if(this.m_floatTimer.IsComplete)
         {
            this.m_floatTimer.reset();
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
               this.float();
               fadeIn();
               this.move();
            }
         }
      }
   }
}
