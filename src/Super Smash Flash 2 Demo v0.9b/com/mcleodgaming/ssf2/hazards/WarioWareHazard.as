package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.enemies.Enemy;
   import com.mcleodgaming.ssf2.enemies.WarioWareBall;
   import com.mcleodgaming.ssf2.enemies.WarioWareCar;
   import com.mcleodgaming.ssf2.enemies.WarioWareFoot;
   import com.mcleodgaming.ssf2.enemies.WarioWareMoveArrow;
   import com.mcleodgaming.ssf2.enemies.WarioWareRope;
   import com.mcleodgaming.ssf2.enemies.WarioWareTree;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.enums.CState;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class WarioWareHazard extends StageHazard
   {
       
      
      private var m_enabled:Boolean;
      
      private var m_action:int;
      
      private var m_nextActionTimer:FrameTimer;
      
      private var m_miniGameStartTimer:FrameTimer;
      
      private var m_miniGameTimer:FrameTimer;
      
      private var m_miniGameEndTimer:FrameTimer;
      
      private var m_miniGameDoubleTimer:FrameTimer;
      
      private var m_currentMiniGame:String;
      
      private var m_lastMiniGame:String;
      
      private var m_doubleMiniGame:Boolean;
      
      private var m_dodgeRight:Boolean;
      
      private var m_winners:Vector.<Character>;
      
      private var m_moveArrows:Vector.<WarioWareMoveArrow>;
      
      private var m_minigameTitles:Vector.<String>;
      
      public function WarioWareHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         STAGEDATA.StageRef.jumpTerrain.fallthrough = true;
         if(Main.DEBUG)
         {
            this.m_nextActionTimer = new FrameTimer(30 * 3);
         }
         else
         {
            this.m_nextActionTimer = new FrameTimer(30 * 30);
         }
         this.m_miniGameStartTimer = new FrameTimer(30 * 0.5);
         this.m_miniGameEndTimer = new FrameTimer(30 * 0.5);
         this.m_miniGameTimer = new FrameTimer(30 * 4);
         this.m_miniGameDoubleTimer = new FrameTimer(30 * 3);
         this.m_action = 0;
         this.m_enabled = param1 >= 0;
         this.m_lastMiniGame = null;
         this.m_currentMiniGame = null;
         this.m_doubleMiniGame = false;
         this.m_dodgeRight = false;
         this.m_winners = new Vector.<Character>();
         this.m_moveArrows = new Vector.<WarioWareMoveArrow>();
         this.m_minigameTitles = new Vector.<String>();
         this.m_minigameTitles.push("dodge");
         this.m_minigameTitles.push("dontmove");
         this.m_minigameTitles.push("lookout");
         this.m_minigameTitles.push("taunt");
         this.m_minigameTitles.push("avoid");
         this.m_minigameTitles.push("jump");
         this.m_minigameTitles.push("shake");
         this.m_minigameTitles.push("move");
      }
      
      public function get Winners() : Vector.<Character>
      {
         return this.m_winners;
      }
      
      override protected function runHazard() : void
      {
         this.m_enabled = true;
      }
      
      private function resetScores() : void
      {
         var _loc2_:Character = null;
         var _loc1_:int = 0;
         while(_loc1_ < STAGEDATA.PlayerList.length)
         {
            _loc2_ = STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc1_]);
            if(_loc2_)
            {
               _loc2_.WWScore = 0;
            }
            _loc1_++;
         }
      }
      
      private function resetWinners() : void
      {
         this.m_winners.splice(0,this.m_winners.length);
      }
      
      private function resetArrows() : void
      {
         this.m_moveArrows.splice(0,this.m_moveArrows.length);
      }
      
      private function fillPlayerWinners() : void
      {
         var _loc2_:Character = null;
         var _loc1_:int = 0;
         while(_loc1_ < STAGEDATA.PlayerList.length)
         {
            _loc2_ = STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc1_]);
            if(_loc2_)
            {
               this.m_winners.push(_loc2_);
            }
            _loc1_++;
         }
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
         this.m_lastMiniGame = this.m_currentMiniGame;
      }
      
      private function turnOnMiniGameTerrain() : void
      {
         STAGEDATA.StageRef.transitionPlat.fallthrough = false;
         STAGEDATA.StageRef.platform1.fallthrough = true;
         STAGEDATA.StageRef.platform2.fallthrough = true;
         STAGEDATA.StageRef.platform3.fallthrough = true;
         STAGEDATA.StageRef.platform4.fallthrough = true;
         STAGEDATA.StageRef.platform5.fallthrough = true;
      }
      
      private function turnOffMiniGameTerrain() : void
      {
         STAGEDATA.StageRef.transitionPlat.fallthrough = true;
         STAGEDATA.StageRef.platform1.fallthrough = false;
         STAGEDATA.StageRef.platform2.fallthrough = false;
         STAGEDATA.StageRef.platform3.fallthrough = false;
         STAGEDATA.StageRef.platform4.fallthrough = false;
         STAGEDATA.StageRef.platform5.fallthrough = false;
      }
      
      override protected function excess() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = 0;
         var _loc3_:String = "";
         var _loc4_:Character = null;
         var _loc5_:Enemy = null;
         var _loc6_:Object = null;
         if(this.m_enabled)
         {
            if(this.m_action == 0)
            {
               this.m_nextActionTimer.tick();
               if(this.m_nextActionTimer.IsComplete)
               {
                  this.resetScores();
                  this.resetWinners();
                  this.m_nextActionTimer.reset();
                  this.getNextMiniGame();
                  STAGEDATA.StageBG.elevator.gotoAndStop("open");
                  if(!this.m_doubleMiniGame)
                  {
                     STAGEDATA.StageBG.mainstage.gotoAndStop("fade");
                  }
                  STAGEDATA.StageBG.face.visible = false;
                  STAGEDATA.StageBG.gotoAndStop(this.m_currentMiniGame);
                  STAGEDATA.StageFG.gotoAndStop("microgame");
                  STAGEDATA.CamRef.gotoAndPlayBG(this.m_currentMiniGame);
                  STAGEDATA.CamRef.setStageFocus(this.m_miniGameStartTimer.MaxTime + this.m_miniGameTimer.MaxTime);
                  this.turnOnMiniGameTerrain();
                  this.m_action = 1;
                  if(this.m_currentMiniGame == "dodge")
                  {
                     this.fillPlayerWinners();
                     this.m_dodgeRight = Utils.random() > 0.5;
                  }
                  else if(this.m_currentMiniGame == "dontmove")
                  {
                     this.fillPlayerWinners();
                  }
                  else if(this.m_currentMiniGame == "lookout")
                  {
                     this.fillPlayerWinners();
                  }
                  else if(this.m_currentMiniGame != "taunt")
                  {
                     if(this.m_currentMiniGame == "avoid")
                     {
                        this.fillPlayerWinners();
                     }
                     else if(this.m_currentMiniGame == "jump")
                     {
                        STAGEDATA.StageRef.jumpTerrain.fallthrough = false;
                        this.fillPlayerWinners();
                     }
                     else if(this.m_currentMiniGame != "shake")
                     {
                        if(this.m_currentMiniGame == "move")
                        {
                           this.fillPlayerWinners();
                        }
                     }
                  }
               }
            }
            else if(this.m_action == 1)
            {
               this.m_miniGameStartTimer.tick();
               if(STAGEDATA.StageFG.currentFrame == 4)
               {
                  STAGEDATA.StageFG.text.gotoAndStop(this.m_currentMiniGame);
               }
               if(this.m_miniGameStartTimer.IsComplete)
               {
                  this.m_miniGameStartTimer.reset();
                  this.m_action = 2;
               }
            }
            else if(this.m_action == 2)
            {
               if(this.m_currentMiniGame == "dodge")
               {
                  if(this.m_miniGameTimer.CurrentTime == 1)
                  {
                     STAGEDATA.StageBG.hazard.gotoAndPlay("start");
                  }
                  if(this.m_miniGameTimer.CurrentTime == 20)
                  {
                     STAGEDATA.StageBG.hazard.gotoAndPlay(!!this.m_dodgeRight?"right":"left");
                  }
                  if(this.m_miniGameTimer.CurrentTime == 43)
                  {
                     STAGEDATA.StageBG.hazard.gotoAndPlay("gone");
                  }
                  if(this.m_miniGameTimer.CurrentTime == 60)
                  {
                     if(this.m_dodgeRight)
                     {
                        _loc5_ = STAGEDATA.spawnEnemy(WarioWareCar,740,Utils.randomInteger(47,185));
                        _loc5_.faceLeft();
                     }
                     else
                     {
                        _loc5_ = STAGEDATA.spawnEnemy(WarioWareCar,-415,Utils.randomInteger(47,185));
                        _loc5_.faceRight();
                     }
                  }
               }
               else if(this.m_currentMiniGame == "dontmove")
               {
                  if(this.m_miniGameTimer.CurrentTime > this.m_miniGameTimer.MaxTime - 30 * 2)
                  {
                     _loc1_ = 0;
                     while(_loc1_ < this.m_winners.length)
                     {
                        _loc6_ = this.m_winners[_loc1_].getControls();
                        if(_loc6_.UP || _loc6_.DOWN || _loc6_.LEFT || _loc6_.RIGHT)
                        {
                           this.m_winners.splice(_loc1_--,1);
                        }
                        _loc1_++;
                     }
                  }
               }
               else if(this.m_currentMiniGame == "lookout")
               {
                  if(this.m_miniGameTimer.CurrentTime == 0)
                  {
                     _loc5_ = STAGEDATA.spawnEnemy(WarioWareFoot,229,188);
                  }
                  if(this.m_miniGameTimer.CurrentTime == 68)
                  {
                     STAGEDATA.StageBG.gotoAndStop("lookoutshake");
                  }
               }
               else if(this.m_currentMiniGame == "taunt")
               {
                  _loc1_ = 0;
                  while(_loc1_ < STAGEDATA.PlayerList.length)
                  {
                     _loc4_ = STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc1_]);
                     if(_loc4_ && this.m_winners.indexOf(_loc4_) < 0 && _loc4_.inState(CState.TAUNT))
                     {
                        this.m_winners.push(_loc4_);
                     }
                     _loc1_++;
                  }
               }
               else if(this.m_currentMiniGame == "avoid")
               {
                  if(this.m_miniGameTimer.CurrentTime == 0)
                  {
                     _loc5_ = STAGEDATA.spawnEnemy(WarioWareBall,Utils.random() > 0.5?Number(-373):Number(858),Utils.randomInteger(-217,175));
                     _loc5_ = STAGEDATA.spawnEnemy(WarioWareBall,Utils.random() > 0.5?Number(-373):Number(858),Utils.randomInteger(-217,175));
                     _loc5_ = STAGEDATA.spawnEnemy(WarioWareBall,Utils.random() > 0.5?Number(-373):Number(858),Utils.randomInteger(-217,175));
                     _loc5_ = STAGEDATA.spawnEnemy(WarioWareBall,Utils.random() > 0.5?Number(-373):Number(858),Utils.randomInteger(-217,175));
                     STAGEDATA.setCamStageFocus(30 * 4);
                  }
               }
               else if(this.m_currentMiniGame == "jump")
               {
                  if(this.m_miniGameTimer.CurrentTime == 0)
                  {
                     _loc5_ = STAGEDATA.spawnEnemy(WarioWareRope,235,190);
                  }
                  if(this.m_miniGameTimer.CurrentTime + 1 >= this.m_miniGameTimer.MaxTime)
                  {
                     STAGEDATA.StageRef.jumpTerrain.fallthrough = true;
                  }
               }
               else if(this.m_currentMiniGame == "shake")
               {
                  if(this.m_miniGameTimer.CurrentTime == 0)
                  {
                     _loc5_ = STAGEDATA.spawnEnemy(WarioWareTree,235,190);
                  }
                  _loc1_ = 0;
                  while(_loc1_ < STAGEDATA.PlayerList.length)
                  {
                     _loc4_ = STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc1_]);
                     if(_loc4_.WWScore > 0 && this.m_winners.indexOf(_loc4_) < 0)
                     {
                        this.m_winners.push(_loc4_);
                     }
                     _loc1_++;
                  }
                  if(this.m_miniGameTimer.CurrentTime + 1 >= this.m_miniGameTimer.MaxTime)
                  {
                     if(this.m_winners.length > 0)
                     {
                        _loc2_ = 0;
                        _loc1_ = 0;
                        while(_loc1_ < this.m_winners.length)
                        {
                           if(this.m_winners[_loc1_].WWScore > _loc2_)
                           {
                              _loc2_ = this.m_winners[_loc1_].WWScore;
                           }
                           _loc1_++;
                        }
                        _loc1_ = 0;
                        while(_loc1_ < this.m_winners.length)
                        {
                           if(this.m_winners[_loc1_].WWScore < _loc2_)
                           {
                              this.m_winners.splice(_loc1_--,1);
                           }
                           _loc1_++;
                        }
                     }
                  }
               }
               else if(this.m_currentMiniGame == "move")
               {
                  if(this.m_miniGameTimer.CurrentTime == 0)
                  {
                     _loc1_ = 0;
                     while(_loc1_ < 6)
                     {
                        this.m_moveArrows.push(WarioWareMoveArrow(STAGEDATA.spawnEnemy(WarioWareMoveArrow,90 + _loc1_ * 40,120 + Utils.randomInteger(-40,40))));
                        _loc1_++;
                     }
                  }
                  else
                  {
                     _loc1_ = 0;
                     while(_loc1_ < this.m_winners.length)
                     {
                        if(this.m_winners[_loc1_].WWScore < this.m_moveArrows.length)
                        {
                           _loc6_ = this.m_winners[_loc1_].getControls();
                           if(_loc6_.UP && !_loc6_.DOWN && !_loc6_.LEFT && !_loc6_.RIGHT || !_loc6_.UP && _loc6_.DOWN && !_loc6_.LEFT && !_loc6_.RIGHT || !_loc6_.UP && !_loc6_.DOWN && _loc6_.LEFT && !_loc6_.RIGHT || !_loc6_.UP && !_loc6_.DOWN && !_loc6_.LEFT && _loc6_.RIGHT)
                           {
                              if(_loc6_.UP && this.m_moveArrows[this.m_winners[_loc1_].WWScore].DirectionID == WarioWareMoveArrow.UP && this.m_winners[_loc1_].WWUpLetGo || _loc6_.DOWN && this.m_moveArrows[this.m_winners[_loc1_].WWScore].DirectionID == WarioWareMoveArrow.DOWN && this.m_winners[_loc1_].WWDownLetGo || _loc6_.LEFT && this.m_moveArrows[this.m_winners[_loc1_].WWScore].DirectionID == WarioWareMoveArrow.LEFT && this.m_winners[_loc1_].WWLeftLetGo || _loc6_.RIGHT && this.m_moveArrows[this.m_winners[_loc1_].WWScore].DirectionID == WarioWareMoveArrow.RIGHT && this.m_winners[_loc1_].WWRightLetGo)
                              {
                                 Utils.setColorFilter(this.m_moveArrows[this.m_winners[_loc1_].WWScore].MC,{
                                    "hue":-59,
                                    "saturation":34,
                                    "brightness":0,
                                    "contrast":25
                                 });
                                 if(_loc6_.UP)
                                 {
                                    this.m_winners[_loc1_].WWUpLetGo = false;
                                 }
                                 if(_loc6_.DOWN)
                                 {
                                    this.m_winners[_loc1_].WWDownLetGo = false;
                                 }
                                 if(_loc6_.LEFT)
                                 {
                                    this.m_winners[_loc1_].WWLeftLetGo = false;
                                 }
                                 if(_loc6_.RIGHT)
                                 {
                                    this.m_winners[_loc1_].WWRightLetGo = false;
                                 }
                                 this.m_winners[_loc1_].WWScore++;
                              }
                           }
                        }
                        _loc1_++;
                     }
                  }
                  if(this.m_miniGameTimer.CurrentTime + 1 >= this.m_miniGameTimer.MaxTime)
                  {
                     _loc1_ = 0;
                     while(_loc1_ < this.m_winners.length)
                     {
                        if(this.m_winners[_loc1_].WWScore < this.m_moveArrows.length)
                        {
                           this.m_winners.splice(_loc1_--,1);
                        }
                        _loc1_++;
                     }
                     this.resetArrows();
                  }
               }
               this.m_miniGameTimer.tick();
               if(this.m_miniGameTimer.IsComplete)
               {
                  this.m_miniGameTimer.reset();
                  _loc1_ = 0;
                  while(_loc1_ < this.m_winners.length)
                  {
                     if(this.m_winners[_loc1_].StandBy || this.m_winners[_loc1_].Dead || this.m_winners[_loc1_].inState(CState.STAR_KO) || this.m_winners[_loc1_].inState(CState.SCREEN_KO) || this.m_winners[_loc1_].inState(CState.REVIVAL))
                     {
                        this.m_winners.splice(_loc1_--,1);
                     }
                     _loc1_++;
                  }
                  _loc3_ = "microgame winners: { ";
                  _loc1_ = 0;
                  while(_loc1_ < this.m_winners.length)
                  {
                     _loc3_ = _loc3_ + (this.m_winners[_loc1_].ID + ", ");
                     _loc1_++;
                  }
                  if(this.m_winners.length > 0)
                  {
                     _loc3_ = _loc3_.substr(0,_loc3_.length - 2);
                  }
                  _loc3_ = _loc3_ + " }";
                  trace(_loc3_);
                  if(!this.m_doubleMiniGame && Utils.random() < 0.1)
                  {
                     this.m_doubleMiniGame = true;
                     this.m_action = 4;
                     STAGEDATA.StageBG.elevator.gotoAndStop("close");
                  }
                  else
                  {
                     this.m_doubleMiniGame = false;
                     this.m_action = 3;
                     STAGEDATA.StageBG.mainstage.gotoAndStop("fadeIn");
                     STAGEDATA.StageBG.elevator.gotoAndStop(this.m_winners.length > 0?"closeWin":"close");
                  }
                  _loc1_ = 0;
                  while(_loc1_ < this.m_winners.length)
                  {
                     _loc4_ = this.m_winners[_loc1_];
                     if(_loc4_)
                     {
                        _loc4_.warioWareEffect(true,!this.m_doubleMiniGame);
                     }
                     _loc1_++;
                  }
                  _loc1_ = 0;
                  while(_loc1_ < STAGEDATA.PlayerList.length)
                  {
                     _loc4_ = STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc1_]);
                     if(_loc4_ && this.m_winners.indexOf(_loc4_) < 0 && !_loc4_.inState(CState.DEAD) && !_loc4_.StandBy && !_loc4_.inState(CState.STAR_KO) && !_loc4_.inState(CState.SCREEN_KO) && !_loc4_.inState(CState.REVIVAL))
                     {
                        if(_loc4_)
                        {
                           _loc4_.warioWareEffect(false,!this.m_doubleMiniGame);
                        }
                     }
                     _loc1_++;
                  }
               }
            }
            else if(this.m_action == 3)
            {
               this.m_miniGameEndTimer.tick();
               if(this.m_miniGameEndTimer.IsComplete)
               {
                  this.m_miniGameEndTimer.reset();
                  this.m_action = 0;
                  STAGEDATA.StageBG.face.gotoAndPlay(this.m_winners.length > 0?"win":"lose");
                  STAGEDATA.StageBG.face.visible = true;
                  STAGEDATA.StageFG.gotoAndStop("loop");
                  STAGEDATA.CamRef.gotoAndPlayBG("normal");
                  this.turnOffMiniGameTerrain();
               }
            }
            else if(this.m_action == 4)
            {
               this.m_miniGameDoubleTimer.tick();
               if(this.m_miniGameDoubleTimer.IsComplete)
               {
                  this.m_miniGameDoubleTimer.reset();
                  this.m_action = 0;
                  this.m_nextActionTimer.finish();
               }
            }
         }
      }
   }
}
