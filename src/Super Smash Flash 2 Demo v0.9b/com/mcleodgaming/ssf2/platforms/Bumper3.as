package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.enemies.Enemy;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.InteractiveSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.items.Item;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Bumper3 extends CNZBumper
   {
       
      
      public function Bumper3(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
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
            bouncePlayer(_loc4_,Utils.getAngleBetween(new Point(m_platform.x,m_platform.y),new Point(_loc4_.X,_loc4_.Y)));
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
         var _loc2_:Character = null;
         var _loc3_:Item = null;
         var _loc4_:Enemy = null;
         m_attack.ExecTime++;
         m_attack.RefreshRateTimer++;
         if(m_attack.RefreshRateReady && m_attack.RefreshRateTimer % m_attack.RefreshRate == 0)
         {
            m_attack.AttackID++;
         }
         var _loc5_:Number = 0;
         _loc5_ = 0;
         while(_loc5_ < m_opponents.length)
         {
            _loc2_ = STAGEDATA.getPlayer(m_opponents[_loc5_]);
            if(_loc2_ != null)
            {
               if(Utils.fastAbs(m_attack.AttackID - _loc2_.PreviousAttackID) > 1 && !_loc2_.IsCaught && _loc1_.intersects(_loc2_.BoundsRect))
               {
                  bouncePlayer(_loc2_,Utils.getAngleBetween(new Point(m_platform.x,m_platform.y),new Point(_loc2_.X,_loc2_.Y)));
               }
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < STAGEDATA.Enemies.length)
         {
            _loc4_ = STAGEDATA.Enemies[_loc5_];
            if(_loc4_ != null)
            {
               if(_loc4_.HasHitBox && _loc1_.intersects(_loc4_.BoundsRect))
               {
               }
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < STAGEDATA.ItemsRef.MAXITEMS)
         {
            _loc3_ = STAGEDATA.ItemsRef.ItemsInUse[_loc5_];
            if(_loc3_ != null)
            {
               if(_loc3_)
               {
                  if(_loc3_.HasHitBox && HasHitBox && _loc1_.intersects(_loc3_.BoundsRect))
                  {
                  }
               }
            }
            _loc5_++;
         }
      }
   }
}
