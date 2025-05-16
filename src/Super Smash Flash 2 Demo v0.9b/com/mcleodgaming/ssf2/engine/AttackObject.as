package com.mcleodgaming.ssf2.engine
{
    import com.mcleodgaming.ssf2.util.Dictionary;

    public class AttackObject 
    {

        private var m_name:String;
        private var m_refreshRate:int;
        private var m_resetMovement:Boolean;
        private var m_attackDelay:int;
        private var m_cancel:Boolean;
        private var m_cancelWhenAirborne:Boolean;
        private var m_cancelSoundOnEnd:Boolean;
        private var m_cancelVoiceOnEnd:Boolean;
        private var m_jumpCancel:Boolean;
        private var m_jumpCancelAttack:Boolean;
        private var m_doubleJumpCancel:Boolean;
        private var m_doubleJumpCancelAttack:Boolean;
        private var m_airCancel:Boolean;
        private var m_airCancelSpecial:Boolean;
        private var m_mustCharge:Boolean;
        private var m_xVelocityDecay:Number;
        private var m_yVelocityDecay:Number;
        private var m_xSpeedAccel:Number;
        private var m_xSpeedAccelAir:Number;
        private var m_xSpeedDecay:Number;
        private var m_xSpeedDecayAir:Number;
        private var m_conserveJumpConstant:Boolean;
        private var m_invincible:Boolean;
        private var m_superArmor:Boolean;
        private var m_heavyArmor:Number;
        private var m_air_ease:Number;
        private var m_hit_ease:Number;
        private var m_xSpeedCap:Number;
        private var m_allowControl:Boolean;
        private var m_allowControlGround:Boolean;
        private var m_chargetime:int;
        private var m_chargetime_max:int;
        private var m_charge_retain:Boolean;
        private var m_linkCharge:String;
        private var m_combo_max:int;
        private var m_forceComboContinue:Boolean;
        private var m_forceUseAtMaxCharge:Boolean;
        private var m_forceGrabbable:Boolean;
        private var m_holdRepeat:Boolean;
        private var m_rotate:Boolean;
        private var m_stale:Boolean;
        private var m_flip:Boolean;
        private var m_canBeAbsorbed:Boolean;
        private var m_canFallOff:Boolean;
        private var m_forceFallthrough:Boolean;
        private var m_hitEffect:String;
        private var m_disableOnHit:Boolean;
        private var m_maintainSpeed:Boolean;
        private var m_jumpFrame:String;
        private var m_parentAttack:String;
        private var m_secondaryAttack:String;
        private var m_isHorizontalRecoveryMove:Boolean;
        private var m_isRecoveryMove:Boolean;
        private var m_isLongRangeMove:Boolean;
        private var m_disableForCPU:Boolean;
        private var m_cpuAttackQueue:String;
        private var m_facedLedgesOnly:Boolean;
        private var m_chargeInAir:Boolean;
        private var m_canUseInAir:Boolean;
        private var m_allowJump:Boolean;
        private var m_allowFastFall:Boolean;
        private var m_allowRun:Boolean;
        private var m_allowTurn:Boolean;
        private var m_allowDoubleJump:Boolean;
        private var m_allowFullInterrupt:Boolean;
        private var m_linkFrames:Boolean;
        private var m_isDisabled:Boolean;
        private var m_enabled:Boolean;
        private var m_disableMove:Boolean;
        private var m_reenableEffect:String;
        private var m_reenableTimer:int;
        private var m_reenableTimerCount:int;
        private var m_disableJump:Boolean;
        private var m_controlDirection:Boolean;
        private var m_homingSpeed:Number;
        private var m_chargeClick:Boolean;
        private var m_lastUsed:int;
        private var m_lastUsed_previous:int;
        private var m_customChargeGlow:String;
        private var m_useChargeBar:Boolean;
        private var m_lock_x_target:Boolean;
        private var m_lock_y_target:Boolean;
        private var m_attackVoices:Array;
        private var m_attackSounds:Array;
        private var m_effectSounds:Array;
        private var m_attackBoxes:Array;
        private var m_overrideMap:Dictionary;

        public function AttackObject(_arg_1:String)
        {
            this.m_name = _arg_1;
            this.init();
        }

        public function init():void
        {
            this.m_refreshRate = 50;
            this.m_resetMovement = false;
            this.m_attackDelay = 0;
            this.m_cancel = false;
            this.m_cancelWhenAirborne = true;
            this.m_cancelSoundOnEnd = false;
            this.m_cancelVoiceOnEnd = false;
            this.m_jumpCancel = false;
            this.m_jumpCancelAttack = false;
            this.m_doubleJumpCancel = false;
            this.m_doubleJumpCancelAttack = false;
            this.m_airCancel = false;
            this.m_airCancelSpecial = false;
            this.m_mustCharge = false;
            this.m_xVelocityDecay = -1;
            this.m_yVelocityDecay = -1;
            this.m_xSpeedAccel = 0;
            this.m_xSpeedAccelAir = 0;
            this.m_xSpeedDecay = 0;
            this.m_xSpeedDecayAir = 0;
            this.m_conserveJumpConstant = true;
            this.m_invincible = false;
            this.m_superArmor = false;
            this.m_heavyArmor = 0;
            this.m_air_ease = -1;
            this.m_hit_ease = 0;
            this.m_xSpeedCap = -1;
            this.m_allowControl = false;
            this.m_allowControlGround = true;
            this.m_chargetime = 0;
            this.m_chargetime_max = 0;
            this.m_charge_retain = false;
            this.m_linkCharge = null;
            this.m_combo_max = 0;
            this.m_forceComboContinue = false;
            this.m_forceUseAtMaxCharge = false;
            this.m_forceGrabbable = false;
            this.m_holdRepeat = false;
            this.m_rotate = false;
            this.m_stale = false;
            this.m_flip = false;
            this.m_canFallOff = true;
            this.m_forceFallthrough = false;
            this.m_canBeAbsorbed = false;
            this.m_hitEffect = null;
            this.m_disableOnHit = false;
            this.m_maintainSpeed = false;
            this.m_jumpFrame = null;
            this.m_parentAttack = null;
            this.m_secondaryAttack = null;
            this.m_isHorizontalRecoveryMove = false;
            this.m_isRecoveryMove = false;
            this.m_isLongRangeMove = false;
            this.m_disableForCPU = false;
            this.m_cpuAttackQueue = null;
            this.m_facedLedgesOnly = false;
            this.m_chargeInAir = true;
            this.m_canUseInAir = false;
            this.m_allowJump = false;
            this.m_allowFastFall = true;
            this.m_allowRun = false;
            this.m_allowTurn = false;
            this.m_allowDoubleJump = false;
            this.m_allowFullInterrupt = false;
            this.m_linkFrames = false;
            this.m_isDisabled = false;
            this.m_enabled = true;
            this.m_disableMove = false;
            this.m_reenableEffect = null;
            this.m_reenableTimer = 0;
            this.m_reenableTimerCount = 0;
            this.m_disableJump = false;
            this.m_controlDirection = false;
            this.m_homingSpeed = -1;
            this.m_chargeClick = false;
            this.m_lastUsed = 0;
            this.m_lastUsed_previous = 0;
            this.m_customChargeGlow = null;
            this.m_useChargeBar = true;
            this.m_lock_x_target = false;
            this.m_lock_y_target = false;
            this.m_attackVoices = new Array();
            this.m_attackSounds = new Array();
            this.m_effectSounds = new Array();
            this.m_attackBoxes = new Array();
            this.m_overrideMap = new Dictionary(Object);
        }

        public function get Name():String
        {
            return (this.m_name);
        }

        public function set Name(_arg_1:String):void
        {
            this.m_name = this.m_name;
        }

        public function get RefreshRate():int
        {
            return (this.m_refreshRate);
        }

        public function get ResetMovement():Boolean
        {
            return (this.m_resetMovement);
        }

        public function get AttackDelay():int
        {
            return (this.m_attackDelay);
        }

        public function get Cancel():Boolean
        {
            return (this.m_cancel);
        }

        public function get CancelWhenAirborne():Boolean
        {
            return (this.m_cancelWhenAirborne);
        }

        public function get CancelSoundOnEnd():Boolean
        {
            return (this.m_cancelSoundOnEnd);
        }

        public function get CancelVoiceOnEnd():Boolean
        {
            return (this.m_cancelVoiceOnEnd);
        }

        public function get JumpCancel():Boolean
        {
            return (this.m_jumpCancel);
        }

        public function get JumpCancelAttack():Boolean
        {
            return (this.m_jumpCancelAttack);
        }

        public function get DoubleJumpCancel():Boolean
        {
            return (this.m_doubleJumpCancel);
        }

        public function get DoubleJumpCancelAttack():Boolean
        {
            return (this.m_doubleJumpCancelAttack);
        }

        public function get AirCancel():Boolean
        {
            return (this.m_airCancel);
        }

        public function get AirCancelSpecial():Boolean
        {
            return (this.m_airCancelSpecial);
        }

        public function get MustCharge():Boolean
        {
            return (this.m_mustCharge);
        }

        public function get XVelocityDecay():Number
        {
            return (this.m_xVelocityDecay);
        }

        public function get YVelocityDecay():Number
        {
            return (this.m_yVelocityDecay);
        }

        public function get XSpeedAccel():Number
        {
            return (this.m_xSpeedAccel);
        }

        public function get XSpeedAccelAir():Number
        {
            return (this.m_xSpeedAccelAir);
        }

        public function get XSpeedDecay():Number
        {
            return (this.m_xSpeedDecay);
        }

        public function get XSpeedDecayAir():Number
        {
            return (this.m_xSpeedDecayAir);
        }

        public function get ConserveJumpConstant():Boolean
        {
            return (this.m_conserveJumpConstant);
        }

        public function get Invincible():Boolean
        {
            return (this.m_invincible);
        }

        public function get SuperArmor():Boolean
        {
            return (this.m_superArmor);
        }

        public function get HeavyArmor():Number
        {
            return (this.m_heavyArmor);
        }

        public function get AirEase():Number
        {
            return (this.m_air_ease);
        }

        public function get HitEase():Number
        {
            return (this.m_hit_ease);
        }

        public function get XSpeedCap():Number
        {
            return (this.m_xSpeedCap);
        }

        public function get AllowControl():Boolean
        {
            return (this.m_allowControl);
        }

        public function get AllowControlGround():Boolean
        {
            return (this.m_allowControlGround);
        }

        public function get ChargeTime():int
        {
            return (this.m_chargetime);
        }

        public function set ChargeTime(_arg_1:int):void
        {
            this.m_chargetime = _arg_1;
        }

        public function get ChargeTimeMax():int
        {
            return (this.m_chargetime_max);
        }

        public function get ChargeRetain():Boolean
        {
            return (this.m_charge_retain);
        }

        public function get LinkCharge():String
        {
            return (this.m_linkCharge);
        }

        public function get ComboMax():int
        {
            return (this.m_combo_max);
        }

        public function get ForceComboContinue():Boolean
        {
            return (this.m_forceComboContinue);
        }

        public function get ForceUseAtMaxCharge():Boolean
        {
            return (this.m_forceUseAtMaxCharge);
        }

        public function get ForceGrabbable():Boolean
        {
            return (this.m_forceGrabbable);
        }

        public function get HoldRepeat():Boolean
        {
            return (this.m_holdRepeat);
        }

        public function get Rotate():Boolean
        {
            return (this.m_rotate);
        }

        public function get Stale():Boolean
        {
            return (this.m_stale);
        }

        public function get Flip():Boolean
        {
            return (this.m_flip);
        }

        public function get CanFallOff():Boolean
        {
            return (this.m_canFallOff);
        }

        public function get ForceFallThrough():Boolean
        {
            return (this.m_forceFallthrough);
        }

        public function get CanBeAbsorbed():Boolean
        {
            return (this.m_canBeAbsorbed);
        }

        public function get HitEffect():String
        {
            return (this.m_hitEffect);
        }

        public function get DisableOnHit():Boolean
        {
            return (this.m_disableOnHit);
        }

        public function get MaintainSpeed():Boolean
        {
            return (this.m_maintainSpeed);
        }

        public function get JumpFrame():String
        {
            return (this.m_jumpFrame);
        }

        public function get ParentAttack():String
        {
            return (this.m_parentAttack);
        }

        public function get SecondaryAttack():String
        {
            return (this.m_secondaryAttack);
        }

        public function get IsHorizontalRecoveryMove():Boolean
        {
            return (this.m_isHorizontalRecoveryMove);
        }

        public function get IsRecoveryMove():Boolean
        {
            return (this.m_isRecoveryMove);
        }

        public function get IsLongRangeMove():Boolean
        {
            return (this.m_isLongRangeMove);
        }

        public function get DisableForCPU():Boolean
        {
            return (this.m_disableForCPU);
        }

        public function get CPUAttackList():String
        {
            return (this.m_cpuAttackQueue);
        }

        public function get FacedLedgesOnly():Boolean
        {
            return (this.m_facedLedgesOnly);
        }

        public function get ChargeInAir():Boolean
        {
            return (this.m_chargeInAir);
        }

        public function get CanUseInAir():Boolean
        {
            return (this.m_canUseInAir);
        }

        public function get AllowJump():Boolean
        {
            return (this.m_allowJump);
        }

        public function get AllowFastFall():Boolean
        {
            return (this.m_allowFastFall);
        }

        public function get AllowRun():Boolean
        {
            return (this.m_allowRun);
        }

        public function get AllowTurn():Boolean
        {
            return (this.m_allowTurn);
        }

        public function get AllowDoubleJump():Boolean
        {
            return (this.m_allowDoubleJump);
        }

        public function get AllowFullInterrupt():Boolean
        {
            return (this.m_allowFullInterrupt);
        }

        public function get LinkFrames():Boolean
        {
            return (this.m_linkFrames);
        }

        public function get IsDisabled():Boolean
        {
            return (this.m_isDisabled);
        }

        public function get Enabled():Boolean
        {
            return (this.m_enabled);
        }

        public function set IsDisabled(_arg_1:Boolean):void
        {
            this.m_isDisabled = _arg_1;
        }

        public function get ReenableEffect():String
        {
            return (this.m_reenableEffect);
        }

        public function get ReenableTimer():int
        {
            return (this.m_reenableTimer);
        }

        public function get ReenableTimerCount():int
        {
            return (this.m_reenableTimerCount);
        }

        public function set ReenableTimerCount(_arg_1:int):void
        {
            this.m_reenableTimerCount = _arg_1;
        }

        public function get DisableJump():Boolean
        {
            return (this.m_disableJump);
        }

        public function get ControlDirection():Boolean
        {
            return (this.m_controlDirection);
        }

        public function get HomingSpeed():Number
        {
            return (this.m_homingSpeed);
        }

        public function get ChargeClick():Boolean
        {
            return (this.m_chargeClick);
        }

        public function get LastUsed():int
        {
            return (this.m_lastUsed);
        }

        public function set LastUsed(_arg_1:int):void
        {
            this.m_lastUsed = _arg_1;
        }

        public function get LastUsedPrevious():int
        {
            return (this.m_lastUsed_previous);
        }

        public function set LastUsedPrevious(_arg_1:int):void
        {
            this.m_lastUsed_previous = _arg_1;
        }

        public function get CustomChargeGlow():String
        {
            return (this.m_customChargeGlow);
        }

        public function get UseChargeBar():Boolean
        {
            return (this.m_useChargeBar);
        }

        public function get LockXTarget():Boolean
        {
            return (this.m_lock_x_target);
        }

        public function get LockYTarget():Boolean
        {
            return (this.m_lock_y_target);
        }

        public function get AttackVoices():Array
        {
            return (this.m_attackVoices);
        }

        public function get AttackSounds():Array
        {
            return (this.m_attackSounds);
        }

        public function get EffectSounds():Array
        {
            return (this.m_effectSounds);
        }

        public function get AttackBoxes():Array
        {
            return (this.m_attackBoxes);
        }

        public function set Stale(_arg_1:Boolean):void
        {
            this.m_stale = _arg_1;
        }

        public function get OverrideMap():Dictionary
        {
            return (this.m_overrideMap);
        }

        public function Clone():AttackObject
        {
            var _local_1:Object = this.exportAttackData();
            var _local_2:AttackObject = new AttackObject(this.m_name);
            _local_2.importAttackData(_local_1);
            return (_local_2);
        }

        public function importAttackData(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:String;
            var _local_4:String;
            var _local_5:String;
            var _local_6:*;
            for (_local_2 in _arg_1)
            {
                if (new String(_local_2).substring(0, 11) == "attackVoice")
                {
                    _local_3 = new String(_local_2).substring(11);
                    this.m_attackVoices[(Number(_local_3.split("_")[0]) - 1)] = new String(_arg_1[_local_2]);
                }
                else
                {
                    if (new String(_local_2).substring(0, 11) == "attackSound")
                    {
                        _local_4 = new String(_local_2).substring(11);
                        this.m_attackSounds[(Number(_local_4.split("_")[0]) - 1)] = new String(_arg_1[_local_2]);
                    }
                    else
                    {
                        if (new String(_local_2).substring(0, 11) == "effectSound")
                        {
                            _local_5 = new String(_local_2).substring(11);
                            this.m_effectSounds[(Number(_local_5.split("_")[0]) - 1)] = new String(_arg_1[_local_2]);
                        }
                        else
                        {
                            if (_local_2 == "attackBoxes")
                            {
                                for (_local_6 in _arg_1[_local_2])
                                {
                                    this.m_attackBoxes[_local_6] = new AttackDamage(-1, null);
                                    this.m_attackBoxes[_local_6].importAttackDamageData(_arg_1[_local_2][_local_6]);
                                };
                            }
                            else
                            {
                                if (this[("m_" + _local_2)] !== undefined)
                                {
                                    this[("m_" + _local_2)] = _arg_1[_local_2];
                                }
                                else
                                {
                                    trace((('You tried to set "m_' + _local_2) + "\" but it doesn't exist in the AttackObject class."));
                                };
                            };
                        };
                    };
                };
            };
        }

        public function setVar(_arg_1:String, _arg_2:*):void
        {
            if (this[("m_" + _arg_1)] !== undefined)
            {
                this[("m_" + _arg_1)] = _arg_2;
            }
            else
            {
                trace((((('Could not set var "' + _arg_1) + '" to ') + _arg_2) + " in AttackObject"));
            };
        }

        public function updateAllAttackBoxes(_arg_1:Object):void
        {
            var _local_2:*;
            for (_local_2 in this.m_attackBoxes)
            {
                this.m_attackBoxes[_local_2].importAttackDamageData(_arg_1);
            };
        }

        public function exportAttackData():Object
        {
            var _local_3:*;
            var _local_1:Object = new Object();
            _local_1.name = this.m_name;
            _local_1.refreshRate = this.m_refreshRate;
            _local_1.resetMovement = this.m_resetMovement;
            _local_1.attackDelay = this.m_attackDelay;
            _local_1.cancel = this.m_cancel;
            _local_1.cancelWhenAirborne = this.m_cancelWhenAirborne;
            _local_1.cancelSoundOnEnd = this.m_cancelSoundOnEnd;
            _local_1.cancelVoiceOnEnd = this.m_cancelVoiceOnEnd;
            _local_1.jumpCancel = this.m_jumpCancel;
            _local_1.jumpCancelAttack = this.m_jumpCancelAttack;
            _local_1.doubleJumpCancel = this.m_doubleJumpCancel;
            _local_1.doubleJumpCancelAttack = this.m_doubleJumpCancelAttack;
            _local_1.airCancel = this.m_airCancel;
            _local_1.airCancelSpecial = this.m_airCancelSpecial;
            _local_1.mustCharge = this.m_mustCharge;
            _local_1.xVelocityDecay = this.m_xVelocityDecay;
            _local_1.yVelocityDecay = this.m_yVelocityDecay;
            _local_1.xSpeedAccel = this.m_xSpeedAccel;
            _local_1.xSpeedAccelAir = this.m_xSpeedAccelAir;
            _local_1.xSpeedDecay = this.m_xSpeedDecay;
            _local_1.xSpeedDecayAir = this.m_xSpeedDecayAir;
            _local_1.conserveJumpConstant = this.m_conserveJumpConstant;
            _local_1.invincible = this.m_invincible;
            _local_1.superArmor = this.m_superArmor;
            _local_1.heavyArmor = this.m_heavyArmor;
            _local_1.air_ease = this.m_air_ease;
            _local_1.hit_ease = this.m_hit_ease;
            _local_1.xSpeedCap = this.m_xSpeedCap;
            _local_1.allowControl = this.m_allowControl;
            _local_1.allowControlGround = this.m_allowControlGround;
            _local_1.chargetime = this.m_chargetime;
            _local_1.chargetime_max = this.m_chargetime_max;
            _local_1.charge_retain = this.m_charge_retain;
            _local_1.linkCharge = this.m_linkCharge;
            _local_1.combo_max = this.m_combo_max;
            _local_1.forceComboContinue = this.m_forceComboContinue;
            _local_1.forceUseAtMaxCharge = this.m_forceUseAtMaxCharge;
            _local_1.forceGrabbable = this.m_forceGrabbable;
            _local_1.holdRepeat = this.m_holdRepeat;
            _local_1.rotate = this.m_rotate;
            _local_1.stale = this.m_stale;
            _local_1.flip = this.m_flip;
            _local_1.canFallOff = this.m_canFallOff;
            _local_1.forceFallthrough = this.m_forceFallthrough;
            _local_1.canBeAbsorbed = this.m_canBeAbsorbed;
            _local_1.hitEffect = this.m_hitEffect;
            _local_1.disableOnHit = this.m_disableOnHit;
            _local_1.maintainSpeed = this.m_maintainSpeed;
            _local_1.jumpFrame = this.m_jumpFrame;
            _local_1.parentAttack = this.m_parentAttack;
            _local_1.secondaryAttack = this.m_secondaryAttack;
            _local_1.isHorizontalRecoveryMove = this.m_isHorizontalRecoveryMove;
            _local_1.isRecoveryMove = this.m_isRecoveryMove;
            _local_1.isLongRangeMove = this.m_isLongRangeMove;
            _local_1.disableForCPU = this.m_disableForCPU;
            _local_1.cpuAttackQueue = this.m_cpuAttackQueue;
            _local_1.facedLedgesOnly = this.m_facedLedgesOnly;
            _local_1.chargeInAir = this.m_chargeInAir;
            _local_1.canUseInAir = this.m_canUseInAir;
            _local_1.allowJump = this.m_allowJump;
            _local_1.allowFastFall = this.m_allowFastFall;
            _local_1.allowRun = this.m_allowRun;
            _local_1.allowTurn = this.m_allowTurn;
            _local_1.allowDoubleJump = this.m_allowDoubleJump;
            _local_1.allowFullInterrupt = this.m_allowFullInterrupt;
            _local_1.linkFrames = this.m_linkFrames;
            _local_1.isDisabled = this.m_isDisabled;
            _local_1.enabled = this.m_enabled;
            _local_1.disableMove = this.m_disableMove;
            _local_1.reenableEffect = this.m_reenableEffect;
            _local_1.reenableTimer = this.m_reenableTimer;
            _local_1.reenableTimerCount = this.m_reenableTimerCount;
            _local_1.disableJump = this.m_disableJump;
            _local_1.controlDirection = this.m_controlDirection;
            _local_1.homingSpeed = this.m_homingSpeed;
            _local_1.lastUsed = this.m_lastUsed;
            _local_1.customChargeGlow = this.m_customChargeGlow;
            _local_1.useChargeBar = this.m_useChargeBar;
            _local_1.lock_x_target = this.m_lock_x_target;
            _local_1.lock_y_target = this.m_lock_y_target;
            _local_1.chargeClick = this.m_chargeClick;
            var _local_2:Number = 0;
            _local_2 = 0;
            while (_local_2 < this.m_attackVoices.length)
            {
                _local_1[(("attackVoice" + (_local_2 + 1)) + "_id")] = this.m_attackVoices[_local_2];
                _local_2++;
            };
            _local_2 = 0;
            while (_local_2 < this.m_attackSounds.length)
            {
                _local_1[(("attackSound" + (_local_2 + 1)) + "_id")] = this.m_attackSounds[_local_2];
                _local_2++;
            };
            _local_2 = 0;
            while (_local_2 < this.m_effectSounds.length)
            {
                _local_1[(("effectSound" + (_local_2 + 1)) + "_id")] = this.m_effectSounds[_local_2];
                _local_2++;
            };
            _local_1.attackBoxes = new Object();
            for (_local_3 in this.m_attackBoxes)
            {
                _local_1.attackBoxes[_local_3] = this.m_attackBoxes[_local_3].exportAttackDamageData();
            };
            return (_local_1);
        }


    }
}//package com.mcleodgaming.ssf2.engine