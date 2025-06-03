package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.Projectile;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.items.Item;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class Yggdrasil extends Enemy
   {
       
      
      private var m_action:uint;
      
      private var m_target:Target;
      
      private var m_hover:Boolean;
      
      private var m_hoverTimer:FrameTimer;
      
      private var m_idleTimer:FrameTimer;
      
      private var m_attackTimer:FrameTimer;
      
      private var m_targetLoc:Point;
      
      private var m_projectileLoc:Point;
      
      private var m_lanceCount:int;
      
      private var m_rayCount:int;
      
      private var m_lanceDelay:FrameTimer;
      
      private var m_rayDelay:FrameTimer;
      
      private var m_canDeathKnell:Boolean;
      
      private const HOVERSPEED:Number = 2;
      
      public function Yggdrasil(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("yggdrasil",param1,param2,param3,param4);
         m_sprite.parent.setChildIndex(m_sprite,0);
         m_gravity = 0;
         m_max_ySpeed = 16;
         this.m_action = 2;
         m_attackData.importAttacks(Main.getEnemyAttackData("yggrasil_stats"));
         m_attackData.importProjectiles(Main.getEnemyAttackData("yggrasil_projectiles"));
         m_width = 24;
         m_height = 45;
         this.m_target = new Target();
         this.m_idleTimer = new FrameTimer(30 * 26);
         this.m_attackTimer = new FrameTimer(5);
         this.m_hover = false;
         this.m_hoverTimer = new FrameTimer(30 * 3);
         m_projectile = new Vector.<Projectile>();
         m_projectile_max = 20;
         var _loc5_:Number = 0;
         _loc5_ = 0;
         while(_loc5_ < m_projectile_max)
         {
            m_projectile[_loc5_] = null;
            _loc5_++;
         }
         this.m_targetLoc = new Point(236,20);
         this.m_projectileLoc = new Point();
         this.m_lanceCount = 15;
         this.m_rayCount = 15;
         this.m_lanceDelay = new FrameTimer(30 * 6 + 30 * 4);
         this.m_rayDelay = new FrameTimer(30 * 2);
         this.m_canDeathKnell = false;
         buildHitBoxData();
      }
      
      private function runAI() : void
      {
         var _loc2_:int = 0;
         var _loc1_:MovieClip = null;
         if(this.m_action == 0)
         {
            _loc2_ = Utils.randomInteger(1,2);
            if(_loc2_ == 1)
            {
               m_sprite.x = -160;
               m_sprite.y = 20;
            }
            else if(_loc2_ == 2)
            {
               m_sprite.x = 635;
               m_sprite.y = 20;
               m_faceLeft();
            }
            playFrame("move");
            m_sprite.visible = true;
            this.m_action = 1;
         }
         else if(this.m_action == 1)
         {
            if(Utils.getDistance(new Point(m_sprite.x,m_sprite.y),this.m_targetLoc) > 5)
            {
               m_xSpeed = !!m_facingForward?Number(3):Number(-3);
            }
            else
            {
               this.m_hover = true;
               this.m_hoverTimer.reset();
               this.m_idleTimer.reset();
               this.m_action = 2;
               m_xSpeed = 0;
               playFrame("stand");
            }
         }
         else if(this.m_action == 2)
         {
            this.m_idleTimer.tick();
            if(this.m_idleTimer.IsComplete && currentFrameIs("stand"))
            {
               this.m_idleTimer.reset();
               this.m_hover = false;
               this.m_action = Utils.randomInteger(3,!!this.m_canDeathKnell?Number(5):Number(4));
               if(this.m_action == 3)
               {
                  playFrame("holylance");
                  this.m_canDeathKnell = true;
                  STAGEDATA.StageBG.gotoAndStop("holylance");
               }
               else if(this.m_action == 4)
               {
                  playFrame("ray");
                  this.m_canDeathKnell = true;
               }
               else if(this.m_action == 5)
               {
                  Attack("deathknell");
               }
            }
            else if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames - 1)
            {
               playFrame("stand");
            }
         }
         else if(this.m_action == 3)
         {
            if(m_sprite.stance.currentLabel == "wait")
            {
               this.m_lanceDelay.tick();
               if(!this.m_lanceDelay.IsComplete && this.m_lanceDelay.CurrentTime > 200 && (this.m_lanceDelay.CurrentTime % 8 == 0 || this.m_lanceDelay.CurrentTime % 8 == 4))
               {
                  this.m_projectileLoc.x = this.m_lanceDelay.CurrentTime % 8 == 0?Number(Utils.randomInteger(-35,40)):Number(Utils.randomInteger(437,512));
                  this.m_projectileLoc.y = STAGEDATA.DeathBounds.y + 10;
                  if(fireProjectile("holylance"))
                  {
                     m_projectile[m_lastProjectile].MC.x = this.m_projectileLoc.x;
                     m_projectile[m_lastProjectile].MC.y = this.m_projectileLoc.y;
                  }
               }
               else if(this.m_lanceDelay.IsComplete)
               {
                  this.m_lanceDelay.reset();
                  stancePlayFrame("continue");
                  this.m_action = 2;
               }
            }
         }
         else if(this.m_action == 4)
         {
            this.m_rayDelay.tick();
            if(this.m_rayDelay.IsComplete)
            {
               this.m_rayDelay.reset();
               STAGEDATA.spawnEnemy(YggrasilRay,0,0);
               playFrame("stand");
               this.m_action = 2;
            }
         }
         else if(this.m_action == 5)
         {
            if(!m_collision.ground)
            {
               m_ySpeed = 12;
            }
            else if(!m_attack.IsAttacking)
            {
               Attack("deathknell");
            }
            else if(m_sprite.stance.currentFrame >= 63)
            {
               m_ySpeed = 0;
               playFrame("stand");
               unnattachFromGround();
               this.m_action = 6;
            }
         }
         else if(this.m_action == 6)
         {
            if(Utils.getDistance(new Point(m_sprite.x,m_sprite.y),this.m_targetLoc) > 5)
            {
               m_ySpeed = -3;
            }
            else
            {
               this.m_hover = false;
               this.m_hoverTimer.reset();
               this.m_idleTimer.reset();
               this.m_action = 2;
               m_ySpeed = 0;
               playFrame("stand");
            }
         }
         else if(this.m_action == 7)
         {
            m_sprite.y = m_sprite.y - 8;
            if(m_sprite.y < STAGEDATA.CamBounds.y - m_height / 2)
            {
               destroy();
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(param1.BypassEnemies || attackIDArrayContains(param1.AttackID))
         {
            return false;
         }
         if(param1.EffectSound)
         {
            STAGEDATA.playSpecificSound(param1.EffectSound);
         }
         if(param1.EffectID != null && param1.EffectID != null)
         {
            attachHurtEffect(param1.EffectID,param2);
         }
         if(this.m_action == 2 && currentFrameIs("stand"))
         {
            if(param1.XLoc > m_sprite.x && !m_facingForward)
            {
               m_faceRight();
            }
            else if(param1.YLoc < m_sprite.x && m_facingForward)
            {
               m_faceLeft();
            }
            m_attack.IsForward = m_facingForward;
            Attack("attack");
            if(param1.Owner is Character)
            {
               Character(param1.Owner).startActionShot(param1.SelfHitStun);
            }
            else if(param1.Owner is Projectile)
            {
               Projectile(param1.Owner).startActionShot(param1.SelfHitStun);
            }
            else if(param1.Owner is Item)
            {
               Item(param1.Owner).startActionShot(param1.SelfHitStun);
            }
            else if(param1.Owner is Enemy)
            {
               Enemy(param1.Owner).startActionShot(param1.SelfHitStun);
            }
         }
         stackAttackID(param1.AttackID);
         return true;
      }
      
      override protected function move() : void
      {
         if(this.m_hover)
         {
            this.m_hoverTimer.tick();
            if(this.m_hoverTimer.IsComplete)
            {
               this.m_hoverTimer.reset();
            }
            m_sprite.y = m_sprite.y + this.HOVERSPEED * Math.sin(360 * (this.m_hoverTimer.CurrentTime / this.m_hoverTimer.MaxTime) * Math.PI / 180);
         }
         m_attemptToMove(m_xSpeed,0);
         m_attemptToMove(0,m_ySpeed);
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
               m_groundCollisionTest();
               performAttackChecks();
               attackCollisionTest();
            }
         }
      }
   }
}
