package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.items.Item;
   import com.mcleodgaming.ssf2.items.OnionPellet;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class Onion extends Enemy
   {
       
      
      public const RED:String = "Red";
      
      public const BLUE:String = "Blue";
      
      public const YELLOW:String = "Yellow";
      
      public var SLOT:int = 0;
      
      private var Y_SPEED:int = 4;
      
      private var Y_ACCEL:int = 1;
      
      private var m_action:int;
      
      private var m_type:String;
      
      private var m_damage:Number;
      
      private var m_itemCount:int;
      
      private var m_idleTimer:FrameTimer;
      
      private var m_packUpTimer:FrameTimer;
      
      private var m_absorbTimer:FrameTimer;
      
      public function Onion(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         var _loc5_:Array = [this.RED,this.BLUE,this.YELLOW];
         this.m_type = _loc5_[Utils.randomInteger(0,2)];
         super("onion" + this.m_type,param1,param2,param3,param4);
         m_width = 10;
         m_height = 36;
         this.m_action = 0;
         this.m_damage = 0;
         this.m_idleTimer = new FrameTimer(30 * 12);
         this.m_packUpTimer = new FrameTimer(30);
         this.m_absorbTimer = new FrameTimer(30 * 2);
         this.m_itemCount = 0;
         m_gravity = 1;
         m_max_ySpeed = 10;
      }
      
      public function flyAway() : void
      {
         if(this.m_action < 3)
         {
            m_gravity = 0;
            this.m_action = 3;
            playFrame("leave");
         }
      }
      
      private function runAI() : void
      {
         var _loc2_:Item = null;
         var _loc1_:int = 0;
         if(this.m_action == 0)
         {
            if(m_collision.ground)
            {
               this.m_action = 1;
               m_ySpeed = 0;
            }
         }
         else if(this.m_action == 1)
         {
            this.m_action = 2;
         }
         else if(this.m_action == 2)
         {
            this.m_idleTimer.tick();
            if(this.m_idleTimer.IsComplete)
            {
               this.m_idleTimer.reset();
               this.flyAway();
            }
            else
            {
               _loc1_ = 0;
               while(_loc1_ < STAGEDATA.ItemsRef.MAXITEMS)
               {
                  _loc2_ = STAGEDATA.ItemsRef.getItemData(_loc1_);
                  if(_loc2_ != null && !_loc2_.PickedUp && _loc2_ is OnionPellet && Utils.fastAbs(_loc2_.X - m_sprite.x) < 8 && _loc2_.Y < m_sprite.y + 5 && _loc2_.Y > m_sprite.y - m_height)
                  {
                     if(OnionPellet(_loc2_).Level == 1)
                     {
                        this.m_itemCount = 2;
                     }
                     else if(OnionPellet(_loc2_).Level == 2)
                     {
                        this.m_itemCount = 7;
                     }
                     else if(OnionPellet(_loc2_).Level == 3)
                     {
                        this.m_itemCount = 12;
                     }
                     if(OnionPellet(_loc2_).Type == this.m_type)
                     {
                        this.m_itemCount = this.m_itemCount + 3;
                     }
                     _loc2_.destroy();
                     this.m_absorbTimer.reset();
                     this.m_action = 4;
                     break;
                  }
                  _loc1_++;
               }
            }
         }
         else if(this.m_action == 3)
         {
            this.m_packUpTimer.tick();
            if(this.m_packUpTimer.IsComplete)
            {
               if(m_ySpeed > -this.Y_SPEED)
               {
                  m_ySpeed = m_ySpeed - this.Y_ACCEL;
               }
            }
            checkDeath();
         }
         else if(this.m_action == 4)
         {
            this.m_absorbTimer.tick();
            if(this.m_absorbTimer.IsComplete)
            {
               while(this.m_itemCount > 0)
               {
                  this.m_itemCount--;
                  STAGEDATA.ItemsRef.makeItem(m_sprite.x,m_sprite.y - m_sprite.height);
               }
               this.flyAway();
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(param1.BypassEnemies || attackIDArrayContains(param1.AttackID) || this.m_action >= 3)
         {
            return false;
         }
         stackAttackID(param1.AttackID);
         if(param1.EffectSound)
         {
            STAGEDATA.playSpecificSound(param1.EffectSound);
         }
         this.m_damage = this.m_damage + Utils.calculateChargeDamage(param1);
         if(this.m_damage >= 22)
         {
            this.flyAway();
            unnattachFromGround();
         }
         return true;
      }
      
      override protected function move() : void
      {
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
               if(this.m_action != 3)
               {
                  m_groundCollisionTest();
               }
               performAttackChecks();
               attackCollisionTest();
               updateSelfPlatform();
            }
         }
      }
   }
}
