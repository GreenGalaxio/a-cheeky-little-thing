package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.enemies.Enemy;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.HitBoxCollisionResult;
   import com.mcleodgaming.ssf2.engine.InteractiveSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.items.Item;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   
   public class Bumper1_B extends CNZBumper
   {
       
      
      private var m_xLocation:FrameTimer;
      
      public function Bumper1_B(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         this.m_xLocation = new FrameTimer(30 * 16);
         m_x_start = m_platform.x;
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         m_platform.x = m_x_start + 300 * Math.sin(this.m_xLocation.CurrentTime / this.m_xLocation.MaxTime * (2 * Math.PI));
         this.m_xLocation.tick();
         if(this.m_xLocation.IsComplete)
         {
            this.m_xLocation.reset();
         }
         m_attack.XLoc = m_platform.x;
         m_attack.YLoc = m_platform.y;
         fade();
         this.checkBounce();
         super.move();
      }
      
      override public function extraHitTests(param1:Number, param2:Number, param3:InteractiveSprite = null) : Boolean
      {
         if(m_killed)
         {
            return false;
         }
         if(!(param3 is Character) || !param3)
         {
            return false;
         }
         var _loc4_:Character = param3 as Character;
         var _loc5_:Rectangle = _loc4_.BoundsRect;
         _loc5_.offset(param1,param2);
         var _loc6_:Rectangle = m_hitBoxRect.clone();
         _loc6_.offset(this.X - m_originalLocation.x,this.Y - m_originalLocation.y);
         if(Utils.fastAbs(m_attack.AttackID - _loc4_.PreviousAttackID) > 1 && !_loc4_.IsCaught && _loc6_.intersects(_loc5_))
         {
            if(_loc4_.Y > m_platform.y)
            {
               bouncePlayer(_loc4_,270);
            }
            else if(_loc4_.Y <= m_platform.y && _loc4_.X < m_platform.x)
            {
               bouncePlayer(_loc4_,135);
            }
            else if(_loc4_.Y <= m_platform.y && _loc4_.X >= m_platform.x)
            {
               bouncePlayer(_loc4_,45);
            }
            return true;
         }
         return false;
      }
      
      override protected function checkBounce() : void
      {
         if(m_killed)
         {
            return;
         }
         var _loc1_:Rectangle = m_hitBoxRect.clone();
         _loc1_.offset(this.X - m_originalLocation.x,this.Y - m_originalLocation.y);
         var _loc2_:Vector.<HitBoxCollisionResult> = null;
         var _loc3_:Character = null;
         var _loc4_:Item = null;
         var _loc5_:Enemy = null;
         m_attack.ExecTime++;
         m_attack.RefreshRateTimer++;
         if(m_attack.RefreshRateReady && m_attack.RefreshRateTimer % m_attack.RefreshRate == 0)
         {
            m_attack.AttackID++;
         }
         var _loc6_:Number = 0;
         _loc6_ = 0;
         while(_loc6_ < m_opponents.length)
         {
            _loc3_ = STAGEDATA.getPlayer(m_opponents[_loc6_]);
            if(_loc3_ != null)
            {
               if(Utils.fastAbs(m_attack.AttackID - _loc3_.PreviousAttackID) > 1 && !_loc3_.IsCaught && _loc1_.intersects(_loc3_.BoundsRect))
               {
                  if(_loc3_.Y > m_platform.y)
                  {
                     bouncePlayer(_loc3_,270);
                  }
                  else if(_loc3_.Y <= m_platform.y && _loc3_.X < m_platform.x)
                  {
                     bouncePlayer(_loc3_,135);
                  }
                  else if(_loc3_.Y <= m_platform.y && _loc3_.X >= m_platform.x)
                  {
                     bouncePlayer(_loc3_,45);
                  }
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
                  if(_loc4_.HasHitBox && HasHitBox && _loc1_.intersects(_loc4_.BoundsRect))
                  {
                  }
               }
            }
            _loc6_++;
         }
      }
   }
}
