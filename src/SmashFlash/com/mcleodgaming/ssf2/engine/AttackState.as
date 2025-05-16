package com.mcleodgaming.ssf2.engine
{
    import com.mcleodgaming.ssf2.util.Utils;
    import com.mcleodgaming.ssf2.util.*;
    import com.mcleodgaming.ssf2.items.*;

    public class AttackState 
    {

        private var m_owner:InteractiveSprite;
        private var m_isAttacking:Boolean;
        private var m_isForward:Boolean;
        private var m_staleMultiplier:Number;
        private var m_xSpeedAccel:Number;
        private var m_xSpeedAccelAir:Number;
        private var m_xSpeedDecay:Number;
        private var m_xSpeedDecayAir:Number;
        private var m_invincible:Boolean;
        private var m_superArmor:Boolean;
        private var m_heavyArmor:Number;
        private var m_combo_total:int;
        private var m_combo_max:int;
        private var m_forceComboContinue:Boolean;
        private var m_forceTumbleFall:Boolean;
        private var m_forceFallThrough:Boolean;
        private var m_forceGrabbable:Boolean;
        private var m_rocket:Boolean;
        private var m_holdRepeat:Boolean;
        private var m_rotate:Boolean;
        private var m_nextComboFrame:String;
        private var m_atk_id:int;
        private var m_frame:String;
        private var m_letGo:Boolean;
        private var m_hasLanded:Boolean;
        private var m_exec_time:int;
        private var m_allowControl:Boolean;
        private var m_allowControlGround:Boolean;
        private var m_disable:Boolean;
        private var m_chargedAttacks:Object;
        private var m_linkedChargeAttacks:Object;
        private var m_direction:Number;
        private var m_reversableAngle:Boolean;
        private var m_chargetime:int;
        private var m_chargetime_max:int;
        private var m_linkCharge:String;
        private var m_charge_retain:Boolean;
        private var m_ignoreChargeDamage:Boolean;
        private var m_ignoreChargeKnockback:Boolean;
        private var m_attackType:int;
        private var m_transformed:Boolean;
        private var m_refreshRate:int;
        private var m_refreshRateTimer:int;
        private var m_refreshRateReady:Boolean;
        private var m_resetMovement:Boolean;
        private var m_cancel:Boolean;
        private var m_cancelWhenAirborne:Boolean;
        private var m_cancelSoundOnEnd:Boolean;
        private var m_cancelVoiceOnEnd:Boolean;
        private var m_wasCancelled:Boolean;
        private var m_airCancel:Boolean;
        private var m_airCancelSpecial:Boolean;
        private var m_xloc:Number;
        private var m_yloc:Number;
        private var m_attackDelay:int;
        private var m_mustCharge:Boolean;
        private var m_isAirAttack:Boolean;
        private var m_disableHurtSound:Boolean;
        private var m_disableHurtFallOff:Boolean;
        private var m_disableLastHitUpdate:Boolean;
        private var m_reverseID:int;
        private var m_reverseTeam:int;
        private var m_air_ease:Number;
        private var m_hit_ease:Number;
        private var m_xSpeedCap:Number;
        private var m_controlDirection:Boolean;
        private var m_homingTarget:InteractiveSprite;
        private var m_homingSpeed:Number;
        private var m_disableJump:Boolean;
        private var m_jumpCancelAttack:Boolean;
        private var m_doubleJumpCancelAttack:Boolean;
        private var m_allowJump:Boolean;
        private var m_allowFastFall:Boolean;
        private var m_allowRun:Boolean;
        private var m_allowTurn:Boolean;
        private var m_allowDoubleJump:Boolean;
        private var m_allowFullInterrupt:Boolean;
        private var m_linkFrames:Boolean;
        private var m_isTurning:Boolean;
        private var m_isAccelerating:Boolean;
        private var m_isThrow:Boolean;
        private var m_chargeInAir:Boolean;
        private var m_canFallOff:Boolean;
        private var m_canBeAbsorbed:Boolean;
        private var m_maintainSpeed:Boolean;
        private var m_secondaryAttack:String;
        private var m_sizeStatus:int;
        private var m_facedLedgesOnly:Boolean;

        public function AttackState(_arg_1:InteractiveSprite=null)
        {
            this.m_owner = _arg_1;
            this.m_isAttacking = false;
            this.m_isForward = true;
            this.m_staleMultiplier = 1.05;
            this.m_xSpeedAccel = 0;
            this.m_xSpeedAccelAir = 0;
            this.m_xSpeedDecay = 0;
            this.m_xSpeedDecayAir = 0;
            this.m_invincible = false;
            this.m_superArmor = false;
            this.m_heavyArmor = 0;
            this.m_combo_total = 0;
            this.m_combo_max = 0;
            this.m_forceComboContinue = false;
            this.m_forceTumbleFall = false;
            this.m_forceFallThrough = false;
            this.m_forceGrabbable = false;
            this.m_rocket = false;
            this.m_holdRepeat = false;
            this.m_rotate = false;
            this.m_nextComboFrame = null;
            this.m_atk_id = Utils.getUID();
            this.m_frame = null;
            this.m_letGo = false;
            this.m_hasLanded = true;
            this.m_exec_time = 0;
            this.m_allowControl = false;
            this.m_allowControlGround = true;
            this.m_chargedAttacks = {};
            this.m_linkedChargeAttacks = {};
            this.m_charge_retain = false;
            this.m_chargetime = 0;
            this.m_chargetime_max = 0;
            this.m_linkCharge = null;
            this.m_attackType = 0;
            this.m_transformed = false;
            this.m_refreshRate = 50;
            this.m_refreshRateTimer = 1;
            this.m_refreshRateReady = true;
            this.m_resetMovement = false;
            this.m_cancel = false;
            this.m_cancelWhenAirborne = true;
            this.m_cancelSoundOnEnd = false;
            this.m_cancelVoiceOnEnd = false;
            this.m_wasCancelled = false;
            this.m_airCancel = false;
            this.m_airCancelSpecial = false;
            this.m_xloc = 0;
            this.m_yloc = 0;
            this.m_attackDelay = 0;
            this.m_mustCharge = false;
            this.m_isAirAttack = false;
            this.m_disableHurtSound = false;
            this.m_disableHurtFallOff = false;
            this.m_disableLastHitUpdate = false;
            this.m_reverseID = -1;
            this.m_reverseTeam = -1;
            this.m_air_ease = -1;
            this.m_hit_ease = 0;
            this.m_xSpeedCap = -1;
            this.m_controlDirection = false;
            this.m_homingTarget = null;
            this.m_homingSpeed = -1;
            this.m_disableJump = false;
            this.m_jumpCancelAttack = false;
            this.m_doubleJumpCancelAttack = false;
            this.m_allowJump = false;
            this.m_allowFastFall = true;
            this.m_allowRun = false;
            this.m_allowTurn = false;
            this.m_allowDoubleJump = false;
            this.m_allowFullInterrupt = false;
            this.m_linkFrames = false;
            this.m_isTurning = false;
            this.m_isAccelerating = false;
            this.m_isThrow = false;
            this.m_chargeInAir = true;
            this.m_canFallOff = false;
            this.m_canBeAbsorbed = false;
            this.m_maintainSpeed = false;
            this.m_secondaryAttack = null;
            this.m_sizeStatus = 0;
            this.m_facedLedgesOnly = false;
        }

        public function simpleReset():void
        {
            this.m_isAttacking = false;
            this.m_isForward = true;
            this.m_staleMultiplier = 1.05;
            this.m_xSpeedAccel = 0;
            this.m_xSpeedAccelAir = 0;
            this.m_xSpeedDecay = 0;
            this.m_xSpeedDecayAir = 0;
            this.m_invincible = false;
            this.m_superArmor = false;
            this.m_heavyArmor = 0;
            this.m_combo_total = 0;
            this.m_combo_max = 0;
            this.m_forceComboContinue = false;
            this.m_forceTumbleFall = false;
            this.m_forceFallThrough = false;
            this.m_forceGrabbable = false;
            this.m_rocket = false;
            this.m_holdRepeat = false;
            this.m_rotate = false;
            this.m_nextComboFrame = null;
            this.m_frame = null;
            this.m_letGo = false;
            this.m_hasLanded = true;
            this.m_exec_time = 0;
            this.m_allowControl = false;
            this.m_allowControlGround = true;
            this.m_chargedAttacks = {};
            this.m_linkedChargeAttacks = {};
            this.m_charge_retain = false;
            this.m_chargetime = 0;
            this.m_chargetime_max = 0;
            this.m_linkCharge = null;
            this.m_attackType = 0;
            this.m_transformed = false;
            this.m_refreshRate = 50;
            this.m_resetMovement = false;
            this.m_cancel = false;
            this.m_cancelWhenAirborne = true;
            this.m_cancelSoundOnEnd = false;
            this.m_cancelVoiceOnEnd = false;
            this.m_wasCancelled = false;
            this.m_airCancel = false;
            this.m_airCancelSpecial = false;
            this.m_xloc = 0;
            this.m_yloc = 0;
            this.m_attackDelay = 0;
            this.m_mustCharge = false;
            this.m_isAirAttack = false;
            this.m_disableHurtSound = false;
            this.m_disableHurtFallOff = false;
            this.m_disableLastHitUpdate = false;
            this.m_reverseID = -1;
            this.m_reverseTeam = -1;
            this.m_air_ease = -1;
            this.m_hit_ease = 0;
            this.m_xSpeedCap = -1;
            this.m_controlDirection = false;
            this.m_homingTarget = null;
            this.m_homingSpeed = -1;
            this.m_disableJump = false;
            this.m_jumpCancelAttack = false;
            this.m_doubleJumpCancelAttack = false;
            this.m_allowJump = false;
            this.m_allowFastFall = true;
            this.m_allowRun = false;
            this.m_allowTurn = false;
            this.m_allowDoubleJump = false;
            this.m_allowFullInterrupt = false;
            this.m_linkFrames = false;
            this.m_isTurning = false;
            this.m_isAccelerating = false;
            this.m_isThrow = false;
            this.m_chargeInAir = true;
            this.m_canFallOff = false;
            this.m_canBeAbsorbed = false;
            this.m_maintainSpeed = false;
            this.m_secondaryAttack = null;
            this.m_sizeStatus = 0;
            this.m_facedLedgesOnly = false;
        }

        public function get Owner():InteractiveSprite
        {
            return (this.m_owner);
        }

        public function get IsAttacking():Boolean
        {
            return (this.m_isAttacking);
        }

        public function get IsForward():Boolean
        {
            return (this.m_isForward);
        }

        public function get StaleMultiplier():Number
        {
            return (this.m_staleMultiplier);
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

        public function get ComboTotal():int
        {
            return (this.m_combo_total);
        }

        public function set ComboTotal(_arg_1:int):void
        {
            this.m_combo_total = _arg_1;
        }

        public function get ComboMax():int
        {
            return (this.m_combo_max);
        }

        public function set ComboMax(_arg_1:int):void
        {
            this.m_combo_max = _arg_1;
        }

        public function get ForceComboContinue():Boolean
        {
            return (this.m_forceComboContinue);
        }

        public function get ForceTumbleFall():Boolean
        {
            return (this.m_forceTumbleFall);
        }

        public function get ForceFallThrough():Boolean
        {
            return (this.m_forceFallThrough);
        }

        public function get ForceGrabbable():Boolean
        {
            return (this.m_forceGrabbable);
        }

        public function get Rocket():Boolean
        {
            return (this.m_rocket);
        }

        public function get HoldRepeat():Boolean
        {
            return (this.m_holdRepeat);
        }

        public function get Rotate():Boolean
        {
            return (this.m_rotate);
        }

        public function get NextComboFrame():String
        {
            return (this.m_nextComboFrame);
        }

        public function get AttackID():int
        {
            return (this.m_atk_id);
        }

        public function get Frame():String
        {
            return (this.m_frame);
        }

        public function get LetGo():Boolean
        {
            return (this.m_letGo);
        }

        public function get HasLanded():Boolean
        {
            return (this.m_hasLanded);
        }

        public function get ExecTime():int
        {
            return (this.m_exec_time);
        }

        public function get AllowControl():Boolean
        {
            return (this.m_allowControl);
        }

        public function get AllowControlGround():Boolean
        {
            return (this.m_allowControlGround);
        }

        public function get ChargedAttacks():Object
        {
            return (this.m_chargedAttacks);
        }

        public function get LinkedChargeAttacks():Object
        {
            return (this.m_linkedChargeAttacks);
        }

        public function get ChargeTime():int
        {
            return (this.m_chargetime);
        }

        public function get ChargeTimeMax():int
        {
            return (this.m_chargetime_max);
        }

        public function get LinkCharge():String
        {
            return (this.m_linkCharge);
        }

        public function get AttackType():int
        {
            return (this.m_attackType);
        }

        public function get Transformed():Boolean
        {
            return (this.m_transformed);
        }

        public function get RefreshRate():int
        {
            return (this.m_refreshRate);
        }

        public function get RefreshRateTimer():int
        {
            return (this.m_refreshRateTimer);
        }

        public function get RefreshRateReady():Boolean
        {
            return (this.m_refreshRateReady);
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

        public function get WasCancelled():Boolean
        {
            return (this.m_wasCancelled);
        }

        public function get AirCancel():Boolean
        {
            return (this.m_airCancel);
        }

        public function get AirCancelSpecial():Boolean
        {
            return (this.m_airCancelSpecial);
        }

        public function get XLoc():Number
        {
            return (this.m_xloc);
        }

        public function get YLoc():Number
        {
            return (this.m_yloc);
        }

        public function get AttackDelay():int
        {
            return (this.m_attackDelay);
        }

        public function get MustCharge():Boolean
        {
            return (this.m_mustCharge);
        }

        public function get IsAirAttack():Boolean
        {
            return (this.m_isAirAttack);
        }

        public function get DisableHurtSound():Boolean
        {
            return (this.m_disableHurtSound);
        }

        public function get DisableHurtFallOff():Boolean
        {
            return (this.m_disableHurtFallOff);
        }

        public function get DisableLastHitUpdate():Boolean
        {
            return (this.m_disableLastHitUpdate);
        }

        public function get ReverseID():int
        {
            return (this.m_reverseID);
        }

        public function get ReverseTeam():int
        {
            return (this.m_reverseTeam);
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

        public function get ControlDirection():Boolean
        {
            return (this.m_controlDirection);
        }

        public function get HomingTarget():InteractiveSprite
        {
            return (this.m_homingTarget);
        }

        public function get HomingSpeed():Number
        {
            return (this.m_homingSpeed);
        }

        public function get DisableJump():Boolean
        {
            return (this.m_disableJump);
        }

        public function get JumpCancelAttack():Boolean
        {
            return (this.m_jumpCancelAttack);
        }

        public function get DoubleJumpCancelAttack():Boolean
        {
            return (this.m_doubleJumpCancelAttack);
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

        public function get IsTurning():Boolean
        {
            return (this.m_isTurning);
        }

        public function get IsAccelerating():Boolean
        {
            return (this.m_isAccelerating);
        }

        public function get IsThrow():Boolean
        {
            return (this.m_isThrow);
        }

        public function get ChargeInAir():Boolean
        {
            return (this.m_chargeInAir);
        }

        public function get SizeStatus():int
        {
            return (this.m_sizeStatus);
        }

        public function get FacedLedgesOnly():Boolean
        {
            return (this.m_facedLedgesOnly);
        }

        public function get ChargeRetain():Boolean
        {
            return (this.m_charge_retain);
        }

        public function get IgnoreChargeDamage():Boolean
        {
            return (this.m_ignoreChargeDamage);
        }

        public function get IgnoreChargeKnockback():Boolean
        {
            return (this.m_ignoreChargeKnockback);
        }

        public function get ResetMovement():Boolean
        {
            return (this.m_resetMovement);
        }

        public function get CanFallOff():Boolean
        {
            return (this.m_canFallOff);
        }

        public function get CanBeAbsorbed():Boolean
        {
            return (this.m_canBeAbsorbed);
        }

        public function get MaintainSpeed():Boolean
        {
            return (this.m_maintainSpeed);
        }

        public function get SecondaryAttack():String
        {
            return (this.m_secondaryAttack);
        }

        public function set Owner(_arg_1:InteractiveSprite):void
        {
            this.m_owner = _arg_1;
        }

        public function set IsAttacking(_arg_1:Boolean):void
        {
            this.m_isAttacking = _arg_1;
        }

        public function set IsForward(_arg_1:Boolean):void
        {
            this.m_isForward = _arg_1;
        }

        public function set StaleMultiplier(_arg_1:Number):void
        {
            this.m_staleMultiplier = _arg_1;
        }

        public function set XSpeedAccel(_arg_1:Number):void
        {
            this.m_xSpeedAccel = _arg_1;
        }

        public function set XSpeedAccelAir(_arg_1:Number):void
        {
            this.m_xSpeedAccelAir = _arg_1;
        }

        public function set XSpeedDecay(_arg_1:Number):void
        {
            this.m_xSpeedDecay = _arg_1;
        }

        public function set XSpeedDecayAir(_arg_1:Number):void
        {
            this.m_xSpeedDecayAir = _arg_1;
        }

        public function set Invincible(_arg_1:Boolean):void
        {
            this.m_invincible = _arg_1;
        }

        public function set SuperArmor(_arg_1:Boolean):void
        {
            this.m_superArmor = _arg_1;
        }

        public function set HeavyArmor(_arg_1:Number):void
        {
            this.m_heavyArmor = _arg_1;
        }

        public function set ForceComboContinue(_arg_1:Boolean):void
        {
            this.m_forceComboContinue = _arg_1;
        }

        public function set ForceTumbleFall(_arg_1:Boolean):void
        {
            this.m_forceTumbleFall = _arg_1;
        }

        public function set ForceFallThrough(_arg_1:Boolean):void
        {
            this.m_forceFallThrough = _arg_1;
        }

        public function set ForceGrabbable(_arg_1:Boolean):void
        {
            this.m_forceGrabbable = _arg_1;
        }

        public function set Rocket(_arg_1:Boolean):void
        {
            this.m_rocket = _arg_1;
        }

        public function set HoldRepeat(_arg_1:Boolean):void
        {
            this.m_holdRepeat = _arg_1;
        }

        public function set Rotate(_arg_1:Boolean):void
        {
            this.m_rotate = _arg_1;
        }

        public function set NextComboFrame(_arg_1:String):void
        {
            this.m_nextComboFrame = _arg_1;
        }

        public function set AttackID(_arg_1:int):void
        {
            this.m_atk_id = _arg_1;
        }

        public function set Frame(_arg_1:String):void
        {
            this.m_frame = _arg_1;
        }

        public function set LetGo(_arg_1:Boolean):void
        {
            this.m_letGo = _arg_1;
        }

        public function set HasLanded(_arg_1:Boolean):void
        {
            this.m_hasLanded = _arg_1;
        }

        public function set ExecTime(_arg_1:int):void
        {
            this.m_exec_time = _arg_1;
        }

        public function set AllowControl(_arg_1:Boolean):void
        {
            this.m_allowControl = _arg_1;
        }

        public function set AllowControlGround(_arg_1:Boolean):void
        {
            this.m_allowControlGround = _arg_1;
        }

        public function set ChargedAttacks(_arg_1:Object):void
        {
            this.m_chargedAttacks = _arg_1;
        }

        public function set LinkedChargeAttacks(_arg_1:Object):void
        {
            this.m_linkedChargeAttacks = _arg_1;
        }

        public function set ChargeTime(_arg_1:int):void
        {
            this.m_chargetime = _arg_1;
        }

        public function set ChargeTimeMax(_arg_1:int):void
        {
            this.m_chargetime_max = _arg_1;
        }

        public function set LinkCharge(_arg_1:String):void
        {
            this.m_linkCharge = _arg_1;
        }

        public function set AttackType(_arg_1:int):void
        {
            this.m_attackType = _arg_1;
        }

        public function set Transformed(_arg_1:Boolean):void
        {
            this.m_transformed = _arg_1;
        }

        public function set RefreshRate(_arg_1:int):void
        {
            this.m_refreshRate = _arg_1;
        }

        public function set RefreshRateTimer(_arg_1:int):void
        {
            if (this.m_refreshRateReady)
            {
                this.m_refreshRateTimer = _arg_1;
            };
        }

        public function set RefreshRateReady(_arg_1:Boolean):void
        {
            this.m_refreshRateReady = _arg_1;
        }

        public function set Cancel(_arg_1:Boolean):void
        {
            this.m_cancel = _arg_1;
        }

        public function set CancelWhenAirborne(_arg_1:Boolean):void
        {
            this.m_cancelWhenAirborne = _arg_1;
        }

        public function set CancelSoundOnEnd(_arg_1:Boolean):void
        {
            this.m_cancelSoundOnEnd = _arg_1;
        }

        public function set CancelVoiceOnEnd(_arg_1:Boolean):void
        {
            this.m_cancelVoiceOnEnd = _arg_1;
        }

        public function set WasCancelled(_arg_1:Boolean):void
        {
            this.m_wasCancelled = _arg_1;
        }

        public function set AirCancel(_arg_1:Boolean):void
        {
            this.m_airCancel = _arg_1;
        }

        public function set AirCancelSpecial(_arg_1:Boolean):void
        {
            this.m_airCancelSpecial = _arg_1;
        }

        public function set XLoc(_arg_1:Number):void
        {
            this.m_xloc = _arg_1;
        }

        public function set YLoc(_arg_1:Number):void
        {
            this.m_yloc = _arg_1;
        }

        public function set AttackDelay(_arg_1:int):void
        {
            this.m_attackDelay = _arg_1;
        }

        public function set MustCharge(_arg_1:Boolean):void
        {
            this.m_mustCharge = _arg_1;
        }

        public function set IsAirAttack(_arg_1:Boolean):void
        {
            this.m_isAirAttack = _arg_1;
        }

        public function set DisableHurtSound(_arg_1:Boolean):void
        {
            this.m_disableHurtSound = _arg_1;
        }

        public function set DisableHurtFallOff(_arg_1:Boolean):void
        {
            this.m_disableHurtFallOff = _arg_1;
        }

        public function set DisableLastHitUpdate(_arg_1:Boolean):void
        {
            this.m_disableLastHitUpdate = _arg_1;
        }

        public function set ReverseID(_arg_1:int):void
        {
            this.m_reverseID = _arg_1;
        }

        public function set ReverseTeam(_arg_1:int):void
        {
            this.m_reverseTeam = _arg_1;
        }

        public function set AirEase(_arg_1:Number):void
        {
            this.m_air_ease = _arg_1;
        }

        public function set XSpeedCap(_arg_1:Number):void
        {
            this.m_xSpeedCap = _arg_1;
        }

        public function set HitEase(_arg_1:Number):void
        {
            this.m_hit_ease = _arg_1;
        }

        public function set ControlDirection(_arg_1:Boolean):void
        {
            this.m_controlDirection = _arg_1;
        }

        public function set HomingTarget(_arg_1:InteractiveSprite):void
        {
            this.m_homingTarget = _arg_1;
        }

        public function set HomingSpeed(_arg_1:Number):void
        {
            this.m_homingSpeed = _arg_1;
        }

        public function set DisableJump(_arg_1:Boolean):void
        {
            this.m_disableJump = _arg_1;
        }

        public function set JumpCancelAttack(_arg_1:Boolean):void
        {
            this.m_jumpCancelAttack = _arg_1;
        }

        public function set DoubleJumpCancelAttack(_arg_1:Boolean):void
        {
            this.m_doubleJumpCancelAttack = _arg_1;
        }

        public function set AllowJump(_arg_1:Boolean):void
        {
            this.m_allowJump = _arg_1;
        }

        public function set AllowFastFall(_arg_1:Boolean):void
        {
            this.m_allowFastFall = _arg_1;
        }

        public function set AllowRun(_arg_1:Boolean):void
        {
            this.m_allowRun = _arg_1;
        }

        public function set AllowTurn(_arg_1:Boolean):void
        {
            this.m_allowTurn = _arg_1;
        }

        public function set AllowDoubleJump(_arg_1:Boolean):void
        {
            this.m_allowDoubleJump = _arg_1;
        }

        public function set AllowFullInterrupt(_arg_1:Boolean):void
        {
            this.m_allowFullInterrupt = _arg_1;
        }

        public function set LinkFrames(_arg_1:Boolean):void
        {
            this.m_linkFrames = _arg_1;
        }

        public function set IsTurning(_arg_1:Boolean):void
        {
            this.m_isTurning = _arg_1;
        }

        public function set IsAccelerating(_arg_1:Boolean):void
        {
            this.m_isAccelerating = _arg_1;
        }

        public function set IsThrow(_arg_1:Boolean):void
        {
            this.m_isThrow = _arg_1;
        }

        public function set ChargeInAir(_arg_1:Boolean):void
        {
            this.m_chargeInAir = _arg_1;
        }

        public function set SizeStatus(_arg_1:int):void
        {
            this.m_sizeStatus = _arg_1;
        }

        public function set FacedLedgesOnly(_arg_1:Boolean):void
        {
            this.m_facedLedgesOnly = _arg_1;
        }

        public function set ChargeRetain(_arg_1:Boolean):void
        {
            this.m_charge_retain = _arg_1;
        }

        public function set IgnoreChargeDamage(_arg_1:Boolean):void
        {
            this.m_ignoreChargeDamage = _arg_1;
        }

        public function set IgnoreChargeKnockback(_arg_1:Boolean):void
        {
            this.m_ignoreChargeKnockback = _arg_1;
        }

        public function set ResetMovement(_arg_1:Boolean):void
        {
            this.m_resetMovement = _arg_1;
        }

        public function set CanFallOff(_arg_1:Boolean):void
        {
            this.m_canFallOff = _arg_1;
        }

        public function set CanBeAbsorbed(_arg_1:Boolean):void
        {
            this.m_canBeAbsorbed = _arg_1;
        }

        public function set MaintainSpeed(_arg_1:Boolean):void
        {
            this.m_maintainSpeed = _arg_1;
        }

        public function set SecondaryAttack(_arg_1:String):void
        {
            this.m_secondaryAttack = _arg_1;
        }

        public function importAttackStateData(_arg_1:Object):void
        {
            var _local_2:*;
            for (_local_2 in _arg_1)
            {
                if (this[("m_" + _local_2)] !== undefined)
                {
                    this[("m_" + _local_2)] = _arg_1[_local_2];
                }
                else
                {
                    trace((('You tried to set "m_' + _local_2) + "\" but it doesn't exist in the AttackState class."));
                };
            };
        }

        public function getVar(_arg_1:String):*
        {
            if (this[("m_" + _arg_1)] !== undefined)
            {
                return (this[("m_" + _arg_1)]);
            };
            return (null);
        }


    }
}//package com.mcleodgaming.ssf2.engine