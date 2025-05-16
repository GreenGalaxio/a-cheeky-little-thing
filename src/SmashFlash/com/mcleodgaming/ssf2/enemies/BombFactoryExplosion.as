package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.HitBoxCollisionResult;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.InteractiveSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.enums.CState;
   import com.mcleodgaming.ssf2.hazards.BombFactoryHazard;
   import com.mcleodgaming.ssf2.items.Item;
   
   public class BombFactoryExplosion extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_x_cell:int;
      
      private var m_y_cell:int;
      
      private var m_x_inc:int;
      
      private var m_y_inc:int;
      
      public function BombFactoryExplosion(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("bombFactoryExplosion",param1,param2,param3,param4);
         m_attackData.importAttacks(Main.getEnemyAttackData("bombfactory_stats"));
         Attack("explode");
         this.m_x_cell = 0;
         this.m_y_cell = 0;
         this.m_x_inc = 0;
         this.m_y_inc = 0;
         this.m_action = 0;
      }
      
      public function setCell(param1:int, param2:int) : void
      {
         this.m_x_cell = param1;
         this.m_y_cell = param2;
      }
      
      public function setInc(param1:int, param2:int) : void
      {
         this.m_x_inc = param1;
         this.m_y_inc = param2;
      }
      
      override protected function attackCollisionTest() : void
      {
         if(m_bypassCollisionTesting)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:Character = null;
         var _loc3_:Enemy = null;
         var _loc4_:Item = null;
         var _loc5_:Vector.<HitBoxCollisionResult> = null;
         var _loc6_:Array = null;
         if(!m_dead)
         {
            _loc1_ = 0;
            while(_loc1_ < m_opponents.length)
            {
               _loc2_ = STAGEDATA.getPlayer(m_opponents[_loc1_]);
               if(_loc2_ != null && !(!STAGEDATA.TeamDamage && _loc2_.Team == m_team_id && m_team_id > 0) && !_loc2_.StandBy && !_loc2_.Dead && !_loc2_.IsTeching && !_loc2_.inState(CState.STAR_KO) && !_loc2_.inState(CState.SCREEN_KO) && !_loc2_.inState(CState.REVIVAL))
               {
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.SHIELD,reactionShield);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.ABSORB,reactionAbsorb);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.HIT,reactionHit);
               }
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.ItemsRef.MAXITEMS)
            {
               _loc4_ = STAGEDATA.ItemsRef.getItemData(_loc1_);
               if(_loc4_ != null)
               {
                  InteractiveSprite.hitTest(this,_loc4_,HitBoxSprite.ATTACK,HitBoxSprite.HIT,reactionHit);
               }
               _loc1_++;
            }
         }
      }
      
      private function runAI() : void
      {
         var _loc1_:BombFactoryHazard = null;
         var _loc2_:BombFactoryExplosion = null;
         if(this.m_action == 0)
         {
            if(m_sprite.stance.currentFrame == 4)
            {
               _loc1_ = BombFactoryHazard(STAGEDATA.getHazard(BombFactoryHazard));
               _loc2_ = null;
               if(_loc1_)
               {
                  if(this.m_x_inc != 0 && _loc1_.getXCellLoc(this.m_x_cell + this.m_x_inc) > STAGEDATA.DeathBounds.x && _loc1_.getXCellLoc(this.m_x_cell + this.m_x_inc) < STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width)
                  {
                     _loc2_ = BombFactoryExplosion(STAGEDATA.spawnEnemy(BombFactoryExplosion,_loc1_.getXCellLoc(this.m_x_cell + this.m_x_inc),_loc1_.getYCellLoc(this.m_y_cell)));
                     _loc2_.setCell(this.m_x_cell + this.m_x_inc,this.m_y_cell);
                     _loc2_.setInc(this.m_x_inc,0);
                     if(this.m_x_cell + this.m_x_inc >= 0 && this.m_y_cell >= 0 && this.m_y_cell < _loc1_.Grid.length && this.m_x_cell + this.m_x_inc < _loc1_.Grid[this.m_y_cell].length)
                     {
                        if(BombFactoryBlock(_loc1_.Grid[this.m_y_cell][this.m_x_cell + this.m_x_inc]).isBrick())
                        {
                           BombFactoryBlock(_loc1_.Grid[this.m_y_cell][this.m_x_cell + this.m_x_inc]).breakBrick();
                        }
                        else if(BombFactoryBlock(_loc1_.Grid[this.m_y_cell][this.m_x_cell + this.m_x_inc]).isBomb())
                        {
                           BombFactoryBlock(_loc1_.Grid[this.m_y_cell][this.m_x_cell + this.m_x_inc]).explode();
                        }
                     }
                  }
                  else if(this.m_y_inc != 0 && _loc1_.getYCellLoc(this.m_y_cell + this.m_y_inc) > STAGEDATA.DeathBounds.y && _loc1_.getXCellLoc(this.m_y_cell + this.m_y_inc) < STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.height)
                  {
                     _loc2_ = BombFactoryExplosion(STAGEDATA.spawnEnemy(BombFactoryExplosion,_loc1_.getXCellLoc(this.m_x_cell),_loc1_.getYCellLoc(this.m_y_cell + this.m_y_inc)));
                     _loc2_.setCell(this.m_x_cell,this.m_y_cell + this.m_y_inc);
                     _loc2_.setInc(0,this.m_y_inc);
                     if(this.m_x_cell >= 0 && this.m_y_cell + this.m_y_inc >= 0 && this.m_y_cell + this.m_y_inc < _loc1_.Grid.length && this.m_x_cell < _loc1_.Grid[this.m_y_cell + this.m_y_inc].length)
                     {
                        if(BombFactoryBlock(_loc1_.Grid[this.m_y_cell + this.m_y_inc][this.m_x_cell]).isBrick())
                        {
                           BombFactoryBlock(_loc1_.Grid[this.m_y_cell + this.m_y_inc][this.m_x_cell]).breakBrick();
                        }
                        else if(BombFactoryBlock(_loc1_.Grid[this.m_y_cell + this.m_y_inc][this.m_x_cell]).isBomb())
                        {
                           BombFactoryBlock(_loc1_.Grid[this.m_y_cell + this.m_y_inc][this.m_x_cell]).explode();
                        }
                     }
                  }
                  else if(this.m_x_inc == 0 && this.m_y_inc == 0)
                  {
                     if(_loc1_.getYCellLoc(this.m_y_cell - 1) > STAGEDATA.DeathBounds.y)
                     {
                        _loc2_ = BombFactoryExplosion(STAGEDATA.spawnEnemy(BombFactoryExplosion,_loc1_.getXCellLoc(this.m_x_cell),_loc1_.getYCellLoc(this.m_y_cell - 1)));
                        _loc2_.setCell(this.m_x_cell,this.m_y_cell - 1);
                        _loc2_.setInc(0,-1);
                        if(this.m_x_cell >= 0 && this.m_y_cell - 1 >= 0 && this.m_y_cell - 1 < _loc1_.Grid.length && this.m_x_cell < _loc1_.Grid[this.m_y_cell - 1].length)
                        {
                           if(BombFactoryBlock(_loc1_.Grid[this.m_y_cell - 1][this.m_x_cell]).isBrick())
                           {
                              BombFactoryBlock(_loc1_.Grid[this.m_y_cell - 1][this.m_x_cell]).breakBrick();
                           }
                           else if(BombFactoryBlock(_loc1_.Grid[this.m_y_cell - 1][this.m_x_cell]).isBomb())
                           {
                              BombFactoryBlock(_loc1_.Grid[this.m_y_cell - 1][this.m_x_cell]).explode();
                           }
                        }
                     }
                     if(_loc1_.getYCellLoc(this.m_y_cell + 1) < STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height)
                     {
                        _loc2_ = BombFactoryExplosion(STAGEDATA.spawnEnemy(BombFactoryExplosion,_loc1_.getXCellLoc(this.m_x_cell),_loc1_.getYCellLoc(this.m_y_cell + 1)));
                        _loc2_.setCell(this.m_x_cell,this.m_y_cell + 1);
                        _loc2_.setInc(0,1);
                        if(this.m_x_cell >= 0 && this.m_y_cell + 1 >= 0 && this.m_y_cell + 1 < _loc1_.Grid.length && this.m_x_cell < _loc1_.Grid[this.m_y_cell + 1].length)
                        {
                           if(BombFactoryBlock(_loc1_.Grid[this.m_y_cell + 1][this.m_x_cell]).isBrick())
                           {
                              BombFactoryBlock(_loc1_.Grid[this.m_y_cell + 1][this.m_x_cell]).breakBrick();
                           }
                           else if(BombFactoryBlock(_loc1_.Grid[this.m_y_cell + 1][this.m_x_cell]).isBomb())
                           {
                              BombFactoryBlock(_loc1_.Grid[this.m_y_cell + 1][this.m_x_cell]).explode();
                           }
                        }
                     }
                     if(_loc1_.getXCellLoc(this.m_x_cell - 1) > STAGEDATA.DeathBounds.x)
                     {
                        _loc2_ = BombFactoryExplosion(STAGEDATA.spawnEnemy(BombFactoryExplosion,_loc1_.getXCellLoc(this.m_x_cell - 1),_loc1_.getYCellLoc(this.m_y_cell)));
                        _loc2_.setCell(this.m_x_cell - 1,this.m_y_cell);
                        _loc2_.setInc(-1,0);
                        if(this.m_x_cell - 1 >= 0 && this.m_y_cell >= 0 && this.m_y_cell < _loc1_.Grid.length && this.m_x_cell - 1 < _loc1_.Grid[this.m_y_cell].length)
                        {
                           if(BombFactoryBlock(_loc1_.Grid[this.m_y_cell][this.m_x_cell - 1]).isBrick())
                           {
                              BombFactoryBlock(_loc1_.Grid[this.m_y_cell][this.m_x_cell - 1]).breakBrick();
                           }
                           else if(BombFactoryBlock(_loc1_.Grid[this.m_y_cell][this.m_x_cell - 1]).isBomb())
                           {
                              BombFactoryBlock(_loc1_.Grid[this.m_y_cell][this.m_x_cell - 1]).explode();
                           }
                        }
                     }
                     if(_loc1_.getXCellLoc(this.m_x_cell + 1) < STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width)
                     {
                        _loc2_ = BombFactoryExplosion(STAGEDATA.spawnEnemy(BombFactoryExplosion,_loc1_.getXCellLoc(this.m_x_cell + 1),_loc1_.getYCellLoc(this.m_y_cell)));
                        _loc2_.setCell(this.m_x_cell + 1,this.m_y_cell);
                        _loc2_.setInc(1,0);
                        if(this.m_x_cell + 1 >= 0 && this.m_y_cell >= 0 && this.m_y_cell < _loc1_.Grid.length && this.m_x_cell + 1 < _loc1_.Grid[this.m_y_cell].length)
                        {
                           if(BombFactoryBlock(_loc1_.Grid[this.m_y_cell][this.m_x_cell + 1]).isBrick())
                           {
                              BombFactoryBlock(_loc1_.Grid[this.m_y_cell][this.m_x_cell + 1]).breakBrick();
                           }
                           else if(BombFactoryBlock(_loc1_.Grid[this.m_y_cell][this.m_x_cell + 1]).isBomb())
                           {
                              BombFactoryBlock(_loc1_.Grid[this.m_y_cell][this.m_x_cell + 1]).explode();
                           }
                        }
                     }
                  }
               }
            }
            else if(m_sprite.stance.currentFrame >= m_sprite.stance.totalFrames)
            {
               destroy();
            }
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            checkTimers();
            this.runAI();
            if(!m_dead)
            {
               move();
               gravity();
               performAttackChecks();
               this.attackCollisionTest();
               updateSelfPlatform();
            }
         }
      }
   }
}
