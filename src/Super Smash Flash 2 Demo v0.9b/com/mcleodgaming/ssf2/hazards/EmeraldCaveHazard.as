package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.EmeraldCaveWoodenPanel;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class EmeraldCaveHazard extends StageHazard
   {
       
      
      private var m_fullCover:MovieClip;
      
      private var m_halfCover:MovieClip;
      
      private var m_fullCoverList:Vector.<Character>;
      
      private var m_halfCoverList:Vector.<Character>;
      
      private var m_fullCoverTimer:FrameTimer;
      
      private var m_halfCoverTimer:FrameTimer;
      
      public function EmeraldCaveHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_fullCover = MovieClip(STAGEDATA.StageFG.getChildByName("fullCover"));
         this.m_halfCover = MovieClip(STAGEDATA.StageFG.getChildByName("halfCover"));
         this.m_fullCoverList = new Vector.<Character>();
         this.m_halfCoverList = new Vector.<Character>();
         this.m_fullCoverTimer = new FrameTimer(10);
         this.m_halfCoverTimer = new FrameTimer(10);
         this.m_fullCoverTimer.finish();
         this.m_halfCoverTimer.finish();
         var _loc4_:EmeraldCaveWoodenPanel = null;
         _loc4_ = EmeraldCaveWoodenPanel(STAGEDATA.spawnEnemy(EmeraldCaveWoodenPanel,0,0));
         EmeraldCaveWoodenPanel(_loc4_).setType("ecave_wood_left");
         STAGEDATA.StageRef.setChildIndex(_loc4_.MC,0);
         _loc4_ = EmeraldCaveWoodenPanel(STAGEDATA.spawnEnemy(EmeraldCaveWoodenPanel,0,0));
         EmeraldCaveWoodenPanel(_loc4_).setType("ecave_wood_topleft");
         STAGEDATA.StageRef.setChildIndex(_loc4_.MC,0);
         _loc4_ = EmeraldCaveWoodenPanel(STAGEDATA.spawnEnemy(EmeraldCaveWoodenPanel,0,0));
         EmeraldCaveWoodenPanel(_loc4_).setType("ecave_wood_topright");
         STAGEDATA.StageRef.setChildIndex(_loc4_.MC,0);
         _loc4_ = EmeraldCaveWoodenPanel(STAGEDATA.spawnEnemy(EmeraldCaveWoodenPanel,0,0));
         EmeraldCaveWoodenPanel(_loc4_).setType("ecave_wood_right");
         STAGEDATA.StageRef.setChildIndex(_loc4_.MC,0);
         _loc4_ = EmeraldCaveWoodenPanel(STAGEDATA.spawnEnemy(EmeraldCaveWoodenPanel,0,0));
         EmeraldCaveWoodenPanel(_loc4_).setType("ecave_wood_bottom");
         STAGEDATA.StageRef.setChildIndex(_loc4_.MC,0);
         m_safe = true;
      }
      
      override protected function runHazard() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Character = null;
         var _loc4_:int = 0;
         var _loc5_:Point = null;
         var _loc1_:int = 0;
         while(_loc1_ < STAGEDATA.PlayerList.length)
         {
            _loc2_ = STAGEDATA.PlayerList[_loc1_];
            _loc3_ = STAGEDATA.getPlayer(_loc2_);
            if(_loc3_ != null && !_loc3_.Dead && !_loc3_.StandBy && _loc3_.MC.parent)
            {
               _loc4_ = this.m_fullCoverList.indexOf(_loc3_);
               _loc5_ = _loc3_.MC.parent.localToGlobal(_loc3_.Location);
               if(_loc4_ < 0)
               {
                  if(this.m_fullCover.hitTestPoint(_loc5_.x,_loc5_.y,false))
                  {
                     this.m_fullCoverList.push(_loc3_);
                  }
               }
               else if(!this.m_fullCover.hitTestPoint(_loc5_.x,_loc5_.y,false))
               {
                  this.m_fullCoverList.splice(_loc4_,1);
               }
               _loc4_ = this.m_halfCoverList.indexOf(_loc3_);
               if(_loc4_ < 0)
               {
                  if(this.m_halfCover.hitTestPoint(_loc5_.x,_loc5_.y,false))
                  {
                     this.m_halfCoverList.push(_loc3_);
                  }
               }
               else if(!this.m_halfCover.hitTestPoint(_loc5_.x,_loc5_.y,false))
               {
                  this.m_halfCoverList.splice(_loc4_,1);
               }
            }
            _loc1_++;
         }
         if(this.m_fullCoverList.length <= 0)
         {
            this.m_fullCoverTimer.tick();
         }
         else
         {
            this.m_fullCoverTimer.tick(-1);
         }
         if(this.m_halfCoverList.length <= 0)
         {
            this.m_halfCoverTimer.tick();
         }
         else
         {
            this.m_halfCoverTimer.tick(-1);
         }
         this.m_fullCover.alpha = this.m_fullCoverTimer.CurrentTime / this.m_fullCoverTimer.MaxTime;
         this.m_halfCover.alpha = this.m_halfCoverTimer.CurrentTime / this.m_halfCoverTimer.MaxTime;
      }
   }
}
