package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.QuestionMarkCloud;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.enums.ModeFeatures;
   import com.mcleodgaming.ssf2.platforms.GooniePlatform;
   import com.mcleodgaming.ssf2.util.*;
   import flash.geom.Point;
   
   public class YoshisIslandHazard extends StageHazard
   {
       
      
      private var m_goonieTimer:FrameTimer;
      
      private var m_goonieList:Vector.<GooniePlatform>;
      
      private var m_activeGoonieList:Vector.<GooniePlatform>;
      
      private var m_itemCloudTimer:FrameTimer;
      
      public function YoshisIslandHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_goonieTimer = new FrameTimer(30 * 14);
         this.m_activeGoonieList = new Vector.<GooniePlatform>();
         this.m_goonieList = new Vector.<GooniePlatform>();
         var _loc4_:int = 0;
         while(_loc4_ < STAGEDATA.MovingPlatforms.length)
         {
            if(STAGEDATA.MovingPlatforms[_loc4_] is GooniePlatform)
            {
               this.m_goonieList.push(STAGEDATA.MovingPlatforms[_loc4_]);
            }
            _loc4_++;
         }
         this.m_itemCloudTimer = new FrameTimer(30 * 8);
      }
      
      override protected function runHazard() : void
      {
      }
      
      private function addNextActiveGoonie() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.m_goonieList.length)
         {
            _loc2_ = this.m_activeGoonieList.indexOf(this.m_goonieList[_loc1_]);
            if(!this.m_goonieList[_loc1_].Active && _loc2_ >= 0)
            {
               this.m_activeGoonieList.splice(_loc2_,1);
            }
            _loc1_++;
         }
         if(this.m_activeGoonieList.length < this.m_goonieList.length)
         {
            _loc1_ = 0;
            while(_loc1_ < this.m_goonieList.length)
            {
               if(!this.m_goonieList[_loc1_].Active)
               {
                  this.m_activeGoonieList.push(this.m_goonieList[_loc1_]);
                  this.m_goonieList[_loc1_].activate();
                  break;
               }
               _loc1_++;
            }
         }
      }
      
      override protected function excess() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Point = null;
         this.m_goonieTimer.tick();
         if(this.m_goonieTimer.IsComplete)
         {
            this.addNextActiveGoonie();
            this.m_goonieTimer.reset();
         }
         this.m_itemCloudTimer.tick();
         if(this.m_itemCloudTimer.IsComplete)
         {
            if(STAGEDATA.ItemsRef.ItemsList.length > 0 && STAGEDATA.ItemsRef.Frequency > 0 && !ModeFeatures.hasFeature(ModeFeatures.FORCE_NO_ITEM_AUTO_SPAWN,STAGEDATA.GameRef.GameMode) && !STAGEDATA.hasEnemy(QuestionMarkCloud) && Utils.random() > 0.5)
            {
               _loc1_ = [new Point(-54,29),new Point(525,29)];
               _loc2_ = _loc1_[Utils.randomInteger(0,_loc1_.length - 1)];
               STAGEDATA.spawnEnemy(QuestionMarkCloud,_loc2_.x,_loc2_.y);
            }
            this.m_itemCloudTimer.reset();
         }
      }
   }
}
