package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.enemies.Enemy;
   import com.mcleodgaming.ssf2.engine.AttackData;
   import com.mcleodgaming.ssf2.engine.AttackState;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.HitBoxCollisionResult;
   import com.mcleodgaming.ssf2.engine.InteractiveSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.items.Item;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   
   public class CNZBumper extends MovingPlatform
   {
       
      
      protected var m_hitBoxRect:Rectangle;
      
      protected var m_fadeTimer:FrameTimer;
      
      protected var m_justHit:Boolean;
      
      protected var m_opponents:Vector.<Number>;
      
      protected var m_attack:AttackState;
      
      protected var m_attackData:AttackData;
      
      protected var m_killed:Boolean;
      
      public function CNZBumper(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         this.m_opponents = new Vector.<Number>();
         this.m_fadeTimer = new FrameTimer(15);
         this.m_justHit = false;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < STAGEDATA.PlayerList.length)
         {
            this.m_opponents.push(STAGEDATA.PlayerList[_loc3_]);
            _loc3_++;
         }
         this.m_attack = new AttackState(null);
         this.m_attack.Frame = "cnz_bumper";
         this.m_attackData = new AttackData(null);
         this.m_attackData.importAttacks(Main.getEnemyAttackData("cnz_stats"));
         this.m_attack.XLoc = m_platform.x;
         this.m_attack.YLoc = m_platform.y;
         this.m_hitBoxRect = !!this.HasHitBox?MovieClip(m_platform.hitBox).getRect(m_platform.parent):new Rectangle();
         if(!STAGEDATA.HazardsOn)
         {
            this.m_killed = true;
            killPlatform();
            fallthrough = true;
         }
      }
      
      public function get HasMC() : Boolean
      {
         return Boolean(m_platform != null);
      }
      
      public function get HasHitBox() : Boolean
      {
         return Boolean(this.HasMC && m_platform.hitBox != null);
      }
      
      protected function bouncePlayer(param1:Character, param2:Number = 0) : void
      {
         if(this.m_killed)
         {
            return;
         }
         if(this.m_attackData.getAttack(this.m_attack.Frame).OverrideMap.containsKey("attackBox"))
         {
            this.m_attackData.getAttack(this.m_attack.Frame).OverrideMap.getKey("attackBox").direction = param2;
         }
         else
         {
            this.m_attackData.getAttack(this.m_attack.Frame).OverrideMap.setKey("attackBox",{"direction":param2});
         }
         if(param1.takeDamage(this.m_attackData.getAttackBoxData(this.m_attack.Frame,"attackBox").syncState(this.m_attack)))
         {
            this.flash();
            param1.turnOffInvincibility();
         }
      }
      
      override public function extraHitTests(param1:Number, param2:Number, param3:InteractiveSprite = null) : Boolean
      {
         if(this.m_killed)
         {
            return false;
         }
         if(!(param3 is Character))
         {
            return false;
         }
         var _loc4_:Character = param3 as Character;
         var _loc5_:Rectangle = _loc4_.BoundsRect;
         _loc5_.offset(param1,param2);
         var _loc6_:Rectangle = this.m_hitBoxRect.clone();
         _loc6_.offset(this.X - m_originalLocation.x,this.Y - m_originalLocation.y);
         if(Utils.fastAbs(this.m_attack.AttackID - _loc4_.PreviousAttackID) > 1 && !_loc4_.IsCaught && _loc6_.intersects(_loc5_))
         {
            this.bouncePlayer(_loc4_,0);
            return true;
         }
         return false;
      }
      
      protected function checkBounce() : void
      {
         if(this.m_killed)
         {
            return;
         }
         var _loc1_:Rectangle = this.m_hitBoxRect.clone();
         _loc1_.offset(this.X - m_originalLocation.x,this.Y - m_originalLocation.y);
         var _loc2_:Vector.<HitBoxCollisionResult> = null;
         var _loc3_:Character = null;
         var _loc4_:Item = null;
         var _loc5_:Enemy = null;
         this.m_attack.ExecTime++;
         this.m_attack.RefreshRateTimer++;
         if(this.m_attack.RefreshRateReady && this.m_attack.RefreshRateTimer % this.m_attack.RefreshRate == 0)
         {
            this.m_attack.AttackID++;
         }
         var _loc6_:Number = 0;
         _loc6_ = 0;
         while(_loc6_ < this.m_opponents.length)
         {
            _loc3_ = STAGEDATA.getPlayer(this.m_opponents[_loc6_]);
            if(_loc3_ != null)
            {
               if(Utils.fastAbs(this.m_attack.AttackID - _loc3_.PreviousAttackID) > 1 && !_loc3_.IsCaught && _loc1_.intersects(_loc3_.BoundsRect))
               {
                  this.bouncePlayer(_loc3_,0);
               }
            }
            _loc6_++;
         }
         _loc6_ = 0;
         while(_loc6_ < STAGEDATA.Enemies.length)
         {
            _loc5_ = STAGEDATA.Enemies[_loc6_];
            if(_loc5_ != null)
            {
               if(_loc5_.HasHitBox && _loc1_.intersects(_loc5_.BoundsRect))
               {
               }
            }
            _loc6_++;
         }
         _loc6_ = 0;
         while(_loc6_ < STAGEDATA.ItemsRef.MAXITEMS)
         {
            _loc4_ = STAGEDATA.ItemsRef.ItemsInUse[_loc6_];
            if(_loc4_ != null)
            {
               if(_loc4_)
               {
                  if(_loc4_.HasHitBox && this.HasHitBox && _loc1_.intersects(_loc4_.BoundsRect))
                  {
                  }
               }
            }
            _loc6_++;
         }
      }
      
      protected function fade() : void
      {
         if(this.m_justHit)
         {
            this.m_fadeTimer.tick();
            Utils.setBrightness(m_platform,(1 - this.m_fadeTimer.CurrentTime / this.m_fadeTimer.MaxTime) * 100);
            if(this.m_fadeTimer.IsComplete)
            {
               this.m_justHit = false;
            }
         }
      }
      
      protected function flash() : void
      {
         this.m_justHit = true;
         this.m_fadeTimer.reset();
      }
      
      override public function PERFORMALL() : void
      {
         if(!STAGEDATA.Paused && !STAGEDATA.StageEvent && !m_disabled)
         {
            this.fade();
            move();
            this.checkBounce();
         }
      }
   }
}
