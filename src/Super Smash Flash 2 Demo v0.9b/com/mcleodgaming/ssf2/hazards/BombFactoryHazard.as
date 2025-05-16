package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.BombFactoryBlock;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.Utils;
   import com.mcleodgaming.ssf2.util.Vcam;
   
   public class BombFactoryHazard extends StageHazard
   {
       
      
      private var GRID_WIDTH:int = 17;
      
      private var GRID_HEIGHT:int = 9;
      
      private var m_grid:Array;
      
      public function BombFactoryHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         var _loc5_:int = 0;
         var _loc6_:BombFactoryBlock = null;
         super(param1,param2,param3);
         this.m_grid = new Array();
         STAGEDATA.CamRef.Mode = Vcam.STAGE_MODE;
         var _loc4_:int = 0;
         while(_loc4_ < this.GRID_HEIGHT)
         {
            this.m_grid.push(new Array());
            _loc5_ = 0;
            while(_loc5_ < this.GRID_WIDTH)
            {
               _loc6_ = BombFactoryBlock(STAGEDATA.spawnEnemy(BombFactoryBlock,this.getXCellLoc(_loc5_),this.getYCellLoc(_loc4_)));
               STAGEDATA.StageRef.setChildIndex(_loc6_.MC,0);
               _loc6_.setCell(_loc5_,_loc4_);
               this.m_grid[_loc4_].push(_loc6_);
               _loc5_++;
            }
            _loc4_++;
         }
      }
      
      public function getXCellLoc(param1:int) : Number
      {
         return -29.25 + 42 * param1 - 42 * 2;
      }
      
      public function getYCellLoc(param1:int) : Number
      {
         return -218.5 + 42 * param1;
      }
      
      public function get Grid() : Array
      {
         return this.m_grid;
      }
      
      override protected function runHazard() : void
      {
         var _loc6_:Number = NaN;
         var _loc1_:Vector.<BombFactoryBlock> = new Vector.<BombFactoryBlock>();
         var _loc2_:int = 0;
         var _loc3_:BombFactoryBlock = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < this.GRID_HEIGHT)
         {
            _loc4_ = 0;
            while(_loc4_ < this.GRID_WIDTH)
            {
               if(this.m_grid[_loc5_][_loc4_])
               {
                  _loc3_ = BombFactoryBlock(this.m_grid[_loc5_][_loc4_]);
                  if(_loc3_.isDead())
                  {
                     _loc1_.push(_loc3_);
                  }
                  else if(_loc3_.isBrick())
                  {
                     _loc2_++;
                  }
               }
               _loc4_++;
            }
            _loc5_++;
         }
         if(_loc1_.length > 0)
         {
            _loc3_ = _loc1_[Utils.randomInteger(0,_loc1_.length - 1)];
            _loc6_ = 100 - _loc2_ * 3.5;
            if(_loc6_ < 0 || Utils.random() * 100 >= _loc6_)
            {
               _loc3_.startBomb();
            }
            else
            {
               _loc3_.startBrick();
            }
         }
      }
   }
}
