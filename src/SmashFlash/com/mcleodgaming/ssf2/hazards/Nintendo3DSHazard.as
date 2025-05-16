package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.enemies.BitTripBit;
   import com.mcleodgaming.ssf2.enemies.NDSTetrisBlock;
   import com.mcleodgaming.ssf2.engine.AttackData;
   import com.mcleodgaming.ssf2.engine.AttackState;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.enums.CState;
   import com.mcleodgaming.ssf2.platforms.MuddTerrain;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   
   public class Nintendo3DSHazard extends StageHazard
   {
       
      
      private var m_enabled:Boolean;
      
      private var m_action:int;
      
      private var m_nextActionTimer:FrameTimer;
      
      private var m_miniGameStartTimer:FrameTimer;
      
      private var m_newGameTimer:FrameTimer;
      
      private var m_miniGameTimer:FrameTimer;
      
      private var m_miniGameEndTimer:FrameTimer;
      
      private var m_currentMiniGame:String;
      
      private var m_lastMiniGame:String;
      
      private var m_attackData:AttackData;
      
      private var m_tetrisPieces:Vector.<int>;
      
      private var m_tetrisStartIndex:Array;
      
      private var m_tetrisTimer:FrameTimer;
      
      private var m_vTimer:FrameTimer;
      
      private var m_vWind:AttackState;
      
      private var m_muddTimer:FrameTimer;
      
      private var m_currentMudd:int;
      
      private var m_touchScreen:MovieClip;
      
      private var m_topScreen:MovieClip;
      
      private var m_hazardMC:MovieClip;
      
      private var m_minigameTitles:Vector.<String>;
      
      public function Nintendo3DSHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         var _loc4_:Array = ["blue","black","red"];
         var _loc5_:String = _loc4_[Utils.randomInteger(0,_loc4_.length - 1)];
         STAGEDATA.StageFG.gotoAndStop(_loc5_);
         STAGEDATA.StageBG.gotoAndStop(_loc5_);
         this.m_touchScreen = STAGEDATA.StageBG.touchScreen;
         this.m_topScreen = STAGEDATA.StageBG.topScreen;
         this.m_hazardMC = STAGEDATA.StageFG.hazardMC;
         this.m_nextActionTimer = new FrameTimer(30 * 10);
         this.m_miniGameStartTimer = new FrameTimer(30 * 1);
         this.m_newGameTimer = new FrameTimer(4);
         this.m_miniGameTimer = new FrameTimer(30 * 25);
         this.m_miniGameEndTimer = new FrameTimer(30 * 8);
         this.m_action = 0;
         this.m_enabled = param1 >= 0;
         this.m_lastMiniGame = null;
         this.m_currentMiniGame = null;
         this.m_tetrisPieces = new Vector.<int>();
         this.m_tetrisStartIndex = [0,5,7,0,5,2,8,5,1,4];
         this.m_tetrisTimer = new FrameTimer(30 * 2);
         this.m_vTimer = new FrameTimer(30 * 1);
         this.m_vWind = new AttackState(null);
         this.m_attackData = new AttackData(null);
         this.m_attackData.importAttacks(Main.getEnemyAttackData("n3ds_hazard_stats"));
         this.m_muddTimer = new FrameTimer(Utils.randomInteger(30 * 4,30 * 8));
         this.m_currentMudd = -1;
         this.m_minigameTitles = new Vector.<String>();
         this.m_minigameTitles.push("bittrip");
         this.m_minigameTitles.push("tetris");
         this.m_minigameTitles.push("v");
         this.m_minigameTitles.push("mudd");
      }
      
      public function get CurrentMiniGame() : String
      {
         return this.m_currentMiniGame;
      }
      
      public function get Action() : int
      {
         return this.m_action;
      }
      
      override protected function runHazard() : void
      {
         this.m_enabled = true;
      }
      
      private function getNextMiniGame() : void
      {
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < this.m_minigameTitles.length)
         {
            if(this.m_lastMiniGame != this.m_minigameTitles[_loc2_])
            {
               _loc1_.push(this.m_minigameTitles[_loc2_]);
            }
            _loc2_++;
         }
         this.m_currentMiniGame = _loc1_.length == 0?this.m_minigameTitles[0]:_loc1_[Utils.randomInteger(0,_loc1_.length - 1)];
         if(_loc1_.length > 1 && (STAGEDATA.ItemsRef.CurrentSmashBall || STAGEDATA.ItemsRef.PlayerUsingSmashBall))
         {
            while(this.m_currentMiniGame == "v")
            {
               this.m_currentMiniGame = _loc1_[Utils.randomInteger(0,_loc1_.length - 1)];
            }
         }
         this.m_lastMiniGame = this.m_currentMiniGame;
      }
      
      private function resetGames() : void
      {
         this.m_currentMudd = -1;
         this.m_vTimer.reset();
         this.m_muddTimer.reset();
         this.m_muddTimer.MaxTime = Utils.randomInteger(30 * 4,30 * 8);
         this.m_muddTimer.finish();
      }
      
      private function activateMuddTerrain() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < STAGEDATA.MovingPlatforms.length)
         {
            if(STAGEDATA.MovingPlatforms[_loc1_] is MuddTerrain && STAGEDATA.MovingPlatforms[_loc1_].Container.name == "mudd" + this.m_currentMudd)
            {
               MuddTerrain(STAGEDATA.MovingPlatforms[_loc1_]).activate();
               break;
            }
            _loc1_++;
         }
      }
      
      private function deactivateMuddTerrain() : void
      {
         var _loc1_:int = 0;
         if(this.m_currentMudd > 0)
         {
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.MovingPlatforms.length)
            {
               if(STAGEDATA.MovingPlatforms[_loc1_] is MuddTerrain && STAGEDATA.MovingPlatforms[_loc1_].Container.name == "mudd" + this.m_currentMudd)
               {
                  MuddTerrain(STAGEDATA.MovingPlatforms[_loc1_]).deactivate();
                  break;
               }
               _loc1_++;
            }
         }
      }
      
      private function activateMainPlatform() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < STAGEDATA.Terrains.length)
         {
            if(STAGEDATA.Terrains[_loc1_].Container.name == "mainTerrain")
            {
               STAGEDATA.Terrains[_loc1_].fallthrough = false;
               break;
            }
            _loc1_++;
         }
      }
      
      private function deactivateMainPlatform() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < STAGEDATA.Terrains.length)
         {
            if(STAGEDATA.Terrains[_loc1_].Container.name == "mainTerrain")
            {
               STAGEDATA.Terrains[_loc1_].fallthrough = true;
               break;
            }
            _loc1_++;
         }
      }
      
      override protected function excess() : void
      {
         var _loc3_:NDSTetrisBlock = null;
         var _loc4_:Array = null;
         var _loc1_:Character = null;
         var _loc2_:int = 0;
         if(this.m_enabled)
         {
            if(this.m_action == 0)
            {
               this.m_nextActionTimer.tick();
               if(this.m_nextActionTimer.IsComplete)
               {
                  this.resetGames();
                  this.getNextMiniGame();
                  this.m_action = 1;
                  this.m_touchScreen.gotoAndPlay(this.m_currentMiniGame);
                  trace("Initiated mini game: " + this.m_currentMiniGame);
                  if(this.m_currentMiniGame == "tetris")
                  {
                     this.m_tetrisPieces.splice(0,this.m_tetrisPieces.length);
                     while(this.m_tetrisPieces.length < 10)
                     {
                        this.m_tetrisPieces.push(this.m_tetrisPieces.length + 1);
                     }
                     this.m_tetrisStartIndex = [0,5,7,0,5,2,8,5,1,4];
                  }
               }
            }
            else if(this.m_action == 1)
            {
               this.m_miniGameStartTimer.tick();
               if(this.m_miniGameStartTimer.IsComplete)
               {
                  this.m_topScreen.gotoAndPlay("newGame");
                  this.m_miniGameStartTimer.reset();
                  this.m_action = 2;
                  trace("New game selected");
                  STAGEDATA.CamRef.setStageFocus(this.m_miniGameTimer.MaxTime);
               }
            }
            else if(this.m_action == 2)
            {
               this.m_newGameTimer.tick();
               if(this.m_newGameTimer.IsComplete)
               {
                  this.m_topScreen.gotoAndPlay(this.m_currentMiniGame);
                  Utils.tryToGotoAndPlay(this.m_hazardMC,this.m_currentMiniGame);
                  this.m_newGameTimer.reset();
                  this.m_action = 3;
                  trace("Mini game started");
               }
            }
            else if(this.m_action == 3)
            {
               if(this.m_currentMiniGame == "bittrip")
               {
                  if(this.m_miniGameTimer.CurrentTime == 58)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,-47)).toBit();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 176)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,-123)).toBit();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 207)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,-47)).toByte();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 239)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,4)).toBit();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 296)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,-123)).toBit();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 376)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,-41)).toBit();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 386)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,-123)).toBit();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 416)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,4)).toBit();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 451)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,-47)).toByte();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 496)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,-41)).toBit();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 506)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,-41)).toBit();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 541)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,-123)).toBit();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 586)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,-123)).toBit();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 601)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,4)).toBit();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 616)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,-102)).toBit();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 631)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,-8)).toBit();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 661)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,-41)).toBit();
                  }
                  else if(this.m_miniGameTimer.CurrentTime == 686)
                  {
                     BitTripBit(STAGEDATA.spawnEnemy(BitTripBit,754,-47)).toByte();
                  }
               }
               else if(this.m_currentMiniGame == "tetris")
               {
                  _loc2_ = 0;
                  while(_loc2_ < 5)
                  {
                     if(10 - this.m_tetrisPieces.length + _loc2_ + 1 <= 10)
                     {
                        this.m_topScreen["nextPiece" + (_loc2_ + 1)].visible = true;
                        this.m_topScreen["nextPiece" + (_loc2_ + 1)].gotoAndStop("piece" + (10 - this.m_tetrisPieces.length + _loc2_ + 1));
                     }
                     else
                     {
                        this.m_topScreen["nextPiece" + (_loc2_ + 1)].visible = false;
                     }
                     _loc2_++;
                  }
                  if(this.m_miniGameTimer.CurrentTime >= 30 * 2.5)
                  {
                     this.m_tetrisTimer.tick();
                     if(this.m_tetrisTimer.IsComplete && this.m_tetrisPieces.length > 0)
                     {
                        this.m_tetrisTimer.reset();
                        _loc3_ = NDSTetrisBlock(STAGEDATA.spawnEnemy(NDSTetrisBlock,18.6,STAGEDATA.CamBounds.y));
                        _loc3_.setPieceType(this.m_tetrisPieces[0]);
                        _loc3_.X = _loc3_.X + this.m_tetrisStartIndex[0] * _loc3_.SideLength;
                        this.m_tetrisPieces.splice(0,1);
                        this.m_tetrisStartIndex.splice(0,1);
                     }
                  }
                  if(this.m_miniGameTimer.CurrentTime + 1 >= this.m_miniGameTimer.MaxTime)
                  {
                     _loc2_ = 0;
                     while(_loc2_ < STAGEDATA.Platforms.length)
                     {
                        if(STAGEDATA.Platforms[_loc2_].SpriteOwner && STAGEDATA.Platforms[_loc2_].SpriteOwner is NDSTetrisBlock)
                        {
                           NDSTetrisBlock(STAGEDATA.Platforms[_loc2_].SpriteOwner).deactivate();
                        }
                        _loc2_++;
                     }
                     _loc2_ = 0;
                     while(_loc2_ < STAGEDATA.Terrains.length)
                     {
                        if(STAGEDATA.Terrains[_loc2_].SpriteOwner && STAGEDATA.Terrains[_loc2_].SpriteOwner is NDSTetrisBlock)
                        {
                           NDSTetrisBlock(STAGEDATA.Terrains[_loc2_].SpriteOwner).deactivate();
                        }
                        _loc2_++;
                     }
                  }
               }
               else if(this.m_currentMiniGame == "v")
               {
                  if(this.m_miniGameTimer.CurrentTime + 1 >= this.m_miniGameTimer.MaxTime)
                  {
                     STAGEDATA.DisableCeilingDeath = false;
                     STAGEDATA.DisableFallDeath = false;
                     if(this.m_miniGameTimer.CurrentTime + 1 >= this.m_miniGameTimer.MaxTime)
                     {
                        _loc2_ = 0;
                        while(_loc2_ < STAGEDATA.PlayerList.length)
                        {
                           _loc1_ = STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc2_]);
                           if(_loc1_ && !_loc1_.CollisionObj.ground && (_loc1_.inState(CState.DISABLED) || _loc1_.inState(CState.ATTACKING)))
                           {
                              _loc1_.setState(CState.IDLE);
                           }
                           _loc2_++;
                        }
                        this.m_vTimer.reset();
                        this.m_vTimer.MaxTime = 30 * 1;
                     }
                  }
                  else
                  {
                     this.m_vTimer.tick();
                     if(this.m_vTimer.IsComplete && !(STAGEDATA.DisableFallDeath && this.m_miniGameTimer.CurrentTime >= this.m_miniGameTimer.MaxTime - 30 * 4) || STAGEDATA.DisableCeilingDeath && this.m_miniGameTimer.CurrentTime >= this.m_miniGameTimer.MaxTime - 30 * 4)
                     {
                        this.m_vTimer.reset();
                        this.m_vTimer.MaxTime = Utils.randomInteger(30 * 3,30 * 7);
                        if(STAGEDATA.DisableCeilingDeath)
                        {
                           this.m_topScreen.gotoAndStop("vDown");
                           STAGEDATA.DisableCeilingDeath = false;
                           STAGEDATA.DisableFallDeath = true;
                        }
                        else
                        {
                           this.m_topScreen.gotoAndStop("vUp");
                           STAGEDATA.DisableCeilingDeath = true;
                           STAGEDATA.DisableFallDeath = false;
                        }
                        _loc2_ = 0;
                        while(_loc2_ < STAGEDATA.PlayerList.length)
                        {
                           _loc1_ = STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc2_]);
                           if(_loc1_ && !_loc1_.CollisionObj.ground && (_loc1_.inState(CState.DISABLED) || _loc1_.inState(CState.ATTACKING)))
                           {
                              _loc1_.setState(CState.IDLE);
                           }
                           _loc2_++;
                        }
                     }
                     if(STAGEDATA.DisableCeilingDeath)
                     {
                        _loc2_ = 0;
                        while(_loc2_ < STAGEDATA.PlayerList.length)
                        {
                           _loc1_ = STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc2_]);
                           if(_loc1_)
                           {
                              _loc1_.takeDamage(this.m_attackData.getAttack("VVVVVV_wind").AttackBoxes["attackBox"].syncState(this.m_vWind));
                              this.m_vWind.AttackID++;
                              if(_loc1_.Y < STAGEDATA.CamBounds.y)
                              {
                                 _loc1_.Y = STAGEDATA.CamBounds.y + STAGEDATA.CamBounds.height + _loc1_.Height * _loc1_.CurrentScale.y;
                              }
                           }
                           _loc2_++;
                        }
                        STAGEDATA.DisableCeilingDeath = true;
                     }
                     else if(!STAGEDATA.DisableCeilingDeath)
                     {
                        _loc2_ = 0;
                        while(_loc2_ < STAGEDATA.PlayerList.length)
                        {
                           _loc1_ = STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc2_]);
                           if(_loc1_)
                           {
                              if(_loc1_.Y > STAGEDATA.CamBounds.y + STAGEDATA.CamBounds.height)
                              {
                                 _loc1_.Y = STAGEDATA.CamBounds.y;
                              }
                           }
                           _loc2_++;
                        }
                     }
                  }
               }
               else if(this.m_currentMiniGame == "mudd")
               {
                  if(this.m_miniGameTimer.CurrentTime == 0)
                  {
                     this.deactivateMainPlatform();
                  }
                  this.m_muddTimer.tick();
                  if(this.m_muddTimer.IsComplete)
                  {
                     this.m_muddTimer.reset();
                     this.m_muddTimer.MaxTime = Utils.randomInteger(30 * 4,30 * 8);
                     this.deactivateMuddTerrain();
                     _loc4_ = [1,2,3];
                     _loc2_ = 0;
                     while(_loc2_ < _loc4_.length)
                     {
                        if(this.m_currentMudd == _loc4_[_loc2_])
                        {
                           _loc4_.splice(_loc2_,1);
                           break;
                        }
                        _loc2_++;
                     }
                     this.m_currentMudd = _loc4_[Utils.randomInteger(0,_loc4_.length - 1)];
                     this.m_topScreen.gotoAndStop("mudd" + this.m_currentMudd);
                     this.activateMuddTerrain();
                  }
                  if(this.m_miniGameTimer.CurrentTime + 1 >= this.m_miniGameTimer.MaxTime)
                  {
                     this.activateMainPlatform();
                  }
               }
               this.m_miniGameTimer.tick();
               if(this.m_miniGameTimer.IsComplete)
               {
                  this.deactivateMuddTerrain();
                  this.m_miniGameTimer.reset();
                  this.m_action = 4;
                  this.m_topScreen.gotoAndPlay("home");
                  Utils.tryToGotoAndPlay(this.m_touchScreen,"home");
                  this.m_hazardMC.gotoAndPlay("home");
                  trace("Home screen");
                  STAGEDATA.CamRef.removeStageFocus();
               }
            }
            else if(this.m_action == 4)
            {
               this.m_miniGameEndTimer.tick();
               if(this.m_miniGameEndTimer.IsComplete)
               {
                  this.m_miniGameEndTimer.reset();
                  this.m_action = 0;
                  trace("Complete");
               }
            }
         }
      }
   }
}
