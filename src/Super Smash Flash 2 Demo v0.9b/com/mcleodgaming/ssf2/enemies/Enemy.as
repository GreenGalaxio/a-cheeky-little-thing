package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.AttackData;
   import com.mcleodgaming.ssf2.engine.AttackObject;
   import com.mcleodgaming.ssf2.engine.AttackState;
   import com.mcleodgaming.ssf2.engine.Beacon;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.HitBoxAnimation;
   import com.mcleodgaming.ssf2.engine.HitBoxCollisionResult;
   import com.mcleodgaming.ssf2.engine.HitBoxManager;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.InteractiveSprite;
   import com.mcleodgaming.ssf2.engine.Projectile;
   import com.mcleodgaming.ssf2.engine.ProjectileAttack;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.engine.Target;
   import com.mcleodgaming.ssf2.engine.TargetTestTarget;
   import com.mcleodgaming.ssf2.enums.CState;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.events.SSF2Event;
   import com.mcleodgaming.ssf2.items.Item;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class Enemy extends InteractiveSprite
   {
       
      
      private var m_extraLinkageList:Vector.<String>;
      
      protected var m_linkage_id:String;
      
      protected var m_dead:Boolean;
      
      protected var m_x_start:Number;
      
      protected var m_y_start:Number;
      
      protected var m_projectile:Vector.<Projectile>;
      
      protected var m_projectile_max:int;
      
      protected var m_lastProjectile:int;
      
      protected var m_didDamage:Boolean;
      
      protected var m_didDamageList:Vector.<InteractiveSprite>;
      
      protected var m_opponents:Vector.<int>;
      
      private var m_warningBounds_lower:Array;
      
      private var m_warningBounds_upper:Array;
      
      protected var m_fadeTimer:FrameTimer;
      
      protected var m_beaconTimer:FrameTimer;
      
      protected var m_shortestPath:Vector.<Beacon>;
      
      protected var m_findTimer:FrameTimer;
      
      protected var m_currentTarget:Target;
      
      protected var m_targetTemp:Target;
      
      public function Enemy(param1:String, param2:StageData, param3:Number, param4:Number, param5:int = -1)
      {
         this.m_extraLinkageList = new Vector.<String>();
         this.m_x_start = param3;
         this.m_y_start = param4;
         this.m_linkage_id = param1;
         var _loc6_:MovieClip = Main.getLibraryMC(param1);
         _loc6_.ACTIVE = true;
         super(_loc6_,param2);
         _loc6_.name = "e" + m_uid;
         m_sprite.x = this.m_x_start;
         m_sprite.y = this.m_y_start;
         m_sprite.enemy_id = m_uid;
         this.m_dead = false;
         this.m_projectile = new Vector.<Projectile>();
         this.m_projectile_max = 10;
         var _loc7_:Number = 0;
         _loc7_ = 0;
         while(_loc7_ < this.m_projectile_max)
         {
            this.m_projectile[_loc7_] = null;
            _loc7_++;
         }
         this.m_lastProjectile = 0;
         m_attack = new AttackState(this);
         m_attackData = new AttackData(this);
         this.m_opponents = new Vector.<int>();
         m_player_id = param5;
         if(m_player_id > 0)
         {
            m_team_id = STAGEDATA.getPlayer(m_player_id).Team;
         }
         else
         {
            m_team_id = -1;
         }
         this.getOpponentData();
         this.m_fadeTimer = new FrameTimer(15);
         this.m_beaconTimer = new FrameTimer(150);
         this.m_findTimer = new FrameTimer(5);
         this.m_shortestPath = null;
         this.m_currentTarget = new Target();
         this.m_targetTemp = new Target();
         this.m_didDamage = false;
         this.m_didDamageList = new Vector.<InteractiveSprite>();
         m_actionShot = false;
         m_actionTimer = 0;
         m_lastHitID = 0;
         m_lastAttackID = new Array(15);
         m_lastAttackIndex = 0;
         this.buildHitBoxData();
         if(Main.DEBUG)
         {
            verifiyHitBoxData();
         }
      }
      
      override public function get CurrentAnimation() : HitBoxAnimation
      {
         return m_hitBoxManager == null?null:m_hitBoxManager.HitBoxAnimationList.length <= 0 || !m_sprite.currentLabel?null:m_hitBoxManager.getHitBoxAnimation(this.m_linkage_id + "_" + m_sprite.currentLabel);
      }
      
      protected function buildHitBoxData() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:MovieClip = null;
         if(HitBoxManager.HitBoxManageList[this.m_linkage_id] != null)
         {
            m_hitBoxManager = HitBoxManager.HitBoxManageList[this.m_linkage_id];
         }
         else
         {
            m_hitBoxManager = new HitBoxManager(this.m_linkage_id);
            _loc2_ = 0;
            _loc3_ = 0;
            _loc1_ = Main.getLibraryMC(this.m_linkage_id);
            _loc2_ = 0;
            while(_loc2_ < _loc1_.totalFrames && _loc1_)
            {
               _loc1_.gotoAndStop(_loc2_ + 1);
               if(_loc1_.stance)
               {
                  Utils.removeActionScript(_loc1_.stance);
                  m_hitBoxManager.addHitBoxAnimation(HitBoxAnimation.createHitBoxAnimation(this.m_linkage_id + "_" + _loc1_.currentLabel,_loc1_.stance,_loc1_));
               }
               _loc2_++;
            }
            _loc1_ = null;
            _loc2_ = 0;
            while(_loc2_ < this.m_extraLinkageList.length)
            {
               _loc1_ = Main.getLibraryMC(this.m_extraLinkageList[_loc2_]);
               if(_loc1_)
               {
                  Utils.removeActionScript(_loc1_);
                  HitBoxAnimation.createHitBoxAnimation(this.m_extraLinkageList[_loc2_],_loc1_,_loc1_);
               }
               _loc1_ = null;
               _loc2_++;
            }
         }
      }
      
      public function getTerrainData() : void
      {
         this.m_warningBounds_lower = new Array(STAGEDATA.getWarningBounds_LL(),STAGEDATA.getWarningBounds_LR());
         this.m_warningBounds_upper = new Array(STAGEDATA.getWarningBounds_UL(),STAGEDATA.getWarningBounds_UR());
      }
      
      protected function getOpponentData() : void
      {
         var _loc1_:Number = 0;
         this.m_opponents = new Vector.<int>();
         _loc1_ = 0;
         while(_loc1_ < STAGEDATA.PlayerList.length)
         {
            if(STAGEDATA.PlayerList[_loc1_] != m_player_id && (m_team_id == -1 || STAGEDATA.TeamDamage || m_team_id > 0 && m_team_id != STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc1_]).Team))
            {
               this.m_opponents.push(STAGEDATA.PlayerList[_loc1_]);
            }
            _loc1_++;
         }
      }
      
      public function get Dead() : Boolean
      {
         return this.m_dead;
      }
      
      public function get ProjectileList() : Vector.<Projectile>
      {
         return this.m_projectile;
      }
      
      public function get LinkageID() : String
      {
         return this.m_linkage_id;
      }
      
      public function get PlayerID() : int
      {
         return m_player_id;
      }
      
      public function get TeamID() : int
      {
         return m_team_id;
      }
      
      public function get ProjectileArray() : Vector.<Projectile>
      {
         return this.m_projectile;
      }
      
      override protected function gravity() : void
      {
         if(!m_collision.ground && m_ySpeed < m_max_ySpeed && !isHitStunOrParalysis())
         {
            m_ySpeed = m_ySpeed + m_gravity;
         }
      }
      
      protected function checkDeath() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = undefined;
         if(m_sprite.x < STAGEDATA.DeathBounds.x || m_sprite.x > STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width || m_sprite.y < STAGEDATA.DeathBounds.y || m_sprite.y > STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height)
         {
            _loc1_ = true;
            for(_loc2_ in this.m_projectile)
            {
               if(this.m_projectile[_loc2_] != null)
               {
                  _loc1_ = false;
                  break;
               }
            }
            if(_loc1_)
            {
               this.destroy();
            }
         }
      }
      
      public function setPlayerID(param1:Number) : void
      {
         m_player_id = param1;
         this.getOpponentData();
      }
      
      public function setTeamID(param1:Number) : void
      {
         m_team_id = param1;
         this.getOpponentData();
      }
      
      public function pause() : void
      {
         if(HasStance)
         {
            m_sprite.stance.stop();
            Utils.recursiveMovieClipPlay(m_sprite.stance,false);
         }
      }
      
      public function unpause() : void
      {
         if(HasStance)
         {
            m_sprite.stance.play();
            Utils.recursiveMovieClipPlay(m_sprite.stance,true);
         }
      }
      
      protected function fadeIn() : void
      {
         if(!this.m_fadeTimer.IsComplete)
         {
            this.m_fadeTimer.tick();
            setBrightness((1 - this.m_fadeTimer.CurrentTime / this.m_fadeTimer.MaxTime) * 100);
         }
      }
      
      protected function fadeOut() : void
      {
         if(!this.m_fadeTimer.IsComplete)
         {
            this.m_fadeTimer.tick();
            setBrightness(this.m_fadeTimer.CurrentTime / this.m_fadeTimer.MaxTime * 100);
         }
      }
      
      public function destroy() : void
      {
         this.m_didDamageList.splice(0,this.m_didDamageList.length);
         if(m_sprite.parent != null)
         {
            STAGE.removeChild(m_sprite);
         }
         this.m_dead = true;
         STAGEDATA.removeEnemy(this);
         removeSelfPlatform();
      }
      
      override protected function m_faceRight() : void
      {
         m_sprite.scaleX = Math.abs(m_sprite.scaleX);
         m_facingForward = true;
         m_attack.IsForward = true;
      }
      
      override protected function m_faceLeft() : void
      {
         m_sprite.scaleX = -Math.abs(m_sprite.scaleX);
         m_facingForward = false;
         m_attack.IsForward = false;
      }
      
      public function destroyInterruptedProjectiles() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.m_projectile.length)
         {
            if(this.m_projectile[_loc1_] != null && !this.m_projectile[_loc1_].Visible)
            {
               this.m_projectile[_loc1_].destroy();
               this.m_projectile[_loc1_] = null;
            }
            _loc1_++;
         }
      }
      
      private function getIndexOfOldestProjectile(param1:String) : int
      {
         var _loc2_:int = -1;
         var _loc3_:int = 0;
         while(_loc3_ < this.m_projectile_max && _loc3_ < this.m_projectile.length)
         {
            if(this.m_projectile[_loc3_] != null && this.m_projectile[_loc3_].LinkageID == param1 && (_loc2_ < 0 || this.m_projectile[_loc3_].Time > this.m_projectile[_loc2_].Time))
            {
               _loc2_ = _loc3_;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getCurrentProjectile() : Projectile
      {
         if(this.m_lastProjectile >= 0 && this.m_lastProjectile < this.m_projectile.length)
         {
            return this.m_projectile[this.m_lastProjectile];
         }
         return null;
      }
      
      public function getProjectile(param1:Number) : Projectile
      {
         if(param1 >= 0 && param1 < this.m_projectile.length)
         {
            return this.m_projectile[param1];
         }
         return null;
      }
      
      private function getProjectileLimit(param1:String) : Number
      {
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.m_projectile.length)
         {
            if(this.m_projectile[_loc3_] != null && this.m_projectile[_loc3_].LinkageID == param1)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getProjectiles() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < this.m_projectile.length)
         {
            if(this.m_projectile[_loc2_] && !this.m_projectile[_loc2_].Dead)
            {
               _loc1_.push(this.m_projectile[_loc2_]);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      protected function fireProjectile(param1:String, param2:Number = 0, param3:Number = 0, param4:Boolean = false, param5:Object = null) : Boolean
      {
         var _loc7_:ProjectileAttack = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc6_:Boolean = false;
         if(!param5)
         {
            param5 = {};
         }
         if(m_attackData.getProjectile(param1) != null)
         {
            _loc7_ = m_attackData.getProjectile(param1);
            _loc8_ = 0;
            while(_loc8_ < this.m_projectile_max && _loc8_ < this.m_projectile.length && !_loc6_)
            {
               if((this.m_projectile[_loc8_] == null || _loc7_.LimitOverwrite) && _loc7_.LinkageID != null && (this.getProjectileLimit(_loc7_.LinkageID) < _loc7_.Limit || _loc7_.LimitOverwrite))
               {
                  _loc9_ = _loc8_;
                  if(_loc7_.LimitOverwrite && this.getProjectileLimit(_loc7_.LinkageID) >= _loc7_.Limit)
                  {
                     _loc8_ = this.getIndexOfOldestProjectile(_loc7_.LinkageID);
                     if(_loc8_ < 0)
                     {
                        return false;
                     }
                     this.m_projectile[_loc8_].destroy();
                     this.m_projectile[_loc8_] = null;
                  }
                  else if(_loc7_.LimitOverwrite)
                  {
                     _loc8_ = this.getIndexOfOldestProjectile(_loc7_.LinkageID);
                     _loc10_ = 0;
                     while(_loc10_ < this.m_projectile.length)
                     {
                        if(this.m_projectile[_loc10_] == null)
                        {
                           _loc8_ = _loc10_;
                           break;
                        }
                        _loc10_++;
                     }
                  }
                  this.m_projectile[_loc8_] = new Projectile({
                     "player_id":m_player_id,
                     "x_start":m_sprite.x,
                     "y_start":m_sprite.y,
                     "sizeRatio":m_sizeRatio,
                     "facingForward":m_facingForward,
                     "chargetime":param5.chargetime || 0,
                     "chargetime_max":param5.chargetime_max || 0,
                     "frame":param1 + "_proj",
                     "staleMultiplier":1,
                     "sizeStatus":0,
                     "opponents":this.m_opponents,
                     "terrains":m_terrains,
                     "platforms":m_platforms,
                     "team_id":m_team_id
                  },_loc7_,STAGEDATA,this);
                  _loc6_ = true;
                  this.m_lastProjectile = _loc8_;
                  if(param2 != 0 || param3 != 0)
                  {
                     if(param4)
                     {
                        this.m_projectile[_loc8_].X = param2;
                        this.m_projectile[_loc8_].Y = param3;
                        this.m_projectile[_loc8_].X = this.m_projectile[_loc8_].X + (!!m_facingForward?_loc7_.XOffset * m_sizeRatio:-_loc7_.XOffset * m_sizeRatio);
                        this.m_projectile[_loc8_].Y = this.m_projectile[_loc8_].Y + _loc7_.YOffset * m_sizeRatio;
                     }
                     else
                     {
                        this.m_projectile[_loc8_].X = this.m_projectile[_loc8_].X + (!!m_facingForward?param2:-param2);
                        this.m_projectile[_loc8_].Y = this.m_projectile[_loc8_].Y + param3 * m_sizeRatio;
                        this.m_projectile[_loc8_].X = this.m_projectile[_loc8_].X + (!!m_facingForward?_loc7_.XOffset * m_sizeRatio:-_loc7_.XOffset * m_sizeRatio);
                        this.m_projectile[_loc8_].Y = this.m_projectile[_loc8_].Y + _loc7_.YOffset * m_sizeRatio;
                     }
                  }
                  else
                  {
                     this.m_projectile[_loc8_].X = this.m_projectile[_loc8_].X + (!!m_facingForward?_loc7_.XOffset * m_sizeRatio:-_loc7_.XOffset * m_sizeRatio);
                     this.m_projectile[_loc8_].Y = this.m_projectile[_loc8_].Y + _loc7_.YOffset * m_sizeRatio;
                  }
                  break;
               }
               _loc8_++;
            }
         }
         if(!_loc6_)
         {
            return false;
         }
         return _loc6_;
      }
      
      public function getActiveProjectiles(param1:int, param2:int) : Vector.<Projectile>
      {
         var _loc3_:Vector.<Projectile> = new Vector.<Projectile>();
         var _loc4_:int = 0;
         while(_loc4_ < this.m_projectile.length)
         {
            if(this.m_projectile[_loc4_] != null && !this.m_projectile[_loc4_].Dead && (this.m_projectile[_loc4_].PlayerID != param1 && !(param2 > 0 && this.m_projectile[_loc4_].TeamID > 0 && this.m_projectile[_loc4_].TeamID == param2) || this.m_projectile[_loc4_].WasReversed))
            {
               _loc3_.push(this.m_projectile[_loc4_]);
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function destroyAllProjectiles() : void
      {
         var _loc1_:* = 0;
         while(_loc1_ < this.m_projectile_max && _loc1_ < this.m_projectile.length)
         {
            if(this.m_projectile[_loc1_] != null)
            {
               this.m_projectile[_loc1_].destroy();
               this.m_projectile[_loc1_] = null;
            }
            _loc1_++;
         }
      }
      
      protected function getNearestTarget() : Target
      {
         var _loc4_:* = undefined;
         var _loc1_:Array = STAGEDATA.getPlayerArray();
         var _loc2_:Target = new Target();
         _loc2_.Distance = Number.MAX_VALUE;
         var _loc3_:Number = 0;
         for(_loc4_ in _loc1_)
         {
            if(Character(_loc1_[_loc4_]).ID != m_player_id && !(m_team_id > 0 && Character(_loc1_[_loc4_]).Team == m_team_id) && !Character(_loc1_[_loc4_]).StandBy)
            {
               _loc3_ = Utils.getDistanceFrom(this,Character(_loc1_[_loc4_]));
               if(_loc3_ < _loc2_.Distance)
               {
                  _loc2_.CurrentTarget = _loc1_[_loc4_];
                  _loc2_.Distance = _loc3_;
               }
            }
         }
         return _loc2_.CurrentTarget == null?null:_loc2_;
      }
      
      protected function runBeaconTimer() : void
      {
         this.m_beaconTimer.tick();
         if(this.m_beaconTimer.IsComplete)
         {
            if(this.m_currentTarget.BeaconSprite)
            {
               this.m_shortestPath = null;
               this.getNearestOpponent();
            }
            this.m_beaconTimer.reset();
         }
      }
      
      protected function runTargetTimer() : void
      {
         this.getNearestOpponent();
         this.m_findTimer.tick();
         if(this.m_findTimer.IsComplete)
         {
            this.checkPotentialBeaconPath();
            this.m_findTimer.reset();
         }
      }
      
      protected function getNearestOpponent() : void
      {
         var _loc2_:Beacon = null;
         var _loc3_:Beacon = null;
         if(this.m_targetTemp.CurrentTarget != null && this.m_targetTemp.CurrentTarget.MC.parent == null)
         {
            this.m_targetTemp.CurrentTarget = null;
         }
         this.m_currentTarget.CurrentTarget = null;
         var _loc1_:Target = this.getNearestTarget();
         if(_loc1_ != null)
         {
            this.m_currentTarget.CurrentTarget = _loc1_.CurrentTarget;
            this.m_targetTemp.CurrentTarget = this.m_currentTarget.CurrentTarget;
            this.m_currentTarget.setDistance(new Point(m_sprite.x,m_sprite.y));
            this.m_targetTemp.setDistance(new Point(m_sprite.x,m_sprite.y));
         }
         if(this.m_currentTarget != null && this.m_currentTarget.CurrentTarget != null && STAGEDATA.getBeacons().length > 0 && this.m_shortestPath == null && (this.m_currentTarget.Distance > 200 || !this.m_currentTarget.CurrentTarget.checkLinearPath(this)))
         {
            _loc2_ = Utils.getClosetBeaconTo(STAGEDATA,m_sprite);
            _loc3_ = Utils.getClosetBeaconTo(STAGEDATA,this.m_currentTarget.CurrentTarget.MC);
            if(_loc2_ != _loc3_)
            {
               this.m_shortestPath = Utils.getPath(STAGEDATA.getBeacons(),Utils.dijkstra(STAGEDATA,STAGEDATA.getBeacons(),STAGEDATA.getAdjMatrix(),_loc2_,_loc3_),_loc2_.BID,_loc3_.BID);
            }
         }
         else if(this.m_shortestPath != null)
         {
            this.m_currentTarget.CurrentTarget = this.m_shortestPath[this.m_shortestPath.length - 1];
            this.m_currentTarget.setDistance(new Point(m_sprite.x,m_sprite.y));
         }
      }
      
      protected function checkPotentialBeaconPath() : void
      {
         if(this.m_targetTemp.CurrentTarget != null)
         {
            this.m_targetTemp.setDistance(new Point(m_sprite.x,m_sprite.y));
         }
         if(this.m_shortestPath != null && this.m_targetTemp.CurrentTarget != null && (this.m_targetTemp.Distance < 100 && this.m_targetTemp.CurrentTarget.checkLinearPath(this)))
         {
            this.m_shortestPath = null;
            this.m_currentTarget.CurrentTarget = this.m_targetTemp.CurrentTarget;
            this.m_targetTemp.CurrentTarget = null;
            this.getNearestOpponent();
         }
         else if(this.m_shortestPath != null)
         {
            this.m_currentTarget.CurrentTarget = this.m_shortestPath[this.m_shortestPath.length - 1];
            this.m_currentTarget.setDistance(new Point(m_sprite.x,m_sprite.y));
            if(this.m_currentTarget.Distance < 50)
            {
               this.m_currentTarget.CurrentTarget = null;
               this.m_shortestPath.pop();
               if(this.m_shortestPath.length > 0 && !(this.m_targetTemp.CurrentTarget != null && this.m_targetTemp.CurrentTarget.checkLinearPath(this) && this.m_targetTemp.Distance < Utils.getDistanceFrom(this,this.m_shortestPath[this.m_shortestPath.length - 1])))
               {
                  this.m_beaconTimer.reset();
                  this.m_currentTarget.CurrentTarget = this.m_shortestPath[this.m_shortestPath.length - 1];
               }
               else
               {
                  this.m_shortestPath = null;
                  this.getNearestOpponent();
               }
            }
         }
      }
      
      protected function performAttackChecks() : void
      {
         if(!isHitStunOrParalysis())
         {
            m_attack.ExecTime++;
            m_attack.RefreshRateTimer++;
            if(m_attack.RefreshRate > 0 && m_attack.RefreshRateReady && m_attack.RefreshRateTimer % m_attack.RefreshRate == 0)
            {
               m_attack.AttackID++;
            }
         }
         m_attack.XLoc = m_sprite.x;
         m_attack.YLoc = m_sprite.y;
      }
      
      protected function Attack(param1:String) : void
      {
         var _loc2_:AttackObject = m_attackData.getAttack(param1);
         if(!_loc2_)
         {
            m_attack.Frame = null;
            return;
         }
         m_attack.IsAttacking = true;
         m_attack.IsAirAttack = !m_collision.ground;
         m_attack.IsForward = m_facingForward;
         m_attack.ExecTime = 0;
         if(m_attack.ResetMovement)
         {
            m_xSpeed = 0;
            m_ySpeed = 0;
         }
         m_attack.RefreshRate = _loc2_.RefreshRate;
         m_attack.Frame = param1;
         playFrame(param1);
      }
      
      override public function reactionShield(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         var _loc3_:Character = Boolean(param1 as Character)?Character(param1):null;
         var _loc4_:AttackDamage = m_attackData.getAttackBoxData(m_attack.Frame,param2.FirstHitBox.Name).syncState(m_attack);
         var _loc5_:Array = null;
         if(_loc3_ && _loc3_.inState(CState.SHIELDING))
         {
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CONNECT_SHIELD,{
               "caller":this,
               "receiver":param1,
               "attackBoxData":_loc4_.exportAttackDamageData()
            }));
            if(_loc3_.takeShieldDamage(m_attackData.getAttackBoxData(m_attack.Frame,param2.FirstHitBox.Name).syncState(m_attack),param2.OverlapHitBox))
            {
               m_eventManager.dispatchEvent(new SSF2Event(!!Character(param1).PerfectShield?SSF2Event.ATTACK_HIT_POWER_SHIELD:SSF2Event.ATTACK_HIT_SHIELD,{
                  "caller":this,
                  "receiver":param1,
                  "attackBoxData":_loc4_.exportAttackDamageData()
               }));
               return true;
            }
         }
         return false;
      }
      
      override public function reactionAbsorb(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         var _loc3_:AttackDamage = m_attackData.getAttackBoxData(m_attack.Frame,param2.FirstHitBox.Name).syncState(m_attack);
         if(param1.LastAttackID.indexOf(_loc3_.AttackID) < 0)
         {
            param1.stackAttackID(_loc3_.AttackID);
            return true;
         }
         return false;
      }
      
      override public function reactionCounter(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         var _loc3_:AttackDamage = param1.AttackDataObj.getAttackBoxData(param1.AttackStateData.Frame,param2.SecondHitBox.Name).syncState(m_attack);
         if(!this.m_dead)
         {
            return true;
         }
         return false;
      }
      
      override public function reactionHit(param1:InteractiveSprite, param2:HitBoxCollisionResult) : Boolean
      {
         var _loc3_:AttackDamage = m_attackData.getAttackBoxData(m_attack.Frame,param2.FirstHitBox.Name).syncState(m_attack);
         if(param1.takeDamage(_loc3_,param2.OverlapHitBox))
         {
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CONNECT,{
               "caller":this,
               "receiver":param1,
               "attackBoxData":_loc3_.exportAttackDamageData()
            }));
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_HIT,{
               "caller":this,
               "receiver":param1,
               "attackBoxData":_loc3_.exportAttackDamageData()
            }));
            this.m_didDamage = true;
            if(this.m_didDamageList.indexOf(param1) < 0)
            {
               this.m_didDamageList.push(param1);
            }
            return true;
         }
         if(param1.Invincible && !param1.attackIDArrayContains(m_attack.AttackID) && validateOnlyAffects(_loc3_))
         {
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CONNECT,{
               "caller":this,
               "receiver":param1,
               "attackBoxData":_loc3_.exportAttackDamageData()
            }));
         }
         return false;
      }
      
      protected function attackCollisionTest() : void
      {
         if(m_bypassCollisionTesting)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:Character = null;
         var _loc3_:Enemy = null;
         var _loc4_:Item = null;
         var _loc5_:TargetTestTarget = null;
         var _loc6_:Vector.<HitBoxCollisionResult> = null;
         var _loc7_:Array = null;
         if(!this.m_dead)
         {
            _loc1_ = 0;
            while(_loc1_ < this.m_opponents.length)
            {
               _loc2_ = STAGEDATA.getPlayer(this.m_opponents[_loc1_]);
               if(_loc2_ != null && !(!STAGEDATA.TeamDamage && _loc2_.Team == m_team_id && m_team_id > 0) && !_loc2_.StandBy && !_loc2_.Dead && !_loc2_.IsTeching && !_loc2_.inState(CState.STAR_KO) && !_loc2_.inState(CState.SCREEN_KO) && !_loc2_.inState(CState.REVIVAL))
               {
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.SHIELD,this.reactionShield);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.ABSORB,this.reactionAbsorb);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.HIT,this.reactionHit);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.EGG,this.reactionHit);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.FREEZE,this.reactionHit);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.ATTACK,HitBoxSprite.STAR,this.reactionHit);
                  InteractiveSprite.hitTest(this,_loc2_,HitBoxSprite.COUNTER,HitBoxSprite.ATTACK,this.reactionCounter);
               }
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.Enemies.length)
            {
               _loc3_ = STAGEDATA.Enemies[_loc1_];
               if(_loc3_ != null && _loc3_ != this)
               {
                  InteractiveSprite.hitTest(this,_loc3_,HitBoxSprite.ATTACK,HitBoxSprite.HIT,this.reactionHit);
               }
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.ItemsRef.MAXITEMS)
            {
               _loc4_ = STAGEDATA.ItemsRef.getItemData(_loc1_);
               if(_loc4_ != null)
               {
                  InteractiveSprite.hitTest(this,_loc4_,HitBoxSprite.ATTACK,HitBoxSprite.HIT,this.reactionHit);
               }
               _loc1_++;
            }
            if(STAGEDATA.GameRef.GameMode == Mode.TARGET_TEST)
            {
               _loc1_ = 0;
               while(_loc1_ < STAGEDATA.Targets.length)
               {
                  _loc5_ = STAGEDATA.Targets[_loc1_];
                  if(_loc5_ != null)
                  {
                     InteractiveSprite.hitTest(this,_loc5_,HitBoxSprite.ATTACK,HitBoxSprite.HIT,this.reactionHit);
                  }
                  _loc1_++;
               }
            }
         }
      }
      
      protected function forceOnGround(param1:Number = 200) : void
      {
         var _loc2_:Number = m_sprite.y;
         var _loc3_:Number = 0;
         if(m_currentPlatform)
         {
            return;
         }
         while(!(m_currentPlatform = testGroundWithCoord(m_sprite.x,m_sprite.y + 1)) && _loc3_ < param1)
         {
            m_sprite.y++;
            _loc3_++;
         }
         if(!m_currentPlatform)
         {
            m_sprite.y = _loc2_;
         }
         else
         {
            attachToGround();
         }
      }
      
      protected function m_calcGroundAngle() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc1_:Number = 0;
         if(m_currentPlatform != null)
         {
            _loc2_ = 0;
            _loc3_ = m_sprite.y;
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            while(testCoordCollision(m_sprite.x - 5,_loc3_))
            {
               _loc3_ = _loc3_ - 1 / 4;
            }
            _loc2_ = m_sprite.y + 20;
            while(_loc3_ < _loc2_ && !testCoordCollision(m_sprite.x - 5,_loc3_ - 2))
            {
               _loc3_++;
            }
            if(_loc3_ < _loc2_ && testCoordCollision(m_sprite.x - 5,_loc3_))
            {
               _loc4_ = m_sprite.x - 5;
               _loc6_ = _loc3_;
               _loc3_ = m_sprite.y;
               while(testCoordCollision(m_sprite.x + 5,_loc3_))
               {
                  _loc3_ = _loc3_ - 1 / 4;
               }
               _loc2_ = m_sprite.y + 20;
               while(_loc3_ < _loc2_ && !testCoordCollision(m_sprite.x + 5,_loc3_ - 2))
               {
                  _loc3_++;
               }
               if(_loc3_ < _loc2_ && testCoordCollision(m_sprite.x + 5,_loc3_))
               {
                  _loc5_ = m_sprite.x + 5;
                  _loc7_ = _loc3_;
                  _loc1_ = _loc7_ > _loc6_?Number(Math.tan(Utils.fastAbs(_loc6_ - _loc7_) / Utils.fastAbs(_loc4_ - _loc5_)) / (Math.PI / 180)):Number(-Math.tan(Utils.fastAbs(_loc6_ - _loc7_) / Utils.fastAbs(_loc4_ - _loc5_)) / (Math.PI / 180));
               }
            }
         }
         if(_loc1_ > 45)
         {
            _loc1_ = 45;
         }
         else if(_loc1_ < -45)
         {
            _loc1_ = -45;
         }
         m_sprite.rotation = _loc1_;
      }
      
      protected function updateWarningCollision() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < this.m_warningBounds_lower[0].length && !_loc1_)
         {
            if(this.m_warningBounds_lower[0][_loc3_].hitTestPoint(GlobalX,GlobalY,true))
            {
               _loc1_ = true;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.m_warningBounds_lower[1].length && !_loc2_)
         {
            if(this.m_warningBounds_lower[1][_loc3_].hitTestPoint(GlobalX,GlobalY,true))
            {
               _loc2_ = true;
            }
            _loc3_++;
         }
         m_collision.lbound_lower = _loc1_;
         m_collision.rbound_lower = _loc2_;
         _loc1_ = false;
         _loc2_ = false;
         _loc3_ = 0;
         while(_loc3_ < this.m_warningBounds_upper[0].length && !_loc1_)
         {
            if(this.m_warningBounds_upper[0][_loc3_].hitTestPoint(GlobalX,GlobalY,true))
            {
               _loc1_ = true;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.m_warningBounds_upper[1].length && !_loc2_)
         {
            if(this.m_warningBounds_upper[1][_loc3_].hitTestPoint(GlobalX,GlobalY,true))
            {
               _loc2_ = true;
            }
            _loc3_++;
         }
         m_collision.lbound_upper = _loc1_;
         m_collision.rbound_upper = _loc2_;
      }
      
      override public function PREPERFORM() : void
      {
         if(HasStance && !this.m_dead && !STAGEDATA.Paused)
         {
            if(m_sprite.stance.currentFrame == m_sprite.stance.totalFrames && !isHitStunOrParalysis())
            {
               m_sprite.stance.gotoAndStop(1);
            }
            else
            {
               m_sprite.stance.nextFrame();
            }
            Utils.recursiveMovieClipPlay(m_sprite.stance,true);
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(m_started && !this.m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            checkTimers();
            super.PERFORMALL();
            this.checkDeath();
            checkHitStun();
         }
      }
      
      override public function POSTPERFORM() : void
      {
         if(HasStance)
         {
            m_sprite.stance.stop();
         }
         m_started = true;
      }
   }
}
