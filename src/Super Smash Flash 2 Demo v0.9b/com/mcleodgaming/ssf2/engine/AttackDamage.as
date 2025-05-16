package com.mcleodgaming.ssf2.engine
{
    import com.mcleodgaming.ssf2.controllers.MenuController;

    public class AttackDamage 
    {

        private var m_attackState:AttackState;
        private var m_player_id:int;
        private var m_owner:InteractiveSprite;
        private var m_attackBoxName:String;
        private var m_isForward:Boolean;
        private var m_damage:Number;
        private var m_absorb_damage:Number;
        private var m_shieldDamage:Number;
        private var m_shieldStunMultiplier:Number;
        private var m_forceTumbleFall:Boolean;
        private var m_kbConstant:Number;
        private var m_stackKnockback:Boolean;
        private var m_canDI:Boolean;
        private var m_staleMultiplier:Number;
        private var m_power:Number;
        private var m_priority:int;
        private var m_chargedPriority:int;
        private var m_atk_id:int;
        private var m_chargetime:int;
        private var m_chargetime_max:int;
        private var m_charge_kbMultiplier:Number;
        private var m_charge_damageMultiplier:Number;
        private var m_ignoreChargeDamage:Boolean;
        private var m_direction:Number;
        private var m_reversableAngle:Boolean;
        private var m_stun:int;
        private var m_dizzy:int;
        private var m_dizzySelf:int;
        private var m_pitfall:int;
        private var m_egg:Boolean;
        private var m_effect_id:String;
        private var m_effectSound:String;
        private var m_stunSelf:int;
        private var m_hasEffect:Boolean;
        private var m_sdiDistance:Number;
        private var m_shieldSound:String;
        private var m_freeze:int;
        private var m_shock:Boolean;
        private var m_burn:Boolean;
        private var m_sleep:int;
        private var m_poison:int;
        private var m_poisonInterval:int;
        private var m_poisonLength:int;
        private var m_bypassShield:Boolean;
        private var m_bypassEnemies:Boolean;
        private var m_xloc:Number;
        private var m_yloc:Number;
        private var m_otherPlayerID:int;
        private var m_hurtSelf:Boolean;
        private var m_hurtSelfShield:Boolean;
        private var m_meteorCancel:Boolean;
        private var m_meteorBounce:Boolean;
        private var m_paralysis:int;
        private var m_hitStun:int;
        private var m_hitStunProjectile:int;
        private var m_hitLag:Number;
        private var m_weightKB:Number;
        private var m_selfHitStun:int;
        private var m_camShake:int;
        private var m_team_id:int;
        private var m_bypassGrabbed:Boolean;
        private var m_bypassNonGrabbed:Boolean;
        private var m_bypassNonLatched:Boolean;
        private var m_onlyAffectsAir:Boolean;
        private var m_onlyAffectsFall:Boolean;
        private var m_onlyAffectsGround:Boolean;
        private var m_allowTurboInterrupt:Boolean;
        private var m_sizeStatus:int;
        private var m_reverse_character:Boolean;
        private var m_reverse_item:Boolean;
        private var m_reverse_projectile:Boolean;
        private var m_disableLastHitUpdate:Boolean;
        private var m_disableHurtSound:Boolean;
        private var m_disableHurtFallOff:Boolean;
        private var m_isAirAttack:Boolean;
        private var m_isThrow:Boolean;
        private var m_importedData:Boolean;

        public function AttackDamage(_arg_1:int, _arg_2:InteractiveSprite=null)
        {
            this.m_attackState = new AttackState();
            this.m_player_id = _arg_1;
            this.m_owner = _arg_2;
            this.m_attackBoxName = null;
            this.m_isForward = true;
            this.m_damage = 0;
            this.m_absorb_damage = 0;
            this.m_shieldDamage = -1;
            this.m_shieldStunMultiplier = 1;
            this.m_forceTumbleFall = false;
            this.m_kbConstant = 100;
            this.m_stackKnockback = true;
            this.m_canDI = true;
            this.m_staleMultiplier = 1.05;
            this.m_power = 0;
            this.m_priority = 0;
            this.m_chargedPriority = -1;
            this.m_atk_id = 0;
            this.m_charge_kbMultiplier = 1;
            this.m_charge_damageMultiplier = 1;
            this.m_ignoreChargeDamage = false;
            this.m_direction = 0;
            this.m_reversableAngle = true;
            this.m_chargetime = 0;
            this.m_chargetime_max = 0;
            this.m_stun = 0;
            this.m_dizzy = 0;
            this.m_dizzySelf = 0;
            this.m_pitfall = 0;
            this.m_egg = false;
            this.m_effect_id = null;
            this.m_effectSound = null;
            this.m_stunSelf = 0;
            this.m_hasEffect = true;
            this.m_sdiDistance = 1;
            this.m_shieldSound = "shieldhit";
            this.m_freeze = 0;
            this.m_sleep = 0;
            this.m_poison = 0;
            this.m_poisonInterval = 15;
            this.m_poisonLength = 300;
            this.m_bypassShield = false;
            this.m_bypassEnemies = false;
            this.m_shock = false;
            this.m_burn = false;
            this.m_xloc = 0;
            this.m_yloc = 0;
            this.m_otherPlayerID = 0;
            this.m_hurtSelf = false;
            this.m_hurtSelfShield = false;
            this.m_meteorCancel = false;
            this.m_meteorBounce = true;
            this.m_paralysis = -1;
            this.m_hitStun = -1;
            this.m_hitStunProjectile = 0;
            this.m_hitLag = -1;
            this.m_weightKB = 0;
            this.m_selfHitStun = -1;
            this.m_camShake = 0;
            this.m_team_id = -1;
            this.m_bypassGrabbed = false;
            this.m_bypassNonGrabbed = false;
            this.m_bypassNonLatched = false;
            this.m_onlyAffectsAir = false;
            this.m_onlyAffectsFall = false;
            this.m_onlyAffectsGround = false;
            this.m_allowTurboInterrupt = true;
            this.m_sizeStatus = 0;
            this.m_reverse_character = false;
            this.m_reverse_item = false;
            this.m_reverse_projectile = false;
            this.m_disableLastHitUpdate = false;
            this.m_disableHurtSound = false;
            this.m_disableHurtFallOff = false;
            this.m_isAirAttack = false;
            this.m_isThrow = false;
            this.m_importedData = false;
        }

        public function get PlayerID():int
        {
            return (this.m_player_id);
        }

        public function set PlayerID(_arg_1:int):void
        {
            this.m_player_id = _arg_1;
        }

        public function get Owner():InteractiveSprite
        {
            return (this.m_owner);
        }

        public function set Owner(_arg_1:InteractiveSprite):void
        {
            this.m_owner = _arg_1;
        }

        public function get AttackBoxName():String
        {
            return (this.m_attackBoxName);
        }

        public function set AttackBoxName(_arg_1:String):void
        {
            this.m_attackBoxName = _arg_1;
        }

        public function get IsForward():Boolean
        {
            return (this.m_isForward);
        }

        public function set IsForward(_arg_1:Boolean):void
        {
            this.m_isForward = _arg_1;
        }

        public function get Damage():Number
        {
            return (this.m_damage);
        }

        public function set Damage(_arg_1:Number):void
        {
            this.m_damage = Math.min(_arg_1, 999);
        }

        public function get AbsorbDamage():Number
        {
            return (this.m_absorb_damage);
        }

        public function set AbsorbDamage(_arg_1:Number):void
        {
            this.m_absorb_damage = _arg_1;
        }

        public function get ShieldDamage():Number
        {
            return (this.m_shieldDamage);
        }

        public function set ShieldDamage(_arg_1:Number):void
        {
            this.m_shieldDamage = _arg_1;
        }

        public function get ShieldStunMultiplier():Number
        {
            return (this.m_shieldStunMultiplier);
        }

        public function set ShieldStunMultiplier(_arg_1:Number):void
        {
            this.m_shieldStunMultiplier = _arg_1;
        }

        public function get ForceTumbleFall():Boolean
        {
            return (this.m_forceTumbleFall);
        }

        public function set ForceTumbleFall(_arg_1:Boolean):void
        {
            this.m_forceTumbleFall = _arg_1;
        }

        public function get KBConstant():Number
        {
            return (this.m_kbConstant);
        }

        public function set KBConstant(_arg_1:Number):void
        {
            this.m_kbConstant = _arg_1;
        }

        public function get StackKnockback():Boolean
        {
            return (this.m_stackKnockback);
        }

        public function set StackKnockback(_arg_1:Boolean):void
        {
            this.m_stackKnockback = _arg_1;
        }

        public function get CanDI():Boolean
        {
            return (this.m_canDI);
        }

        public function set CanDI(_arg_1:Boolean):void
        {
            this.m_canDI = _arg_1;
        }

        public function get StaleMultiplier():Number
        {
            return (this.m_staleMultiplier);
        }

        public function set StaleMultiplier(_arg_1:Number):void
        {
            this.m_staleMultiplier = _arg_1;
        }

        public function get Power():Number
        {
            return (this.m_power);
        }

        public function set Power(_arg_1:Number):void
        {
            this.m_power = _arg_1;
            if (((this.m_power >= 200) && (MenuController.debugConsole)))
            {
                MenuController.debugConsole.alert((("Alert!!! A power level of " + this.m_power) + " has been detected. This should be lowered to a more reasonable value. The engine has forced this value to be 0 instead."));
            }
            else
            {
                if (((this.m_power < 0) && (MenuController.debugConsole)))
                {
                    MenuController.debugConsole.alert((("Alert!!! A power level of " + this.m_power) + " has been detected. Negative values are no good in SSF2's KB formula, please use weightKB instead."));
                };
            };
            if (this.m_power >= 200)
            {
                this.m_power = 0;
            };
        }

        public function get ChargedPriority():int
        {
            return (this.m_chargedPriority);
        }

        public function set ChargedPriority(_arg_1:int):void
        {
            this.m_chargedPriority = _arg_1;
        }

        public function get Priority():int
        {
            return ((((this.ChargeTimeMax > 0) && (this.ChargeTime >= this.ChargeTimeMax)) && (this.ChargedPriority >= 0)) ? this.m_chargedPriority : this.m_priority);
        }

        public function set Priority(_arg_1:int):void
        {
            this.m_priority = _arg_1;
        }

        public function get AttackID():int
        {
            return (this.m_atk_id);
        }

        public function set AttackID(_arg_1:int):void
        {
            this.m_atk_id = _arg_1;
        }

        public function get Direction():Number
        {
            return (this.m_direction);
        }

        public function set Direction(_arg_1:Number):void
        {
            this.m_direction = _arg_1;
        }

        public function get ReversableAngle():Boolean
        {
            return (this.m_reversableAngle);
        }

        public function set ReversableAngle(_arg_1:Boolean):void
        {
            this.m_reversableAngle = _arg_1;
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

        public function set ChargeTimeMax(_arg_1:int):void
        {
            this.m_chargetime_max = _arg_1;
        }

        public function get Stun():int
        {
            return (this.m_stun);
        }

        public function set Stun(_arg_1:int):void
        {
            this.m_stun = _arg_1;
        }

        public function get Dizzy():int
        {
            return (this.m_dizzy);
        }

        public function set Dizzy(_arg_1:int):void
        {
            this.m_dizzy = _arg_1;
        }

        public function get DizzySelf():int
        {
            return (this.m_dizzySelf);
        }

        public function set DizzySelf(_arg_1:int):void
        {
            this.m_dizzySelf = _arg_1;
        }

        public function get Pitfall():int
        {
            return (this.m_pitfall);
        }

        public function set Pitfall(_arg_1:int):void
        {
            this.m_pitfall = _arg_1;
        }

        public function get Egg():Boolean
        {
            return (this.m_egg);
        }

        public function set Egg(_arg_1:Boolean):void
        {
            this.m_egg = _arg_1;
        }

        public function get EffectID():String
        {
            return (this.m_effect_id);
        }

        public function set EffectID(_arg_1:String):void
        {
            this.m_effect_id = _arg_1;
        }

        public function get EffectSound():String
        {
            return (this.m_effectSound);
        }

        public function set EffectSound(_arg_1:String):void
        {
            this.m_effectSound = _arg_1;
        }

        public function get StunSelf():int
        {
            return (this.m_stunSelf);
        }

        public function set StunSelf(_arg_1:int):void
        {
            this.m_stunSelf = _arg_1;
        }

        public function get HasEffect():Boolean
        {
            return (this.m_hasEffect);
        }

        public function set HasEffect(_arg_1:Boolean):void
        {
            this.m_hasEffect = _arg_1;
        }

        public function get SDIDistance():Number
        {
            return (this.m_sdiDistance);
        }

        public function set SDIDistance(_arg_1:Number):void
        {
            this.m_sdiDistance = _arg_1;
        }

        public function get ShieldSound():String
        {
            return (this.m_shieldSound);
        }

        public function set ShieldSound(_arg_1:String):void
        {
            this.m_shieldSound = _arg_1;
        }

        public function get Freeze():int
        {
            return (this.m_freeze);
        }

        public function set Freeze(_arg_1:int):void
        {
            this.m_freeze = _arg_1;
        }

        public function get Sleep():int
        {
            return (this.m_sleep);
        }

        public function set Sleep(_arg_1:int):void
        {
            this.m_sleep = _arg_1;
        }

        public function get Poison():int
        {
            return (this.m_poison);
        }

        public function set Poison(_arg_1:int):void
        {
            this.m_poison = _arg_1;
        }

        public function get PoisonInterval():int
        {
            return (this.m_poisonInterval);
        }

        public function set PoisonInterval(_arg_1:int):void
        {
            this.m_poisonInterval = _arg_1;
        }

        public function get PoisonLength():int
        {
            return (this.m_poisonLength);
        }

        public function set PoisonLength(_arg_1:int):void
        {
            this.m_poisonLength = _arg_1;
        }

        public function get BypassShield():Boolean
        {
            return (this.m_bypassShield);
        }

        public function set BypassShield(_arg_1:Boolean):void
        {
            this.m_bypassShield = _arg_1;
        }

        public function get BypassEnemies():Boolean
        {
            return (this.m_bypassEnemies);
        }

        public function set BypassEnemies(_arg_1:Boolean):void
        {
            this.m_bypassEnemies = _arg_1;
        }

        public function get Shock():Boolean
        {
            return (this.m_shock);
        }

        public function set Shock(_arg_1:Boolean):void
        {
            this.m_shock = _arg_1;
        }

        public function get Burn():Boolean
        {
            return (this.m_burn);
        }

        public function set Burn(_arg_1:Boolean):void
        {
            this.m_burn = _arg_1;
        }

        public function get XLoc():Number
        {
            return (this.m_xloc);
        }

        public function set XLoc(_arg_1:Number):void
        {
            this.m_xloc = _arg_1;
        }

        public function get YLoc():Number
        {
            return (this.m_yloc);
        }

        public function set YLoc(_arg_1:Number):void
        {
            this.m_yloc = _arg_1;
        }

        public function get OtherPlayerID():int
        {
            return (this.m_otherPlayerID);
        }

        public function set OtherPlayerID(_arg_1:int):void
        {
            this.m_otherPlayerID = _arg_1;
        }

        public function get HurtSelf():Boolean
        {
            return (this.m_hurtSelf);
        }

        public function set HurtSelf(_arg_1:Boolean):void
        {
            this.m_hurtSelf = _arg_1;
        }

        public function get HurtSelfShield():Boolean
        {
            return (this.m_hurtSelfShield);
        }

        public function set HurtSelfShield(_arg_1:Boolean):void
        {
            this.m_hurtSelfShield = _arg_1;
        }

        public function get MeteorCancel():Boolean
        {
            return (this.m_meteorCancel);
        }

        public function set MeteorCancel(_arg_1:Boolean):void
        {
            this.m_meteorCancel = _arg_1;
        }

        public function get MeteorBounce():Boolean
        {
            return (this.m_meteorBounce);
        }

        public function set MeteorBounce(_arg_1:Boolean):void
        {
            this.m_meteorBounce = _arg_1;
        }

        public function get Paralysis():int
        {
            return (this.m_paralysis);
        }

        public function set Paralysis(_arg_1:int):void
        {
            this.m_paralysis = _arg_1;
        }

        public function get HitStun():int
        {
            return (this.m_hitStun);
        }

        public function set HitStun(_arg_1:int):void
        {
            this.m_hitStun = _arg_1;
        }

        public function get HitStunProjectile():int
        {
            return (this.m_hitStunProjectile);
        }

        public function set HitStunProjectile(_arg_1:int):void
        {
            this.m_hitStunProjectile = _arg_1;
        }

        public function get HitLag():Number
        {
            return (this.m_hitLag);
        }

        public function set HitLag(_arg_1:Number):void
        {
            this.m_hitLag = _arg_1;
        }

        public function get WeightKB():Number
        {
            return (this.m_weightKB);
        }

        public function set WeightKB(_arg_1:Number):void
        {
            this.m_weightKB = _arg_1;
        }

        public function get SelfHitStun():int
        {
            return (this.m_selfHitStun);
        }

        public function set SelfHitStun(_arg_1:int):void
        {
            this.m_selfHitStun = _arg_1;
        }

        public function get CamShake():int
        {
            return (this.m_camShake);
        }

        public function set CamShake(_arg_1:int):void
        {
            this.m_camShake = _arg_1;
        }

        public function get TeamID():int
        {
            return (this.m_team_id);
        }

        public function set TeamID(_arg_1:int):void
        {
            this.m_team_id = _arg_1;
        }

        public function get BypassGrabbed():Boolean
        {
            return (this.m_bypassGrabbed);
        }

        public function set BypassGrabbed(_arg_1:Boolean):void
        {
            this.m_bypassGrabbed = _arg_1;
        }

        public function get BypassNonGrabbed():Boolean
        {
            return (this.m_bypassNonGrabbed);
        }

        public function set BypassNonGrabbed(_arg_1:Boolean):void
        {
            this.m_bypassNonGrabbed = _arg_1;
        }

        public function get BypassNonLatched():Boolean
        {
            return (this.m_bypassNonLatched);
        }

        public function set BypassNonLatched(_arg_1:Boolean):void
        {
            this.m_bypassNonLatched = _arg_1;
        }

        public function get SizeStatus():int
        {
            return (this.m_sizeStatus);
        }

        public function set SizeStatus(_arg_1:int):void
        {
            this.m_sizeStatus = _arg_1;
        }

        public function get OnlyAffectsAir():Boolean
        {
            return (this.m_onlyAffectsAir);
        }

        public function set OnlyAffectsAir(_arg_1:Boolean):void
        {
            this.m_onlyAffectsAir = _arg_1;
        }

        public function get OnlyAffectsGround():Boolean
        {
            return (this.m_onlyAffectsGround);
        }

        public function set OnlyAffectsGround(_arg_1:Boolean):void
        {
            this.m_onlyAffectsGround = _arg_1;
        }

        public function get OnlyAffectsFall():Boolean
        {
            return (this.m_onlyAffectsFall);
        }

        public function set OnlyAffectsFall(_arg_1:Boolean):void
        {
            this.m_onlyAffectsFall = _arg_1;
        }

        public function get AllowTurboInterrupt():Boolean
        {
            return (this.m_allowTurboInterrupt);
        }

        public function set AllowTurboInterrupt(_arg_1:Boolean):void
        {
            this.m_allowTurboInterrupt = _arg_1;
        }

        public function get ChargeKBMultiplier():Number
        {
            return (this.m_charge_kbMultiplier);
        }

        public function set ChargeKBMultiplier(_arg_1:Number):void
        {
            this.m_charge_kbMultiplier = _arg_1;
        }

        public function get ChargeDamageMultiplier():Number
        {
            return (this.m_charge_damageMultiplier);
        }

        public function set ChargeDamageMultiplier(_arg_1:Number):void
        {
            this.m_charge_damageMultiplier = _arg_1;
        }

        public function get IgnoreChargeDamage():Boolean
        {
            return (this.m_ignoreChargeDamage);
        }

        public function set IgnoreChargeDamage(_arg_1:Boolean):void
        {
            this.m_ignoreChargeDamage = _arg_1;
        }

        public function get ReverseCharacter():Boolean
        {
            return (this.m_reverse_character);
        }

        public function set ReverseCharacter(_arg_1:Boolean):void
        {
            this.m_reverse_character = _arg_1;
        }

        public function get ReverseItem():Boolean
        {
            return (this.m_reverse_item);
        }

        public function set ReverseItem(_arg_1:Boolean):void
        {
            this.m_reverse_item = _arg_1;
        }

        public function get ReverseProjectile():Boolean
        {
            return (this.m_reverse_projectile);
        }

        public function set ReverseProjectile(_arg_1:Boolean):void
        {
            this.m_reverse_projectile = _arg_1;
        }

        public function get DisableLastHitUpdate():Boolean
        {
            return (this.m_disableLastHitUpdate);
        }

        public function set DisableLastHitUpdate(_arg_1:Boolean):void
        {
            this.m_disableLastHitUpdate = _arg_1;
        }

        public function get DisableHurtSound():Boolean
        {
            return (this.m_disableHurtSound);
        }

        public function set DisableHurtSound(_arg_1:Boolean):void
        {
            this.m_disableHurtSound = _arg_1;
        }

        public function get DisableHurtFallOff():Boolean
        {
            return (this.m_disableHurtFallOff);
        }

        public function set DisableHurtFallOff(_arg_1:Boolean):void
        {
            this.m_disableHurtFallOff = _arg_1;
        }

        public function get IsAirAttack():Boolean
        {
            return (this.m_isAirAttack);
        }

        public function set IsAirAttack(_arg_1:Boolean):void
        {
            this.m_isAirAttack = _arg_1;
        }

        public function get IsThrow():Boolean
        {
            return (this.m_isThrow);
        }

        public function set IsThrow(_arg_1:Boolean):void
        {
            this.m_isThrow = _arg_1;
        }

        public function get ImportedData():Boolean
        {
            return (this.m_importedData);
        }

        public function getVar(_arg_1:String):*
        {
            if (this[("m_" + _arg_1)] !== undefined)
            {
                return (this[("m_" + _arg_1)]);
            };
            return (null);
        }

        public function syncState(_arg_1:AttackState):AttackDamage
        {
            if (_arg_1)
            {
                this.m_isForward = _arg_1.IsForward;
                this.m_atk_id = _arg_1.AttackID;
                this.m_isAirAttack = _arg_1.IsAirAttack;
                this.m_isThrow = _arg_1.IsThrow;
                this.m_sizeStatus = _arg_1.SizeStatus;
                this.m_disableHurtSound = _arg_1.DisableHurtSound;
                this.m_xloc = _arg_1.XLoc;
                this.m_yloc = _arg_1.YLoc;
                this.m_owner = _arg_1.Owner;
                this.m_chargetime = _arg_1.ChargeTime;
                this.m_chargetime_max = _arg_1.ChargeTimeMax;
                this.m_staleMultiplier = _arg_1.StaleMultiplier;
                if (this.m_owner)
                {
                    this.m_player_id = ((_arg_1.ReverseID > 0) ? _arg_1.ReverseID : this.m_owner.ID);
                    this.m_team_id = ((_arg_1.ReverseTeam > 0) ? _arg_1.ReverseTeam : this.m_owner.Team);
                };
            };
            return (this);
        }

        public function importAttackDamageData(_arg_1:Object):void
        {
            var _local_2:*;
            this.m_importedData = true;
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
            if (this.m_damage > 999)
            {
                this.m_damage = 999;
            };
        }

        public function exportAttackDamageData():Object
        {
            return ({
                "player_id":this.m_player_id,
                "owner":this.m_owner,
                "isForward":this.m_isForward,
                "damage":this.m_damage,
                "absorb_damage":this.m_absorb_damage,
                "shieldDamage":this.m_shieldDamage,
                "shieldStunMultiplier":this.m_shieldStunMultiplier,
                "forceTumbleFall":this.m_forceTumbleFall,
                "kbConstant":this.m_kbConstant,
                "stackKnockback":this.m_stackKnockback,
                "canDI":this.m_canDI,
                "staleMultiplier":this.m_staleMultiplier,
                "power":this.m_power,
                "priority":this.m_priority,
                "atk_id":this.m_atk_id,
                "charge_kbMultiplier":this.m_charge_kbMultiplier,
                "charge_damageMultiplier":this.m_charge_damageMultiplier,
                "ignoreChargeDamage":this.m_ignoreChargeDamage,
                "direction":this.m_direction,
                "reversableAngle":this.m_reversableAngle,
                "chargetime":this.m_chargetime,
                "chargetime_max":this.m_chargetime_max,
                "stun":this.m_stun,
                "dizzy":this.m_dizzy,
                "dizzySelf":this.m_dizzySelf,
                "pitfall":this.m_pitfall,
                "egg":this.m_egg,
                "effect_id":this.m_effect_id,
                "effectSound":this.m_effectSound,
                "stunSelf":this.m_stunSelf,
                "hasEffect":this.m_hasEffect,
                "sdiDistance":this.m_sdiDistance,
                "shieldSound":this.m_shieldSound,
                "freeze":this.m_freeze,
                "sleep":this.m_sleep,
                "poison":this.m_poison,
                "poisonInterval":this.m_poisonInterval,
                "poisonLength":this.m_poisonLength,
                "bypassShield":this.m_bypassShield,
                "bypassEnemies":this.m_bypassEnemies,
                "shock":this.m_shock,
                "burn":this.m_burn,
                "xloc":this.m_xloc,
                "yloc":this.m_yloc,
                "otherPlayerID":this.m_otherPlayerID,
                "hurtSelf":this.m_hurtSelf,
                "hurtSelfShield":this.m_hurtSelfShield,
                "meteorCancel":this.m_meteorCancel,
                "meteorBounce":this.m_meteorBounce,
                "paralysis":this.m_paralysis,
                "hitStun":this.m_hitStun,
                "hitStunProjectile":this.m_hitStunProjectile,
                "hitLag":this.m_hitLag,
                "weightKB":this.m_weightKB,
                "selfHitStun":this.m_selfHitStun,
                "camShake":this.m_camShake,
                "team_id":this.m_team_id,
                "bypassGrabbed":this.m_bypassGrabbed,
                "bypassNonGrabbed":this.m_bypassNonGrabbed,
                "bypassNonLatched":this.m_bypassNonLatched,
                "onlyAffectsAir":this.m_onlyAffectsAir,
                "onlyAffectsFall":this.m_onlyAffectsFall,
                "onlyAffectsGround":this.m_onlyAffectsGround,
                "allowTurboInterrupt":this.m_allowTurboInterrupt,
                "sizeStatus":this.m_sizeStatus,
                "disableLastHitUpdate":this.m_disableLastHitUpdate,
                "disableHurtSound":this.m_disableHurtSound,
                "disableHurtFallOff":this.m_disableHurtFallOff,
                "isAirAttack":this.m_isAirAttack,
                "isThrow":this.m_isThrow,
                "reverse_character":this.m_reverse_character,
                "reverse_item":this.m_reverse_item,
                "reverse_projectile":this.m_reverse_projectile
            });
        }


    }
}//package com.mcleodgaming.ssf2.engine