package com.mcleodgaming.ssf2.engine
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2.util.Vcam;
    import __AS3__.vec.Vector;
    import com.mcleodgaming.ssf2.platforms.Platform;
    import com.mcleodgaming.ssf2.events.EventManager;
    import flash.geom.Point;
    import com.mcleodgaming.ssf2.platforms.MovingPlatform;
    import com.mcleodgaming.ssf2.util.FrameTimer;
    import com.mcleodgaming.ssf2.util.Utils;
    import flash.geom.Rectangle;
    import com.mcleodgaming.ssf2.Main;
    import com.mcleodgaming.ssf2.items.Item;
    import com.mcleodgaming.ssf2.enemies.Enemy;
    import com.mcleodgaming.ssf2.controllers.MenuController;
    import flash.geom.ColorTransform;
    import com.mcleodgaming.ssf2.events.SSF2Event;
    import __AS3__.vec.*;
    import com.mcleodgaming.ssf2.platforms.*;
    import com.mcleodgaming.ssf2.util.*;

    public class InteractiveSprite 
    {

        public static var SHOW_HITBOXES:Boolean = false;
        public static var HITBOXES_WAS_ON:Boolean = false;

        protected var m_uid:int;
        protected var m_state:uint;
        protected var m_hitBoxManager:HitBoxManager;
        protected var STAGE:MovieClip;
        protected var STAGEPARENT:MovieClip;
        protected var STAGEEFFECTS:MovieClip;
        protected var HUD:MovieClip;
        protected var CAM:Vcam;
        protected var STAGEDATA:StageData;
        protected var m_sprite:MovieClip;
        protected var m_collision:Collision;
        protected var m_width:Number;
        protected var m_height:Number;
        protected var m_terrains:Vector.<Platform>;
        protected var m_platforms:Vector.<Platform>;
        protected var m_eventManager:EventManager;
        protected var m_tempEvents:Vector.<Object>;
        protected var m_timerEvents:Vector.<Object>;
        protected var m_sizeRatio:Number;
        protected var m_currentPlatform:Platform;
        protected var m_gravity:Number;
        protected var m_max_ySpeed:Number;
        protected var m_xSpeed:Number;
        protected var m_ySpeed:Number;
        protected var m_facingForward:Boolean;
        protected var m_started:Boolean;
        protected var m_hitPlatform:Platform;
        protected var m_collisionPoint:Point;
        protected var m_selfPlatform:MovingPlatform;
        protected var m_player_id:int;
        protected var m_team_id:int;
        protected var m_attack:AttackState;
        protected var m_attackData:AttackData;
        protected var m_lastHitID:int;
        protected var m_lastAttackID:Array;
        protected var m_lastAttackIndex:int;
        protected var m_xKnockback:Number;
        protected var m_yKnockback:Number;
        protected var m_xKnockbackDecay:Number;
        protected var m_yKnockbackDecay:Number;
        protected var m_knockbackStackingTimer:FrameTimer;
        protected var m_knockbackStacked:Boolean;
        protected var m_counterAttackData:Object;
        protected var m_invincible:Boolean;
        protected var m_intangible:Boolean;
        protected var m_actionShot:Boolean;
        protected var m_actionTimer:int;
        protected var m_paralysis:Boolean;
        protected var m_paralysisHitCount:int;
        protected var m_paralysisTimer:int;
        protected var m_maxParalysisTime:FrameTimer;
        protected var m_hitStunToggle:Boolean;
        protected var m_hitStunTimer:int;
        protected var m_weight1:Number;
        protected var m_weight2:Number;
        protected var m_cancelEffectDelay:FrameTimer;
        protected var m_cancelEffectDelay2:FrameTimer;
        protected var m_cancelEffectCount:int;
        protected var m_cancelEffect:String;
        protected var m_bypassCollisionTesting:Boolean;
        private var m_globalVariables:Object;
        protected var m_framesSinceLastState:int;

        public function InteractiveSprite(_arg_1:MovieClip, _arg_2:StageData, _arg_3:Boolean=true)
        {
            this.m_globalVariables = new Object();
            var _local_4:int;
            this.m_state = 0;
            this.STAGEDATA = _arg_2;
            this.STAGE = this.STAGEDATA.StageRef;
            this.STAGEPARENT = this.STAGEDATA.StageParentRef;
            this.STAGEEFFECTS = this.STAGEDATA.StageEffectsRef;
            this.HUD = this.STAGEDATA.HudRef;
            this.CAM = this.STAGEDATA.CamRef;
            if (_arg_3)
            {
                this.m_sprite = MovieClip(this.STAGE.addChild(_arg_1));
            }
            else
            {
                this.m_sprite = _arg_1;
            };
            this.m_uid = Utils.getUID();
            this.m_collision = new Collision();
            this.m_currentPlatform = null;
            this.m_gravity = 0;
            this.m_max_ySpeed = 0;
            this.m_xSpeed = 0;
            this.m_ySpeed = 0;
            this.m_sizeRatio = 1;
            this.m_facingForward = true;
            this.m_terrains = this.STAGEDATA.Terrains;
            this.m_platforms = this.STAGEDATA.Platforms;
            this.m_started = false;
            this.m_collisionPoint = new Point();
            this.m_hitPlatform = null;
            this.m_selfPlatform = null;
            this.m_counterAttackData = null;
            this.m_eventManager = new EventManager();
            this.m_tempEvents = new Vector.<Object>();
            this.m_timerEvents = new Vector.<Object>();
            this.m_player_id = -1;
            this.m_team_id = -1;
            this.m_lastHitID = 0;
            this.m_lastAttackIndex = 0;
            this.m_lastAttackID = new Array(60);
            _local_4 = 0;
            while (_local_4 < this.m_lastAttackID.length)
            {
                this.m_lastAttackID[_local_4] = 0;
                _local_4++;
            };
            this.m_xKnockback = 0;
            this.m_yKnockback = 0;
            this.m_xKnockbackDecay = 0;
            this.m_yKnockbackDecay = 0;
            this.m_knockbackStackingTimer = new FrameTimer(5);
            this.m_knockbackStacked = false;
            this.m_invincible = false;
            this.m_intangible = false;
            this.m_actionShot = false;
            this.m_actionTimer = 0;
            this.m_paralysis = false;
            this.m_paralysisHitCount = 0;
            this.m_paralysisTimer = 0;
            this.m_maxParalysisTime = new FrameTimer(15);
            this.m_maxParalysisTime.finish();
            this.m_hitStunTimer = 0;
            this.m_hitStunToggle = false;
            this.m_weight1 = 100;
            this.m_weight2 = (Utils.VELOCITY_SCALE * Utils.WEIGHT2_BASE);
            this.m_cancelEffectDelay = new FrameTimer(10);
            this.m_cancelEffectDelay2 = new FrameTimer(60);
            this.m_cancelEffectCount = 0;
            this.m_cancelEffect = "effect_cancel";
            this.m_bypassCollisionTesting = false;
            this.m_framesSinceLastState = 0;
        }

        public static function hitTest(_arg_1:InteractiveSprite, _arg_2:InteractiveSprite, _arg_3:uint, _arg_4:uint, _arg_5:Function=null):Vector.<HitBoxCollisionResult>
        {
            var _local_6:int;
            var _local_7:Vector.<HitBoxCollisionResult>;
            var _local_8:Array;
            var _local_9:Array;
            if (((_arg_3 == HitBoxSprite.SHIELD) && (_arg_1 as Character)))
            {
                _local_8 = Character(_arg_1).ShieldHitBoxes;
            }
            else
            {
                if (((_arg_3 == HitBoxSprite.STAR) && (_arg_1 as Character)))
                {
                    _local_8 = Character(_arg_1).StarHitBoxes;
                }
                else
                {
                    if (((_arg_3 == HitBoxSprite.EGG) && (_arg_1 as Character)))
                    {
                        _local_8 = Character(_arg_1).EggHitBoxes;
                    }
                    else
                    {
                        if (((_arg_3 == HitBoxSprite.FREEZE) && (_arg_1 as Character)))
                        {
                            _local_8 = Character(_arg_1).FreezeHitBoxes;
                        }
                        else
                        {
                            _local_8 = _arg_1.CurrentAnimation.getHitBoxes(_arg_1.CurrentFrameNum, _arg_3);
                        };
                    };
                };
            };
            if (((_arg_4 == HitBoxSprite.SHIELD) && (_arg_2 as Character)))
            {
                _local_9 = Character(_arg_2).ShieldHitBoxes;
            }
            else
            {
                if (((_arg_4 == HitBoxSprite.STAR) && (_arg_4 as Character)))
                {
                    _local_9 = Character(_arg_2).StarHitBoxes;
                }
                else
                {
                    if (((_arg_4 == HitBoxSprite.EGG) && (_arg_2 as Character)))
                    {
                        _local_9 = Character(_arg_2).EggHitBoxes;
                    }
                    else
                    {
                        if (((_arg_4 == HitBoxSprite.FREEZE) && (_arg_2 as Character)))
                        {
                            _local_9 = Character(_arg_2).FreezeHitBoxes;
                        }
                        else
                        {
                            _local_9 = ((_arg_2) ? _arg_2.CurrentAnimation.getHitBoxes(_arg_2.CurrentFrameNum, _arg_4) : null);
                        };
                    };
                };
            };
            if ((((_local_7 = HitBoxSprite.hitTestArray(_local_8, _local_9, _arg_1.Location, _arg_2.Location, (!(_arg_1.FacingForward)), (!(_arg_2.FacingForward)), _arg_1.CurrentScale, _arg_2.CurrentScale, _arg_1.CurrentRotation, _arg_2.CurrentRotation)).length > 0) && (!(_arg_5 == null))))
            {
                _local_6 = 0;
                while (_local_6 < _local_7.length)
                {
                    if (_arg_5 != null)
                    {
                        (_arg_5(_arg_2, _local_7[_local_6]));
                    };
                    _local_6++;
                };
            };
            return (_local_7);
        }


        public function get ID():int
        {
            return (this.m_player_id);
        }

        public function get UID():int
        {
            return (this.m_uid);
        }

        public function get Team():int
        {
            return (this.m_team_id);
        }

        public function get EventManagerObj():EventManager
        {
            return (this.m_eventManager);
        }

        public function get TempEventObj():Vector.<Object>
        {
            return (this.m_tempEvents);
        }

        public function get ActionShot():Boolean
        {
            return (this.m_actionShot);
        }

        public function get SelfPlatform():MovingPlatform
        {
            return (this.m_selfPlatform);
        }

        public function get Location():Point
        {
            return (new Point(this.m_sprite.x, this.m_sprite.y));
        }

        public function get BoundsRect():Rectangle
        {
            return (new Rectangle((this.m_sprite.x - ((this.m_width / 2) * this.m_sizeRatio)), (this.m_sprite.y - (this.m_height * this.m_sizeRatio)), (this.m_width * this.m_sizeRatio), (this.m_height * this.m_sizeRatio)));
        }

        public function get CurrentAnimation():HitBoxAnimation
        {
            return ((this.m_hitBoxManager == null) ? null : (((this.m_hitBoxManager.HitBoxAnimationList.length <= 0) || (!(this.m_sprite.currentLabel))) ? null : this.m_hitBoxManager.getHitBoxAnimation(this.m_sprite.currentLabel)));
        }

        public function get CurrentFrame():String
        {
            return ((this.m_sprite.xframe != null) ? this.m_sprite.xframe : this.m_sprite.currentLabel);
        }

        public function get CurrentFrameNum():int
        {
            return ((this.HasStance) ? this.m_sprite.stance.currentFrame : this.m_sprite.currentFrame);
        }

        public function get CurrentScale():Point
        {
            return (new Point(Utils.fastAbs(this.m_sprite.scaleX), Utils.fastAbs(this.m_sprite.scaleX)));
        }

        public function get CurrentRotation():Number
        {
            return (Utils.forceBase360((360 - this.m_sprite.rotation)));
        }

        public function get CollisionObj():Collision
        {
            return (this.m_collision);
        }

        public function get Width():Number
        {
            return (this.m_width);
        }

        public function get FacingForward():Boolean
        {
            return (this.m_facingForward);
        }

        public function get Height():Number
        {
            return (this.m_height);
        }

        public function get OnPlatform():Boolean
        {
            return ((!(this.m_currentPlatform == null)) && (this.STAGEDATA.Platforms.indexOf(this.m_currentPlatform) >= 0));
        }

        public function get OnTerrain():Boolean
        {
            return ((!(this.m_currentPlatform == null)) && (this.STAGEDATA.Terrains.indexOf(this.m_currentPlatform) >= 0));
        }

        public function get LastHitID():int
        {
            return (this.m_lastHitID);
        }

        public function get X():Number
        {
            return (this.m_sprite.x);
        }

        public function get Y():Number
        {
            return (this.m_sprite.y);
        }

        public function set X(_arg_1:Number):void
        {
            this.m_sprite.x = _arg_1;
        }

        public function set Y(_arg_1:Number):void
        {
            this.m_sprite.y = _arg_1;
        }

        public function get XSpeed():Number
        {
            return (this.m_xSpeed);
        }

        public function set XSpeed(_arg_1:Number):void
        {
            this.m_xSpeed = _arg_1;
        }

        public function get YSpeed():Number
        {
            return (this.m_ySpeed);
        }

        public function set YSpeed(_arg_1:Number):void
        {
            this.m_ySpeed = _arg_1;
        }

        public function get GlobalX():Number
        {
            return (this.m_sprite.x);
        }

        public function get GlobalY():Number
        {
            return (this.m_sprite.y);
        }

        public function get OverlayX():Number
        {
            return (this.m_sprite.x + this.STAGEDATA.StageRef.x);
        }

        public function get OverlayY():Number
        {
            return (this.m_sprite.y + this.STAGEDATA.StageRef.y);
        }

        public function get Ground():Boolean
        {
            return (this.m_collision.ground as Boolean);
        }

        public function get MC():MovieClip
        {
            return (this.m_sprite);
        }

        public function get CurrentPlatform():Platform
        {
            return (this.m_currentPlatform);
        }

        public function get Depth():Number
        {
            return ((!(this.m_sprite.parent)) ? 0 : this.m_sprite.parent.getChildIndex(this.m_sprite));
        }

        public function get HasMC():Boolean
        {
            return (Boolean((!(this.m_sprite == null))));
        }

        public function get HasStance():Boolean
        {
            return (Boolean(((this.HasMC) && (!(this.m_sprite.stance == null)))));
        }

        public function get HasHand():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.HAND)))));
        }

        public function get HasHitBox():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.HIT)))));
        }

        public function get HasAttackBox():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.ATTACK)))));
        }

        public function get HasReverseBox():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.REVERSE)))));
        }

        public function get HasAbsorbBox():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.ABSORB)))));
        }

        public function get HasShieldAttackBox():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.SHIELDATTACK)))));
        }

        public function get HasShieldProjectileBox():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.SHIELDPROJECTILE)))));
        }

        public function get HasCamBox():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.CAM)))));
        }

        public function get HasGrabBox():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.GRAB)))));
        }

        public function get HasGrabber():Boolean
        {
            return (Boolean(((this.HasStance) && (!(this.m_sprite.stance.grabber == null)))));
        }

        public function get HasItemBox():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.ITEM)))));
        }

        public function get HasHatBox():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.HAT)))));
        }

        public function get HasTouchBox():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.TOUCH)))));
        }

        public function get HasRange():Boolean
        {
            return (Boolean(((this.HasStance) && (!(this.m_sprite.stance.range == null)))));
        }

        public function get HasHoming():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.HOMING)))));
        }

        public function get HasCatchBox():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.CATCH)))));
        }

        public function get HasCounterBox():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.COUNTER)))));
        }

        public function get HasPLockBox():Boolean
        {
            return (Boolean((((this.HasStance) && (this.CurrentAnimation)) && (this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.PLOCK)))));
        }

        public function get ShieldHitBoxes():Array
        {
            return (null);
        }

        public function get StarHitBoxes():Array
        {
            return (null);
        }

        public function get EggHitBoxes():Array
        {
            return (null);
        }

        public function get FreezeHitBoxes():Array
        {
            return (null);
        }

        public function get AttackDataObj():AttackData
        {
            return (this.m_attackData);
        }

        public function get AttackStateData():AttackState
        {
            return (this.m_attack);
        }

        public function get PreviousAttackID():int
        {
            return ((this.m_lastAttackIndex == 0) ? this.m_lastAttackID[(this.m_lastAttackID.length - 1)] : this.m_lastAttackID[(this.m_lastAttackIndex - 1)]);
        }

        public function get LastAttackID():Array
        {
            return (this.m_lastAttackID);
        }

        public function get LastAttackIndex():int
        {
            return (this.m_lastAttackIndex);
        }

        public function get Stance():MovieClip
        {
            return ((this.HasStance) ? this.m_sprite.stance : null);
        }

        public function get SizeRatio():Number
        {
            return (this.m_sizeRatio);
        }

        public function get Invincible():Boolean
        {
            return (this.isInvincible());
        }

        public function get Intangible():Boolean
        {
            return (this.isIntangible());
        }

        public function set SizeRatio(_arg_1:Number):void
        {
            this.m_sizeRatio = _arg_1;
            this.m_sprite.scaleX = ((this.m_sprite.scaleX > 0) ? this.m_sizeRatio : -(this.m_sizeRatio));
            this.m_sprite.scaleY = ((this.m_sprite.scaleY > 0) ? this.m_sizeRatio : -(this.m_sizeRatio));
        }

        public function get BypassCollisionTesting():Boolean
        {
            return (this.m_bypassCollisionTesting);
        }

        public function set BypassCollisionTesting(_arg_1:Boolean):void
        {
            this.m_bypassCollisionTesting = _arg_1;
        }

        public function isInvincible():Boolean
        {
            return (this.m_invincible);
        }

        public function isIntangible():Boolean
        {
            return (this.m_intangible);
        }

        public function isHitStunOrParalysis():Boolean
        {
            return ((this.m_paralysis) || (this.m_actionShot));
        }

        protected function checkShowHitBoxes():void
        {
            var _local_1:Array;
            var _local_2:Rectangle;
            var _local_3:int;
            var _local_4:Point;
            var _local_5:Point;
            var _local_6:Point;
            var _local_7:Point;
            var _local_8:MovieClip;
            var _local_9:MovieClip;
            if (InteractiveSprite.SHOW_HITBOXES)
            {
                InteractiveSprite.HITBOXES_WAS_ON = true;
                _local_1 = null;
                _local_2 = null;
                _local_3 = 0;
                _local_4 = new Point();
                _local_5 = new Point();
                _local_6 = new Point();
                _local_7 = new Point();
                _local_8 = ((this.m_sprite.getChildByName("hBoxHolder")) ? MovieClip(this.m_sprite.getChildByName("hBoxHolder")) : null);
                if (_local_8)
                {
                    _local_8.graphics.clear();
                };
                if (this.HasHitBox)
                {
                    if ((!(_local_8)))
                    {
                        _local_8 = new MovieClip();
                        _local_8.name = "hBoxHolder";
                        this.m_sprite.addChild(_local_8);
                    };
                    _local_1 = this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.HIT);
                    _local_3 = 0;
                    while (_local_3 < _local_1.length)
                    {
                        _local_2 = _local_1[_local_3].BoundingBox;
                        _local_4.x = _local_2.x;
                        _local_4.y = _local_2.y;
                        _local_5.x = (_local_2.x + _local_2.width);
                        _local_5.y = _local_2.y;
                        _local_6.x = (_local_2.x + _local_2.width);
                        _local_6.y = (_local_2.y + _local_2.height);
                        _local_7.x = _local_2.x;
                        _local_7.y = (_local_2.y + _local_2.height);
                        _local_8.graphics.beginFill(0xFFCC00, 0.5);
                        _local_8.graphics.moveTo(_local_4.x, _local_4.y);
                        _local_8.graphics.lineTo(_local_5.x, _local_5.y);
                        _local_8.graphics.lineTo(_local_6.x, _local_6.y);
                        _local_8.graphics.lineTo(_local_7.x, _local_7.y);
                        _local_8.graphics.lineTo(_local_4.x, _local_4.y);
                        _local_8.graphics.endFill();
                        _local_8.parent.setChildIndex(_local_8, (_local_8.parent.numChildren - 1));
                        _local_3++;
                    };
                };
                if (this.HasAttackBox)
                {
                    if ((!(_local_8)))
                    {
                        _local_8 = new MovieClip();
                        _local_8.name = "hBoxHolder";
                        this.m_sprite.addChild(_local_8);
                    };
                    _local_1 = this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.ATTACK);
                    _local_3 = 0;
                    while (_local_3 < _local_1.length)
                    {
                        _local_2 = _local_1[_local_3].BoundingBox;
                        _local_4.x = _local_2.x;
                        _local_4.y = _local_2.y;
                        _local_5.x = (_local_2.x + _local_2.width);
                        _local_5.y = _local_2.y;
                        _local_6.x = (_local_2.x + _local_2.width);
                        _local_6.y = (_local_2.y + _local_2.height);
                        _local_7.x = _local_2.x;
                        _local_7.y = (_local_2.y + _local_2.height);
                        _local_8.graphics.beginFill(0xFF0000, 0.5);
                        _local_8.graphics.moveTo(_local_4.x, _local_4.y);
                        _local_8.graphics.lineTo(_local_5.x, _local_5.y);
                        _local_8.graphics.lineTo(_local_6.x, _local_6.y);
                        _local_8.graphics.lineTo(_local_7.x, _local_7.y);
                        _local_8.graphics.lineTo(_local_4.x, _local_4.y);
                        _local_8.graphics.endFill();
                        _local_8.parent.setChildIndex(_local_8, (_local_8.parent.numChildren - 1));
                        _local_3++;
                    };
                };
                if (this.HasTouchBox)
                {
                    if ((!(_local_8)))
                    {
                        _local_8 = new MovieClip();
                        _local_8.name = "hBoxHolder";
                        this.m_sprite.addChild(_local_8);
                    };
                    _local_1 = this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.TOUCH);
                    _local_3 = 0;
                    while (_local_3 < _local_1.length)
                    {
                        _local_2 = _local_1[_local_3].BoundingBox;
                        _local_4.x = _local_2.x;
                        _local_4.y = _local_2.y;
                        _local_5.x = (_local_2.x + _local_2.width);
                        _local_5.y = _local_2.y;
                        _local_6.x = (_local_2.x + _local_2.width);
                        _local_6.y = (_local_2.y + _local_2.height);
                        _local_7.x = _local_2.x;
                        _local_7.y = (_local_2.y + _local_2.height);
                        _local_8.graphics.beginFill(0xFF, 0.5);
                        _local_8.graphics.moveTo(_local_4.x, _local_4.y);
                        _local_8.graphics.lineTo(_local_5.x, _local_5.y);
                        _local_8.graphics.lineTo(_local_6.x, _local_6.y);
                        _local_8.graphics.lineTo(_local_7.x, _local_7.y);
                        _local_8.graphics.lineTo(_local_4.x, _local_4.y);
                        _local_8.graphics.endFill();
                        _local_8.parent.setChildIndex(_local_8, (_local_8.parent.numChildren - 1));
                        _local_3++;
                    };
                };
                if (this.HasGrabBox)
                {
                    if ((!(_local_8)))
                    {
                        _local_8 = new MovieClip();
                        _local_8.name = "hBoxHolder";
                        this.m_sprite.addChild(_local_8);
                    };
                    _local_1 = this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.GRAB);
                    _local_3 = 0;
                    while (_local_3 < _local_1.length)
                    {
                        _local_2 = _local_1[_local_3].BoundingBox;
                        _local_4.x = _local_2.x;
                        _local_4.y = _local_2.y;
                        _local_5.x = (_local_2.x + _local_2.width);
                        _local_5.y = _local_2.y;
                        _local_6.x = (_local_2.x + _local_2.width);
                        _local_6.y = (_local_2.y + _local_2.height);
                        _local_7.x = _local_2.x;
                        _local_7.y = (_local_2.y + _local_2.height);
                        _local_8.graphics.beginFill(0xFF00FF, 0.5);
                        _local_8.graphics.moveTo(_local_4.x, _local_4.y);
                        _local_8.graphics.lineTo(_local_5.x, _local_5.y);
                        _local_8.graphics.lineTo(_local_6.x, _local_6.y);
                        _local_8.graphics.lineTo(_local_7.x, _local_7.y);
                        _local_8.graphics.lineTo(_local_4.x, _local_4.y);
                        _local_8.graphics.endFill();
                        _local_8.parent.setChildIndex(_local_8, (_local_8.parent.numChildren - 1));
                        _local_3++;
                    };
                };
                if (this.HasHand)
                {
                    if ((!(_local_8)))
                    {
                        _local_8 = new MovieClip();
                        _local_8.name = "hBoxHolder";
                        this.m_sprite.addChild(_local_8);
                    };
                    _local_1 = this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.HAND);
                    _local_3 = 0;
                    while (_local_3 < _local_1.length)
                    {
                        _local_2 = _local_1[_local_3].BoundingBox;
                        _local_4.x = _local_2.x;
                        _local_4.y = _local_2.y;
                        _local_5.x = (_local_2.x + _local_2.width);
                        _local_5.y = _local_2.y;
                        _local_6.x = (_local_2.x + _local_2.width);
                        _local_6.y = (_local_2.y + _local_2.height);
                        _local_7.x = _local_2.x;
                        _local_7.y = (_local_2.y + _local_2.height);
                        _local_8.graphics.beginFill(6737151, 0.25);
                        _local_8.graphics.moveTo(_local_4.x, _local_4.y);
                        _local_8.graphics.lineTo(_local_5.x, _local_5.y);
                        _local_8.graphics.lineTo(_local_6.x, _local_6.y);
                        _local_8.graphics.lineTo(_local_7.x, _local_7.y);
                        _local_8.graphics.lineTo(_local_4.x, _local_4.y);
                        _local_8.graphics.endFill();
                        _local_8.parent.setChildIndex(_local_8, (_local_8.parent.numChildren - 1));
                        _local_3++;
                    };
                };
                if (this.HasCounterBox)
                {
                    if ((!(_local_8)))
                    {
                        _local_8 = new MovieClip();
                        _local_8.name = "hBoxHolder";
                        this.m_sprite.addChild(_local_8);
                    };
                    _local_1 = this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, HitBoxSprite.COUNTER);
                    _local_3 = 0;
                    while (_local_3 < _local_1.length)
                    {
                        _local_2 = _local_1[_local_3].BoundingBox;
                        _local_4.x = _local_2.x;
                        _local_4.y = _local_2.y;
                        _local_5.x = (_local_2.x + _local_2.width);
                        _local_5.y = _local_2.y;
                        _local_6.x = (_local_2.x + _local_2.width);
                        _local_6.y = (_local_2.y + _local_2.height);
                        _local_7.x = _local_2.x;
                        _local_7.y = (_local_2.y + _local_2.height);
                        _local_8.graphics.beginFill(31265, 0.25);
                        _local_8.graphics.moveTo(_local_4.x, _local_4.y);
                        _local_8.graphics.lineTo(_local_5.x, _local_5.y);
                        _local_8.graphics.lineTo(_local_6.x, _local_6.y);
                        _local_8.graphics.lineTo(_local_7.x, _local_7.y);
                        _local_8.graphics.lineTo(_local_4.x, _local_4.y);
                        _local_8.graphics.endFill();
                        _local_8.parent.setChildIndex(_local_8, (_local_8.parent.numChildren - 1));
                        _local_3++;
                    };
                };
            }
            else
            {
                if (InteractiveSprite.HITBOXES_WAS_ON)
                {
                    _local_9 = ((this.m_sprite.getChildByName("hBoxHolder")) ? MovieClip(this.m_sprite.getChildByName("hBoxHolder")) : null);
                    if (_local_9)
                    {
                        _local_9.graphics.clear();
                    };
                    InteractiveSprite.HITBOXES_WAS_ON = false;
                };
            };
        }

        public function verifiyHitBoxData():void
        {
            var _local_2:String;
            var _local_3:int;
            var _local_4:AttackObject;
            var _local_5:String;
            if ((!(Main.DEBUG)))
            {
                return;
            };
            var _local_1:int;
            while (_local_1 < this.m_hitBoxManager.HitBoxAnimationList.length)
            {
                _local_2 = this.m_hitBoxManager.HitBoxAnimationList[_local_1].Name;
                _local_2 = ((_local_2) ? _local_2.substr((_local_2.indexOf("_") + 1)) : "");
                if (_local_2 != "item")
                {
                    _local_3 = 0;
                    while (_local_3 < this.m_hitBoxManager.HitBoxAnimationList[_local_1].AttackBoxes.length)
                    {
                        _local_4 = this.m_attackData.getAttack(_local_2);
                        if (((((Main.DEBUG) && (!(_local_2 == "star"))) && (_local_4)) && (!(_local_4.AttackBoxes[this.m_hitBoxManager.HitBoxAnimationList[_local_1].AttackBoxes[_local_3].Name]))))
                        {
                            _local_5 = "some object";
                            if ((this is Character))
                            {
                                _local_5 = Character(this).LinkageName;
                            }
                            else
                            {
                                if ((this is Projectile))
                                {
                                    _local_5 = Projectile(this).LinkageID;
                                }
                                else
                                {
                                    if ((this is Item))
                                    {
                                        _local_5 = Item(this).LinkageID;
                                    }
                                    else
                                    {
                                        if ((this is Enemy))
                                        {
                                            _local_5 = Enemy(this).LinkageID;
                                        };
                                    };
                                };
                            };
                            if (MenuController.debugConsole)
                            {
                                MenuController.debugConsole.alert((((((("Warning! Unstatted " + this.m_hitBoxManager.HitBoxAnimationList[_local_1].AttackBoxes[_local_3].Name) + " found on ") + _local_5) + "'s ") + _local_2) + " attack!"));
                            };
                        };
                        _local_3++;
                    };
                };
                _local_1++;
            };
        }

        public function hasHitBoxType(_arg_1:int):Boolean
        {
            if (_arg_1 == HitBoxSprite.HIT)
            {
                return (this.HasHitBox);
            };
            if (_arg_1 == HitBoxSprite.ATTACK)
            {
                return (this.HasAttackBox);
            };
            if (_arg_1 == HitBoxSprite.REVERSE)
            {
                return (this.HasReverseBox);
            };
            if (_arg_1 == HitBoxSprite.ABSORB)
            {
                return (this.HasAbsorbBox);
            };
            if (_arg_1 == HitBoxSprite.SHIELDATTACK)
            {
                return (this.HasShieldAttackBox);
            };
            if (_arg_1 == HitBoxSprite.SHIELDPROJECTILE)
            {
                return (this.HasShieldProjectileBox);
            };
            if (_arg_1 == HitBoxSprite.CAM)
            {
                return (this.HasCamBox);
            };
            if (_arg_1 == HitBoxSprite.GRAB)
            {
                return (this.HasGrabBox);
            };
            if (_arg_1 == HitBoxSprite.ITEM)
            {
                return (this.HasItemBox);
            };
            if (_arg_1 == HitBoxSprite.HAT)
            {
                return (this.HasHatBox);
            };
            if (_arg_1 == HitBoxSprite.TOUCH)
            {
                return (this.HasTouchBox);
            };
            if (_arg_1 == HitBoxSprite.RANGE)
            {
                return (this.HasRange);
            };
            if (_arg_1 == HitBoxSprite.HOMING)
            {
                return (this.HasHoming);
            };
            if (_arg_1 == HitBoxSprite.CATCH)
            {
                return (this.HasCatchBox);
            };
            if (_arg_1 == HitBoxSprite.COUNTER)
            {
                return (this.HasCounterBox);
            };
            if (_arg_1 == HitBoxSprite.PLOCK)
            {
                return (this.HasPLockBox);
            };
            return (false);
        }

        public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Object=null):void
        {
            var _local_5:*;
            var _local_4:Object = {"persistant":false};
            if ((!(_arg_3)))
            {
                _arg_3 = new Object();
            };
            for (_local_5 in _local_4)
            {
                if (_arg_3[_local_5] === undefined)
                {
                    _arg_3[_local_5] = _local_4[_local_5];
                };
            };
            this.m_eventManager.addEventListener(_arg_1, _arg_2);
            if ((!(_arg_3.persistent)))
            {
                this.m_tempEvents.push({
                    "type":_arg_1,
                    "listener":_arg_2,
                    "useCapture":false
                });
            };
        }

        public function removeEventListener(_arg_1:String, _arg_2:Function):void
        {
            this.m_eventManager.removeEventListener(_arg_1, _arg_2);
        }

        public function reactionShield(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            return (false);
        }

        public function reactionShieldAttack(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            return (false);
        }

        public function reactionShieldProjectile(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            return (false);
        }

        public function reactionAbsorb(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            return (false);
        }

        public function reactionGrab(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            return (false);
        }

        public function reactionReverse(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            return (false);
        }

        public function reactionClank(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            return (false);
        }

        public function reactionHit(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            return (false);
        }

        public function reactionCollide(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            return (false);
        }

        public function reactionCounter(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            return (false);
        }

        public function reactionTouch(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            return (false);
        }

        public function reactionRange(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            return (false);
        }

        public function reactionCatch(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            return (false);
        }

        public function setXSpeed(_arg_1:Number, _arg_2:Boolean=true):void
        {
            if (_arg_2)
            {
                this.m_xSpeed = _arg_1;
            }
            else
            {
                if (this.m_facingForward)
                {
                    this.m_xSpeed = ((_arg_1 > 0) ? Utils.fastAbs(_arg_1) : -(Utils.fastAbs(_arg_1)));
                }
                else
                {
                    this.m_xSpeed = ((_arg_1 < 0) ? Utils.fastAbs(_arg_1) : -(Utils.fastAbs(_arg_1)));
                };
            };
        }

        public function forceHitStun(_arg_1:int, _arg_2:Number=-1):void
        {
            this.startActionShot(_arg_1);
        }

        protected function checkHitStun():void
        {
            if (this.m_actionShot)
            {
                this.m_actionTimer--;
                this.m_hitStunTimer--;
                if (this.m_actionTimer < 0)
                {
                    if (this.m_paralysis)
                    {
                        this.m_actionShot = false;
                    }
                    else
                    {
                        this.stopActionShot();
                    };
                }
                else
                {
                    if (this.m_hitStunTimer <= 0)
                    {
                        this.m_hitStunTimer = 2;
                        this.m_hitStunToggle = (!(this.m_hitStunToggle));
                        this.m_attemptToMove(((this.m_hitStunToggle) ? 2 : -2), 0);
                    };
                };
            }
            else
            {
                if (this.m_paralysis)
                {
                    this.m_paralysisTimer--;
                    if (this.m_paralysisTimer < 0)
                    {
                        this.stopActionShot();
                    }
                    else
                    {
                        if (this.m_hitStunTimer <= 0)
                        {
                            this.m_hitStunTimer = 2;
                            this.m_hitStunToggle = (!(this.m_hitStunToggle));
                            this.m_attemptToMove(((this.m_hitStunToggle) ? 4 : -4), 0);
                        };
                    };
                };
            };
        }

        public function startActionShot(_arg_1:int, _arg_2:int=-1):void
        {
            if (_arg_1 > 0)
            {
                if ((!(this.m_actionShot)))
                {
                    if (this.HasStance)
                    {
                        this.Stance.stop();
                    };
                    this.m_actionShot = true;
                };
                this.m_actionTimer = _arg_1;
            };
            if ((((_arg_2 > 0) && (this.m_paralysisHitCount < 3)) && (this.m_maxParalysisTime.IsComplete)))
            {
                if ((!(this.m_paralysis)))
                {
                    if (this.HasStance)
                    {
                        this.Stance.stop();
                    };
                    this.m_paralysis = true;
                    this.m_paralysisHitCount = 1;
                    this.m_paralysisTimer = _arg_2;
                }
                else
                {
                    this.m_paralysisHitCount++;
                    if (this.m_paralysisHitCount >= 3)
                    {
                        this.stopActionShot();
                        return;
                    };
                };
            };
        }

        public function stopActionShot(_arg_1:Boolean=true, _arg_2:Boolean=true):void
        {
            if (((this.m_actionShot) && (_arg_1)))
            {
                this.m_actionShot = false;
                this.m_controlFrames();
            };
            if (((this.m_paralysis) && (_arg_2)))
            {
                this.m_paralysis = false;
                this.m_maxParalysisTime.reset();
                this.m_controlFrames();
            };
        }

        public function updateAttackStats(_arg_1:Object):void
        {
            this.m_attack.importAttackStateData(_arg_1);
        }

        public function getAttackStat(_arg_1:String):*
        {
            return (this.m_attack.getVar(_arg_1));
        }

        public function updateAttackBoxStats(_arg_1:int, _arg_2:Object):void
        {
            if (((_arg_2.damage) && (_arg_2.damage > 994)))
            {
                trace(1);
            };
            var _local_3:String = "attackBox";
            if (_arg_1 > 1)
            {
                _local_3 = (_local_3 + _arg_1);
            };
            this.m_attackData.setAttackBoxDataOverride(this.m_attack.Frame, _local_3, _arg_2);
        }

        public function getAttackBoxStat(_arg_1:int, _arg_2:String):*
        {
            var _local_3:String = "attackBox";
            if (_arg_1 > 1)
            {
                _local_3 = (_local_3 + _arg_1);
            };
            var _local_4:AttackDamage = this.m_attackData.getAttackBoxData(this.m_attack.Frame, _local_3).syncState(this.m_attack);
            return (_local_4.getVar(_arg_2));
        }

        public function refreshAttackID():void
        {
            this.m_attack.AttackID = Utils.getUID();
        }

        public function getHitBox(_arg_1:String):Object
        {
            var _local_4:String;
            var _local_5:int;
            var _local_6:Object;
            var _local_7:Array;
            var _local_8:HitBoxSprite;
            var _local_2:Array = _arg_1.match(/[a-zA-Z]+/g);
            var _local_3:Array = _arg_1.match(/[0-9]+/g);
            if (((!(_local_2)) || (!(_local_3))))
            {
                return (null);
            };
            _local_4 = _local_2[0];
            _local_5 = (parseInt(_local_3[0]) - 1);
            _local_6 = {};
            _local_6["attackBox"] = HitBoxSprite.ATTACK;
            _local_6["hitBox"] = HitBoxSprite.HIT;
            _local_6["grabBox"] = HitBoxSprite.GRAB;
            _local_6["touchBox"] = HitBoxSprite.TOUCH;
            _local_6["hand"] = HitBoxSprite.HAND;
            _local_6["range"] = HitBoxSprite.RANGE;
            _local_6["absorbBox"] = HitBoxSprite.ABSORB;
            _local_6["counterBox"] = HitBoxSprite.COUNTER;
            _local_6["shieldBox"] = HitBoxSprite.SHIELD;
            _local_6["shieldAttackBox"] = HitBoxSprite.SHIELDATTACK;
            _local_6["shieldProjectileBox"] = HitBoxSprite.SHIELDPROJECTILE;
            _local_6["reverseBox"] = HitBoxSprite.REVERSE;
            _local_6["catchBox"] = HitBoxSprite.CATCH;
            _local_6["ledgeBox"] = HitBoxSprite.LEDGE;
            _local_6["camBox"] = HitBoxSprite.CAM;
            _local_6["homing"] = HitBoxSprite.HOMING;
            _local_6["pLockBox"] = HitBoxSprite.PLOCK;
            _local_6["hatBox"] = HitBoxSprite.HAT;
            _local_6["itemBox"] = HitBoxSprite.ITEM;
            _local_6["eggBox"] = HitBoxSprite.EGG;
            _local_6["freezeBox"] = HitBoxSprite.FREEZE;
            _local_6["starBox"] = HitBoxSprite.STAR;
            if (_local_6[_local_4])
            {
                _local_7 = this.CurrentAnimation.getHitBoxes(this.CurrentFrameNum, _local_6[_local_4]);
                if (_local_5 < _local_7.length)
                {
                    _local_8 = _local_7[_local_5];
                    return ((this.m_facingForward) ? _local_8.BoundingBox : _local_8.FlippedBoundingBox);
                };
                return (null);
            };
            return (null);
        }

        public function getHomingTarget():InteractiveSprite
        {
            if (((this.m_attack) && (this.m_attack.HomingTarget)))
            {
                return (this.m_attack.HomingTarget);
            };
            return (null);
        }

        public function homeTowardsTarget(_arg_1:Number, _arg_2:InteractiveSprite):void
        {
            var _local_3:Number;
            if (((this.m_attack) && (_arg_2)))
            {
                _local_3 = Utils.getAngleBetween(new Point(this.m_sprite.x, this.m_sprite.y), new Point(_arg_2.X, _arg_2.Y));
                this.m_xSpeed = Utils.calculateXSpeed(_arg_1, _local_3);
                this.m_ySpeed = -(Utils.calculateYSpeed(_arg_1, _local_3));
                if (this.m_xSpeed > 0)
                {
                    this.m_faceRight();
                }
                else
                {
                    this.m_faceLeft();
                };
            };
        }

        protected function syncStats():void
        {
        }

        public function setYSpeed(_arg_1:Number):void
        {
            this.m_ySpeed = _arg_1;
            if (((_arg_1 < 0) && (this.m_collision.ground)))
            {
                this.unnattachFromGround();
            };
        }

        public function forceSetXSpeed(_arg_1:Number):void
        {
            this.m_xSpeed = _arg_1;
        }

        public function forceSetYSpeed(_arg_1:Number):void
        {
            this.m_ySpeed = _arg_1;
        }

        public function swapDepths(_arg_1:InteractiveSprite):void
        {
            if ((((!(_arg_1 == null)) && (_arg_1.MC.parent == this.m_sprite.parent)) && (!(this.m_sprite.parent == null))))
            {
                this.m_sprite.parent.swapChildren(_arg_1.MC, this.m_sprite);
            };
        }

        public function updateSelfPlatform():void
        {
            if (this.m_selfPlatform)
            {
                this.m_selfPlatform.storeOldLocation();
                this.m_selfPlatform.Container.x = this.m_sprite.x;
                this.m_selfPlatform.Container.y = this.m_sprite.y;
            };
        }

        public function recover(_arg_1:int):Boolean
        {
            return (false);
        }

        public function reverse(_arg_1:int, _arg_2:int, _arg_3:Boolean):Boolean
        {
            return (false);
        }

        public function stackAttackID(_arg_1:Number):void
        {
            this.m_lastAttackID[this.m_lastAttackIndex] = _arg_1;
            this.m_lastAttackIndex++;
            if (this.m_lastAttackIndex >= this.m_lastAttackID.length)
            {
                this.m_lastAttackIndex = 0;
            };
        }

        public function attackIDArrayContains(_arg_1:Number):Boolean
        {
            var _local_2:int;
            while (_local_2 < this.m_lastAttackID.length)
            {
                if (this.m_lastAttackID[_local_2] == _arg_1)
                {
                    return (true);
                };
                _local_2++;
            };
            return (false);
        }

        public function createSelfPlatform(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Boolean=true):void
        {
            this.removeSelfPlatform();
            var _local_6:MovieClip = new MovieClip();
            this.STAGE.addChild(_local_6);
            _local_6.graphics.beginFill(0xFF0000, 1);
            _local_6.graphics.drawRect(_arg_1, _arg_2, _arg_3, _arg_4);
            _local_6.graphics.endFill();
            _local_6.visible = false;
            this.m_selfPlatform = new MovingPlatform(_local_6, this.STAGEDATA);
            this.m_selfPlatform.SpriteOwner = this;
            if (_arg_5)
            {
                this.STAGEDATA.Terrains.push(this.m_selfPlatform);
            }
            else
            {
                this.STAGEDATA.Platforms.push(this.m_selfPlatform);
            };
            this.STAGEDATA.MovingPlatforms.push(this.m_selfPlatform);
            this.updateSelfPlatform();
        }

        public function createSelfPlatformWithMC(_arg_1:MovieClip, _arg_2:Boolean=true):void
        {
            this.removeSelfPlatform();
            this.STAGE.addChild(_arg_1);
            this.m_selfPlatform = new MovingPlatform(_arg_1, this.STAGEDATA);
            this.m_selfPlatform.SpriteOwner = this;
            if (_arg_2)
            {
                this.STAGEDATA.Terrains.push(this.m_selfPlatform);
            }
            else
            {
                this.STAGEDATA.Platforms.push(this.m_selfPlatform);
            };
            this.STAGEDATA.MovingPlatforms.push(this.m_selfPlatform);
        }

        public function pushBackSlightly(_arg_1:Boolean):void
        {
            this.stackKnockback(3, ((_arg_1) ? 0 : 180), this.m_xKnockback, this.m_yKnockback);
        }

        protected function m_convertForceToSpeed():void
        {
            this.m_xSpeed = (this.m_xSpeed + this.m_xKnockback);
            this.m_ySpeed = (this.m_ySpeed + this.m_yKnockback);
            this.m_xKnockback = 0;
            this.m_yKnockback = 0;
        }

        public function resetRotation():void
        {
            this.m_sprite.rotation = 0;
        }

        protected function resetKnockbackDecay():void
        {
            var _local_1:Number = Utils.getAngleBetween(new Point(0, 0), new Point(this.m_xKnockback, this.m_yKnockback));
            this.m_xKnockbackDecay = -(Utils.calculateXSpeed(this.m_weight2, _local_1));
            this.m_yKnockbackDecay = Utils.calculateYSpeed(this.m_weight2, _local_1);
        }

        protected function stackKnockback(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):void
        {
            var _local_5:Number = 0;
            var _local_6:Number = 0;
            var _local_7:Number = 0;
            var _local_8:Number = 0;
            _local_5 = (_arg_1 * Math.cos(((_arg_2 * Math.PI) / 180)));
            _local_6 = (-(_arg_1) * Math.sin(((_arg_2 * Math.PI) / 180)));
            if ((((_local_5 <= 0) && (_arg_3 >= 0)) || ((_local_5 >= 0) && (_arg_3 <= 0))))
            {
                _local_7 = (_local_5 + _arg_3);
            }
            else
            {
                if (Utils.fastAbs(_local_5) > Utils.fastAbs(_arg_3))
                {
                    _local_7 = _local_5;
                }
                else
                {
                    _local_7 = _arg_3;
                };
            };
            if ((((_local_6 <= 0) && (_arg_4 >= 0)) || ((_local_6 >= 0) && (_arg_4 <= 0))))
            {
                _local_8 = (_local_6 + _arg_4);
            }
            else
            {
                if (Utils.fastAbs(_local_6) > Utils.fastAbs(_arg_4))
                {
                    _local_8 = _local_6;
                }
                else
                {
                    _local_8 = _arg_4;
                };
            };
            var _local_9:Number = Utils.getAngleBetween(new Point(0, 0), new Point(_local_7, _local_8));
            var _local_10:Number = Utils.calculateSpeed(_local_7, _local_8);
            _arg_2 = _local_9;
            if (((this.m_knockbackStackingTimer.CurrentTime == 0) && (_local_10 < Utils.calculateSpeed(this.m_xKnockback, this.m_yKnockback))))
            {
                return;
            };
            this.m_xKnockback = (_local_10 * Math.cos(((_local_9 * Math.PI) / 180)));
            this.m_yKnockback = (-(_local_10) * Math.sin(((_local_9 * Math.PI) / 180)));
            this.resetKnockbackDecay();
            this.m_knockbackStackingTimer.reset();
        }

        protected function move():void
        {
            this.applyGroundInfluence();
            this.m_sprite.x = (this.m_sprite.x + this.m_xSpeed);
            this.m_sprite.y = (this.m_sprite.y + this.m_ySpeed);
        }

        protected function gravity():void
        {
            if (((!(this.m_collision.ground)) && (this.m_ySpeed < this.m_max_ySpeed)))
            {
                this.m_ySpeed = (this.m_ySpeed + this.m_gravity);
            };
        }

        public function decel(_arg_1:Number):void
        {
            var _local_2:Boolean;
            var _local_3:Boolean;
            if (this.m_xSpeed == 0)
            {
                return;
            };
            if ((!(this.m_collision.ground)))
            {
                if (_arg_1 >= 0)
                {
                    this.m_xSpeed = (this.m_xSpeed * _arg_1);
                }
                else
                {
                    _local_2 = (this.m_xSpeed > 0);
                    this.m_xSpeed = (this.m_xSpeed - ((this.m_xSpeed > 0) ? Utils.fastAbs(_arg_1) : -(Utils.fastAbs(_arg_1))));
                    if ((((_local_2) && (this.m_xSpeed < 0)) || ((!(_local_2)) && (this.m_xSpeed > 0))))
                    {
                        this.m_xSpeed = 0;
                    };
                };
                if (Utils.fastAbs(this.m_xSpeed) < 0.5)
                {
                    this.m_xSpeed = 0;
                };
            }
            else
            {
                if (_arg_1 >= 0)
                {
                    this.m_xSpeed = (this.m_xSpeed * ((this.m_xSpeed != 0) ? (((!(this.m_currentPlatform == null)) && (!(this.m_currentPlatform.decel_friction == 1))) ? (this.m_currentPlatform.decel_friction * _arg_1) : _arg_1) : 0));
                }
                else
                {
                    if (this.m_currentPlatform != null)
                    {
                        _arg_1 = (_arg_1 * this.m_currentPlatform.decel_friction);
                    };
                    _local_3 = (this.m_xSpeed > 0);
                    this.m_xSpeed = (this.m_xSpeed - ((this.m_xSpeed > 0) ? Utils.fastAbs(_arg_1) : -(Utils.fastAbs(_arg_1))));
                    if ((((_local_3) && (this.m_xSpeed < 0)) || ((!(_local_3)) && (this.m_xSpeed > 0))))
                    {
                        this.m_xSpeed = 0;
                    };
                };
                if (Utils.fastAbs(this.m_xSpeed) < 0.5)
                {
                    this.m_xSpeed = 0;
                };
            };
            if (Utils.fastAbs(this.m_xSpeed) < 0.5)
            {
                this.m_xSpeed = 0;
            };
        }

        public function decel_air(_arg_1:Number):void
        {
            var _local_2:Boolean;
            var _local_3:Boolean;
            if (this.m_ySpeed == 0)
            {
                return;
            };
            if ((!(this.m_collision.ground)))
            {
                if (_arg_1 >= 0)
                {
                    this.m_ySpeed = (this.m_ySpeed * _arg_1);
                }
                else
                {
                    _local_2 = (this.m_ySpeed < 0);
                    this.m_ySpeed = (this.m_ySpeed - ((this.m_ySpeed > 0) ? Utils.fastAbs(_arg_1) : -(Utils.fastAbs(_arg_1))));
                    if ((((_local_2) && (this.m_ySpeed > 0)) || ((!(_local_2)) && (this.m_ySpeed < 0))))
                    {
                        this.m_ySpeed = 0;
                    };
                };
                if (Utils.fastAbs(this.m_ySpeed) < 0.5)
                {
                    this.m_ySpeed = 0;
                };
            }
            else
            {
                if (this.m_ySpeed > 0)
                {
                    this.m_ySpeed = 0;
                }
                else
                {
                    if (_arg_1 >= 0)
                    {
                        this.m_ySpeed = (this.m_ySpeed * ((this.m_ySpeed != 0) ? (((!(this.m_currentPlatform == null)) && (!(this.m_currentPlatform.decel_friction == 1))) ? (this.m_currentPlatform.decel_friction * _arg_1) : _arg_1) : 0));
                    }
                    else
                    {
                        if (this.m_currentPlatform != null)
                        {
                            _arg_1 = (_arg_1 * this.m_currentPlatform.decel_friction);
                        };
                        _local_3 = (this.m_ySpeed < 0);
                        this.m_ySpeed = (this.m_ySpeed - ((this.m_ySpeed > 0) ? Utils.fastAbs(_arg_1) : -(Utils.fastAbs(_arg_1))));
                        if ((((_local_3) && (this.m_ySpeed < 0)) || ((!(_local_3)) && (this.m_ySpeed > 0))))
                        {
                            this.m_ySpeed = 0;
                        };
                    };
                    if (Utils.fastAbs(this.m_ySpeed) < 0.5)
                    {
                        this.m_ySpeed = 0;
                    };
                };
            };
            if (Utils.fastAbs(this.m_ySpeed) < 0.5)
            {
                this.m_ySpeed = 0;
            };
        }

        public function netXSpeed(_arg_1:Boolean=false, _arg_2:Boolean=false):Number
        {
            var _local_3:Number = 0;
            if ((!(_arg_1)))
            {
                _local_3 = (_local_3 + this.m_xSpeed);
            };
            return (_local_3);
        }

        public function netYSpeed(_arg_1:Boolean=false, _arg_2:Boolean=false):Number
        {
            var _local_3:Number = 0;
            if ((!(_arg_1)))
            {
                _local_3 = (_local_3 + this.m_ySpeed);
            };
            return (_local_3);
        }

        public function netSpeed(_arg_1:Boolean=false, _arg_2:Boolean=false):Number
        {
            return (Utils.getDistance(new Point(), new Point(this.netXSpeed(_arg_1, _arg_2), this.netYSpeed(_arg_1, _arg_2))));
        }

        protected function applyGroundInfluence():void
        {
            if (((this.m_currentPlatform) && (this.m_currentPlatform.x_influence)))
            {
                this.m_attemptToMove(this.m_currentPlatform.x_influence, 0);
            };
        }

        protected function checkPlatformBounce():void
        {
        }

        protected function validateBypass(_arg_1:AttackDamage):Boolean
        {
            return (false);
        }

        public function validateOnlyAffects(_arg_1:AttackDamage):Boolean
        {
            if (((_arg_1.OnlyAffectsAir) && (this.m_collision.ground)))
            {
                return (false);
            };
            if (((_arg_1.OnlyAffectsGround) && (!(this.m_collision.ground))))
            {
                return (false);
            };
            if (((_arg_1.OnlyAffectsFall) && (!((!(this.m_collision.ground)) && (this.netYSpeed() >= 0)))))
            {
                return (false);
            };
            return (true);
        }

        protected function removeSelfPlatform():void
        {
            var _local_1:int;
            if (this.m_selfPlatform)
            {
                this.m_selfPlatform.SpriteOwner = null;
                _local_1 = this.STAGEDATA.Terrains.indexOf(this.m_selfPlatform);
                if (_local_1 >= 0)
                {
                    this.STAGEDATA.Terrains.splice(_local_1, 1);
                };
                _local_1 = this.STAGEDATA.Platforms.indexOf(this.m_selfPlatform);
                if (_local_1 >= 0)
                {
                    this.STAGEDATA.Platforms.splice(_local_1, 1);
                };
                _local_1 = this.STAGEDATA.MovingPlatforms.indexOf(this.m_selfPlatform);
                if (_local_1 >= 0)
                {
                    this.STAGEDATA.MovingPlatforms.splice(_local_1, 1);
                };
                if (((this.m_selfPlatform) && (this.m_selfPlatform.Container.parent)))
                {
                    this.m_selfPlatform.Container.parent.removeChild(this.m_selfPlatform.Container);
                };
            };
        }

        protected function attachToGround():Boolean
        {
            var _local_2:int;
            if ((!(this.m_currentPlatform)))
            {
                return (false);
            };
            var _local_1:Boolean = true;
            var _local_3:int;
            _local_2 = (this.m_sprite.y + 20);
            while (((this.m_sprite.y < _local_2) && (!(this.testGroundWithCoord(this.m_sprite.x, this.m_sprite.y)))))
            {
                this.m_sprite.y++;
            };
            if ((!(this.testGroundWithCoord(this.m_sprite.x, this.m_sprite.y))))
            {
                this.m_sprite.y = (_local_2 - 20);
            };
            if (((!(this.m_currentPlatform == null)) && (this.netYSpeed() >= 0)))
            {
                _local_3 = 0;
                while (((this.testGroundWithCoord(this.m_sprite.x, this.m_sprite.y)) && (!(this.m_currentPlatform.fallthrough == true))))
                {
                    this.m_sprite.y = (this.m_sprite.y - (1 / 4));
                    _local_3 = int((_local_3 + (1 / 4)));
                };
                if (_local_3 >= ((this.STAGEDATA.Terrains.indexOf(this.m_currentPlatform) >= 0) ? 40 : 10))
                {
                    this.m_sprite.y = (this.m_sprite.y + _local_3);
                    _local_1 = false;
                };
            }
            else
            {
                _local_1 = false;
            };
            return (_local_1);
        }

        protected function attachToGroundTest(_arg_1:Number, _arg_2:Number):Boolean
        {
            var _local_3:Number = this.m_sprite.x;
            var _local_4:Number = this.m_sprite.y;
            this.m_sprite.x = _arg_1;
            this.m_sprite.y = _arg_2;
            var _local_5:Boolean = this.attachToGround();
            this.m_sprite.x = _local_3;
            this.m_sprite.y = _local_4;
            return (_local_5);
        }

        public function willFallOffRange(_arg_1:Number, _arg_2:Number, _arg_3:int=5, _arg_4:int=85):Boolean
        {
            var _local_6:Number;
            _arg_4 = (90 - _arg_4);
            var _local_5:int = -(_arg_3);
            while (_local_5 < _arg_3)
            {
                if (this.testGroundWithCoord(_arg_1, (_arg_2 + _local_5)))
                {
                    _local_6 = Utils.getAngleBetween(new Point(this.m_sprite.x, this.m_sprite.y), new Point(_arg_1, (_arg_2 + _local_5)));
                    if (!(((_local_6 >= (90 - _arg_4)) && (_local_6 <= (90 + _arg_4))) || ((_local_6 >= (270 - _arg_4)) && (_local_6 <= (270 + _arg_4)))))
                    {
                        return (false);
                    };
                };
                _local_5++;
            };
            return (true);
        }

        protected function testCoordCollision(_arg_1:Number, _arg_2:Number):Boolean
        {
            if (((((!(this.m_currentPlatform == null)) && (this.m_currentPlatform.hitTestPoint(_arg_1, (_arg_2 + 1), true))) && (!(this.m_currentPlatform.fallthrough == true))) && (!((this.OnPlatform) && (this.netYSpeed() < 0)))))
            {
                return (true);
            };
            return (false);
        }

        protected function testAbsCoordCollision(_arg_1:Number, _arg_2:Number):Boolean
        {
            if (((((!(this.m_currentPlatform == null)) && (this.m_currentPlatform.hitTestPoint(_arg_1, (_arg_2 + 1), true))) && (!(this.m_currentPlatform.fallthrough == true))) && (!((this.OnPlatform) && (this.netYSpeed() < 0)))))
            {
                return (true);
            };
            return (false);
        }

        public function testGroundWithCoord(_arg_1:Number, _arg_2:Number):Platform
        {
            var _local_4:Platform;
            var _local_3:int;
            _local_3 = 0;
            while (((_local_3 < this.m_terrains.length) && (((!(this.m_terrains[_local_3].hitTestPoint(_arg_1, _arg_2, true))) || (this.m_terrains[_local_3].fallthrough == true)) || (this.m_selfPlatform == this.m_terrains[_local_3]))))
            {
                _local_3++;
            };
            if (((_local_3 < this.m_terrains.length) && (this.m_terrains[_local_3].hitTestPoint(_arg_1, _arg_2, true))))
            {
                _local_4 = this.testPlatformWithCoord(_arg_1, _arg_2);
                if (_local_4)
                {
                    return (_local_4);
                };
                return (this.m_terrains[_local_3]);
            };
            _local_3 = 0;
            while (((_local_3 < this.m_platforms.length) && (((!(this.m_platforms[_local_3].hitTestPoint(_arg_1, _arg_2, true))) || (this.m_platforms[_local_3].fallthrough == true)) || (this.m_selfPlatform == this.m_platforms[_local_3]))))
            {
                _local_3++;
            };
            if ((((_local_3 < this.m_platforms.length) && (this.m_platforms[_local_3].hitTestPoint(_arg_1, _arg_2, true))) && (this.netYSpeed() >= 0)))
            {
                return (this.m_platforms[_local_3]);
            };
            return (null);
        }

        public function testTerrainWithCoord(_arg_1:Number, _arg_2:Number):Platform
        {
            var _local_3:int;
            _local_3 = 0;
            while (((_local_3 < this.m_terrains.length) && (((!(this.m_terrains[_local_3].hitTestPoint(_arg_1, _arg_2, true))) || (this.m_terrains[_local_3].fallthrough == true)) || (this.m_selfPlatform == this.m_terrains[_local_3]))))
            {
                _local_3++;
            };
            if (((_local_3 < this.m_terrains.length) && (this.m_terrains[_local_3].hitTestPoint(_arg_1, _arg_2, true))))
            {
                return (this.m_terrains[_local_3]);
            };
            return (null);
        }

        public function testPlatformWithCoord(_arg_1:Number, _arg_2:Number):Platform
        {
            var _local_3:int;
            _local_3 = 0;
            while (((_local_3 < this.m_platforms.length) && (((!(this.m_platforms[_local_3].hitTestPoint(_arg_1, _arg_2, true))) || (this.m_platforms[_local_3].fallthrough == true)) || (this.m_selfPlatform == this.m_platforms[_local_3]))))
            {
                _local_3++;
            };
            if ((((_local_3 < this.m_platforms.length) && (this.m_platforms[_local_3].hitTestPoint(_arg_1, _arg_2, true))) && (this.netYSpeed() >= 0)))
            {
                return (this.m_platforms[_local_3]);
            };
            return (null);
        }

        protected function testAbsCoordinates(_arg_1:Number, _arg_2:Number):Boolean
        {
            var _local_3:int;
            _local_3 = 0;
            while (((_local_3 < this.m_terrains.length) && (((!(this.m_terrains[_local_3].hitTestPoint(_arg_1, _arg_2, true))) || (this.m_terrains[_local_3].fallthrough == true)) || (this.m_selfPlatform == this.m_terrains[_local_3]))))
            {
                _local_3++;
            };
            if (((_local_3 < this.m_terrains.length) && (this.m_terrains[_local_3].hitTestPoint(_arg_1, _arg_2, true))))
            {
                return (true);
            };
            return (false);
        }

        public function testCoordinates(_arg_1:Number, _arg_2:Number):Platform
        {
            var _local_3:int;
            _local_3 = 0;
            while (((_local_3 < this.m_terrains.length) && ((!(this.m_terrains[_local_3].hitTestPoint(_arg_1, _arg_2, true))) || (this.m_selfPlatform == this.m_terrains[_local_3]))))
            {
                _local_3++;
            };
            if (((_local_3 < this.m_terrains.length) && (this.m_terrains[_local_3].hitTestPoint(_arg_1, _arg_2, true))))
            {
                return (this.m_terrains[_local_3]);
            };
            _local_3 = 0;
            while (((_local_3 < this.m_platforms.length) && ((!(this.m_platforms[_local_3].hitTestPoint(_arg_1, _arg_2, true))) || (this.m_selfPlatform == this.m_platforms[_local_3]))))
            {
                _local_3++;
            };
            if (((_local_3 < this.m_platforms.length) && (this.m_platforms[_local_3].hitTestPoint(_arg_1, _arg_2, true))))
            {
                return (this.m_platforms[_local_3]);
            };
            return (null);
        }

        public function checkLinearPath(_arg_1:InteractiveSprite):Boolean
        {
            return (this.checkLinearPathBetweenPoints(new Point(this.X, this.Y), new Point(_arg_1.X, _arg_1.Y)));
        }

        public function checkLinearPathBetweenPoints(_arg_1:Point, _arg_2:Point, _arg_3:Boolean=true, _arg_4:Platform=null):Boolean
        {
            return (this.getPlatformBetweenPoints(_arg_1, _arg_2, _arg_3, _arg_4) == null);
        }

        public function getPlatformBetweenPoints(_arg_1:Point, _arg_2:Point, _arg_3:Boolean=true, _arg_4:Platform=null):Platform
        {
            var _local_5:Number = _arg_1.x;
            var _local_6:Number = _arg_1.y;
            var _local_7:Number = _arg_1.x;
            var _local_8:Number = _arg_1.y;
            var _local_9:Number = (_arg_2.x - _arg_1.x);
            var _local_10:Number = (_arg_2.y - _arg_1.y);
            var _local_11:Number = ((Math.abs(_local_9) + Math.abs(_local_10)) / 10);
            var _local_12:Platform = _arg_4;
            var _local_13:int;
            while (_local_13 < Math.floor(_local_11))
            {
                if (((((_arg_4) && (_arg_4.hitTestPoint((_local_7 + (_local_9 / _local_11)), (_local_8 + (_local_10 / _local_11))))) || (((_arg_3) && (_arg_4 == null)) && (_local_12 = this.testTerrainWithCoord((_local_7 + (_local_9 / _local_11)), (_local_8 + (_local_10 / _local_11)))))) || (((!(_arg_3)) && (_arg_4 == null)) && (_local_12 = this.testGroundWithCoord((_local_7 + (_local_9 / _local_11)), (_local_8 + (_local_10 / _local_11)))))))
                {
                    return (_local_12);
                };
                _local_7 = (_local_7 + (_local_9 / _local_11));
                _local_8 = (_local_8 + (_local_10 / _local_11));
                _local_13++;
            };
            return (null);
        }

        protected function pushOutOfGround():void
        {
            var _local_1:int = 50;
            var _local_2:int;
            while (((_local_2 < _local_1) && (this.testTerrainWithCoord(this.m_sprite.x, this.m_sprite.y))))
            {
                this.m_sprite.y--;
                _local_2++;
            };
            if (_local_2 >= _local_1)
            {
                this.m_sprite.y = (this.m_sprite.y + _local_2);
            };
        }

        protected function m_groundCollisionTest():void
        {
            if (((this.m_collision.ground) && ((!(this.m_ySpeed)) < 0)))
            {
                this.attachToGround();
            };
            var _local_1:Boolean = (!((this.m_currentPlatform = this.testGroundWithCoord(this.m_sprite.x, (this.m_sprite.y + 1))) == null));
            this.m_collision.ground = _local_1;
            if (this.m_collision.ground)
            {
                this.attachToGround();
            };
            if (this.m_collision.ground)
            {
                this.attachToGround();
            };
        }

        public function m_attemptToMove(_arg_1:Number, _arg_2:Number):void
        {
            var _local_3:int;
            var _local_4:Point;
            var _local_5:Platform;
            var _local_6:Boolean;
            var _local_7:int;
            if ((!((_arg_1 == 0) && (_arg_2 == 0))))
            {
                _local_3 = 0;
                this.m_collision.leftSide = (((_arg_1 < 0) && (this.m_collision.ground)) && (this.testTerrainWithCoord(((this.m_sprite.x + _arg_1) - (this.m_width / 2)), ((this.m_sprite.y + _arg_2) - 25))));
                this.m_collision.rightSide = (((_arg_1 > 0) && (this.m_collision.ground)) && (this.testTerrainWithCoord(((this.m_sprite.x + _arg_1) + (this.m_width / 2)), ((this.m_sprite.y + _arg_2) - 25))));
                if ((!(this.m_collision.ground)))
                {
                    _local_4 = this.Location.clone();
                    _local_5 = this.moveSprite(_arg_1, _arg_2);
                    _local_6 = (!(_local_5 == null));
                    if ((((this.m_collision.rightSide) && (_arg_1 > 0)) || ((this.m_collision.leftSide) && (_arg_1 < 0))))
                    {
                        this.m_sprite.x = _local_4.x;
                    };
                    if (((_local_6) && (_arg_2 >= 0)))
                    {
                        this.m_groundCollisionTest();
                    };
                }
                else
                {
                    _local_7 = (((Utils.fastAbs(_arg_1) >= 10) || (Utils.fastAbs(_arg_2) >= 10)) ? 10 : 1);
                    _arg_1 = (_arg_1 / _local_7);
                    _arg_2 = (_arg_2 / _local_7);
                    _local_3 = 0;
                    while (_local_3 < _local_7)
                    {
                        this.m_collision.leftSide = (((_arg_1 < 0) && (this.m_collision.ground)) && (this.testTerrainWithCoord(((this.m_sprite.x + _arg_1) - (this.m_width / 2)), ((this.m_sprite.y + _arg_2) - 35))));
                        this.m_collision.rightSide = (((_arg_1 > 0) && (this.m_collision.ground)) && (this.testTerrainWithCoord(((this.m_sprite.x + _arg_1) + (this.m_width / 2)), ((this.m_sprite.y + _arg_2) - 35))));
                        if (_arg_2 < 0)
                        {
                            this.m_sprite.y = (this.m_sprite.y + _arg_2);
                        };
                        this.m_sprite.x = (this.m_sprite.x + ((!(((this.m_collision.rightSide) && (_arg_1 > 0)) || ((this.m_collision.leftSide) && (_arg_1 < 0)))) ? _arg_1 : 0));
                        if (((_arg_2 > 0) && (!(this.testTerrainWithCoord(this.m_sprite.x, (this.m_sprite.y + _arg_2))))))
                        {
                            this.m_sprite.y = (this.m_sprite.y + _arg_2);
                        };
                        if (((!(this.m_collision.leftSide)) && (!(this.m_collision.rightSide))))
                        {
                            this.attachToGround();
                        };
                        if ((((Utils.fastAbs(_arg_1) > 10) || (Utils.fastAbs(_arg_2) > 10)) && (this.checkExtraHitTests(0, 0))))
                        {
                            return;
                        };
                        _local_3++;
                    };
                };
            };
        }

        public function safeMove(_arg_1:Number, _arg_2:Number):Boolean
        {
            return (!(this.moveSprite(_arg_1, _arg_2) == null));
        }

        protected function moveSprite(_arg_1:Number, _arg_2:Number, _arg_3:int=5):Platform
        {
            this.m_hitPlatform = null;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Number = Utils.fastAbs(_arg_1);
            var _local_7:Number = Utils.fastAbs(_arg_2);
            var _local_8:Platform;
            var _local_9:int = _arg_3;
            if (((_arg_3 == 0) || ((_arg_1 == 0) && (_arg_2 == 0))))
            {
                return (_local_8);
            };
            if (_local_6 > _local_7)
            {
                _arg_3 = int(Math.max(_arg_3, (_local_6 / _arg_3)));
            }
            else
            {
                _arg_3 = int(Math.max(_arg_3, (_local_7 / _arg_3)));
            };
            var _local_10:Number = this.m_sprite.x;
            var _local_11:Number = this.m_sprite.y;
            var _local_12:Number = _local_10;
            var _local_13:Number = _local_11;
            var _local_14:Number = 0;
            var _local_15:Number = 0;
            if (_arg_1 > 0)
            {
                _local_14 = ((-(this.m_width) * this.m_sizeRatio) / 2);
                _local_12 = (_local_12 + ((this.m_width * this.m_sizeRatio) / 2));
            }
            else
            {
                if (_arg_1 < 0)
                {
                    _local_14 = ((this.m_width * this.m_sizeRatio) / 2);
                    _local_12 = (_local_12 - ((this.m_width * this.m_sizeRatio) / 2));
                };
            };
            if (_arg_2 == 0)
            {
                _local_15 = ((this.m_height * this.m_sizeRatio) / 2);
                _local_13 = (_local_13 - ((this.m_height * this.m_sizeRatio) / 2));
            }
            else
            {
                if (_arg_2 < 0)
                {
                    _local_15 = (this.m_height * this.m_sizeRatio);
                    _local_13 = (_local_13 - (this.m_height * this.m_sizeRatio));
                };
            };
            var _local_16:Number = (_arg_1 / _arg_3);
            var _local_17:Number = (_arg_2 / _arg_3);
            var _local_18:Boolean;
            _local_4 = 0;
            for (;_local_4 < (_arg_3 - 1);_local_4++)
            {
                if ((_local_8 = this.testGroundWithCoord((_local_12 + _local_16), (_local_13 + _local_17))))
                {
                    if ((((_arg_2 < 0) || (_arg_2 == 0)) && (this.STAGEDATA.Platforms.indexOf(_local_8) >= 0)))
                    {
                        _local_8 = null;
                        continue;
                    };
                    break;
                };
                if (((_local_6 > 10) || (_local_7 > 10)))
                {
                    if (this.checkExtraHitTests(((_local_12 + _local_14) - _local_10), ((_local_13 + _local_15) - _local_11)))
                    {
                        return (null);
                    };
                };
                _local_12 = (_local_12 + _local_16);
                _local_13 = (_local_13 + _local_17);
            };
            _arg_3 = _local_9;
            _local_16 = (_local_16 / _arg_3);
            _local_17 = (_local_17 / _arg_3);
            _local_18 = false;
            _local_4 = 0;
            for (;((_local_4 < _arg_3) && (!(_local_18)));_local_4++)
            {
                if ((_local_8 = this.testGroundWithCoord((_local_12 + _local_16), (_local_13 + _local_17))))
                {
                    if ((((_arg_2 < 0) || (_arg_2 == 0)) && (this.STAGEDATA.Platforms.indexOf(_local_8) >= 0)))
                    {
                        _local_8 = null;
                        continue;
                    };
                    break;
                };
                if (((_local_6 > 10) || (_local_7 > 10)))
                {
                    if (this.checkExtraHitTests(((_local_12 + _local_14) - _local_10), ((_local_13 + _local_15) - _local_11)))
                    {
                        return (null);
                    };
                };
                _local_12 = (_local_12 + _local_16);
                _local_13 = (_local_13 + _local_17);
            };
            if (((_local_8 == null) && (!(this.testTerrainWithCoord((_local_10 + _arg_1), (_local_11 + _arg_2))))))
            {
                this.m_sprite.x = (_local_10 + _arg_1);
                this.m_sprite.y = (_local_11 + _arg_2);
            }
            else
            {
                this.m_sprite.x = (_local_12 + _local_14);
                this.m_sprite.y = (_local_13 + _local_15);
            };
            this.m_collisionPoint.x = (_local_12 - _local_14);
            this.m_collisionPoint.y = (_local_13 - _local_15);
            this.m_hitPlatform = _local_8;
            return (_local_8);
        }

        protected function getCollisionQuadrants(_arg_1:Number):Object
        {
            return ({
                "left":((_arg_1 < 225) && (_arg_1 > 135)),
                "right":(((_arg_1 < 45) && (_arg_1 >= 0)) || ((_arg_1 <= 360) && (_arg_1 > 315))),
                "top":((_arg_1 >= 45) && (_arg_1 >= 135)),
                "bottom":((_arg_1 >= 225) && (_arg_1 <= 315))
            });
        }

        protected function checkExtraHitTests(_arg_1:Number, _arg_2:Number):Boolean
        {
            var _local_5:MovingPlatform;
            var _local_6:Item;
            var _local_3:int;
            var _local_4:Vector.<MovingPlatform> = this.STAGEDATA.MovingPlatforms;
            _local_3 = 0;
            while (_local_3 < _local_4.length)
            {
                _local_5 = _local_4[_local_3];
                if (((_local_5) && (_local_5.extraHitTests(_arg_1, _arg_2, this))))
                {
                    return (true);
                };
                _local_3++;
            };
            _local_3 = 0;
            while (_local_3 < this.STAGEDATA.ItemsRef.ItemsInUse.length)
            {
                _local_6 = this.STAGEDATA.ItemsRef.ItemsInUse[_local_3];
                if (((_local_6) && (_local_6.extraHitTests(_arg_1, _arg_2, this))))
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        public function extraHitTests(_arg_1:Number, _arg_2:Number, _arg_3:InteractiveSprite=null):Boolean
        {
            return (false);
        }

        public function checkMovingPlatforms(_arg_1:MovingPlatform):void
        {
            var _local_2:Number;
            var _local_3:Number;
            if ((((this.m_collision.ground) && (!(this.m_currentPlatform == null))) && (this.m_currentPlatform == _arg_1)))
            {
                _local_2 = (_arg_1.X - _arg_1.PreviousX);
                _local_3 = (_arg_1.Y - _arg_1.PreviousY);
                this.m_sprite.x = (this.m_sprite.x + _local_2);
                this.m_sprite.y = (this.m_sprite.y + _local_3);
            };
        }

        public function faceLeft():void
        {
            this.m_faceLeft();
        }

        public function faceRight():void
        {
            this.m_faceRight();
        }

        public function isFacingRight():Boolean
        {
            return (this.m_facingForward);
        }

        public function isCloseToGround():Boolean
        {
            return ((this.m_collision.ground) || (this.testGroundWithCoord(this.m_sprite.x, (this.m_sprite.y + 10))));
        }

        public function isOnGround():Boolean
        {
            return (this.m_collision.ground);
        }

        public function getCounterAttackBoxStats():Object
        {
            return (this.m_counterAttackData);
        }

        public function flip():void
        {
            if (this.m_facingForward)
            {
                this.m_faceLeft();
            }
            else
            {
                this.m_faceRight();
            };
        }

        public function addToCamera():void
        {
            this.STAGEDATA.CamRef.addTarget(this.m_sprite);
        }

        public function removeFromCamera():void
        {
            this.STAGEDATA.CamRef.deleteTarget(this.m_sprite);
        }

        protected function m_faceRight():void
        {
            this.m_sprite.scaleX = Math.abs(this.m_sprite.scaleX);
            this.m_facingForward = true;
            if (this.m_attack)
            {
                this.m_attack.IsForward = true;
            };
        }

        protected function m_faceLeft():void
        {
            this.m_sprite.scaleX = -(Math.abs(this.m_sprite.scaleX));
            this.m_facingForward = false;
            if (this.m_attack)
            {
                this.m_attack.IsForward = false;
            };
        }

        public function setGravity(_arg_1:Number):void
        {
            this.m_gravity = _arg_1;
        }

        public function setCamBoxSize(_arg_1:Number, _arg_2:Number, _arg_3:Number=0, _arg_4:Number=0):void
        {
            this.m_sprite.cam_width = _arg_1;
            this.m_sprite.cam_height = _arg_2;
            this.m_sprite.cam_x_offset = _arg_3;
            this.m_sprite.cam_y_offset = _arg_4;
        }

        public function camFocus(_arg_1:int):void
        {
            this.CAM.addZoomFocus(this.m_sprite, _arg_1);
        }

        public function camUnfocus():void
        {
            this.CAM.removeZoomFocus(this.m_sprite);
        }

        public function setGlobalVariable(_arg_1:String, _arg_2:*):void
        {
            this.m_globalVariables[_arg_1] = _arg_2;
        }

        public function getGlobalVariable(_arg_1:String):*
        {
            return ((this.m_globalVariables[_arg_1] == undefined) ? null : this.m_globalVariables[_arg_1]);
        }

        public function getRotation():Number
        {
            return (this.m_sprite.rotation);
        }

        public function setRotation(_arg_1:Number):void
        {
            this.m_sprite.rotation = _arg_1;
        }

        public function getWidth():Number
        {
            return (this.m_width);
        }

        public function getHeight():Number
        {
            return (this.m_height);
        }

        public function setWidth(_arg_1:Number):void
        {
            this.m_width = _arg_1;
        }

        public function setHeight(_arg_1:Number):void
        {
            this.m_height = _arg_1;
        }

        public function getXSpeed():Number
        {
            return (this.m_xSpeed);
        }

        public function getYSpeed():Number
        {
            return (this.m_ySpeed);
        }

        public function getX():Number
        {
            return (this.m_sprite.x);
        }

        public function setX(_arg_1:Number):void
        {
            this.m_sprite.x = _arg_1;
        }

        public function getY():Number
        {
            return (this.m_sprite.y);
        }

        public function setY(_arg_1:Number):void
        {
            this.m_sprite.y = _arg_1;
        }

        public function getXScale():Number
        {
            return (this.CurrentScale.x);
        }

        public function getYScale():Number
        {
            return (this.CurrentScale.y);
        }

        public function playFrame(_arg_1:String):void
        {
            if ((!(this.currentFrameIs(_arg_1))))
            {
                Utils.tryToGotoAndStop(this.m_sprite, _arg_1);
            };
        }

        public function stancePlayFrame(_arg_1:*):void
        {
            if (this.HasStance)
            {
                if (this.m_sprite.stance.xframe != null)
                {
                    this.m_sprite.stance.xframe = _arg_1;
                };
                Utils.tryToGotoAndStop(this.m_sprite.stance, _arg_1);
            };
        }

        protected function getStanceVar(_arg_1:String, _arg_2:*):Boolean
        {
            if ((((this.HasStance) && (!(this.m_sprite.stance[_arg_1] == null))) && (this.m_sprite.stance[_arg_1] == _arg_2)))
            {
                return (true);
            };
            return (false);
        }

        public function currentFrameIs(_arg_1:String):Boolean
        {
            return ((((!(this.m_sprite.xframe == null)) && (this.m_sprite.xframe == _arg_1)) || ((this.m_sprite.xframe == null) && (this.m_sprite.currentLabel == _arg_1))) ? true : false);
        }

        protected function setBrightness(_arg_1:Number):void
        {
            if (Math.abs(_arg_1) > 100)
            {
                _arg_1 = ((_arg_1 > 0) ? 100 : -100);
            };
            var _local_2:Number = this.m_sprite.alpha;
            var _local_3:ColorTransform = new ColorTransform();
            _local_3.redOffset = (_arg_1 * 2.55);
            _local_3.greenOffset = (_arg_1 * 2.55);
            _local_3.blueOffset = (_arg_1 * 2.55);
            this.m_sprite.transform.colorTransform = _local_3;
            this.m_sprite.alpha = _local_2;
        }

        public function setPosition(_arg_1:Number, _arg_2:Number):void
        {
            this.m_sprite.x = _arg_1;
            this.m_sprite.y = _arg_2;
        }

        protected function setTint(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number, _arg_8:Number):void
        {
            Utils.setTint(this.m_sprite, _arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8);
        }

        public function getMC():MovieClip
        {
            return (this.m_sprite);
        }

        public function getStanceMC():MovieClip
        {
            return ((this.HasStance) ? this.m_sprite.stance : null);
        }

        public function getScale():Point
        {
            return (this.CurrentScale);
        }

        public function setScale(_arg_1:Number, _arg_2:Number):void
        {
            this.m_sprite.scaleX = _arg_1;
            this.m_sprite.scaleY = _arg_2;
        }

        public function getID():int
        {
            return (this.m_player_id);
        }

        public function setVisibility(_arg_1:Boolean):void
        {
            this.m_sprite.visible = _arg_1;
        }

        public function unnattachFromGround():void
        {
            var _local_1:Number = 0;
            while (((_local_1 < 30) && (this.testGroundWithCoord(this.m_sprite.x, (this.m_sprite.y + 1)))))
            {
                _local_1++;
                this.m_sprite.y--;
            };
            if (_local_1 >= 30)
            {
                this.m_sprite.y = (this.m_sprite.y + _local_1);
            };
            this.m_collision.ground = false;
            this.m_currentPlatform = null;
        }

        public function PREPERFORM():void
        {
            if ((((this.m_started) && (this.HasMC)) && (!(this.STAGEDATA.Paused))))
            {
                Utils.advanceFrame(this.m_sprite);
                Utils.recursiveMovieClipPlay(this.m_sprite, true);
            };
        }

        public function PERFORMALL():void
        {
            this.move();
            this.gravity();
            this.m_groundCollisionTest();
        }

        public function POSTPERFORM():void
        {
            if (this.HasMC)
            {
                this.m_sprite.stop();
                Utils.recursiveMovieClipPlay(this.m_sprite, false);
            };
            this.m_started = true;
        }

        public function PAUSEALL():void
        {
            if (this.HasStance)
            {
                this.m_sprite.stop();
                Utils.recursiveMovieClipPlay(this.m_sprite, false);
            };
        }

        public function inState(_arg_1:uint):Boolean
        {
            return (this.m_state == _arg_1);
        }

        public function setState(_arg_1:uint):void
        {
            var _local_2:Boolean = (!(_arg_1 == this.m_state));
            var _local_3:uint = this.m_state;
            this.m_state = _arg_1;
            if (_local_2)
            {
                this.m_framesSinceLastState = 0;
                this.flushTimers();
                this.removeAllTempEvents();
                this.m_controlFrames();
                this.m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.STATE_CHANGE, {
                    "fromState":_local_3,
                    "toState":this.m_state
                }));
            };
        }

        protected function removeAllTempEvents():void
        {
            while (this.m_tempEvents.length > 0)
            {
                this.m_eventManager.removeEventListener(this.m_tempEvents[0].type, this.m_tempEvents[0].listener, this.m_tempEvents[0].useCapture);
                this.m_tempEvents.splice(0, 1);
            };
        }

        protected function m_controlFrames():void
        {
        }

        public function attachEffect(_arg_1:String, _arg_2:Object=null):MovieClip
        {
            _arg_2 = ((_arg_2) || ({}));
            var _local_3:Boolean;
            var _local_4:Boolean = true;
            var _local_5:Boolean = true;
            _local_5 = ((_arg_2.flip !== undefined) ? _arg_2.flip : _local_5);
            _local_4 = ((_arg_2.resize !== undefined) ? _arg_2.resize : _local_4);
            _local_3 = ((_arg_2.absolute !== undefined) ? _arg_2.absolute : _local_3);
            _arg_2.x = ((_arg_2.x !== undefined) ? _arg_2.x : 0);
            _arg_2.y = ((_arg_2.y !== undefined) ? _arg_2.y : 0);
            var _local_6:MovieClip;
            if (((!(_arg_1 == null)) && (((this.m_cancelEffectDelay.IsComplete) || (!(_arg_1 == this.m_cancelEffect))) || (this.m_cancelEffectCount < 6))))
            {
                if ((!(_local_3)))
                {
                    _arg_2.x = (this.m_sprite.x + _arg_2.x);
                    _arg_2.y = (this.m_sprite.y + _arg_2.y);
                };
                _local_6 = this.STAGEDATA.attachEffect(_arg_1, _arg_2);
                if (_local_6)
                {
                    if (_local_4)
                    {
                        _local_6.width = (_local_6.width * this.m_sizeRatio);
                        _local_6.height = (_local_6.height * this.m_sizeRatio);
                    };
                    if (((!(this.m_facingForward)) && (_local_5)))
                    {
                        _local_6.scaleX = (_local_6.scaleX * -1);
                    };
                    if (_arg_1 != this.m_cancelEffect)
                    {
                        this.m_cancelEffectCount = 0;
                    }
                    else
                    {
                        this.m_cancelEffectCount++;
                        this.m_cancelEffectDelay2.reset();
                    };
                    this.m_cancelEffectDelay.reset();
                };
            };
            return (_local_6);
        }

        public function attachEffectOverlay(_arg_1:String, _arg_2:Object=null):MovieClip
        {
            _arg_2 = ((_arg_2) || ({}));
            var _local_3:Boolean;
            var _local_4:Boolean = true;
            var _local_5:Boolean = true;
            _local_5 = ((_arg_2.flip !== undefined) ? _arg_2.flip : _local_5);
            _local_4 = ((_arg_2.resize !== undefined) ? _arg_2.resize : _local_4);
            _local_3 = ((_arg_2.absolute !== undefined) ? _arg_2.absolute : _local_3);
            _arg_2.x = ((_arg_2.x !== undefined) ? _arg_2.x : 0);
            _arg_2.y = ((_arg_2.y !== undefined) ? _arg_2.y : 0);
            var _local_6:MovieClip;
            if (_arg_1 != null)
            {
                if (_local_3)
                {
                    _arg_2.x = (this.STAGEDATA.StageRef.x + _arg_2.x);
                    _arg_2.y = (this.STAGEDATA.StageRef.y + _arg_2.y);
                }
                else
                {
                    _arg_2.x = (this.OverlayX + _arg_2.x);
                    _arg_2.y = (this.OverlayY + _arg_2.y);
                };
                _local_6 = this.STAGEDATA.attachEffectOverlay(_arg_1, _arg_2);
                if (_local_6)
                {
                    if (_local_4)
                    {
                        _local_6.width = (_local_6.width * this.m_sizeRatio);
                        _local_6.height = (_local_6.height * this.m_sizeRatio);
                    };
                    if (((!(this.m_facingForward)) && (_local_5)))
                    {
                        _local_6.scaleX = (_local_6.scaleX * -1);
                    };
                };
            };
            return (_local_6);
        }

        public function attachHurtEffect(_arg_1:String, _arg_2:HitBoxSprite=null, _arg_3:Object=null):MovieClip
        {
            var _local_5:*;
            var _local_4:Object = {
                "x":((_arg_2) ? _arg_2.centerx : 0),
                "y":((_arg_2) ? _arg_2.centery : 0),
                "scaleX":((1 + Math.min((0 / 100), 0.5)) * this.CurrentScale.x),
                "scaleY":((1 + Math.min((0 / 100), 0.5)) * this.CurrentScale.y),
                "resize":false,
                "absolute":true
            };
            if (_arg_3)
            {
                for (_local_5 in _arg_3)
                {
                    _local_4[_local_5] = _arg_3[_local_5];
                };
            };
            return (this.attachEffectOverlay(_arg_1, _local_4));
        }

        protected function checkTimers():void
        {
            this.m_framesSinceLastState++;
            this.tickTimers();
            this.m_knockbackStackingTimer.tick();
            if ((!(this.m_paralysis)))
            {
                this.m_maxParalysisTime.tick();
            };
            this.m_cancelEffectDelay.tick();
            this.m_cancelEffectDelay2.tick();
            if (this.m_cancelEffectDelay2.IsComplete)
            {
                this.m_cancelEffectDelay2.reset();
                this.m_cancelEffectCount = 0;
            };
            this.m_knockbackStacked = false;
        }

        public function createTimer(_arg_1:int, _arg_2:int, _arg_3:Function, _arg_4:Object=null):void
        {
            var _local_6:*;
            var _local_5:Object = {
                "persistant":false,
                "hitStunPause":true,
                "condition":null,
                "inverseCondition":null
            };
            if ((!(_arg_4)))
            {
                _arg_4 = new Object();
            };
            for (_local_6 in _local_5)
            {
                if (_arg_4[_local_6] === undefined)
                {
                    _arg_4[_local_6] = _local_5[_local_6];
                };
            };
            this.m_timerEvents.push({
                "current_time":_arg_1,
                "max_time":_arg_1,
                "func":_arg_3,
                "repeats":_arg_2,
                "options":_arg_4
            });
        }

        public function flushTimers(_arg_1:Boolean=false):void
        {
            var _local_2:int;
            while (_local_2 < this.m_timerEvents.length)
            {
                if (((_arg_1) || (!(this.m_timerEvents[_local_2].options.persistent))))
                {
                    this.m_timerEvents.splice(_local_2--, 1);
                };
                _local_2++;
            };
        }

        private function tickTimers():void
        {
            var _local_1:int;
            var _local_2:Array = new Array();
            _local_1 = 0;
            while (_local_1 < this.m_timerEvents.length)
            {
                if ((!((this.m_timerEvents[_local_1].options.hitStunPause) && (this.m_actionShot))))
                {
                    this.m_timerEvents[_local_1].current_time--;
                };
                if (this.m_timerEvents[_local_1].current_time <= 0)
                {
                    if (((!((!(this.m_timerEvents[_local_1].options.condition == null)) && (!(this.m_timerEvents[_local_1].options.condition())))) && (!((!(this.m_timerEvents[_local_1].options.inverseCondition == null)) && (this.m_timerEvents[_local_1].options.inverseCondition())))))
                    {
                        _local_2.push(this.m_timerEvents[_local_1]);
                    };
                    this.m_timerEvents[_local_1].current_time = this.m_timerEvents[_local_1].max_time;
                    if (this.m_timerEvents[_local_1].repeats > 0)
                    {
                        if (this.m_timerEvents[_local_1].repeats == 1)
                        {
                            this.m_timerEvents[_local_1].repeats--;
                            this.m_timerEvents.splice(_local_1--, 1);
                        }
                        else
                        {
                            this.m_timerEvents[_local_1].repeats--;
                        };
                    };
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < _local_2.length)
            {
                if (this.m_timerEvents.indexOf(_local_2[_local_1]) >= 0)
                {
                    _local_2[_local_1].func();
                };
                _local_1++;
            };
        }

        public function destroyTimer(_arg_1:Function):void
        {
            var _local_2:int;
            while (_local_2 < this.m_timerEvents.length)
            {
                if (this.m_timerEvents[_local_2].func == _arg_1)
                {
                    this.m_timerEvents.splice(_local_2--, 1);
                };
                _local_2++;
            };
        }

        public function takeDamage(_arg_1:AttackDamage, _arg_2:HitBoxSprite=null):Boolean
        {
            return (false);
        }


    }
}//package com.mcleodgaming.ssf2.engine