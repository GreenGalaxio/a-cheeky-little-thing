package com.mcleodgaming.ssf2.engine
{
    import com.mcleodgaming.ssf2.util.Utils;
    import com.mcleodgaming.ssf2.controllers.MatchResults;
    import com.mcleodgaming.ssf2.util.Controller;
    import com.mcleodgaming.ssf2.util.FrameTimer;
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2.platforms.Platform;
    import __AS3__.vec.Vector;
    import com.mcleodgaming.ssf2.items.Item;
    import flash.geom.Rectangle;
    import com.mcleodgaming.ssf2.platforms.CollisionBoundary;
    import com.mcleodgaming.ssf2.Main;
    import com.mcleodgaming.ssf2.enums.CState;
    import com.mcleodgaming.ssf2.enums.SpecialMode;
    import com.mcleodgaming.ssf2.enums.ModeFeatures;
    import flash.events.MouseEvent;
    import com.mcleodgaming.ssf2.util.MouseTracker;
    import flash.events.Event;
    import com.mcleodgaming.ssf2.events.SSF2Event;
    import com.mcleodgaming.ssf2.items.EnergyTank;
    import com.mcleodgaming.ssf2.util.Vcam;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.display.Bitmap;
    import flash.geom.ColorTransform;
    import flash.geom.Point;
    import com.mcleodgaming.ssf2.enums.Mode;
    import flash.text.TextField;
    import com.mcleodgaming.ssf2.controllers.GameController;
    import com.mcleodgaming.ssf2.platforms.MovingPlatform;
    import com.mcleodgaming.ssf2.controllers.MenuController;
    import com.mcleodgaming.ssf2.items.AssistTrophyItem;
    import com.mcleodgaming.ssf2.assists.AssistTrophy;
    import flash.display.DisplayObject;
    import com.mcleodgaming.ssf2.enums.IState;
    import com.mcleodgaming.ssf2.enemies.Enemy;
    import com.mcleodgaming.ssf2.audio.SoundObject;
    import com.mcleodgaming.ssf2.enemies.BM_Goblin;
    import com.mcleodgaming.ssf2.enemies.BM_Bomb;
    import com.mcleodgaming.ssf2.enemies.BM_Wolf;
    import com.mcleodgaming.ssf2.util.*;
    import com.mcleodgaming.ssf2.enums.*;
    import com.mcleodgaming.ssf2.audio.*;
    import com.mcleodgaming.ssf2.assists.*;
    import com.mcleodgaming.ssf2.controllers.*;
    import com.mcleodgaming.ssf2.enemies.*;
    import com.mcleodgaming.ssf2.items.*;
    import com.mcleodgaming.ssf2.net.*;
    import com.mcleodgaming.ssf2.platforms.*;
    import __AS3__.vec.*;

    public class Character extends InteractiveSprite 
    {

        private var m_preFrameInfo:String;
        private var m_freezePlayback:Boolean;
        private var HEAVY_KNOCKBACK_THRESHOLD:Number = (2.4 * Utils.VELOCITY_SCALE);
        private var HEAVY_KNOCKBACK_HITLAG_THRESHOLD:Number = 16;
        private var m_hitLagHack:Number = 1.79769313486232E308;
        private var SDI_BASE:Number = 6;
        private var m_characterStats:CharacterData;
        private var m_playerName:String;
        private var m_costume_id:int;
        private var m_expansion_id:int;
        private var m_teamDamage:Boolean;
        private var m_transformingSpecial:Boolean;
        private var m_transformedSpecial:Boolean;
        private var m_transformTime:int;
        private var m_transformLimit:int;
        private var m_unlimitedFinal:Boolean;
        private var m_specialInit:Boolean;
        private var m_matchResults:MatchResults;
        private var m_droughtTimer:int;
        private var m_justHit:Boolean;
        private var m_justHitTimer:int;
        private var m_key:Controller;
        private var m_starKOTimer:FrameTimer;
        private var m_starKOMC:MovieClip;
        private var m_screenKO:Boolean;
        private var m_starKOHolder:MovieClip;
        private var m_screenKOHolder:MovieClip;
        private var m_crowdAwe:Boolean;
        private var m_originalSizeRatio:Number;
        private var m_sizeStatus:int;
        private var m_sizeStatusPermanent:Boolean;
        private var m_sizeStatusTimer:FrameTimer;
        private var m_lives:int;
        private var m_usingLives:Boolean;
        private var m_jumpSpeedMidairDelay:FrameTimer;
        private var m_jumpStartup:FrameTimer;
        private var m_doingBackFlip:Boolean;
        private var m_jumpSpeedList:Array;
        private var m_jumpEffectTimer:FrameTimer;
        private var m_jumpTimer:int;
        private var m_shortHop:Boolean;
        private var m_jumpJustLetGo:Boolean;
        private var m_attackHovering:Boolean;
        private var m_canHover:Boolean;
        private var m_midAirHoverTime:FrameTimer;
        private var m_midAirJumpConstantTime:FrameTimer;
        private var m_midAirJumpConstantDelay:FrameTimer;
        private var m_rocketSpeed:Number;
        private var m_rocketRotation:Boolean;
        private var m_rocketDecay:Number;
        private var m_rocketAngle:Number;
        private var m_smashTimer:int;
        private var m_smashTimerUp:int;
        private var m_smashTimerSide:int;
        private var m_smashTimerDown:int;
        private var m_upSpecialTimer:int;
        private var m_specialTurnTimer:FrameTimer;
        private var m_specialTurnRight:Boolean;
        private var m_runningSpeedLevel:Boolean;
        private var m_speedTimer:int;
        private var m_speedLetGo:Boolean;
        private var m_dashReady:Boolean;
        private var m_speedFacingForward:Boolean;
        private var m_norm_xSpeed:Number;
        private var m_max_xSpeed:Number;
        private var m_glideAngle:Number;
        private var m_glideMaxHeight:Number;
        private var m_glideDelay:int;
        private var m_glideReady:Boolean;
        private var m_underWater:MovieClip;
        private var m_flyingRight:Boolean;
        private var m_flyingUp:Boolean;
        private var m_windBoxHit:Boolean;
        private var m_hasArced:Boolean;
        private var m_forcedCrash:Boolean;
        private var m_fallTiltTimer:FrameTimer;
        private var m_fallTiltRight:Boolean;
        private var m_forceTumbleFall:Boolean;
        private var m_hitLag:int;
        private var m_hitLagJumpCancelTimer:FrameTimer;
        private var m_hitLagCanCancel:Boolean;
        private var m_hitLagLetGo:Boolean;
        private var m_hitLagStunTimer:FrameTimer;
        private var m_hitLagLandDelay:FrameTimer;
        private var m_hitsDealtCounter:int;
        private var m_hitsReceivedCounter:int;
        private var m_smashDILetGo:Boolean;
        private var m_smashDILetGoCStick:Boolean;
        private var m_smashDIAmount:Number;
        private var m_smashDISelf:Boolean;
        private var m_canDI:Boolean;
        private var m_techLetGo:Boolean;
        private var m_techTimer:FrameTimer;
        private var m_techDelay:FrameTimer;
        private var m_techReady:Boolean;
        private var m_canTech:Boolean;
        private var m_canWallTech:Boolean;
        private var m_canBounce:Boolean;
        private var m_hasBounced:Boolean;
        private var m_stunTimer:int;
        private var m_dizzyTimer:int;
        private var m_stunCancelTimer:FrameTimer;
        private var m_dizzyShield:Boolean;
        private var m_pitfallTimer:int;
        private var m_ricochetCount:FrameTimer;
        private var m_ricochetTimer:FrameTimer;
        private var m_ricochetX:FrameTimer;
        private var m_ricochetY:FrameTimer;
        private var m_invisibleTimer:FrameTimer;
        private var m_invincibleBrightness:Number;
        private var m_invincibleUp:Boolean;
        private var m_disableHurtFallOff:Boolean;
        private var m_jumpCount:int;
        private var m_jumpLetGo:Boolean;
        private var m_jumpFullyReleased:Boolean;
        private var m_bufferedAttackJump:Boolean;
        private var m_jumpSpeedBuffer:Number;
        private var m_crouch:Boolean;
        private var m_crouchTimer:int;
        private var m_crouchLength:int;
        private var m_crouchFrame:int;
        private var m_wallJumpCount:int;
        private var m_wallStickTime:FrameTimer;
        private var m_wallClingDelay:FrameTimer;
        private var m_shieldTimer:int;
        private var m_shieldStartFrame:int;
        private var m_shieldType:String;
        private var m_shieldPower:Number;
        private var m_shieldLetGo:Boolean;
        private var m_shield_originalWidth:Number;
        private var m_shield_originalHeight:Number;
        private var m_shieldDelay:int;
        private var m_shieldDelayTimer:FrameTimer;
        private var m_shieldStartTimer:int;
        private var m_shieldDropLag:FrameTimer;
        private var m_dodgeTimer:Number;
        private var m_dodgeLetGo:Boolean;
        private var m_sideStepLetGo:Boolean;
        private var m_fastFallLetGo:Boolean;
        private var m_fastFallLetGoAttack:Boolean;
        private var m_attackDelay:int;
        private var m_attackLetGoA:Boolean;
        private var m_attackLetGoB:Boolean;
        private var m_attackIDIncremented:Boolean;
        private var m_up:Boolean;
        private var m_down:Boolean;
        private var m_left:Boolean;
        private var m_right:Boolean;
        private var m_a:Boolean;
        private var m_b:Boolean;
        private var m_jump2:Boolean;
        private var m_c_up:Boolean;
        private var m_c_down:Boolean;
        private var m_c_left:Boolean;
        private var m_c_right:Boolean;
        private var m_cStickUse:Boolean;
        private var m_cStickLetGo:Boolean;
        private var m_c_buffered_down:Boolean;
        private var m_c_buffered_left:Boolean;
        private var m_c_buffered_right:Boolean;
        private var m_grab:Boolean;
        private var m_grabKeyReleased:Boolean;
        private var m_grabDelay:int;
        private var m_tap_jump:Boolean;
        private var m_tap_jump_btn:Boolean;
        private var m_tapJumpLetGo:Boolean;
        private var m_dash_btn:Boolean;
        private var m_auto_dash:Boolean;
        private var m_dt_dash:Boolean;
        private var m_hitForceVisible:Boolean;
        private var m_caughtInvincibility:Boolean;
        private var m_tetherCount:int;
        private var m_taunt:Boolean;
        private var m_jump:Boolean;
        private var m_pause:Boolean;
        private var m_pauseLetGo:Boolean;
        private var m_pauseFreeze:Boolean;
        private var m_pauseTimer:int;
        private var m_pauseCamHeight:Number;
        private var m_shield_btn:Boolean;
        private var m_shield_btn2:Boolean;
        private var m_ledge:MovieClip;
        private var m_ledgeHangTimer:FrameTimer;
        private var m_lastLedge:MovieClip;
        private var m_ledgeDelay:int;
        private var m_rollTimer:int;
        private var m_currentRollSpeed:Number;
        private var m_recoveryAmount:int;
        private var m_fallthrough:Boolean;
        private var m_fallthroughPlatform:Platform;
        private var m_fallthroughTimer:FrameTimer;
        private var m_damage:Number;
        private var m_blinkTimer:int;
        private var m_blinkNumber:int;
        private var m_stamina:Boolean;
        private var m_calcAngles:Boolean;
        private var m_player:MovieClip;
        private var m_human:Boolean;
        private var m_attachedFPS:MovieClip;
        private var m_attachedReticule:MovieClip;
        private var m_usingSpecialAttack:Boolean;
        private var m_lastSFX:int;
        private var m_lastVFX:int;
        private var m_staleMovesArr:Array;
        private var m_staleMoveVals:Array;
        private var m_projectile:Vector.<Projectile>;
        private var m_lastProjectile:int;
        private var m_item:Item;
        private var m_item2:Item;
        private var m_itemSpawnTimer:FrameTimer;
        private var m_itemTimer:int;
        private var m_itemLetGo:Boolean;
        private var m_itemThrowInfo:Rectangle;
        private var m_itemThrowWeak:Boolean;
        private var m_itemThrowSmash:Boolean;
        private var m_hasFinalSmash:Boolean;
        private var m_opponents:Vector.<int>;
        private var m_warningBounds_lower:Array;
        private var m_warningBounds_upper:Array;
        private var m_ledges:Array;
        private var m_grabbed:Vector.<Character>;
        private var m_walls:Vector.<CollisionBoundary>;
        private var m_outsideCameraBounds:Boolean;
        private var m_outsideMainTerrain:Boolean;
        private var m_grabTimer:int;
        private var m_pummelTimer:int;
        private var m_justPummeled:Boolean;
        private var m_grabLetGo:Boolean;
        private var m_grabberID:int;
        private var m_struggleDirectionLetGo:Boolean;
        private var m_struggleALetGo:Boolean;
        private var m_struggleBLetGo:Boolean;
        private var m_initTimer:int;
        private var m_ignoreTauntAudio:Boolean;
        private var m_showPlayerID:Boolean;
        private var m_turnTimer:FrameTimer;
        private var m_frozenTimer:int;
        private var m_sleepingTimer:int;
        private var m_eggTimer:int;
        private var m_damageRatio:Number;
        private var m_startDamage:Number;
        private var m_dustTimer:FrameTimer;
        private var m_currentPower:String;
        private var m_kirbyLastGrabbed:int;
        private var m_charIsFull:Boolean;
        private var m_holdTimer:int;
        private var m_starTimer:int;
        private var m_justReleased:Boolean;
        private var m_kirbyDamageCounter:int;
        private var m_itemDamageCounter:int;
        private var m_lastYPosition:Number;
        private var m_forceRight:Boolean;
        private var m_forceTimer:int;
        private var m_getUpTimer:int;
        private var m_revivalTimer:int;
        private var m_revivalInvincibility:FrameTimer;
        private var m_respawnDelay:FrameTimer;
        private var m_standby:Boolean;
        private var m_comboTimer:FrameTimer;
        private var m_comboCount:int;
        private var m_comboID:int;
        private var m_comboDamage:Number;
        private var m_comboDamageTotal:Number;
        private var m_damageIncreaseInterval:FrameTimer;
        private var m_poisonIncrease:int;
        private var m_poisonIncreaseInterval:FrameTimer;
        private var m_poisonIncreaseTime:FrameTimer;
        private var m_offscreenDamageTimer:FrameTimer;
        private var m_offScreenBubble:MovieClip;
        private var m_shadowEffect:MovieClip;
        private var m_poisonEffect:MovieClip;
        private var m_pitfallEffect:MovieClip;
        private var m_healEffect:MovieClip;
        private var m_burnSmoke:MovieClip;
        private var m_warioWareIcon:MovieClip;
        private var m_starmanInvincibility:MovieClip;
        private var m_itemMC:MovieClip;
        private var m_hatMC:MovieClip;
        private var m_hatHolder:MovieClip;
        private var m_shieldHolderMC:MovieClip;
        private var m_chargeGlowHolderMC:MovieClip;
        private var m_fsGlowHolderMC:MovieClip;
        private var m_pidHolderMC:MovieClip;
        private var m_pidHolderNameMC:MovieClip;
        private var m_kirbyStarMC:MovieClip;
        private var m_yoshiEggMC:MovieClip;
        private var m_freezeMC:MovieClip;
        private var m_burnSmokeTimer:FrameTimer;
        private var m_shockEffectTimer:FrameTimer;
        private var m_poisonTintTimer:FrameTimer;
        private var m_injureFlashTimer:FrameTimer;
        private var m_warioWareIconTimer:FrameTimer;
        private var m_starmanInvincibilityTimer:FrameTimer;
        private var m_forceTransformTime:FrameTimer;
        private var m_wwScore:Number;
        private var m_wwUpLetGo:Boolean;
        private var m_wwDownLetGo:Boolean;
        private var m_wwLeftLetGo:Boolean;
        private var m_wwRightLetGo:Boolean;
        private var m_lastAttackUsedTurbo:String;
        private var m_invisiblePulseTimer:FrameTimer;
        private var m_invisiblePulseToggle:Boolean;
        private var m_invisiblePulseCount:int;
        private var CPU:AI;
        private var m_attackControlsArr:Vector.<int>;
        private var dragging:Boolean;

        public function Character(_arg_1:CharacterData, _arg_2:Object, _arg_3:StageData)
        {
            var _local_4:MovieClip;
            this.m_characterStats = _arg_1;
            _local_4 = Main.getLibraryMC(this.m_characterStats.LinkageID, _arg_2["expansion"]);
            _local_4.name = ("p" + m_player_id);
            super(_local_4, _arg_3);
            m_state = CState.IDLE;
            m_player_id = _arg_1.PlayerID;
            this.m_costume_id = _arg_2["costumeID"];
            this.m_playerName = _arg_2["name"];
            _local_4.player_id = m_player_id;
            m_sprite.x = this.m_characterStats.XStart;
            m_sprite.y = this.m_characterStats.YStart;
            m_sizeRatio = _arg_1.SizeRatio;
            this.m_originalSizeRatio = m_sizeRatio;
            m_sprite.width = (m_sprite.width * m_sizeRatio);
            m_sprite.height = (m_sprite.height * m_sizeRatio);
            this.m_jumpSpeedMidairDelay = new FrameTimer(1);
            this.m_jumpStartup = new FrameTimer(_arg_1.JumpStartup);
            this.m_jumpSpeedList = new Array();
            this.m_jumpEffectTimer = new FrameTimer(6);
            var _local_5:String = _arg_1.JumpSpeedList;
            while (((_local_5) && (_local_5.indexOf(" ") >= 0)))
            {
                _local_5 = _local_5.replace(" ", "");
            };
            var _local_6:Array = ((_arg_1.JumpSpeedList) ? _local_5.split(",") : null);
            var _local_7:int;
            while (((!(_local_6 == null)) && (_local_7 < _local_6.length)))
            {
                this.m_jumpSpeedList.push(((isNaN(parseFloat(_local_6[_local_7]))) ? 0 : parseFloat(_local_6[_local_7])));
                _local_7++;
            };
            this.m_jumpSpeedList = _local_6;
            m_gravity = _arg_1.Gravity;
            this.m_norm_xSpeed = _arg_1.NormalXSpeed;
            this.m_max_xSpeed = _arg_1.MaxXSpeed;
            m_max_ySpeed = _arg_1.MaxYSpeed;
            this.m_lives = _arg_2["lives"];
            m_attackData = _arg_1.Attacks;
            m_attackData.Owner = this;
            this.m_shieldType = _arg_1.ShieldType;
            m_weight1 = _arg_1.Weight1;
            this.m_kirbyLastGrabbed = 1;
            this.m_glideAngle = 0;
            this.m_glideMaxHeight = 0;
            this.m_glideDelay = 0;
            this.m_glideReady = false;
            this.m_underWater = null;
            this.m_attachedReticule = null;
            this.m_attachedFPS = null;
            m_width = _arg_1.Width;
            m_height = _arg_1.Height;
            m_sprite.cam_width = this.m_characterStats.CamWidth;
            m_sprite.cam_height = this.m_characterStats.CamHeight;
            m_sprite.cam_x_offset = this.m_characterStats.CamXOffset;
            m_sprite.cam_y_offset = this.m_characterStats.CamYOffset;
            m_sprite.camOverride = null;
            this.m_damageIncreaseInterval = new FrameTimer(_arg_1.DamageIncreaseInterval);
            this.m_wallJumpCount = 0;
            this.m_wallStickTime = new FrameTimer(this.m_characterStats.WallStick);
            this.m_wallClingDelay = new FrameTimer(10);
            if (SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.LIGHT))
            {
                m_gravity = (m_gravity / 2);
                m_max_ySpeed = (m_max_ySpeed / 2);
            }
            else
            {
                if (SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.HEAVY))
                {
                    m_gravity = (m_gravity * 2);
                    m_max_ySpeed = (m_max_ySpeed * 2);
                };
            };
            this.m_shieldDropLag = new FrameTimer(8);
            this.m_disableHurtFallOff = false;
            this.m_outsideCameraBounds = false;
            this.m_outsideMainTerrain = false;
            this.m_doingBackFlip = false;
            this.m_tap_jump = false;
            this.m_tap_jump_btn = false;
            this.m_tapJumpLetGo = true;
            this.m_dash_btn = false;
            this.m_auto_dash = false;
            this.m_dt_dash = false;
            this.m_shieldStartTimer = 0;
            this.m_wwScore = 0;
            this.m_wwUpLetGo = false;
            this.m_wwDownLetGo = false;
            this.m_wwLeftLetGo = false;
            this.m_wwRightLetGo = false;
            m_facingForward = true;
            this.m_speedFacingForward = true;
            this.m_tetherCount = 0;
            if ((!(this.m_characterStats.FacingRight)))
            {
                this.m_faceLeft();
                this.m_speedFacingForward = false;
            };
            this.m_damageRatio = _arg_2["damageRatio"];
            this.m_startDamage = _arg_2["startDamage"];
            this.m_usingLives = _arg_2["usingLives"];
            this.m_showPlayerID = _arg_2["showPlayerID"];
            m_team_id = _arg_2["teamID"];
            this.m_teamDamage = _arg_2["teamDamage"];
            this.m_unlimitedFinal = _arg_2["unlimitedFinal"];
            this.m_expansion_id = _arg_2["expansion"];
            this.m_human = _arg_2["human"];
            this.m_specialInit = false;
            this.m_matchResults = new MatchResults(m_player_id);
            this.m_matchResults.StockRemaining = this.m_lives;
            this.m_midAirHoverTime = new FrameTimer(this.m_characterStats.MidAirHover);
            this.m_midAirJumpConstantTime = new FrameTimer(_arg_1.MidAirJumpConstant);
            this.m_midAirJumpConstantTime.CurrentTime = this.m_midAirJumpConstantTime.MaxTime;
            this.m_midAirJumpConstantDelay = new FrameTimer(_arg_1.MidAirJumpConstantDelay);
            this.m_forceTransformTime = new FrameTimer(_arg_1.ForceTransformTime);
            if (Stats.getStats(this.m_characterStats.ForceTransformID, this.m_expansion_id) == null)
            {
                this.m_forceTransformTime.MaxTime = 0;
            };
            this.m_offscreenDamageTimer = new FrameTimer(30);
            this.m_shadowEffect = new MovieClip();
            this.m_offScreenBubble = new MovieClip();
            this.m_poisonEffect = Main.getLibraryMC("poison_effect");
            this.m_pitfallEffect = Main.getLibraryMC("pitfall_dirt");
            this.m_healEffect = Main.getLibraryMC("effect_heal");
            this.m_burnSmoke = Main.getLibraryMC("burn_smoke");
            this.m_warioWareIcon = Main.getLibraryMC("wariowareResultsIcon");
            this.m_starmanInvincibility = Main.getLibraryMC("effect_heal");
            this.m_yoshiEggMC = Main.getLibraryMC("egg_mc");
            this.m_kirbyStarMC = Main.getLibraryMC("star_mc");
            this.m_freezeMC = Main.getLibraryMC("freeze_mc");
            Utils.setColorFilter(this.m_starmanInvincibility, {
                "hue":-59,
                "saturation":34,
                "brightness":0,
                "contrast":25
            });
            this.m_itemMC = new MovieClip();
            this.m_hatMC = new MovieClip();
            this.m_hatHolder = null;
            this.m_shieldHolderMC = Main.getLibraryMC(this.m_shieldType, this.m_expansion_id);
            this.m_chargeGlowHolderMC = null;
            this.m_pidHolderMC = Main.getLibraryMC("pid_mc");
            this.m_pidHolderNameMC = MovieClip(this.m_pidHolderMC.addChildAt(new MovieClip(), 0));
            if (((this.m_playerName) && (this.m_human)))
            {
                this.m_pidHolderMC.pname.text = this.m_playerName;
                this.m_pidHolderMC.pid.text = "";
                this.m_pidHolderNameMC.graphics.clear();
                this.m_pidHolderNameMC.graphics.beginFill(0, 0.5);
                this.m_pidHolderNameMC.graphics.drawRect(((-(this.m_pidHolderMC.pname.textWidth) / 2) - 3), this.m_pidHolderMC.pname.y, (this.m_pidHolderMC.pname.textWidth + 6), this.m_pidHolderMC.pname.height);
                this.m_pidHolderNameMC.graphics.endFill();
            }
            else
            {
                this.m_pidHolderNameMC.graphics.clear();
            };
            Utils.tryToGotoAndStop(this.m_pidHolderMC, ("p" + Utils.convertTeamToColor(m_player_id, ((ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)) ? -1 : m_team_id))));
            Utils.tryToGotoAndStop(this.m_pidHolderMC.arrow, ("p" + Utils.convertTeamToColor(m_player_id, ((ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)) ? -1 : m_team_id))));
            this.m_fsGlowHolderMC = Main.getLibraryMC("finalsmash_standby");
            this.m_warioWareIconTimer = new FrameTimer(20);
            this.m_warioWareIconTimer.finish();
            this.m_burnSmokeTimer = new FrameTimer(75);
            this.m_burnSmokeTimer.finish();
            this.m_injureFlashTimer = new FrameTimer(3);
            this.m_injureFlashTimer.finish();
            this.m_shockEffectTimer = new FrameTimer(10);
            this.m_shockEffectTimer.finish();
            this.m_poisonTintTimer = new FrameTimer(12);
            this.m_poisonTintTimer.finish();
            this.m_starmanInvincibilityTimer = new FrameTimer((30 * 10));
            this.m_starmanInvincibilityTimer.finish();
            this.m_currentRollSpeed = 0;
            this.m_starKOTimer = new FrameTimer(90);
            this.m_starKOTimer.finish();
            this.m_screenKO = false;
            this.m_starKOHolder = Main.getLibraryMC("starkoholder");
            this.m_screenKOHolder = Main.getLibraryMC("screenkoholder");
            this.m_starKOMC = Main.getLibraryMC(this.m_characterStats.LinkageID);
            this.updateColorFilter(this.m_starKOMC, ((ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)) ? null : m_team_id), this.CurrentStatsName, this.m_costume_id);
            Utils.tryToGotoAndStop(this.m_starKOMC, "falling");
            this.m_starKOHolder.stop();
            this.m_screenKOHolder.stop();
            Utils.recursiveMovieClipPlay(this.m_starKOMC, false);
            this.m_sizeStatus = 0;
            this.m_sizeStatusPermanent = false;
            this.m_sizeStatusTimer = new FrameTimer((30 * 10));
            this.m_sizeStatusTimer.finish();
            this.m_crowdAwe = false;
            this.m_fastFallLetGo = true;
            this.m_fastFallLetGoAttack = true;
            this.m_attackHovering = false;
            this.m_canHover = true;
            this.m_rocketSpeed = 0;
            this.m_rocketRotation = false;
            this.m_rocketDecay = 0;
            this.m_rocketAngle = 0;
            this.m_droughtTimer = 0;
            this.m_dodgeLetGo = false;
            this.m_recoveryAmount = 0;
            this.m_justHit = false;
            this.m_justHitTimer = 5;
            this.resetJustHitTimer();
            this.m_hasFinalSmash = false;
            this.m_hitLag = -1;
            this.m_hitLagJumpCancelTimer = new FrameTimer(9);
            this.m_hitLagStunTimer = new FrameTimer(12);
            this.m_hitLagLandDelay = new FrameTimer(15);
            this.m_hitLagStunTimer.finish();
            this.m_hitLagCanCancel = false;
            this.m_hitLagLetGo = false;
            this.m_hitsDealtCounter = 0;
            this.m_hitsReceivedCounter = 0;
            this.m_smashDILetGo = false;
            this.m_smashDILetGoCStick = false;
            this.m_techTimer = new FrameTimer(10);
            this.m_techDelay = new FrameTimer(10);
            this.m_smashDIAmount = 18;
            this.m_smashDISelf = false;
            this.m_canDI = true;
            this.m_techReady = false;
            this.m_techLetGo = false;
            this.m_canTech = false;
            this.m_canWallTech = true;
            this.m_canBounce = false;
            this.m_hasBounced = false;
            this.m_itemTimer = 0;
            this.m_revivalTimer = 0;
            this.m_revivalInvincibility = new FrameTimer(75);
            this.m_revivalInvincibility.finish();
            this.m_respawnDelay = new FrameTimer((30 * 1));
            this.m_getUpTimer = 0;
            this.m_forceRight = true;
            this.m_forceTimer = 0;
            this.m_currentPower = null;
            this.m_charIsFull = false;
            this.m_poisonIncrease = 0;
            this.m_poisonIncreaseInterval = new FrameTimer(15);
            this.m_poisonIncreaseTime = new FrameTimer(300);
            this.m_rollTimer = 0;
            this.m_starTimer = 0;
            this.m_item = null;
            this.m_item2 = null;
            this.m_itemSpawnTimer = new FrameTimer(3);
            this.m_itemLetGo = false;
            this.m_itemThrowInfo = new Rectangle();
            this.m_itemThrowWeak = false;
            this.m_itemThrowSmash = false;
            this.m_justReleased = false;
            this.m_kirbyDamageCounter = -1;
            this.m_itemDamageCounter = -1;
            this.m_lastYPosition = m_sprite.y;
            this.m_lastAttackUsedTurbo = null;
            this.m_invisiblePulseTimer = new FrameTimer(10);
            this.m_invisiblePulseToggle = false;
            this.m_invisiblePulseCount = 0;
            this.m_grabTimer = 0;
            this.m_pummelTimer = 0;
            this.m_justPummeled = false;
            this.m_eggTimer = 0;
            this.m_projectile = new Vector.<Projectile>();
            var _local_8:int;
            while (_local_8 < this.m_characterStats.MaxProjectile)
            {
                this.m_projectile[_local_8] = null;
                _local_8++;
            };
            this.m_lastProjectile = 0;
            this.m_shieldLetGo = false;
            this.m_turnTimer = new FrameTimer(5);
            this.m_frozenTimer = 0;
            this.m_sleepingTimer = 0;
            this.m_grabLetGo = false;
            this.m_grabberID = -1;
            this.m_struggleDirectionLetGo = false;
            this.m_struggleALetGo = false;
            this.m_struggleBLetGo = false;
            this.m_fallthrough = false;
            this.m_fallthroughPlatform = null;
            this.m_fallthroughTimer = new FrameTimer(6);
            this.m_fallthroughTimer.finish();
            this.m_transformingSpecial = false;
            this.m_transformedSpecial = false;
            this.m_usingSpecialAttack = false;
            this.m_transformTime = 0;
            this.m_transformLimit = 0;
            this.m_blinkTimer = 0;
            this.m_blinkNumber = 1;
            this.m_invisibleTimer = new FrameTimer(1);
            this.m_invisibleTimer.finish();
            this.m_holdTimer = 0;
            this.m_invincibleBrightness = 25;
            this.m_invincibleUp = true;
            this.m_attackLetGoA = true;
            this.m_attackLetGoB = true;
            this.m_attackIDIncremented = false;
            this.m_attackDelay = 0;
            this.m_stunTimer = 0;
            this.m_dizzyTimer = 0;
            this.m_stunCancelTimer = new FrameTimer(10);
            this.m_dizzyShield = false;
            this.m_pitfallTimer = 0;
            this.m_ricochetTimer = new FrameTimer(3);
            this.m_ricochetCount = new FrameTimer(5);
            this.m_ricochetX = new FrameTimer(2);
            this.m_ricochetY = new FrameTimer(2);
            this.m_ricochetX.finish();
            this.m_ricochetY.finish();
            this.m_dustTimer = new FrameTimer(1);
            this.m_staleMovesArr = [null, null, null, null, null, null, null, null, null];
            this.m_staleMoveVals = [0.1, 0.09, 0.08, 0.07, 0.06, 0.05, 0.04, 0.03, 0.02];
            this.m_key = _arg_2["controls"];
            this.m_stamina = _arg_2["stamina"];
            this.m_lastSFX = -1;
            this.m_lastVFX = -1;
            m_xSpeed = 0;
            m_ySpeed = 0;
            this.m_jumpCount = this.m_characterStats.MaxJump;
            this.m_up = false;
            this.m_down = false;
            this.m_left = false;
            this.m_right = false;
            this.m_a = false;
            this.m_b = false;
            this.m_jump2 = false;
            this.m_c_up = false;
            this.m_c_down = false;
            this.m_c_left = false;
            this.m_c_right = false;
            this.m_cStickUse = false;
            this.m_cStickLetGo = false;
            this.m_grab = false;
            this.m_grabKeyReleased = true;
            this.m_grabDelay = 0;
            this.m_jump = false;
            this.m_taunt = false;
            this.m_pause = false;
            this.m_pauseLetGo = true;
            this.m_pauseTimer = 0;
            this.m_pauseCamHeight = 0;
            this.m_jumpLetGo = true;
            this.m_jumpFullyReleased = false;
            this.m_bufferedAttackJump = false;
            this.m_jumpSpeedBuffer = 0;
            this.m_c_buffered_down = false;
            this.m_c_buffered_left = false;
            this.m_c_buffered_right = false;
            m_collision.ground = true;
            m_currentPlatform = null;
            this.m_ledge = null;
            this.m_ledgeHangTimer = new FrameTimer((4 * 30));
            this.m_lastLedge = null;
            this.m_ledgeDelay = 0;
            this.m_calcAngles = true;
            this.resetSpeedLevel();
            this.m_speedLetGo = false;
            this.m_dashReady = true;
            this.m_jumpTimer = 0;
            this.m_shortHop = false;
            this.m_jumpJustLetGo = false;
            this.m_smashTimer = 0;
            this.m_smashTimerUp = 0;
            this.m_smashTimerSide = 0;
            this.m_smashTimerDown = 0;
            this.m_upSpecialTimer = 0;
            this.m_specialTurnTimer = new FrameTimer(3);
            this.m_specialTurnTimer.finish();
            this.m_specialTurnRight = false;
            this.m_crouch = false;
            this.m_crouchTimer = 0;
            this.m_crouchLength = 0;
            this.m_crouchFrame = -1;
            this.setState(CState.IDLE);
            this.m_windBoxHit = false;
            this.m_hasArced = false;
            this.m_forceTumbleFall = false;
            this.m_forcedCrash = false;
            this.m_fallTiltTimer = new FrameTimer(15);
            this.m_fallTiltTimer.finish();
            this.m_fallTiltRight = true;
            this.m_shieldTimer = 0;
            this.m_shieldStartFrame = 2;
            this.m_pauseFreeze = false;
            this.m_damage = this.m_startDamage;
            this.m_shieldPower = 100;
            this.m_shield_originalWidth = 0;
            this.m_shield_originalHeight = 0;
            this.m_shieldDelay = 0;
            this.m_shieldDelayTimer = new FrameTimer(1);
            this.m_flyingRight = false;
            this.m_flyingUp = false;
            this.m_sideStepLetGo = false;
            this.m_dodgeTimer = 15;
            this.m_comboTimer = new FrameTimer(1);
            this.m_comboCount = 0;
            this.m_comboID = 0;
            this.m_comboDamage = 0;
            this.m_comboDamageTotal = 0;
            this.m_hitForceVisible = true;
            this.m_caughtInvincibility = false;
            this.m_standby = false;
            m_attack = new AttackState(this);
            this.m_attackControlsArr = new Vector.<int>();
            if ((!(this.m_human)))
            {
                this.CPU = new AI(this.m_characterStats.Level, this, STAGEDATA);
                this.CPU.refreshRecoveryAttackList();
                this.CPU.refreshDisabledAttackList();
                this.m_playerName = null;
            };
            this.m_opponents = new Vector.<int>();
            this.m_ledges = new Array();
            this.m_warningBounds_lower = new Array();
            this.m_warningBounds_upper = new Array();
            this.m_grabbed = new Vector.<Character>();
            this.m_walls = new Vector.<CollisionBoundary>();
            this.m_initTimer = 0;
            this.m_preFrameInfo = "";
            this.m_freezePlayback = false;
            this.setVisibility(false);
            if (this.m_characterStats.LinkageID2 != null)
            {
                this.buildHitBoxData(this.m_characterStats.LinkageID2);
            };
            if (this.m_characterStats.LinkageIDSpecial != null)
            {
                this.buildHitBoxData(this.m_characterStats.LinkageIDSpecial);
            };
            this.buildHitBoxData(this.m_characterStats.LinkageID);
            if (Main.DEBUG)
            {
                verifiyHitBoxData();
            };
            this.generatePummelData();
            m_attackData.getAttack("star").importAttackData({"attackBoxes":{"attackBox":{
                        "atk_id":m_attack.AttackID,
                        "damage":5,
                        "kbConstant":100,
                        "weightKB":110,
                        "power":0,
                        "direction":70,
                        "hitStun":1,
                        "hitLag":5,
                        "effectSound":"ssb_hit1",
                        "reversableAngle":false,
                        "isForward":(!(m_facingForward))
                    }}});
        }

        public static function updateColorFilter(_arg_1:MovieClip, _arg_2:int, _arg_3:String, _arg_4:int=-1):void
        {
            var _local_5:String = Utils.getColorString(_arg_2);
            var _local_6:Object = Main.getCostume(_arg_3, _local_5, _arg_4);
            if (_local_6 == null)
            {
                _local_6 = Utils.getCostumeObject();
            };
            if (_local_6 != null)
            {
                Utils.setTint(_arg_1, 1, 1, 1, 1, 0, 0, 0, 0);
                Utils.setColorFilter(_arg_1, _local_6);
            };
        }


        private function blahd(_arg_1:MouseEvent):void
        {
            m_sprite.startDrag();
            this.dragging = true;
        }

        private function blahd2(_arg_1:MouseEvent):void
        {
            m_sprite.stopDrag();
            this.dragging = false;
        }

        private function ugh(_arg_1:Event):void
        {
            trace(testTerrainWithCoord(MouseTracker.X, MouseTracker.Y));
        }

        public function getStateInfo():String
        {
            return ((((((((((((((((((("{" + "x:") + m_sprite.x) + ", y:") + m_sprite.y) + ", state:") + CState.toString(m_state)) + ", stanceFrame#:") + ((HasStance) ? m_sprite.stance.currentFrame : "err")) + ", onGround:") + m_collision.ground) + ", attackingFrame:") + (((this.inState(CState.ATTACKING)) && (m_attack.Frame)) ? m_attack.Frame : "null")) + ", preFrameInfo: ") + this.m_preFrameInfo) + ", postFrameInfo: ") + this.getFrameData()) + ", controlBits: ") + this.m_key.getControlObjectBits()) + " }");
        }

        override public function get CurrentAnimation():HitBoxAnimation
        {
            return ((m_hitBoxManager == null) ? null : (((m_hitBoxManager.HitBoxAnimationList.length <= 0) || (!(m_sprite.currentLabel))) ? null : m_hitBoxManager.getHitBoxAnimation(((this.m_characterStats.LinkageID + "_") + m_sprite.currentLabel))));
        }

        private function buildHitBoxData(_arg_1:String):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:*;
            var _local_6:*;
            var _local_2:MovieClip;
            if (HitBoxManager.HitBoxManageList[_arg_1] != null)
            {
                m_hitBoxManager = HitBoxManager.HitBoxManageList[_arg_1];
            }
            else
            {
                m_hitBoxManager = new HitBoxManager(_arg_1);
                _local_3 = 0;
                _local_4 = 0;
                _local_2 = Main.getLibraryMC(_arg_1);
                _local_3 = 0;
                while (_local_3 < _local_2.totalFrames)
                {
                    _local_2.gotoAndStop((_local_3 + 1));
                    if (_local_2)
                    {
                        if (_local_2.stance)
                        {
                            Utils.removeActionScript(_local_2.stance);
                            m_hitBoxManager.addHitBoxAnimation(HitBoxAnimation.createHitBoxAnimation(((_arg_1 + "_") + _local_2.currentLabel), _local_2.stance, _local_2));
                        };
                    };
                    _local_3++;
                };
                _local_2 = null;
                for (_local_5 in m_attackData.ProjectilesArray)
                {
                    if (ProjectileAttack(m_attackData.ProjectilesArray[_local_5]).LinkageID)
                    {
                        _local_2 = Main.getLibraryMC(ProjectileAttack(m_attackData.ProjectilesArray[_local_5]).LinkageID);
                        if (_local_2)
                        {
                            Utils.removeActionScript(_local_2);
                            HitBoxAnimation.createHitBoxAnimation(ProjectileAttack(m_attackData.ProjectilesArray[_local_5]).LinkageID, _local_2, _local_2);
                        };
                    };
                    _local_2 = null;
                };
                for (_local_6 in m_attackData.ItemsArray)
                {
                    if (ItemData(m_attackData.ItemsArray[_local_6]).LinkageID)
                    {
                        _local_2 = Main.getLibraryMC(ItemData(m_attackData.ItemsArray[_local_6]).LinkageID);
                        if (_local_2)
                        {
                            Utils.removeActionScript(_local_2);
                            HitBoxAnimation.createHitBoxAnimation(ItemData(m_attackData.ItemsArray[_local_6]).LinkageID, _local_2, _local_2);
                        };
                    };
                    _local_2 = null;
                };
            };
        }

        private function generatePummelData():void
        {
            var _local_1:AttackObject;
            if ((!(m_attackData.getAttack("grab"))))
            {
                _local_1 = new AttackObject("grab");
                _local_1.importAttackData({"refreshRate":5});
                _local_1.AttackBoxes["attackBox"] = new AttackDamage(m_player_id, this);
                _local_1.AttackBoxes["attackBox"].importAttackDamageData({
                    "team_id":m_team_id,
                    "damage":this.m_characterStats.GrabDamage,
                    "hasEffect":false,
                    "bypassNonGrabbed":true,
                    "effectSound":this.m_characterStats.Sounds["pummel"]
                });
                m_attackData.setAttack("grab", _local_1);
            };
        }

        public function modifyAttack(_arg_1:String, _arg_2:Number, _arg_3:Number):void
        {
            if (m_attackData.getAttack(_arg_1) != null)
            {
                switch (_arg_2)
                {
                    case 1:
                        m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].Direction = _arg_3;
                        return;
                    case 2:
                        m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].KBConstant = _arg_3;
                        return;
                    case 3:
                        m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].Power = _arg_3;
                        return;
                    case 4:
                        m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].HitStun = _arg_3;
                        return;
                    case 5:
                        m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].SelfHitStun = _arg_3;
                        return;
                    case 6:
                        m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].HitLag = _arg_3;
                        return;
                    case 7:
                        m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].Priority = _arg_3;
                        return;
                    case 8:
                        m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].Damage = _arg_3;
                        return;
                    case 9:
                        m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].WeightKB = _arg_3;
                        return;
                };
            };
        }

        public function getAttack(_arg_1:String, _arg_2:Number):*
        {
            if (m_attackData.getAttack(_arg_1) != null)
            {
                switch (_arg_2)
                {
                    case 1:
                        return (m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].Direction);
                    case 2:
                        return (m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].KBConstant);
                    case 3:
                        return (m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].Power);
                    case 4:
                        return (m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].HitStun);
                    case 5:
                        return (m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].SelfHitStun);
                    case 6:
                        return (m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].HitLag);
                    case 7:
                        return (m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].Priority);
                    case 8:
                        return (m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].Damage);
                    case 9:
                        return (m_attackData.getAttack(_arg_1).AttackBoxes["attackBox"].WeightKB);
                };
            }
            else
            {
                return (null);
            };
        }

        public function getFrameData():String
        {
            return ((HasStance) ? ((m_sprite.currentFrame + ":") + m_sprite.stance.currentFrame) : ((m_sprite.currentFrame + ":") + "nullstance"));
        }

        public function getAI():AI
        {
            return (this.CPU);
        }

        public function getTerrainData():void
        {
            this.m_opponents = new Vector.<int>();
            this.m_warningBounds_lower = new Array(STAGEDATA.getWarningBounds_LL(), STAGEDATA.getWarningBounds_LR());
            this.m_warningBounds_upper = new Array(STAGEDATA.getWarningBounds_UL(), STAGEDATA.getWarningBounds_UR());
            this.m_ledges = new Array(STAGEDATA.getLedges_L(), STAGEDATA.getLedges_R());
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < STAGEDATA.PlayerList.length)
            {
                if (STAGEDATA.PlayerList[_local_1] != m_player_id)
                {
                    this.m_opponents.push(STAGEDATA.PlayerList[_local_1]);
                };
                _local_1++;
            };
            m_terrains = STAGEDATA.Terrains;
            m_platforms = STAGEDATA.Platforms;
            this.m_walls = STAGEDATA.getWalls();
        }

        public function Capture(_arg_1:int, _arg_2:Boolean=true, _arg_3:Boolean=false):Boolean
        {
            var _local_4:Character;
            if ((((((((((((this.m_standby) || (this.IsCaught)) || ((Invincible) && (!((this.inState(CState.ATTACKING)) && (m_attack.ForceGrabbable))))) || (this.Dead)) || (this.Hanging)) || (this.AirDodge)) || (this.SidestepDodge)) || (this.Frozen)) || (this.UsingFinalSmash)) || ((this.m_usingSpecialAttack) && ((this.m_characterStats.SpecialType == 2) || (this.m_characterStats.SpecialType == 3)))) || (this.Egg)))
            {
                return (false);
            };
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_GRABBED, {
                "caller":this,
                "grabber":_local_4
            }));
            _local_4 = (((this.m_grabberID > 0) && (STAGEDATA.getPlayer(this.m_grabberID))) ? STAGEDATA.getPlayer(this.m_grabberID) : null);
            m_knockbackStackingTimer.reset();
            this.stopActionShot();
            this.m_grabberID = _arg_1;
            this.m_recoveryAmount = 0;
            this.toggleEffect(this.m_healEffect, false);
            this.turnOffInvincibility();
            this.m_hitForceVisible = _arg_2;
            this.m_caughtInvincibility = _arg_3;
            if (this.inState(CState.SHIELDING))
            {
                this.m_deactivateShield();
            };
            this.grabReleaseOpponent();
            this.m_jumpStartup.reset();
            this.m_attackHovering = false;
            m_attack.Rocket = false;
            this.m_midAirJumpConstantTime.CurrentTime = this.m_midAirJumpConstantTime.MaxTime;
            if (this.inState(CState.FLYING))
            {
                this.killAllSpeeds();
                this.resetRotation();
                Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
            };
            if (this.inState(CState.GLIDING))
            {
                m_xSpeed = 0;
                m_ySpeed = 0;
            };
            if (this.inState(CState.ATTACKING))
            {
                this.resetChargedAttacks();
                m_attackData.resetCharges();
                this.killAllSpeeds();
                if ((((((this.inState(CState.ATTACKING)) && (!(m_attack.Frame == null))) && (!(this.m_projectile[this.m_lastProjectile] == null))) && (this.m_projectile[this.m_lastProjectile].Visible)) && (!(this.m_projectile[this.m_lastProjectile].Dead))))
                {
                    this.m_projectile[this.m_lastProjectile].endControl();
                };
                this.resetRotation();
                Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                this.updateItemHolding();
                this.forceEndAttack();
                this.setState(CState.IDLE);
            };
            if (STAGEPARENT.getChildByName(("energy" + m_player_id)) != null)
            {
                STAGEPARENT.removeChild(STAGEPARENT.getChildByName(("energy" + m_player_id)));
            };
            if (this.m_usingSpecialAttack)
            {
                this.m_usingSpecialAttack = false;
            };
            if (((this.m_item) && (this.m_item is EnergyTank)))
            {
                this.m_item.destroy();
                this.m_item = null;
            };
            if (this.m_item2)
            {
                this.m_fsGlowHolderMC.visible = false;
            };
            this.setState(CState.CAUGHT);
            this.stancePlayFrame(("hurt" + (Math.round((Utils.random() * (this.m_characterStats.HurtFrames - 1))) + 1)));
            return (true);
        }

        public function Uncapture():void
        {
            this.m_caughtInvincibility = false;
            this.m_hitForceVisible = true;
            Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
            if (this.m_item2)
            {
                this.m_fsGlowHolderMC.visible = true;
            };
            this.setState(CState.IDLE);
        }

        public function Caught():Boolean
        {
            return (this.inState(CState.CAUGHT));
        }

        public function Struggle(_arg_1:int=4):int
        {
            var _local_2:int;
            if (((this.m_struggleDirectionLetGo) && ((((this.m_up) || (this.m_down)) || (this.m_left)) || (this.m_right))))
            {
                _local_2 = (_local_2 + _arg_1);
                this.m_struggleDirectionLetGo = false;
            };
            if (((this.m_struggleALetGo) && (this.m_a)))
            {
                _local_2 = (_local_2 + _arg_1);
                this.m_struggleALetGo = false;
            };
            if (((this.m_struggleBLetGo) && (this.m_b)))
            {
                _local_2 = (_local_2 + _arg_1);
                this.m_struggleBLetGo = false;
            };
            return (_local_2);
        }

        public function destroy():void
        {
            this.setState(CState.DEAD);
            this.destroyAllProjectiles();
            if (((!(m_sprite == null)) && (!(m_sprite.parent == null))))
            {
                m_sprite.parent.removeChild(m_sprite);
            };
        }

        public function getMatchResults():MatchResults
        {
            return (this.m_matchResults);
        }

        public function resetDroughtTimer():void
        {
            if (((this.m_matchResults.LongestDrought < this.m_droughtTimer) && (!(STAGEDATA.GameEnded))))
            {
                this.m_matchResults.LongestDrought = this.m_droughtTimer;
            };
            this.m_droughtTimer = 0;
        }

        public function inKnockback():Boolean
        {
            return (!((m_xKnockback == 0) && (m_yKnockback == 0)));
        }

        override public function inState(_arg_1:uint):Boolean
        {
            return (m_state == _arg_1);
        }

        override public function setState(_arg_1:uint):void
        {
            var _local_2:Boolean;
            var _local_3:Boolean = (!(_arg_1 == m_state));
            var _local_4:uint = m_state;
            if (((_arg_1 == CState.IDLE) && (!(this.inState(CState.IDLE)))))
            {
                _local_2 = true;
                if (!m_collision.ground)
                {
                    this.resetRotation();
                    this.m_fallTiltTimer.reset();
                    _arg_1 = CState.JUMP_FALLING;
                };
                this.turnOffInvincibility();
                this.m_dashReady = true;
            }
            else
            {
                if (_arg_1 == CState.LAND)
                {
                    this.turnOffInvincibility();
                };
            };
            m_state = _arg_1;
            if (_local_2)
            {
                this.checkEdgeLean();
            };
            if (_local_3)
            {
                m_framesSinceLastState = 0;
                this.m_controlFrames();
                m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.STATE_CHANGE, {
                    "caller":this,
                    "fromState":_local_4,
                    "toState":m_state
                }));
                if (m_state != CState.ATTACKING)
                {
                    flushTimers();
                    removeAllTempEvents();
                };
                if (m_state == CState.LAND)
                {
                    m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.GROUND_LAND, {"caller":this}));
                };
                if ((((_local_4 == CState.ATTACKING) && (!(this.inState(CState.ATTACKING)))) && (!(this.m_charIsFull))))
                {
                    this.grabReleaseOpponent();
                };
            };
        }

        public function starmanEffect(_arg_1:int=10):void
        {
            this.m_starmanInvincibilityTimer.reset();
            this.m_starmanInvincibilityTimer.MaxTime = (30 * _arg_1);
            this.toggleEffect(this.m_starmanInvincibility, true);
            this.m_starmanInvincibility.x = m_sprite.x;
            this.m_starmanInvincibility.y = (m_sprite.y - ((m_height * m_sizeRatio) / 2));
        }

        public function warioWareEffect(_arg_1:Boolean, _arg_2:Boolean):void
        {
            var _local_4:Vector.<ItemData>;
            var _local_5:Vector.<ItemData>;
            var _local_6:int;
            var _local_7:Number;
            var _local_8:String;
            var _local_3:int = this.m_sizeStatus;
            if (((((((this.m_warioWareIcon) && (!(this.inState(CState.DEAD)))) && (!(this.m_standby))) && (!(this.inState(CState.REVIVAL)))) && (!(this.inState(CState.STAR_KO)))) && (!(this.inState(CState.SCREEN_KO)))))
            {
                this.toggleEffect(this.m_warioWareIcon, true);
                this.m_warioWareIcon.x = m_sprite.x;
                this.m_warioWareIcon.y = (m_sprite.y - ((m_height * m_sizeRatio) / 2));
                this.m_warioWareIconTimer.reset();
                this.m_warioWareIcon.gotoAndStop(((_arg_1) ? "win" : "lose"));
                if (((_arg_2) && (_arg_1)))
                {
                    _local_4 = new Vector.<ItemData>();
                    _local_5 = ((ModeFeatures.hasFeature(ModeFeatures.FORCE_ITEM_AVAILABILITY, STAGEDATA.GameRef.GameMode)) ? STAGEDATA.ItemsRef.FullItemsList : STAGEDATA.ItemsRef.ItemsList);
                    _local_6 = 0;
                    while (_local_6 < _local_5.length)
                    {
                        _local_8 = _local_5[_local_6].LinkageID;
                        if (((((((_local_8 == "smashball") && (!(STAGEDATA.ItemsRef.CurrentSmashBall))) || (_local_8 == "homerunbat")) || (_local_8 == "pokeball")) || (_local_8 == "assistTrophy")) || (_local_8 == "spinyShell")))
                        {
                            _local_4.push(_local_5[_local_6]);
                        };
                        _local_6++;
                    };
                    _local_7 = Utils.random();
                    if (_local_7 < 0.3333)
                    {
                        this.setSizeStatus(1);
                        if (_local_3 != this.m_sizeStatus)
                        {
                            STAGEDATA.playSpecificSound("mushroom_grow");
                        };
                    }
                    else
                    {
                        if (_local_7 < 0.66666)
                        {
                            this.recover(50);
                        }
                        else
                        {
                            if (_local_7 >= 0.6666)
                            {
                                this.starmanEffect();
                            }
                            else
                            {
                                if (_local_7 == 4)
                                {
                                    STAGEDATA.ItemsRef.generateItemObj(_local_4[Utils.randomInteger(0, (_local_4.length - 1))], m_sprite.x, (m_sprite.y - (m_height / 2)));
                                };
                            };
                        };
                    };
                };
            };
        }

        public function get HitLagHack():Number
        {
            return (this.m_hitLagHack);
        }

        public function set HitLagHack(_arg_1:Number):void
        {
            this.m_hitLagHack = _arg_1;
        }

        public function get WWScore():Number
        {
            return (this.m_wwScore);
        }

        public function set WWScore(_arg_1:Number):void
        {
            this.m_wwScore = _arg_1;
        }

        public function get WWUpLetGo():Boolean
        {
            return (this.m_wwUpLetGo);
        }

        public function set WWUpLetGo(_arg_1:Boolean):void
        {
            this.m_wwUpLetGo = _arg_1;
        }

        public function get WWDownLetGo():Boolean
        {
            return (this.m_wwDownLetGo);
        }

        public function set WWDownLetGo(_arg_1:Boolean):void
        {
            this.m_wwDownLetGo = _arg_1;
        }

        public function get WWLeftLetGo():Boolean
        {
            return (this.m_wwLeftLetGo);
        }

        public function set WWLeftLetGo(_arg_1:Boolean):void
        {
            this.m_wwLeftLetGo = _arg_1;
        }

        public function get WWRightLetGo():Boolean
        {
            return (this.m_wwRightLetGo);
        }

        public function set WWRightLetGo(_arg_1:Boolean):void
        {
            this.m_wwRightLetGo = _arg_1;
        }

        public function get PauseLetGo():Boolean
        {
            return (this.m_pauseLetGo);
        }

        public function set PauseLetGo(_arg_1:Boolean):void
        {
            this.m_pauseLetGo = _arg_1;
        }

        public function get HoldJump():Boolean
        {
            return (this.m_characterStats.HoldJump);
        }

        public function get CanHover():Boolean
        {
            return (this.m_canHover);
        }

        public function get MidAirHover():int
        {
            return (this.m_characterStats.MidAirHover);
        }

        public function get AttackHovering():Boolean
        {
            return ((this.inState(CState.ATTACKING)) && (this.m_attackHovering));
        }

        public function get CostumeID():int
        {
            return (this.m_costume_id);
        }

        public function get CostumeName():String
        {
            return ((this.m_transformedSpecial) ? this.m_characterStats.NormalStatsID : this.m_characterStats.StatsName);
        }

        public function get CpuAI():AI
        {
            return (this.CPU);
        }

        public function get State():uint
        {
            return (m_state);
        }

        public function get CanBarrel():Boolean
        {
            return (this.m_characterStats.CanBarrel);
        }

        public function get IsTeching():Boolean
        {
            return ((this.inState(CState.TECH_ROLL)) || (this.inState(CState.TECH_GROUND)));
        }

        public function get Frozen():Boolean
        {
            return (this.inState(CState.FROZEN));
        }

        public function get Pitfall():Boolean
        {
            return (this.inState(CState.PITFALL));
        }

        public function get DisplayName():String
        {
            return (this.m_characterStats.DisplayName);
        }

        public function get SoundData():Array
        {
            return (this.m_characterStats.Sounds);
        }

        public function get ExpansionID():Number
        {
            return (this.m_expansion_id);
        }

        public function get IsCaught():Boolean
        {
            return (this.inState(CState.CAUGHT));
        }

        public function get StatsName():String
        {
            return (this.m_characterStats.NormalStatsID);
        }

        public function get CurrentStatsName():String
        {
            return (this.m_characterStats.StatsName);
        }

        public function get StandBy():Boolean
        {
            return (this.m_standby);
        }

        public function set StandBy(_arg_1:Boolean):void
        {
            var _local_3:Vector.<MovieClip>;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Vector.<MovieClip>;
            var _local_2:Boolean = this.m_standby;
            this.m_standby = _arg_1;
            if (((this.m_standby) && (!(_local_2))))
            {
                if (this.inState(CState.CAUGHT))
                {
                    _local_4 = 0;
                    while (_local_4 < this.m_opponents.length)
                    {
                        _local_5 = STAGEDATA.getPlayer(this.m_opponents[_local_4]).Grabbed.indexOf(this);
                        if (_local_5 >= 0)
                        {
                            STAGEDATA.getPlayer(this.m_opponents[_local_4]).releaseOpponent();
                        };
                        _local_4++;
                    };
                };
                m_sprite.x = this.m_characterStats.XStart;
                m_sprite.y = this.m_characterStats.YStart;
                this.forceOnGround();
                this.reset();
                _local_3 = new Vector.<MovieClip>();
                _local_3.push(m_sprite);
                STAGEDATA.CamRef.deleteTargets(_local_3);
                this.setVisibility(false);
                this.HealthBox.visible = false;
                this.HealthBox.damageMC_holder.visible = false;
                this.HealthBox.percent_mc.damage.visible = false;
                this.m_recoveryAmount = 0;
                this.toggleEffect(this.m_healEffect, false);
                this.m_screenKO = false;
                if (this.m_pidHolderMC.parent)
                {
                    this.m_pidHolderMC.parent.removeChild(this.m_pidHolderMC);
                };
                if ((!(this.m_human)))
                {
                    this.CPU.resetControlOverrides();
                };
                this.m_revivalInvincibility.finish();
                this.m_starmanInvincibilityTimer.finish();
                this.turnOffInvincibility();
                this.setState(CState.IDLE);
                if (this.m_starKOMC)
                {
                    this.m_starKOMC.visible = false;
                };
                this.m_burnSmokeTimer.finish();
                this.m_shockEffectTimer.finish();
                this.m_poisonTintTimer.finish();
                this.m_injureFlashTimer.finish();
                this.m_starmanInvincibilityTimer.finish();
                if (this.m_starKOHolder.visible)
                {
                    this.m_starKOHolder.visible = false;
                    this.m_starKOHolder.gotoAndStop(1);
                };
                if (this.m_screenKOHolder.visible)
                {
                    this.m_screenKOHolder.visible = false;
                    this.m_screenKOHolder.gotoAndStop(1);
                };
            }
            else
            {
                if (((!(this.m_standby)) && (_local_2)))
                {
                    if ((!((CAM.Mode == Vcam.ZOOM_MODE) && (m_player_id > 1))))
                    {
                        _local_6 = new Vector.<MovieClip>();
                        _local_6.push(m_sprite);
                        STAGEDATA.CamRef.addTargets(_local_6);
                    };
                    this.setVisibility(true);
                    this.HealthBox.visible = true;
                    this.HealthBox.damageMC_holder.visible = true;
                    this.HealthBox.percent_mc.damage.visible = true;
                };
            };
        }

        public function get ControlSettings():Controller
        {
            return (this.m_key);
        }

        public function set Team(_arg_1:int):void
        {
            m_team_id = _arg_1;
        }

        public function get Revival():Boolean
        {
            return (currentFrameIs("revival"));
        }

        public function get DizzyShield():Boolean
        {
            return (this.m_dizzyShield);
        }

        public function get UnderWater():MovieClip
        {
            return (this.m_underWater);
        }

        public function set UnderWater(_arg_1:MovieClip):void
        {
            this.m_underWater = _arg_1;
        }

        public function get HitBox():MovieClip
        {
            return (m_sprite.stance.hitBox);
        }

        public function get AirDodge():Boolean
        {
            return (this.inState(CState.AIR_DODGE));
        }

        public function get SidestepDodge():Boolean
        {
            return (this.inState(CState.SIDESTEP_DODGE));
        }

        public function get AttackForward():Boolean
        {
            return (m_attack.IsForward);
        }

        public function get UsingFinalSmash():Boolean
        {
            if ((((this.m_usingSpecialAttack) || (this.m_transformedSpecial)) || (this.m_transformingSpecial)))
            {
                return (true);
            };
            return (false);
        }

        public function get TransformedSpecial():Boolean
        {
            return (this.m_transformedSpecial);
        }

        public function get TransformingFinalSmash():Boolean
        {
            if (((this.m_usingSpecialAttack) && (this.m_transformingSpecial)))
            {
                return (true);
            };
            return (false);
        }

        public function get AttackingFinalSmash():Boolean
        {
            if (((this.m_usingSpecialAttack) && (this.m_characterStats.SpecialType > 0)))
            {
                return (true);
            };
            return (false);
        }

        public function get HasSmashBall():Boolean
        {
            return (this.m_hasFinalSmash);
        }

        public function get HoldingItem():Boolean
        {
            return ((!(this.m_item == null)) && (this.m_item.CanPickup));
        }

        public function get WarningCollision():Boolean
        {
            return ((((m_collision.lbound_lower) || (m_collision.lbound_upper)) || (m_collision.rbound_lower)) || (m_collision.rbound_upper));
        }

        public function get HealthBox():MovieClip
        {
            return (HUD[(("p" + m_player_id) + "health")].display);
        }

        public function get Gliding():Boolean
        {
            return (this.inState(CState.GLIDING));
        }

        public function get Opponents():Vector.<int>
        {
            return (this.m_opponents);
        }

        public function get ItemObj():Item
        {
            return (this.m_item);
        }

        public function set ItemObj(_arg_1:*):void
        {
            this.m_item = _arg_1;
        }

        public function get ItemObj2():Item
        {
            return (this.m_item2);
        }

        public function set ItemObj2(_arg_1:*):void
        {
            this.m_item2 = _arg_1;
        }

        public function get JumpFullyReleased():Boolean
        {
            return (this.m_jumpFullyReleased);
        }

        public function get Injured():Boolean
        {
            return (this.inState(CState.INJURED));
        }

        public function get Flying():Boolean
        {
            return (this.inState(CState.FLYING));
        }

        public function get Crashed():Boolean
        {
            return ((this.inState(CState.CRASH_LAND)) || (this.inState(CState.CRASH_GETUP)));
        }

        public function get SmashDISelf():Boolean
        {
            return (this.m_smashDISelf);
        }

        public function set SmashDISelf(_arg_1:Boolean):void
        {
            this.m_smashDISelf = _arg_1;
        }

        public function get FlyingRight():Boolean
        {
            return (this.m_flyingRight);
        }

        public function get FlyingUp():Boolean
        {
            return (this.m_flyingUp);
        }

        public function get KirbyPower():String
        {
            if (this.m_characterStats.LinkageID == "kirby")
            {
                return (this.m_currentPower);
            };
            return (this.m_characterStats.Power);
        }

        public function set KirbyPower(_arg_1:String):void
        {
            var _local_2:int;
            var _local_3:Character;
            var _local_4:*;
            if (this.m_characterStats.LinkageID == "kirby")
            {
                this.m_currentPower = _arg_1;
                if (_arg_1 != null)
                {
                    _local_2 = 0;
                    while (_local_2 < this.m_opponents.length)
                    {
                        _local_3 = STAGEDATA.getPlayer(this.m_opponents[_local_2]);
                        if (_local_3.KirbyPower == _arg_1)
                        {
                            for (_local_4 in _local_3.AttackDataObj.ProjectilesArray)
                            {
                                if ((!(m_attackData.getProjectile(_local_4))))
                                {
                                    m_attackData.addProjectile(_local_4, _local_3.AttackDataObj.ProjectilesArray[_local_4]);
                                };
                            };
                            break;
                        };
                        _local_2++;
                    };
                };
                this.m_kirbyDamageCounter = 45;
                if (((!(STAGEDATA.getPlayer(this.m_kirbyLastGrabbed) == null)) && (STAGEDATA.getPlayer(this.m_kirbyLastGrabbed).LinkageName == "kirby")))
                {
                    STAGEDATA.getPlayer(this.m_kirbyLastGrabbed).releaseKirbyPower();
                };
            }
            else
            {
                this.m_characterStats.Power = _arg_1;
            };
        }

        public function get LinkageName():String
        {
            return (this.m_characterStats.LinkageID);
        }

        public function get LinkageNameSpecial():String
        {
            return (this.m_characterStats.LinkageIDSpecial);
        }

        public function get Ledge():MovieClip
        {
            return (this.m_ledge);
        }

        public function get Hanging():Boolean
        {
            return (this.inState(CState.LEDGE_HANG));
        }

        public function get AttackDelay():int
        {
            return (this.m_attackDelay);
        }

        public function set AttackDelay(_arg_1:int):void
        {
            this.m_attackDelay = _arg_1;
        }

        public function get JumpCount():int
        {
            return (this.m_jumpCount);
        }

        public function get MaxJump():int
        {
            return (this.m_characterStats.MaxJump);
        }

        public function get ShieldPower():Number
        {
            return (this.m_shieldPower);
        }

        public function get ShieldStartTimer():Number
        {
            return (this.m_shieldStartTimer);
        }

        public function get PerfectShield():Boolean
        {
            return ((this.inState(CState.SHIELDING)) && (this.m_shieldStartTimer < 1));
        }

        public function get IsHuman():Boolean
        {
            return (this.m_human);
        }

        public function get Shielding():Boolean
        {
            return (this.inState(CState.SHIELDING));
        }

        public function get Grabbing():Boolean
        {
            return (this.inState(CState.GRABBING));
        }

        public function get Dodging():Boolean
        {
            return (this.inState((((CState.DODGE_ROLL) || (CState.AIR_DODGE)) || (CState.SIDESTEP_DODGE))));
        }

        public function get Grabbed():Vector.<Character>
        {
            return (this.m_grabbed);
        }

        public function get Rolling():Boolean
        {
            return (this.inState(CState.ROLL));
        }

        public function get RollingUp():Boolean
        {
            return (this.inState(CState.LEDGE_ROLL));
        }

        public function get ClimbingUp():Boolean
        {
            return (this.inState(CState.LEDGE_CLIMB));
        }

        public function get Dead():Boolean
        {
            return (this.inState(CState.DEAD));
        }

        public function get FacingRight():Boolean
        {
            return (m_facingForward);
        }

        public function get HitLag():int
        {
            return (this.m_hitLag);
        }

        public function set FlyingRight(_arg_1:Boolean):void
        {
            this.m_flyingRight = _arg_1;
        }

        public function set FlyingUp(_arg_1:Boolean):void
        {
            this.m_flyingUp = _arg_1;
        }

        public function get XVelocity():Number
        {
            return (0);
        }

        public function set XVelocity(_arg_1:Number):void
        {
        }

        public function get YVelocity():Number
        {
            return (0);
        }

        public function set YVelocity(_arg_1:Number):void
        {
        }

        public function get Terrain():Vector.<Platform>
        {
            return (m_terrains);
        }

        public function get Platforms():Vector.<Platform>
        {
            return (m_platforms);
        }

        public function get ProjectileArray():Vector.<Projectile>
        {
            return (this.m_projectile);
        }

        public function get CharIsFull():Boolean
        {
            return (this.m_charIsFull);
        }

        public function get Combo():Number
        {
            return (this.m_comboCount);
        }

        public function get ComboDamage():Number
        {
            return (this.m_comboDamage);
        }

        public function get SpecialType():int
        {
            return (this.m_characterStats.SpecialType);
        }

        public function get ComboDamageTotal():Number
        {
            return (this.m_comboDamageTotal);
        }

        override public function get ShieldHitBoxes():Array
        {
            var _local_1:Rectangle;
            var _local_2:HitBoxSprite;
            if (((this.inState(CState.SHIELDING)) && (this.m_shieldTimer >= this.m_shieldStartFrame)))
            {
                if (this.m_characterStats.CustomShield)
                {
                    return ((HasHitBox) ? this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.SHIELD) : super.ShieldHitBoxes);
                };
                _local_1 = new Rectangle();
                _local_1.width = (55 * ((this.m_shieldPower / 100) + 0.4));
                _local_1.height = (55 * ((this.m_shieldPower / 100) + 0.4));
                _local_1.x = (-(_local_1.width) / 2);
                _local_1.y = (((-(m_height) / 3) * m_sizeRatio) - (_local_1.height / 2));
                _local_2 = new HitBoxSprite(HitBoxSprite.SHIELD, _local_1, true, null);
                return (new Array(_local_2));
            };
            return (super.ShieldHitBoxes);
        }

        override public function get StarHitBoxes():Array
        {
            var _local_1:Rectangle;
            var _local_2:HitBoxSprite;
            if (this.inState(CState.KIRBY_STAR))
            {
                _local_1 = new Rectangle();
                _local_1.width = 35;
                _local_1.height = 35;
                _local_1.x = (-(_local_1.width) / 2);
                _local_1.y = (-(m_height) * m_sizeRatio);
                _local_2 = new HitBoxSprite(HitBoxSprite.ATTACK, _local_1, true, null);
                _local_2.Name = "attackBox";
                return (new Array(_local_2));
            };
            return (null);
        }

        override public function get EggHitBoxes():Array
        {
            var _local_1:Rectangle;
            var _local_2:HitBoxSprite;
            if (this.inState(CState.EGG))
            {
                _local_1 = new Rectangle();
                _local_1.width = 30;
                _local_1.height = 35;
                _local_1.x = (-(_local_1.width) / 2);
                _local_1.y = (-(m_height) * m_sizeRatio);
                _local_2 = new HitBoxSprite(HitBoxSprite.EGG, _local_1, true, null);
                return (new Array(_local_2));
            };
            return (null);
        }

        override public function get FreezeHitBoxes():Array
        {
            var _local_1:Rectangle;
            var _local_2:HitBoxSprite;
            if (this.inState(CState.FROZEN))
            {
                _local_1 = new Rectangle();
                _local_1.width = 85;
                _local_1.height = 65;
                _local_1.x = (-(_local_1.width) / 2);
                _local_1.y = (-(m_height) * m_sizeRatio);
                _local_2 = new HitBoxSprite(HitBoxSprite.FREEZE, _local_1, true, null);
                return (new Array(_local_2));
            };
            return (null);
        }

        public function usingMidAirJumpConstant():Boolean
        {
            return ((this.m_midAirJumpConstantTime.MaxTime > 0) && (!(this.m_midAirJumpConstantTime.IsComplete)));
        }

        public function inFreeState(_arg_1:Boolean=false, _arg_2:Boolean=false, _arg_3:Boolean=false, _arg_4:Boolean=false, _arg_5:Boolean=false, _arg_6:Boolean=false, _arg_7:Boolean=false, _arg_8:Boolean=false, _arg_9:Boolean=false, _arg_10:Boolean=false, _arg_11:Boolean=false):Boolean
        {
            var _local_12:Boolean = ((_arg_1) ? false : this.inState(CState.ATTACKING));
            var _local_13:Boolean = ((_arg_2) ? false : this.inState(CState.GRABBING));
            var _local_14:Boolean = ((_arg_3) ? false : this.m_charIsFull);
            var _local_15:Boolean = ((_arg_4) ? false : this.inState(CState.SHIELDING));
            var _local_16:Boolean = ((_arg_5) ? false : (!((!(this.inState(CState.INJURED))) && (!(this.inState(CState.FLYING))))));
            var _local_17:Boolean = ((_arg_6) ? false : this.inState(CState.DISABLED));
            var _local_18:Boolean = ((_arg_7) ? false : (((this.inState(CState.DODGE_ROLL)) || (this.inState(CState.SIDESTEP_DODGE))) || (this.inState(CState.AIR_DODGE))));
            var _local_19:Boolean = ((_arg_8) ? false : this.inState(CState.GLIDING));
            var _local_20:Boolean = ((_arg_9) ? false : this.inState(CState.TURN));
            var _local_21:Boolean = ((_arg_10) ? false : this.isJumpChambering());
            var _local_22:Boolean = ((_arg_11) ? false : this.isSkidding());
            return ((((((((((((((((((((((((((((((((((((((((!(this.m_standby)) && (!(this.inState(CState.DEAD)))) && (!(_local_16))) && (!(_local_17))) && (!(_local_12))) && (!(_local_15))) && (!(_local_18))) && (!(this.inState(CState.LEDGE_HANG)))) && (!(this.inState(CState.LEDGE_ROLL)))) && (!(this.inState(CState.LEDGE_CLIMB)))) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.PITFALL)))) && (!(this.inState(CState.WALL_CLING)))) && (!(this.inState(CState.SLEEP)))) && (!(this.m_transformingSpecial))) && (!(this.m_usingSpecialAttack))) && (!(this.inState(CState.TAUNT)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.CAUGHT)))) && (!(this.inState(CState.BARREL)))) && (!(this.inState(CState.EGG)))) && (!(this.isLanding()))) && (!(_local_21))) && (!(this.inState(CState.ROLL)))) && (!(_local_13))) && (!(_local_14))) && (!(this.inState(CState.KIRBY_STAR)))) && (!(this.inState(CState.REVIVAL)))) && (!(this.inState(CState.ITEM_TOSS)))) && (!(this.inState(CState.CRASH_LAND)))) && (!(this.inState(CState.CRASH_GETUP)))) && (!(this.inState(CState.STAR_KO)))) && (!(this.inState(CState.SCREEN_KO)))) && (!(_local_19))) && (!(_local_20))) && (!(this.inState(CState.TECH_GROUND)))) && (!(this.inState(CState.TECH_ROLL)))) && (!(_local_22))) && (!(this.inState(CState.SHIELD_DROP))));
        }

        public function get OnKirbyFrame():Boolean
        {
            return (Boolean((((!(this.m_currentPower == null)) && (this.m_characterStats.LinkageID == "kirby")) && ((m_attack.Frame == "kirby") || (m_attack.Frame == "kirby_air")))));
        }

        public function get Disabled():Boolean
        {
            return (this.inState(CState.DISABLED));
        }

        public function get AttachedReticule():MovieClip
        {
            return (this.m_attachedReticule);
        }

        public function get StarKOMC():MovieClip
        {
            return (this.m_starKOMC);
        }

        public function get ScreenKO():Boolean
        {
            return (this.m_screenKO);
        }

        public function get Egg():Boolean
        {
            return (this.inState(CState.EGG));
        }

        public function get SizeStatus():int
        {
            return (this.m_sizeStatus);
        }

        public function get SizeStatusPermanent():Boolean
        {
            return (this.m_sizeStatusPermanent);
        }

        public function set SizeStatusPermanent(_arg_1:Boolean):void
        {
            this.m_sizeStatusPermanent = _arg_1;
        }

        public function get OriginalSizeRatio():Number
        {
            return (this.m_originalSizeRatio);
        }

        public function set OriginalSizeRatio(_arg_1:Number):void
        {
            this.m_originalSizeRatio = _arg_1;
        }

        public function get FreezePlayback():Boolean
        {
            return (this.m_freezePlayback);
        }

        public function set FreezePlayback(_arg_1:Boolean):void
        {
            this.m_freezePlayback = _arg_1;
        }

        public function get TimePriority():int
        {
            return (this.m_characterStats.TimePriority);
        }

        public function set TimePriority(value:int):void
        {
            this.m_characterStats.TimePriority = value;
        }

        public function getLinkageID():String
        {
            return (this.m_characterStats.LinkageID);
        }

        public function jumpFullyReleased():Boolean
        {
            return (this.m_jumpFullyReleased);
        }

        public function jumpIsPressed():Boolean
        {
            return (((this.m_jump) || (this.m_jump2)) || (this.m_tap_jump_btn));
        }

        public function shieldIsPressed():Boolean
        {
            return ((this.m_shield_btn) || (this.m_shield_btn2));
        }

        override public function recover(_arg_1:int):Boolean
        {
            if (this.m_damage == 0)
            {
                return (false);
            };
            if (this.m_recoveryAmount <= 0)
            {
                this.m_healEffect.x = m_sprite.x;
                this.m_healEffect.y = m_sprite.y;
                this.toggleEffect(this.m_healEffect, true);
            };
            this.m_recoveryAmount = (this.m_recoveryAmount + _arg_1);
            return (true);
        }

        private function checkRecovery():void
        {
            if (this.m_recoveryAmount > 0)
            {
                this.setDamage((this.m_damage - 1));
                Utils.advanceFrame(this.m_healEffect);
                this.m_recoveryAmount--;
                this.m_healEffect.x = m_sprite.x;
                this.m_healEffect.y = m_sprite.y;
                if (this.m_damage <= 0)
                {
                    this.m_damage = 0;
                    this.m_recoveryAmount = 0;
                };
            };
            if (this.m_recoveryAmount <= 0)
            {
                this.toggleEffect(this.m_healEffect, false);
            };
        }

        private function checkOffScreenBubble():void
        {
            var _local_2:Rectangle;
            var _local_3:Rectangle;
            var _local_4:BitmapData;
            var _local_5:Boolean;
            var _local_6:Boolean;
            var _local_7:Matrix;
            var _local_8:Bitmap;
            var _local_9:Matrix;
            var _local_1:MovieClip;
            if (((this.m_outsideCameraBounds) && (HasStance)))
            {
                _local_1 = this.m_pidHolderMC;
                _local_1.pid.visible = false;
                _local_2 = m_sprite.getBounds(m_sprite);
                _local_3 = m_sprite.getBounds(m_sprite.parent);
                _local_4 = new BitmapData((_local_2.width + 0.5), (_local_2.height + 0.5), true, 1127270);
                _local_5 = false;
                _local_6 = false;
                _local_7 = new Matrix();
                _local_7.tx = -(_local_2.x);
                _local_7.ty = -(_local_2.y);
                _local_5 = (!(m_facingForward));
                _local_6 = false;
                _local_4.draw(m_sprite, _local_7, null, null, null, false);
                while (this.m_offScreenBubble.numChildren > 0)
                {
                    this.m_offScreenBubble.removeChild(this.m_offScreenBubble.getChildAt(0));
                };
                _local_8 = new Bitmap(_local_4);
                _local_9 = new Matrix();
                if (_local_5)
                {
                    _local_9.a = -1;
                };
                if (_local_6)
                {
                    _local_9.d = -1;
                };
                _local_9.tx = ((_local_5) ? -(_local_2.x) : _local_2.x);
                _local_9.ty = ((_local_6) ? -(_local_2.y) : _local_2.y);
                _local_9.scale(0.4, 0.4);
                _local_9.rotate(Utils.toRadians(Utils.forceBase360(((!(m_facingForward)) ? -(CurrentRotation) : -(CurrentRotation)))));
                _local_8.transform.matrix = _local_9;
                _local_8.y = (_local_8.y - (m_height * 0.2));
                this.m_offScreenBubble.addChild(_local_8);
                _local_1.offScreenBubble.visible = true;
                if ((!(this.m_offScreenBubble.parent)))
                {
                    _local_1.offScreenBubble.bmpImage.addChild(this.m_offScreenBubble);
                };
            }
            else
            {
                if (this.m_offScreenBubble.parent)
                {
                    _local_1 = this.m_pidHolderMC;
                    _local_1.pid.visible = true;
                    _local_1.offScreenBubble.visible = false;
                    this.toggleEffect(this.m_offScreenBubble, false);
                };
            };
        }

        private function checkShadow():void
        {
            var _local_1:Rectangle;
            var _local_2:Number;
            var _local_3:Rectangle;
            var _local_4:BitmapData;
            var _local_5:Boolean;
            var _local_6:Boolean;
            var _local_7:Matrix;
            var _local_8:Bitmap;
            var _local_9:Matrix;
            var _local_10:Number;
            var _local_11:Number;
            if ((((STAGEDATA.LightSource) && (STAGEDATA.ShadowsRef)) && (HasStance)))
            {
                if (((((((m_collision.ground) && (m_currentPlatform)) && (m_sprite)) && (m_sprite.parent)) && (!(this.inState(CState.CAUGHT)))) && (!(this.inState(CState.BARREL)))))
                {
                    _local_1 = m_sprite.getBounds(m_sprite);
                    _local_2 = ((this.m_sizeStatus == 0) ? 1 : ((this.m_sizeStatus > 0) ? 2 : 0.5));
                    _local_1.x = (_local_1.x * _local_2);
                    _local_1.y = (_local_1.y * _local_2);
                    _local_1.width = (_local_1.width * _local_2);
                    _local_1.height = (_local_1.height * _local_2);
                    _local_3 = m_sprite.getBounds(m_sprite.parent);
                    if (((_local_1.width > 2000) || (_local_1.height > 2000)))
                    {
                        return;
                    };
                    _local_4 = new BitmapData((_local_1.width + 0.5), (_local_1.height + 0.5), true, 1127270);
                    _local_5 = false;
                    _local_6 = false;
                    _local_7 = new Matrix();
                    _local_7.tx = -(_local_1.x);
                    _local_7.ty = -(_local_1.y);
                    _local_7.a = _local_2;
                    _local_7.d = _local_2;
                    _local_5 = (m_sprite.transform.matrix.a < 0);
                    _local_6 = (m_sprite.transform.matrix.d < 0);
                    _local_4.draw(m_sprite, _local_7, null, null, new Rectangle(0, 0, _local_1.width, Utils.fastAbs(_local_1.y)), false);
                    while (this.m_shadowEffect.numChildren > 0)
                    {
                        this.m_shadowEffect.removeChild(this.m_shadowEffect.getChildAt(0));
                    };
                    _local_8 = new Bitmap(_local_4);
                    _local_8.transform.colorTransform = new ColorTransform(1, 1, 1, 0.25, -255, -255, -255, 0);
                    _local_9 = new Matrix();
                    _local_10 = 0;
                    if (STAGEDATA.LightSource)
                    {
                        _local_10 = Utils.forceBase360((90 - Utils.getAngleBetween(new Point(STAGEDATA.LightSource.x, ((m_sprite.y > STAGEDATA.LightSource.y) ? (STAGEDATA.LightSource.y - Utils.fastAbs((STAGEDATA.LightSource.y - m_sprite.y))) : m_sprite.y)), new Point(m_sprite.x, STAGEDATA.LightSource.y))));
                        if (_local_10 > 180)
                        {
                            _local_10 = (_local_10 - 180);
                        };
                    };
                    _local_11 = (((_local_10 >= 45) && (_local_10 < 90)) ? 45 : (((_local_10 >= 90) && (_local_10 < 135)) ? 135 : _local_10));
                    _local_9.c = Math.tan(Utils.toRadians(_local_11));
                    if (_local_5)
                    {
                        _local_9.a = -1;
                    };
                    if (_local_6)
                    {
                        _local_9.d = -1;
                    };
                    _local_9.tx = ((_local_5) ? -(_local_1.x) : _local_1.x);
                    _local_9.ty = ((_local_6) ? -(_local_1.y) : _local_1.y);
                    _local_8.transform.matrix = _local_9.clone();
                    this.m_shadowEffect.addChild(_local_8);
                    this.m_shadowEffect.x = (m_sprite.x - (Math.tan(Utils.toRadians(_local_11)) * _local_1.height));
                    this.m_shadowEffect.y = m_sprite.y;
                    this.m_shadowEffect.scaleX = 1;
                    this.m_shadowEffect.scaleY = 1;
                    this.m_shadowEffect.scaleY = -0.25;
                    this.m_shadowEffect.alpha = m_sprite.alpha;
                    if ((!(this.m_shadowEffect.parent)))
                    {
                        STAGEDATA.ShadowsRef.addChildAt(this.m_shadowEffect, 0);
                    };
                }
                else
                {
                    this.toggleEffect(this.m_shadowEffect, false);
                };
            };
        }

        public function increaseComboCount(_arg_1:AttackDamage, _arg_2:Number, _arg_3:Boolean=false):void
        {
            if (((_arg_1.HasEffect) || (_arg_3)))
            {
                if (this.m_comboID != _arg_2)
                {
                    this.m_comboCount = 0;
                    this.m_comboDamageTotal = 0;
                };
                this.m_comboID = _arg_2;
                this.m_comboCount++;
                this.m_comboTimer.reset();
                this.m_comboDamage = Utils.calculateChargeDamage(_arg_1);
                this.m_comboDamageTotal = (this.m_comboDamageTotal + this.m_comboDamage);
            };
        }

        public function dealDamage(_arg_1:Number):void
        {
            if ((!(STAGEDATA.GameEnded)))
            {
                this.m_matchResults.DamageTaken = (this.m_matchResults.DamageTaken + _arg_1);
            };
            this.setDamage((this.m_damage + _arg_1));
        }

        private function m_pushAwayOpponents():void
        {
            var _local_2:Vector.<HitBoxCollisionResult>;
            var _local_3:Character;
            var _local_1:int;
            while (_local_1 < this.m_opponents.length)
            {
                _local_2 = null;
                _local_3 = STAGEDATA.getPlayer(this.m_opponents[_local_1]);
                if ((((((HasHitBox) && (m_collision.ground)) && (_local_3.CollisionObj.ground)) && (_local_3.HasHitBox)) && ((_local_2 = HitBoxSprite.hitTestArray(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.HIT), _local_3.CurrentAnimation.getHitBoxes(_local_3.CurrentFrameNum, HitBoxSprite.HIT), Location, _local_3.Location, (!(m_facingForward)), (!(_local_3.FacingForward)), CurrentScale, _local_3.CurrentScale, CurrentRotation, _local_3.CurrentRotation)).length > 0)))
                {
                    if ((((this.inState(CState.LEDGE_ROLL)) || (this.inState(CState.LEDGE_CLIMB))) || ((this.inState(CState.ATTACKING)) && (m_attack.Frame == "ledge_attack"))))
                    {
                        _local_3.pushAway(m_facingForward);
                    }
                    else
                    {
                        if (m_sprite.x < _local_3.X)
                        {
                            _local_3.pushAway(true);
                        }
                        else
                        {
                            _local_3.pushAway(false);
                        };
                    };
                };
                _local_1++;
            };
        }

        public function m_pushAwayItems():void
        {
            var _local_1:int;
            var _local_2:Vector.<HitBoxCollisionResult>;
            var _local_3:Item;
            if (((HasHitBox) && (m_collision.ground)))
            {
                _local_1 = 0;
                while (_local_1 < STAGEDATA.ItemsRef.ItemsInUse.length)
                {
                    _local_2 = null;
                    _local_3 = STAGEDATA.ItemsRef.ItemsInUse[_local_1];
                    if ((((((((!(_local_3 == null)) && (!(_local_3.Dead))) && (!(_local_3.PickedUp))) && (_local_3.Ground)) && (!(_local_3.IsSmashBall))) && (_local_3.HasHitBox)) && ((_local_2 = HitBoxSprite.hitTestArray(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.HIT), _local_3.CurrentAnimation.getHitBoxes(_local_3.CurrentFrameNum, HitBoxSprite.HIT), Location, _local_3.Location, (!(m_facingForward)), (!(_local_3.FacingForward)), CurrentScale, _local_3.CurrentScale, CurrentRotation, _local_3.CurrentRotation)).length > 0)))
                    {
                        if (m_sprite.x > _local_3.X)
                        {
                            _local_3.pushAway(false);
                        }
                        else
                        {
                            if (m_sprite.x < _local_3.X)
                            {
                                _local_3.pushAway(true);
                            }
                            else
                            {
                                if (m_sprite.x == _local_3.X)
                                {
                                    _local_3.pushAway(true);
                                    this.pushAway(false);
                                };
                            };
                        };
                    };
                    _local_1++;
                };
            };
        }

        public function pushAway(_arg_1:Boolean, _arg_2:int=1):void
        {
            if (((((((((((((((((((((((((((((((((m_collision.ground) && (!(this.inState(CState.LEDGE_HANG)))) && (!(this.m_standby))) && (!(this.inState(CState.INJURED)))) && (!(this.inState(CState.CROUCH)))) && (!(this.inState(CState.FLYING)))) && (!(this.inState(CState.ATTACKING)))) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.PITFALL)))) && (!(this.inState(CState.WALL_CLING)))) && (!(this.inState(CState.SLEEP)))) && (!(this.m_transformingSpecial))) && (!(this.m_usingSpecialAttack))) && (!(this.inState(CState.SHIELDING)))) && (!(this.inState(CState.DODGE_ROLL)))) && (!(this.inState(CState.AIR_DODGE)))) && (!(this.inState(CState.SIDESTEP_DODGE)))) && (!(this.inState(CState.TAUNT)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.CAUGHT)))) && (!(this.inState(CState.BARREL)))) && (!(this.isLandingOrSkiddingOrChambering()))) && (!(this.inState(CState.LEDGE_ROLL)))) && (!(this.inState(CState.TECH_GROUND)))) && (!(this.inState(CState.TECH_ROLL)))) && (!(this.inState(CState.LEDGE_CLIMB)))) && (!(this.inState(CState.GRABBING)))) && (!(this.inState(CState.KIRBY_STAR)))) && (m_xSpeed == 0)) && (!(this.m_charIsFull))) && (!(isIntangible()))))
            {
                if (((_arg_1) && (!(m_collision.rightSide))))
                {
                    this.m_attemptToMove(_arg_2, 0);
                }
                else
                {
                    if (((!(_arg_1)) && (!(m_collision.leftSide))))
                    {
                        this.m_attemptToMove(-(_arg_2), 0);
                    };
                };
            };
        }

        public function pushAwayFromWalls():void
        {
            if ((((!(this.inState(CState.FLYING))) && (!(m_collision.ground))) && (testTerrainWithCoord((m_sprite.x - ((m_width / 2) * m_sizeRatio)), (m_sprite.y - (m_height * m_sizeRatio))))))
            {
                this.m_attemptToMove((6 - (m_xSpeed / 2)), 0);
                m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HIT_WALL, {
                    "caller":this,
                    "left":(m_xSpeed < 0),
                    "right":(m_xSpeed > 0),
                    "top":false
                }));
            };
            if ((((!(this.inState(CState.FLYING))) && (!(m_collision.ground))) && (testTerrainWithCoord((m_sprite.x + ((m_width / 2) * m_sizeRatio)), (m_sprite.y - (m_height * m_sizeRatio))))))
            {
                this.m_attemptToMove((-6 - (m_xSpeed / 2)), 0);
                m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HIT_WALL, {
                    "caller":this,
                    "left":(m_xSpeed < 0),
                    "right":(m_xSpeed > 0),
                    "top":false
                }));
            };
        }

        public function removeOpponent(_arg_1:int):void
        {
            var _local_2:Vector.<int> = new Vector.<int>();
            var _local_3:int;
            while (_local_3 < this.m_opponents.length)
            {
                if (this.m_opponents[_local_3] != _arg_1)
                {
                    _local_2.push(this.m_opponents[_local_3]);
                };
                _local_3++;
            };
            this.m_opponents = _local_2;
        }

        public function getCharacterStat(_arg_1:String):*
        {
            return (this.m_characterStats.getVar(_arg_1));
        }

        public function updateCharacterStats(_arg_1:Object):void
        {
            this.m_characterStats.importData(_arg_1);
            this.syncStats();
        }

        override protected function syncStats():void
        {
            this.setStats(this.m_characterStats);
        }

        public function getActiveProjectiles(_arg_1:int, _arg_2:int):Vector.<Projectile>
        {
            var _local_3:Vector.<Projectile> = new Vector.<Projectile>();
            var _local_4:int;
            while (_local_4 < this.m_projectile.length)
            {
                if ((((!(this.m_projectile[_local_4] == null)) && (!(this.m_projectile[_local_4].Dead))) && (((!(this.m_projectile[_local_4].PlayerID == _arg_1)) && (!(((_arg_2 > 0) && (this.m_projectile[_local_4].TeamID > 0)) && (this.m_projectile[_local_4].TeamID == _arg_2)))) || (this.m_projectile[_local_4].WasReversed))))
                {
                    _local_3.push(this.m_projectile[_local_4]);
                };
                _local_4++;
            };
            return (_local_3);
        }

        public function getCurrentProjectile():Projectile
        {
            if (((this.m_lastProjectile >= 0) && (this.m_lastProjectile < this.m_projectile.length)))
            {
                return (this.m_projectile[this.m_lastProjectile]);
            };
            return (null);
        }

        public function getProjectile(_arg_1:Number):Projectile
        {
            if (((_arg_1 >= 0) && (_arg_1 < this.m_projectile.length)))
            {
                return (this.m_projectile[_arg_1]);
            };
            return (null);
        }

        public function getProjectiles():Array
        {
            var _local_1:Array = new Array();
            var _local_2:int;
            while (_local_2 < this.m_projectile.length)
            {
                if (((this.m_projectile[_local_2]) && (!(this.m_projectile[_local_2].Dead))))
                {
                    _local_1.push(this.m_projectile[_local_2]);
                };
                _local_2++;
            };
            return (_local_1);
        }

        private function getProjectileLimit(_arg_1:String):Number
        {
            var _local_2:Number = 0;
            var _local_3:int;
            while (_local_3 < this.m_projectile.length)
            {
                if (((!(this.m_projectile[_local_3] == null)) && ((this.m_projectile[_local_3].LinkageID == _arg_1) || ((this.m_projectile[_local_3].getProjectileStat("statsName")) && (this.m_projectile[_local_3].getProjectileStat("statsName") == _arg_1)))))
                {
                    _local_2++;
                };
                _local_3++;
            };
            return (_local_2);
        }

        private function updateLivesDisplay():void
        {
            if (((!(this.inState(CState.DEAD))) && (this.m_usingLives)))
            {
                this.HealthBox.lives.text = ((this.m_lives > 0) ? ("x" + this.m_lives) : "");
            };
        }

        public function m_initFunctions():void
        {
            var _local_1:MovieClip = this.HealthBox;
            this.HealthBox.visible = true;
            this.HealthBox.cacheAsBitmap = true;
            this.updateLivesDisplay();
            var _local_2:MovieClip = Main.getLibraryMC(this.m_characterStats.Thumbnail, this.m_expansion_id);
            if (_local_2 != null)
            {
                _local_2.name = "charhead";
                this.HealthBox.charHead.addChild(_local_2);
            };
            _local_2 = Main.getLibraryMC(this.m_characterStats.SeriesIcon, this.m_expansion_id);
            if (_local_2 != null)
            {
                _local_2.name = "icon";
                this.HealthBox.icon.addChild(_local_2);
                if (((m_team_id > 0) && (!(ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)))))
                {
                    this.updateColorFilter(this.HealthBox.charHead, m_team_id, this.CostumeName, this.m_costume_id);
                    switch (m_team_id)
                    {
                        case 1:
                            Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 90, 0, 0, 0);
                            break;
                        case 2:
                            Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 0, 90, 0, 0);
                            break;
                        case 3:
                            Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 0, 0, 90, 0);
                            break;
                    };
                }
                else
                {
                    this.updateColorFilter(this.HealthBox.charHead, -1, this.CostumeName, this.m_costume_id);
                    switch (m_player_id)
                    {
                        case 1:
                            Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 90, 0, 0, 0);
                            break;
                        case 2:
                            Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 0, 0, 90, 0);
                            break;
                        case 3:
                            Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 90, 90, 0, 0);
                            break;
                        case 4:
                            Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 0, 90, 0, 0);
                            break;
                    };
                    if ((((STAGEDATA.GameRef.GameMode == Mode.TRAINING) && (m_player_id > 1)) || (!(this.m_human))))
                    {
                        Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 0, 0, 0, 0);
                    };
                };
            };
            if ((!(ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode))))
            {
                if (m_team_id < 0)
                {
                    switch (m_player_id)
                    {
                        case 1:
                            Utils.tryToGotoAndStop(this.HealthBox.damageBox, "team1");
                            Utils.tryToGotoAndStop(this.HealthBox.damageStrike, "team1");
                            break;
                        case 2:
                            Utils.tryToGotoAndStop(this.HealthBox.damageBox, "team3");
                            Utils.tryToGotoAndStop(this.HealthBox.damageStrike, "team3");
                            break;
                        case 3:
                            Utils.tryToGotoAndStop(this.HealthBox.damageBox, "team4");
                            Utils.tryToGotoAndStop(this.HealthBox.damageStrike, "team4");
                            break;
                        case 4:
                            Utils.tryToGotoAndStop(this.HealthBox.damageBox, "team2");
                            Utils.tryToGotoAndStop(this.HealthBox.damageStrike, "team2");
                            break;
                    };
                    if ((!(this.m_human)))
                    {
                        Utils.tryToGotoAndStop(this.HealthBox.damageBox, "team-1");
                        Utils.tryToGotoAndStop(this.HealthBox.damageStrike, "team-1");
                    };
                }
                else
                {
                    Utils.tryToGotoAndStop(this.HealthBox.damageBox, ("team" + m_team_id));
                    Utils.tryToGotoAndStop(this.HealthBox.damageStrike, ("team" + m_team_id));
                };
            }
            else
            {
                switch (m_player_id)
                {
                    case 1:
                        Utils.tryToGotoAndStop(this.HealthBox.damageBox, "team1");
                        Utils.tryToGotoAndStop(this.HealthBox.damageStrike, "team1");
                        break;
                    case 2:
                        Utils.tryToGotoAndStop(this.HealthBox.damageBox, "team3");
                        Utils.tryToGotoAndStop(this.HealthBox.damageStrike, "team3");
                        break;
                    case 3:
                        Utils.tryToGotoAndStop(this.HealthBox.damageBox, "team4");
                        Utils.tryToGotoAndStop(this.HealthBox.damageStrike, "team4");
                        break;
                    case 4:
                        Utils.tryToGotoAndStop(this.HealthBox.damageBox, "team2");
                        Utils.tryToGotoAndStop(this.HealthBox.damageStrike, "team2");
                        break;
                };
                if (m_player_id > 1)
                {
                    Utils.tryToGotoAndStop(this.HealthBox.damageBox, "team-1");
                    Utils.tryToGotoAndStop(this.HealthBox.damageStrike, "team-1");
                };
            };
            this.HealthBox.charName.text = this.m_characterStats.DisplayName.toUpperCase();
            this.setDamage(this.m_startDamage);
            this.getTerrainData();
            if (ModeFeatures.hasFeature(ModeFeatures.ALLOW_ENTRANCES, STAGEDATA.GameRef.GameMode))
            {
                this.setState(CState.ENTRANCE);
            }
            else
            {
                this.setState(CState.IDLE);
            };
            this.applySpecialModeEffects();
            if (((Stance) && (Stance["frame1"] as Function)))
            {
                ((Stance["frame1"] as Function)());
            };
            if (this.m_standby)
            {
                this.StandBy = false;
                this.StandBy = true;
            }
            else
            {
                this.setVisibility(true);
            };
            if (this.m_characterStats.StatsName === "sandbag")
            {
                m_sprite.x = 408;
                m_sprite.y = 280;
                this.m_characterStats.importData({
                    "x_respawn":(STAGEDATA.CamBounds.x + (STAGEDATA.CamBounds.width / 2)),
                    "y_respawn":(STAGEDATA.CamBounds.y + (STAGEDATA.CamBounds.height / 2))
                });
            };
        }

        private function applySpecialModeEffects():void
        {
            if (SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.MINI))
            {
                this.setSizeStatus(-1);
                this.m_sizeStatusPermanent = true;
            }
            else
            {
                if (SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.MEGA))
                {
                    this.setSizeStatus(1);
                    this.m_sizeStatusPermanent = true;
                };
            };
        }

        public function forceOnGround():void
        {
            this.m_down = false;
            var _local_1:Number = 0;
            while ((((!(m_currentPlatform = this.testGroundWithCoord(m_sprite.x, (m_sprite.y + 1)))) && (!(OnPlatform))) && (_local_1 < 400)))
            {
                m_sprite.y++;
                _local_1++;
            };
            if ((!(OnPlatform)))
            {
                _local_1 = 0;
                m_sprite.y = this.m_characterStats.YStart;
                while ((((!(m_currentPlatform = this.testGroundWithCoord(m_sprite.x, (m_sprite.y + 1)))) && (!(OnTerrain))) && (_local_1 < 400)))
                {
                    m_sprite.y++;
                    _local_1++;
                };
            };
            if (((!(OnPlatform)) && (!(OnTerrain))))
            {
                trace("what happened?");
                m_sprite.y = this.m_characterStats.YStart;
            }
            else
            {
                m_collision.ground = true;
                attachToGround();
            };
            this.updateColorFilter(m_sprite, ((ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)) ? null : m_team_id), this.CostumeName, this.m_costume_id);
        }

        private function m_checkInvincible():void
        {
            if (((this.isInvincible()) || (isIntangible())))
            {
                this.m_blinkTimer++;
                setBrightness(this.m_invincibleBrightness);
                this.m_invincibleBrightness = (this.m_invincibleBrightness + ((this.m_invincibleUp) ? 3 : -3));
                this.m_invincibleUp = (((this.m_invincibleUp) && (this.m_invincibleBrightness >= 50)) ? false : (((!(this.m_invincibleUp)) && (this.m_invincibleBrightness <= 15)) ? true : this.m_invincibleUp));
            };
        }

        private function m_checkStun():void
        {
            if (this.inState(CState.STUNNED))
            {
                this.m_stunCancelTimer.tick();
                if (((!(m_collision.ground)) && (this.m_stunCancelTimer.IsComplete)))
                {
                    this.setState(CState.TUMBLE_FALL);
                }
                else
                {
                    if (m_collision.ground)
                    {
                        this.m_stunCancelTimer.finish();
                        this.m_stunTimer--;
                        if (this.m_stunTimer <= 0)
                        {
                            this.m_stunTimer = 0;
                            this.setState(CState.IDLE);
                        };
                    };
                };
            };
        }

        private function m_checkDizzy():void
        {
            var _local_1:int;
            if (this.inState(CState.DIZZY))
            {
                this.m_stunCancelTimer.tick();
                if ((((!(m_collision.ground)) && (this.m_stunCancelTimer.IsComplete)) && (!(this.m_dizzyShield))))
                {
                    this.setState(CState.TUMBLE_FALL);
                }
                else
                {
                    if (m_collision.ground)
                    {
                        this.m_stunCancelTimer.finish();
                        this.m_dizzyTimer--;
                        if ((!(this.m_dizzyShield)))
                        {
                            _local_1 = this.Struggle(3);
                            this.m_dizzyTimer = (this.m_dizzyTimer - ((_local_1 > 0) ? _local_1 : 1));
                        };
                        if (this.m_dizzyTimer <= 0)
                        {
                            this.m_dizzyTimer = 0;
                            this.setState(CState.IDLE);
                        };
                    };
                };
            };
        }

        private function m_checkPitfall():void
        {
            var _local_1:int;
            if (this.inState(CState.PITFALL))
            {
                _local_1 = this.Struggle(3);
                this.m_pitfallTimer = (this.m_pitfallTimer - ((_local_1 > 0) ? _local_1 : 1));
                this.m_pitfallEffect.x = m_sprite.x;
                this.m_pitfallEffect.y = m_sprite.y;
                if (this.m_pitfallTimer <= 0)
                {
                    this.pitFallRelease();
                    this.toggleEffect(this.m_pitfallEffect, false);
                };
            };
        }

        private function pitFallRelease():void
        {
            this.m_pitfallTimer = 0;
            unnattachFromGround();
            m_ySpeed = (-(this.m_characterStats.JumpSpeed) / 2);
            this.setState(CState.IDLE);
        }

        public function freeze(_arg_1:Boolean, _arg_2:int=-1):void
        {
            if (_arg_1)
            {
                if (((this.inState(CState.CAUGHT)) && (this.m_grabberID > 0)))
                {
                    STAGEDATA.getPlayer(this.m_grabberID).setState(CState.IDLE);
                };
                this.setState(CState.FROZEN);
                this.toggleEffect(this.m_freezeMC, true);
                this.m_freezeMC.x = m_sprite.x;
                this.m_freezeMC.y = m_sprite.y;
                this.m_freezeMC.rotation = m_sprite.rotation;
                this.m_freezeMC.scaleX = m_sprite.scaleX;
                this.m_freezeMC.scaleY = m_sprite.scaleY;
                this.m_frozenTimer = _arg_2;
                this.resetRotation();
                this.killAllSpeeds(false, true);
                Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
            }
            else
            {
                if ((!(_arg_1)))
                {
                    this.m_frozenTimer = 0;
                    this.setState(CState.INJURED);
                    this.toggleEffect(this.m_freezeMC, false);
                    unnattachFromGround();
                    m_yKnockback = -10;
                    resetKnockbackDecay();
                    this.m_hitLag = this.calculateHitLag(10, -1);
                };
            };
        }

        private function m_checkFrozen():void
        {
            var _local_1:int;
            if (this.inState(CState.FROZEN))
            {
                if ((!(m_collision.ground)))
                {
                    m_sprite.rotation = (m_sprite.rotation + ((m_facingForward) ? -2 : 2));
                };
                this.m_frozenTimer--;
                _local_1 = this.Struggle();
                this.m_frozenTimer = (this.m_frozenTimer - _local_1);
                if (_local_1 > 0)
                {
                    m_sprite.stance.x = (m_sprite.stance.x + ((Utils.random() > 0.5) ? -1 : 1));
                    m_sprite.stance.y = (m_sprite.stance.y + ((Utils.random() > 0.5) ? -1 : 1));
                };
                if (this.m_frozenTimer <= 0)
                {
                    this.freeze(false);
                    attachEffect("freeze_break");
                };
            };
        }

        private function m_checkSleeping():void
        {
            var _local_1:int;
            if (this.inState(CState.SLEEP))
            {
                this.m_stunCancelTimer.tick();
                if (((!(m_collision.ground)) && (this.m_stunCancelTimer.IsComplete)))
                {
                    this.setState(CState.TUMBLE_FALL);
                }
                else
                {
                    if (m_collision.ground)
                    {
                        this.m_stunCancelTimer.finish();
                        if (((((this.m_sleepingTimer <= 0) && (HasStance)) && (Utils.hasLabel(m_sprite.stance, "wakeup"))) && (getStanceVar("finished", true))))
                        {
                            this.m_sleepingTimer = 0;
                            this.setState(CState.IDLE);
                        }
                        else
                        {
                            if (!((((this.m_sleepingTimer <= 0) && (HasStance)) && (Utils.hasLabel(m_sprite.stance, "wakeup"))) && (getStanceVar("finished", false))))
                            {
                                this.m_sleepingTimer--;
                                _local_1 = this.Struggle(3);
                                this.m_sleepingTimer = (this.m_sleepingTimer - ((_local_1 > 0) ? _local_1 : 1));
                                if (this.m_sleepingTimer <= 0)
                                {
                                    if (((HasStance) && (Utils.hasLabel(m_sprite.stance, "wakeup"))))
                                    {
                                        Utils.tryToGotoAndPlay(m_sprite.stance, "wakeup");
                                    }
                                    else
                                    {
                                        this.m_sleepingTimer = 0;
                                        this.setState(CState.IDLE);
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        public function egg(_arg_1:Boolean, _arg_2:int=-1):void
        {
            if (_arg_1)
            {
                if (((this.inState(CState.CAUGHT)) && (this.m_grabberID > 0)))
                {
                    STAGEDATA.getPlayer(this.m_grabberID).setState(CState.IDLE);
                };
                this.setState(CState.EGG);
                this.m_yoshiEggMC.x = m_sprite.x;
                this.m_yoshiEggMC.y = m_sprite.y;
                this.m_yoshiEggMC.stance.gotoAndStop("idle");
                this.toggleEffect(this.m_yoshiEggMC, true);
                if (_arg_2 > -1)
                {
                    this.m_eggTimer = _arg_2;
                }
                else
                {
                    this.m_eggTimer = (Math.round((90 + Math.floor((this.m_damage / 2.5)))) / 2);
                    if (this.m_eggTimer > 210)
                    {
                        this.m_eggTimer = 210;
                    };
                };
                this.resetRotation();
                Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                unnattachFromGround();
            }
            else
            {
                if ((!(_arg_1)))
                {
                    this.setVisibility(true);
                    this.toggleEffect(this.m_yoshiEggMC, false);
                    this.m_eggTimer = 0;
                    unnattachFromGround();
                    m_ySpeed = (-(this.m_characterStats.JumpSpeed) / 2);
                    this.setState(CState.IDLE);
                };
            };
        }

        private function m_checkEgg():void
        {
            var _local_1:int;
            if (this.inState(CState.EGG))
            {
                this.setVisibility(false);
                this.m_eggTimer--;
                _local_1 = this.Struggle();
                this.m_eggTimer = (this.m_eggTimer - _local_1);
                if (((this.m_eggTimer < 12) && (!(this.m_yoshiEggMC.stance.currentLabel === "break"))))
                {
                    this.m_yoshiEggMC.stance.gotoAndStop("break");
                }
                else
                {
                    if ((((_local_1 > 0) && (!(this.m_yoshiEggMC.stance.currentLabel === "mash"))) && (!(this.m_yoshiEggMC.stance.currentLabel === "break"))))
                    {
                        this.m_yoshiEggMC.stance.gotoAndStop("mash");
                    };
                };
                if (this.m_yoshiEggMC.stance.currentLabel !== "break")
                {
                    this.m_yoshiEggMC.gotoAndPlay(Math.min((this.m_yoshiEggMC.stance.currentFrame + _local_1), this.m_yoshiEggMC.stance.totalFrames));
                };
                if (this.m_eggTimer <= 0)
                {
                    this.egg(false);
                    attachEffect("yoshi_egg_break");
                };
            };
        }

        override public function resetRotation():void
        {
            if ((!(this.inState(CState.FROZEN))))
            {
                super.resetRotation();
                this.updateItemHolding();
            };
        }

        override public function setRotation(_arg_1:Number):void
        {
            super.setRotation(_arg_1);
            this.updateItemHolding();
        }

        public function getTetherCount():int
        {
            return (this.m_tetherCount);
        }

        private function resetSpeedLevel():void
        {
            this.m_runningSpeedLevel = false;
            this.m_speedTimer = 0;
        }

        private function resetBufferedCStick():void
        {
            this.m_c_buffered_down = false;
            this.m_c_buffered_left = false;
            this.m_c_buffered_right = false;
        }

        private function alternateBlink():void
        {
            if (this.m_blinkNumber == 1)
            {
                setBrightness(30);
                this.m_blinkNumber = 2;
                this.m_blinkTimer = 0;
            }
            else
            {
                setBrightness(50);
                this.m_blinkNumber = 1;
                this.m_blinkTimer = 0;
            };
        }

        override public function setVisibility(_arg_1:Boolean):void
        {
            m_sprite.visible = _arg_1;
            this.m_burnSmoke.visible = _arg_1;
            this.m_poisonEffect.visible = _arg_1;
            this.m_healEffect.visible = _arg_1;
            this.m_shadowEffect.visible = _arg_1;
            if (this.m_warioWareIcon)
            {
                this.m_warioWareIcon.visible = _arg_1;
            };
            this.m_starmanInvincibility.visible = _arg_1;
            this.m_hatMC.visible = _arg_1;
            if (this.m_item)
            {
                this.m_item.setVisibility(_arg_1);
            };
            if (this.m_fsGlowHolderMC)
            {
                this.m_fsGlowHolderMC.visible = _arg_1;
            };
            if (this.m_chargeGlowHolderMC)
            {
                this.m_chargeGlowHolderMC.visible = _arg_1;
            };
        }

        public function setDamage(_arg_1:Number):void
        {
            var _local_2:MovieClip;
            var _local_3:Number;
            var _local_4:uint;
            var _local_5:uint;
            var _local_6:uint;
            if ((!(this.m_stamina)))
            {
                if (_arg_1 > 999)
                {
                    _arg_1 = 999;
                }
                else
                {
                    if (_arg_1 < 0)
                    {
                        _arg_1 = 0;
                    };
                };
                this.m_damage = _arg_1;
                _local_2 = this.HealthBox;
                if (this.HealthBox != null)
                {
                    this.HealthBox.damageMC_holder.damageMC.damage.text = (((this.m_damage > 0) && (this.m_damage < 1.5)) ? 1 : Math.ceil(this.m_damage));
                    _local_3 = ((this.m_damage > 300) ? 1 : (this.m_damage / 300));
                    _local_4 = ((_local_3 < 0.6) ? 0xFF : uint((0xFF - (128 * ((_local_3 - 0.6) / 0.6)))));
                    _local_5 = ((_local_3 >= 0.6) ? 0 : uint((0xFF - (0xFF * (_local_3 / 0.6)))));
                    _local_6 = ((_local_3 >= 0.6) ? 0 : uint((0xFF - (0xFF * (_local_3 / 0.6)))));
                    TextField(this.HealthBox.damageMC_holder.damageMC.damage).textColor = (((_local_4 << 16) + (_local_5 << 8)) + _local_6);
                    TextField(this.HealthBox.percent_mc.damage).textColor = (((_local_4 << 16) + (_local_5 << 8)) + _local_6);
                };
                if (((this.m_damage > this.m_matchResults.PeakDamage) && (!(STAGEDATA.GameEnded))))
                {
                    this.m_matchResults.PeakDamage = this.m_damage;
                };
            };
        }

        public function throbDamageCounter():void
        {
            if (this.HealthBox != null)
            {
                Utils.tryToGotoAndPlay(this.HealthBox.damageMC_holder, "throb");
            };
        }

        public function reset():void
        {
            var _local_1:Vector.<MovieClip> = new Vector.<MovieClip>();
            _local_1.push(m_sprite);
            STAGEDATA.CamRef.deleteTargets(_local_1);
            this.setVisibility(false);
            if ((!(this.m_sizeStatusPermanent)))
            {
                m_sizeRatio = this.m_originalSizeRatio;
            };
            if (this.m_sizeStatus != 0)
            {
                this.setSizeStatus(0);
            };
            this.toggleEffect(this.m_poisonEffect, false);
            this.toggleEffect(this.m_pitfallEffect, false);
            this.toggleEffect(this.m_healEffect, false);
            this.toggleEffect(this.m_shadowEffect, false);
            this.toggleEffect(this.m_warioWareIcon, false);
            this.toggleEffect(this.m_starmanInvincibility, false);
            this.toggleEffect(this.m_offScreenBubble, false);
            this.toggleEffect(this.m_chargeGlowHolderMC, false);
            this.toggleEffect(this.m_fsGlowHolderMC, false);
            this.m_chargeGlowHolderMC = null;
            this.m_burnSmokeTimer.finish();
            this.m_starmanInvincibilityTimer.finish();
            this.m_wallStickTime.MaxTime = this.m_characterStats.WallStick;
            this.m_wallClingDelay;
            m_attackData.resetDisabledAttacks();
            this.turnOffInvincibility();
            this.stopActionShot();
            this.releaseOpponent();
            this.m_crowdAwe = false;
            this.m_hasFinalSmash = false;
            this.m_lastLedge = null;
            this.m_revivalTimer = 150;
            this.m_respawnDelay.reset();
            this.m_recoveryAmount = 0;
            this.HealthBox.damageMC_holder.visible = false;
            this.HealthBox.percent_mc.damage.visible = false;
            this.m_justReleased = false;
            this.m_jumpStartup.reset();
            this.setDamage((((STAGEDATA.GameRef.GameMode == Mode.TRAINING) && (m_player_id > 1)) ? GameController.hud.CpuDamage : this.m_startDamage));
            this.m_charIsFull = false;
            this.setState(CState.IDLE);
            this.m_shieldPower = 100;
            this.m_poisonIncreaseTime.reset();
            this.m_poisonIncrease = 0;
            if (((this.m_usingSpecialAttack) || (this.m_transformedSpecial)))
            {
                STAGEDATA.killFSCutscene();
                if (this.m_transformedSpecial)
                {
                    STAGEDATA.ItemsRef.SmashBallReady.CurrentTime = STAGEDATA.ItemsRef.SmashBallReady.MaxTime;
                };
                CAM.brighten();
            };
            this.m_usingSpecialAttack = false;
            m_facingForward = true;
            this.m_glideReady = true;
            var _local_2:Number = 0;
            var _local_3:Number = 0;
            var _local_4:MovieClip;
            var _local_5:String;
            var _local_6:Vector.<MovieClip>;
            if (this.m_transformedSpecial)
            {
                this.HealthBox.fsmeter.visible = false;
                this.replaceCharacter(((this.m_characterStats.DeathSwitchID != null) ? this.m_characterStats.DeathSwitchID : this.m_characterStats.NormalStatsID), "fall");
            }
            else
            {
                if (this.m_characterStats.DeathSwitchID != null)
                {
                    this.HealthBox.fsmeter.visible = false;
                    this.replaceCharacter(this.m_characterStats.DeathSwitchID, "fall");
                };
            };
            m_attackData.resetDisabledAttacks();
            this.m_faceRight();
            this.m_currentPower = null;
            this.m_transformingSpecial = false;
            this.m_transformedSpecial = false;
            this.m_jumpLetGo = true;
            this.m_tapJumpLetGo = true;
            this.m_jumpFullyReleased = true;
            this.m_crouchFrame = -1;
            this.m_deactivateShield();
            this.m_ledge = null;
            m_collision.ground = false;
            m_collision.lbound_lower = false;
            m_collision.rbound_lower = false;
            m_collision.lbound_upper = false;
            m_collision.rbound_upper = false;
            Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
            this.resetRotation();
            this.resetChargedAttacks();
            m_attack.Rocket = false;
            m_attackData.resetCharges();
            this.removeChargeGlow();
            this.killAllSpeeds();
            this.m_jumpCount = 0;
            this.m_canHover = true;
            this.m_midAirJumpConstantTime.CurrentTime = this.m_midAirJumpConstantTime.MaxTime;
            this.m_comboCount = 0;
            this.m_jumpLetGo = true;
            this.m_tapJumpLetGo = true;
            this.m_jumpFullyReleased = true;
            if (this.m_item != null)
            {
                STAGEDATA.ItemsRef.killItem(this.m_item.Slot);
                this.m_item = null;
            };
            if (STAGEPARENT.getChildByName(("energy" + m_player_id)) != null)
            {
                STAGEPARENT.removeChild(STAGEPARENT.getChildByName(("energy" + m_player_id)));
            };
            if (this.m_item2 != null)
            {
                this.m_item2.destroy();
                this.m_item2 = null;
            };
            if ((!(this.m_human)))
            {
                this.CPU.resetControlOverrides();
            };
            m_currentPlatform = null;
        }

        private function toggleEffect(_arg_1:MovieClip, _arg_2:Boolean=true):void
        {
            if (_arg_2)
            {
                if (((_arg_1) && (!(_arg_1.parent))))
                {
                    STAGE.addChild(_arg_1);
                };
            }
            else
            {
                if (((_arg_1) && (!(_arg_1.parent == null))))
                {
                    _arg_1.parent.removeChild(_arg_1);
                };
            };
        }

        public function turnOffInvincibility():void
        {
            m_invincible = false;
            m_intangible = false;
            setBrightness(0);
        }

        public function setHumanControl(_arg_1:Boolean, _arg_2:Number):void
        {
            if (((_arg_1) && (!(this.m_human))))
            {
                this.CPU = null;
                this.m_human = true;
                this.m_characterStats.Level = _arg_2;
            }
            else
            {
                if (((!(_arg_1)) && (this.m_human)))
                {
                    this.m_characterStats.Level = _arg_2;
                    this.CPU = new AI(this.m_characterStats.Level, this, STAGEDATA);
                    this.CPU.refreshRecoveryAttackList();
                    this.m_human = false;
                };
            };
        }

        private function m_getKey():void
        {
            var _local_1:Object;
            var _local_2:Object;
            if (((!(STAGEDATA.FreezeKeys)) && (!(STAGEDATA.StageEvent))))
            {
                if (this.m_human)
                {
                    if (((STAGEDATA.OnlineMode) || (STAGEDATA.ReplayMode)))
                    {
                        _local_1 = this.m_key.getControlsObject();
                        if (((this.m_characterStats.HoldJump) || (!(this.jumpIsPressed()))))
                        {
                            this.m_jumpLetGo = true;
                        };
                        if (((this.m_characterStats.HoldJump) || ((this.m_tap_jump) && (!(this.m_up)))))
                        {
                            this.m_tapJumpLetGo = true;
                        };
                        this.m_left = _local_1["LEFT"];
                        this.m_right = _local_1["RIGHT"];
                        this.m_up = _local_1["UP"];
                        this.m_down = _local_1["DOWN"];
                        this.m_b = _local_1["BUTTON1"];
                        this.m_a = _local_1["BUTTON2"];
                        this.m_grab = _local_1["GRAB"];
                        this.m_jump = _local_1["JUMP"];
                        this.m_taunt = _local_1["TAUNT"];
                        this.m_pause = _local_1["START"];
                        this.m_shield_btn = _local_1["SHIELD"];
                        this.m_shield_btn2 = _local_1["SHIELD2"];
                        this.m_jump2 = _local_1["JUMP2"];
                        this.m_c_up = _local_1["C_UP"];
                        this.m_c_down = _local_1["C_DOWN"];
                        this.m_c_left = _local_1["C_LEFT"];
                        this.m_c_right = _local_1["C_RIGHT"];
                        this.m_tap_jump = _local_1["TAP_JUMP"];
                        this.m_dash_btn = _local_1["DASH"];
                        this.m_auto_dash = _local_1["AUTO_DASH"];
                        this.m_dt_dash = _local_1["DT_DASH"];
                        this.m_tap_jump_btn = (((this.m_tap_jump) && (this.m_tapJumpLetGo)) && (this.m_up));
                        if (((((!(this.m_up)) && (!(this.m_right))) && (!(this.m_left))) && (!(this.m_down))))
                        {
                            this.m_smashDILetGo = true;
                        };
                        if (((((!(this.m_c_up)) && (!(this.m_c_down))) && (!(this.m_c_left))) && (!(this.m_c_right))))
                        {
                            this.m_smashDILetGoCStick = true;
                        };
                        if ((!(this.m_up)))
                        {
                            this.m_wwUpLetGo = true;
                        };
                        if ((!(this.m_down)))
                        {
                            this.m_wwDownLetGo = true;
                        };
                        if ((!(this.m_left)))
                        {
                            this.m_wwLeftLetGo = true;
                        };
                        if ((!(this.m_right)))
                        {
                            this.m_wwRightLetGo = true;
                        };
                    }
                    else
                    {
                        if (((this.m_characterStats.HoldJump) || (!(this.jumpIsPressed()))))
                        {
                            this.m_jumpLetGo = true;
                        };
                        if (((this.m_characterStats.HoldJump) || ((this.m_tap_jump) && (!(this.m_up)))))
                        {
                            this.m_tapJumpLetGo = true;
                        };
                        this.m_left = ((this.m_key.IsDown(this.m_key._LEFT)) ? true : false);
                        this.m_right = ((this.m_key.IsDown(this.m_key._RIGHT)) ? true : false);
                        this.m_up = ((this.m_key.IsDown(this.m_key._UP)) ? true : false);
                        this.m_down = ((this.m_key.IsDown(this.m_key._DOWN)) ? true : false);
                        this.m_b = ((this.m_key.IsDown(this.m_key._BUTTON1)) ? true : false);
                        this.m_a = ((this.m_key.IsDown(this.m_key._BUTTON2)) ? true : false);
                        this.m_grab = ((this.m_key.IsDown(this.m_key._GRAB)) ? true : false);
                        this.m_jump = ((this.m_key.IsDown(this.m_key._JUMP)) ? true : false);
                        this.m_taunt = ((this.m_key.IsDown(this.m_key._TAUNT)) ? true : false);
                        this.m_pause = ((this.m_key.IsDown(this.m_key._START)) ? true : false);
                        this.m_jump2 = ((this.m_key.IsDown(this.m_key._JUMP2)) ? true : false);
                        this.m_c_up = ((this.m_key.IsDown(this.m_key._C_UP)) ? true : false);
                        this.m_c_down = ((this.m_key.IsDown(this.m_key._C_DOWN)) ? true : false);
                        this.m_c_left = ((this.m_key.IsDown(this.m_key._C_LEFT)) ? true : false);
                        this.m_c_right = ((this.m_key.IsDown(this.m_key._C_RIGHT)) ? true : false);
                        this.m_shield_btn = ((this.m_key.IsDown(this.m_key._SHIELD)) ? true : false);
                        this.m_shield_btn2 = ((this.m_key.IsDown(this.m_key._SHIELD2)) ? true : false);
                        this.m_tap_jump = (this.m_key._TAP_JUMP == 1);
                        this.m_dash_btn = this.m_key.IsDown(this.m_key._DASH);
                        this.m_auto_dash = (this.m_key._AUTO_DASH == 1);
                        this.m_dt_dash = (this.m_key._DT_DASH == 1);
                        this.m_tap_jump_btn = (((this.m_tap_jump) && (this.m_tapJumpLetGo)) && (this.m_up));
                        if (((((!(this.m_up)) && (!(this.m_right))) && (!(this.m_left))) && (!(this.m_down))))
                        {
                            this.m_smashDILetGo = true;
                        };
                        if (((((!(this.m_c_up)) && (!(this.m_c_down))) && (!(this.m_c_left))) && (!(this.m_c_right))))
                        {
                            this.m_smashDILetGoCStick = true;
                        };
                        if ((!(this.m_up)))
                        {
                            this.m_wwUpLetGo = true;
                        };
                        if ((!(this.m_down)))
                        {
                            this.m_wwDownLetGo = true;
                        };
                        if ((!(this.m_left)))
                        {
                            this.m_wwLeftLetGo = true;
                        };
                        if ((!(this.m_right)))
                        {
                            this.m_wwRightLetGo = true;
                        };
                    };
                }
                else
                {
                    if ((!(STAGEDATA.Paused)))
                    {
                        _local_2 = this.CPU.getAction();
                        if (((this.m_characterStats.HoldJump) || (!(this.jumpIsPressed()))))
                        {
                            this.m_jumpLetGo = true;
                        };
                        this.m_left = _local_2["left"];
                        this.m_right = _local_2["right"];
                        this.m_up = _local_2["up"];
                        this.m_jump = _local_2["jump"];
                        this.m_down = _local_2["down"];
                        this.m_a = _local_2["a"];
                        this.m_b = _local_2["b"];
                        this.m_grab = _local_2["grab"];
                        this.m_taunt = _local_2["taunt"];
                        this.m_pause = _local_2["pause"];
                        this.m_shield_btn = _local_2["shield"];
                        this.m_shield_btn2 = _local_2["shield2"];
                        this.m_dash_btn = _local_2["dash"];
                        this.m_tap_jump = false;
                        this.m_auto_dash = false;
                        this.m_dt_dash = false;
                        if ((!(this.m_up)))
                        {
                            this.m_wwUpLetGo = true;
                        };
                        if ((!(this.m_down)))
                        {
                            this.m_wwDownLetGo = true;
                        };
                        if ((!(this.m_left)))
                        {
                            this.m_wwLeftLetGo = true;
                        };
                        if ((!(this.m_right)))
                        {
                            this.m_wwRightLetGo = true;
                        };
                    };
                };
            }
            else
            {
                if ((!(STAGEDATA.StageEvent)))
                {
                    this.m_left = false;
                    this.m_right = false;
                    this.m_up = false;
                    this.m_down = false;
                    this.m_b = false;
                    this.m_a = false;
                    this.m_grab = false;
                    this.m_jump = false;
                    this.m_taunt = false;
                    this.m_pause = ((this.m_human) ? ((this.m_key.IsDown(this.m_key._START)) ? true : false) : false);
                    this.m_jump2 = false;
                    this.m_c_up = false;
                    this.m_c_down = false;
                    this.m_c_left = false;
                    this.m_c_right = false;
                    this.m_shield_btn = false;
                    this.m_shield_btn2 = false;
                    this.m_dash_btn = false;
                }
                else
                {
                    this.m_left = false;
                    this.m_right = false;
                    this.m_up = false;
                    this.m_down = false;
                    this.m_b = false;
                    this.m_a = false;
                    this.m_grab = false;
                    this.m_jump = false;
                    this.m_taunt = false;
                    this.m_pause = false;
                    this.m_jump2 = false;
                    this.m_c_up = false;
                    this.m_c_down = false;
                    this.m_c_left = false;
                    this.m_c_right = false;
                    this.m_shield_btn = false;
                    this.m_shield_btn2 = false;
                    this.m_dash_btn = false;
                };
            };
        }

        private function checkDoubleTap(_arg_1:Number):Boolean
        {
            var _local_2:Boolean;
            switch (_arg_1)
            {
                case 0:
                    if ((!(m_collision.ground)))
                    {
                        return (false);
                    };
                    if (((this.m_auto_dash) && (!(this.m_dash_btn))))
                    {
                        return (true);
                    };
                    if (this.m_auto_dash)
                    {
                        return (false);
                    };
                    if (((!(this.m_dt_dash)) && (this.m_dash_btn)))
                    {
                        return (true);
                    };
                    if ((!(this.m_dt_dash)))
                    {
                        return (false);
                    };
                    if (((this.m_dt_dash) && (this.m_dash_btn)))
                    {
                        return (true);
                    };
                    if ((((!(this.m_right)) && (!(this.m_left))) && (Utils.fastAbs(m_xSpeed) < this.m_max_xSpeed)))
                    {
                        this.m_speedLetGo = true;
                    };
                    if (this.inState(CState.WALK))
                    {
                        this.m_speedTimer = 0;
                    }
                    else
                    {
                        this.m_speedTimer++;
                    };
                    if ((((this.m_right) || (this.m_left)) && (this.inState(CState.RUN))))
                    {
                        _local_2 = true;
                    };
                    if (((this.inState(CState.TURN)) || (this.inState(CState.DASH))))
                    {
                        _local_2 = true;
                    };
                    if ((((((this.m_speedTimer < 6) && (((this.inState(CState.IDLE)) || (this.inState(CState.WALK))) || (this.inState(CState.SKID)))) && (!(this.m_right == this.m_left))) && (this.m_speedLetGo)) && (((this.m_right) && (m_facingForward)) || ((this.m_left) && (!(m_facingForward))))))
                    {
                        this.m_speedLetGo = false;
                        _local_2 = true;
                    };
                    break;
                case 1:
                    _local_2 = false;
                    if (((this.m_crouchTimer > 6) && (!(this.inState(CState.CROUCH)))))
                    {
                        this.m_crouchTimer = 0;
                    };
                    if (((this.inState(CState.CROUCH)) && (this.m_crouchTimer == 0)))
                    {
                        this.m_crouchTimer = 1;
                    };
                    if ((((this.m_crouchTimer > 0) && (!(this.inState(CState.CROUCH)))) && (!(this.m_down))))
                    {
                        this.m_crouchTimer++;
                    };
                    if ((((this.m_crouchTimer > 0) && (!(this.inState(CState.CROUCH)))) && (this.m_down)))
                    {
                        this.m_crouchTimer = 0;
                        _local_2 = true;
                    };
                    break;
            };
            return (_local_2);
        }

        private function initDash(_arg_1:Boolean):void
        {
            if (this.inState(CState.ATTACKING))
            {
                this.forceEndAttack();
            };
            this.m_dashReady = false;
            this.m_speedTimer = 0;
            if (_arg_1)
            {
                this.m_faceRight();
            }
            else
            {
                this.m_faceLeft();
            };
            var _local_2:Number = ((this.m_characterStats.AccelStartDash >= 0) ? this.m_characterStats.AccelStartDash : this.m_characterStats.AccelStart);
            m_xSpeed = ((_arg_1) ? (_local_2 * this.m_max_xSpeed) : (-(_local_2) * this.m_max_xSpeed));
            this.setState(CState.DASH);
            this.stancePlayFrame("dash");
            this.attachRunEffect();
        }

        override protected function checkPlatformBounce():void
        {
            if (((m_currentPlatform) && (m_currentPlatform.bounce_speed > 0)))
            {
                m_ySpeed = -(m_currentPlatform.bounce_speed);
                unnattachFromGround();
                if (this.m_grabbed.length > 0)
                {
                    this.setState(CState.JUMP_RISING);
                    this.releaseOpponent();
                };
            };
        }

        private function m_charRun():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Boolean;
            var _local_5:Boolean;
            var _local_6:Boolean;
            var _local_7:Boolean;
            if ((!(isHitStunOrParalysis())))
            {
                applyGroundInfluence();
                this.checkPlatformBounce();
            };
            if (((!(isHitStunOrParalysis())) && (!(this.inState(CState.GLIDING)))))
            {
                _local_1 = this.m_norm_xSpeed;
                _local_2 = this.m_max_xSpeed;
                _local_3 = this.m_characterStats.MaxJumpSpeed;
                if (this.m_sizeStatus != 0)
                {
                    this.m_norm_xSpeed = (this.m_norm_xSpeed * ((this.m_sizeStatus == 1) ? 2 : 0.5));
                    this.m_max_xSpeed = (this.m_max_xSpeed * ((this.m_sizeStatus == 1) ? 2 : 0.5));
                    this.m_characterStats.MaxJumpSpeed = (this.m_characterStats.MaxJumpSpeed * ((this.m_sizeStatus == 1) ? 2 : 0.5));
                };
                if ((!(this.inState(CState.ATTACKING))))
                {
                    if (this.m_forceTimer > 0)
                    {
                        this.m_right = this.m_forceRight;
                        this.m_left = (!(this.m_forceRight));
                        this.m_forceTimer--;
                    };
                };
                _local_4 = this.m_runningSpeedLevel;
                this.m_runningSpeedLevel = ((this.checkDoubleTap(0)) ? true : false);
                _local_5 = (!(_local_4 == this.m_runningSpeedLevel));
                _local_6 = (m_xSpeed > 0);
                if (((this.m_charIsFull) && (this.m_grabbed.length > 0)))
                {
                    this.resetSpeedLevel();
                    this.m_grabbed[0].X = m_sprite.x;
                    this.m_grabbed[0].Y = m_sprite.y;
                };
                if (((this.inState(CState.DASH)) || (this.inState(CState.TURN))))
                {
                    this.m_runningSpeedLevel = true;
                    _local_5 = false;
                };
                if (((this.inState(CState.TURN)) && (!(m_sprite.stance.currentLabel == "turn"))))
                {
                    this.m_dashReady = false;
                    this.m_turnTimer.reset();
                    this.setState(CState.RUN);
                    if (m_facingForward)
                    {
                        this.m_faceLeft();
                    }
                    else
                    {
                        this.m_faceRight();
                    };
                };
                if (this.inState(CState.DASH))
                {
                    if (((!(this.m_left)) && (!(this.m_right))))
                    {
                        this.m_dashReady = true;
                    };
                    if (m_sprite.stance.currentLabel != "dash")
                    {
                        this.m_dashReady = false;
                        this.setState(CState.RUN);
                    }
                    else
                    {
                        if ((((this.m_runningSpeedLevel) && (!(this.m_left == this.m_right))) && (((this.m_left) && (m_facingForward)) || ((this.m_right) && (!(m_facingForward))))))
                        {
                            if (m_facingForward)
                            {
                                this.m_faceLeft();
                            }
                            else
                            {
                                this.m_faceRight();
                            };
                            this.setState(CState.DASH_INIT);
                            m_xSpeed = 0;
                        };
                    };
                }
                else
                {
                    if (this.inState(CState.DASH_INIT))
                    {
                        this.initDash(m_facingForward);
                    };
                };
                if (this.inState(CState.SKID))
                {
                    if (((!(this.m_left)) && (!(this.m_right))))
                    {
                        this.m_dashReady = true;
                    };
                    if (((((_local_5) && (this.m_runningSpeedLevel)) && (!(this.m_left == this.m_right))) && (((this.m_left) && (!(m_facingForward))) || ((this.m_right) && (m_facingForward)))))
                    {
                    };
                };
                if (((this.inState(CState.RUN)) && (!(this.m_runningSpeedLevel))))
                {
                    this.m_speedLetGo = false;
                    this.resetSpeedLevel();
                    this.m_dashReady = true;
                    this.resetSmashTimers();
                    this.m_dashReady = true;
                    this.setState(CState.SKID);
                };
                if (((((((((this.m_right) && ((!(this.m_left)) || ((this.m_left) && (m_facingForward)))) && (this.inFreeState(false, false, true, false, false, true, (!((STAGEDATA.MeleeAirDodge) && (this.inState(CState.AIR_DODGE))))))) && (!(this.inState(CState.DASH_INIT)))) && (!(this.inState(CState.DODGE_ROLL)))) && (!(this.inState(CState.SIDESTEP_DODGE)))) && ((!(this.inState(CState.CROUCH))) || ((this.inState(CState.CROUCH)) && (this.m_characterStats.CrouchWalkSpeed > 0)))) && (!(this.inState(CState.TURN)))))
                {
                    if ((!(m_collision.ground)))
                    {
                        if (((!(this.inState(CState.DISABLED))) && (this.m_runningSpeedLevel)))
                        {
                            m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_characterStats.MaxJumpSpeed) ? this.m_characterStats.AccelRateAir : 0));
                        }
                        else
                        {
                            m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_characterStats.MaxJumpSpeed) ? this.m_characterStats.AccelRateAir : 0));
                        };
                    }
                    else
                    {
                        if ((!(this.inState(CState.EGG))))
                        {
                            if ((!(this.m_runningSpeedLevel)))
                            {
                                if (m_xSpeed == 0)
                                {
                                    m_xSpeed = (this.m_characterStats.AccelStart * this.m_norm_xSpeed);
                                }
                                else
                                {
                                    m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_norm_xSpeed) ? (this.m_characterStats.AccelRate * m_currentPlatform.accel_friction) : 0));
                                };
                            }
                            else
                            {
                                if (((((this.m_dashReady) && (this.m_runningSpeedLevel)) && (!(this.inState(CState.DASH)))) && (Utils.fastAbs(m_xSpeed) < this.m_max_xSpeed)))
                                {
                                    this.initDash(true);
                                }
                                else
                                {
                                    m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_max_xSpeed) ? (this.m_characterStats.AccelRate * m_currentPlatform.accel_friction) : 0));
                                    if (m_xSpeed > this.m_max_xSpeed)
                                    {
                                        decel(this.m_characterStats.DecelRate);
                                        if (m_xSpeed < this.m_max_xSpeed)
                                        {
                                            m_xSpeed = this.m_max_xSpeed;
                                        };
                                    };
                                };
                            };
                            if (((((this.m_turnTimer.IsComplete) && (this.inState(CState.RUN))) && ((!(_local_6)) && (!(m_facingForward)))) && ((Utils.hasLabel(m_sprite.stance, "turn")) && (!(m_sprite.stance.currentLabel == "turn")))))
                            {
                                this.stancePlayFrame("turn");
                                this.setState(CState.TURN);
                            }
                            else
                            {
                                if (((((this.inState(CState.RUN)) && (Utils.fastAbs(m_xSpeed) > this.m_norm_xSpeed)) && (!(m_facingForward))) && (!(Utils.hasLabel(m_sprite.stance, "turn")))))
                                {
                                    m_xSpeed = (this.m_characterStats.AccelStart * -(this.m_norm_xSpeed));
                                };
                            };
                            if (this.m_runningSpeedLevel)
                            {
                                this.m_calcGroundAngle();
                            };
                        };
                    };
                    if (this.inState(CState.CROUCH))
                    {
                        if (((this.m_left) && (this.m_right)))
                        {
                            m_xSpeed = 0;
                        }
                        else
                        {
                            if (m_xSpeed > this.m_characterStats.CrouchWalkSpeed)
                            {
                                m_xSpeed = this.m_characterStats.CrouchWalkSpeed;
                            };
                        };
                    }
                    else
                    {
                        if (((((((m_collision.ground) && (!(this.inState(CState.FLYING)))) && (!(this.inState(CState.INJURED)))) && (!(this.inState(CState.AIR_DODGE)))) && (!(this.inState(CState.TURN)))) && (!(this.inState(CState.DASH)))))
                        {
                            this.setState(((!(this.m_runningSpeedLevel)) ? CState.WALK : CState.RUN));
                            if (((this.inState(CState.WALK)) && (Utils.fastAbs(m_xSpeed) > this.m_norm_xSpeed)))
                            {
                                m_xSpeed = ((m_xSpeed > 0) ? this.m_norm_xSpeed : -(this.m_norm_xSpeed));
                            };
                            this.m_speedLetGo = false;
                        };
                    };
                }
                else
                {
                    if (((((((((this.m_left) && ((!(this.m_right)) || ((this.m_right) && (!(m_facingForward))))) && (this.inFreeState(false, false, true, false, false, true, (!((STAGEDATA.MeleeAirDodge) && (this.inState(CState.AIR_DODGE))))))) && (!(this.inState(CState.DASH_INIT)))) && (!(this.inState(CState.DODGE_ROLL)))) && (!(this.inState(CState.SIDESTEP_DODGE)))) && ((!(this.inState(CState.CROUCH))) || ((this.inState(CState.CROUCH)) && (this.m_characterStats.CrouchWalkSpeed > 0)))) && (!(this.inState(CState.TURN)))))
                    {
                        if ((!(m_collision.ground)))
                        {
                            if (((!(this.inState(CState.DISABLED))) && (this.m_runningSpeedLevel)))
                            {
                                m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_characterStats.MaxJumpSpeed)) ? this.m_characterStats.AccelRateAir : 0));
                            }
                            else
                            {
                                m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_characterStats.MaxJumpSpeed)) ? this.m_characterStats.AccelRateAir : 0));
                            };
                        }
                        else
                        {
                            if ((!(this.inState(CState.EGG))))
                            {
                                if ((!(this.m_runningSpeedLevel)))
                                {
                                    if (m_xSpeed == 0)
                                    {
                                        m_xSpeed = (this.m_characterStats.AccelStart * -(this.m_norm_xSpeed));
                                    }
                                    else
                                    {
                                        m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_norm_xSpeed)) ? (this.m_characterStats.AccelRate * m_currentPlatform.accel_friction) : 0));
                                    };
                                }
                                else
                                {
                                    if (((((this.m_dashReady) && (this.m_runningSpeedLevel)) && (!(this.inState(CState.DASH)))) && (Utils.fastAbs(m_xSpeed) < this.m_max_xSpeed)))
                                    {
                                        this.initDash(false);
                                    }
                                    else
                                    {
                                        m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_max_xSpeed)) ? (this.m_characterStats.AccelRate * m_currentPlatform.accel_friction) : 0));
                                        if (m_xSpeed < -(this.m_max_xSpeed))
                                        {
                                            decel(this.m_characterStats.DecelRate);
                                            if (m_xSpeed > -(this.m_max_xSpeed))
                                            {
                                                m_xSpeed = -(this.m_max_xSpeed);
                                            };
                                        };
                                    };
                                };
                                if (((((this.m_turnTimer.IsComplete) && (this.inState(CState.RUN))) && ((_local_6) && (m_facingForward))) && ((Utils.hasLabel(m_sprite.stance, "turn")) && (!(m_sprite.stance.currentLabel == "turn")))))
                                {
                                    this.stancePlayFrame("turn");
                                    this.setState(CState.TURN);
                                }
                                else
                                {
                                    if (((((this.inState(CState.RUN)) && (Utils.fastAbs(m_xSpeed) > this.m_norm_xSpeed)) && (m_facingForward)) && (!(Utils.hasLabel(m_sprite.stance, "turn")))))
                                    {
                                        m_xSpeed = (this.m_characterStats.AccelStart * this.m_norm_xSpeed);
                                    };
                                };
                                if (this.m_runningSpeedLevel)
                                {
                                    this.m_calcGroundAngle();
                                };
                            };
                        };
                        if (this.inState(CState.CROUCH))
                        {
                            if (((this.m_left) && (this.m_right)))
                            {
                                m_xSpeed = 0;
                            }
                            else
                            {
                                if (m_xSpeed < -(this.m_characterStats.CrouchWalkSpeed))
                                {
                                    m_xSpeed = -(this.m_characterStats.CrouchWalkSpeed);
                                };
                            };
                        }
                        else
                        {
                            if (((((((m_collision.ground) && (!(this.inState(CState.FLYING)))) && (!(this.inState(CState.INJURED)))) && (!(this.inState(CState.AIR_DODGE)))) && (!(this.inState(CState.TURN)))) && (!(this.inState(CState.DASH)))))
                            {
                                this.setState(((!(this.m_runningSpeedLevel)) ? CState.WALK : CState.RUN));
                                if (((this.inState(CState.WALK)) && (Utils.fastAbs(m_xSpeed) > this.m_norm_xSpeed)))
                                {
                                    m_xSpeed = ((m_xSpeed > 0) ? this.m_norm_xSpeed : -(this.m_norm_xSpeed));
                                };
                                this.m_speedLetGo = false;
                            };
                        };
                    }
                    else
                    {
                        if ((((((((((m_collision.ground) && (!(this.inState(CState.LEDGE_ROLL)))) && (!(this.inState(CState.DASH_INIT)))) && (!(this.inState(CState.ROLL)))) && (!(this.inState(CState.TECH_ROLL)))) && (!(this.inState(CState.DODGE_ROLL)))) && ((!(this.inState(CState.FLYING))) || (this.m_hasBounced))) && (!(this.inState(CState.INJURED)))) && (!(this.inState(CState.ATTACKING)))))
                        {
                            if (m_xSpeed != 0)
                            {
                                decel(this.m_characterStats.DecelRate);
                            };
                        };
                    };
                };
                if (((((!(this.inState(CState.BARREL))) && (!(this.inState(CState.CAUGHT)))) && ((!(this.inState(CState.FLYING))) || (this.m_hasBounced))) && (!(this.inState(CState.INJURED)))))
                {
                    if (((m_collision.ground) && ((!(this.m_runningSpeedLevel)) || (this.inState(CState.DASH)))))
                    {
                        this.m_calcGroundAngle();
                    };
                    if ((((this.inState(CState.CROUCH)) && (this.m_characterStats.CrouchWalkSpeed > 0)) && (currentFrameIs("crouch"))))
                    {
                        if (this.m_left != this.m_right)
                        {
                            if (getStanceVar("moving", false))
                            {
                                this.stancePlayFrame("walking");
                            };
                            m_xSpeed = ((this.m_right) ? this.m_characterStats.CrouchWalkSpeed : -(this.m_characterStats.CrouchWalkSpeed));
                        }
                        else
                        {
                            if (getStanceVar("moving", true))
                            {
                                this.stancePlayFrame("crouching");
                            };
                        };
                    };
                    _local_7 = ((this.inState(CState.TURN)) || ((this.inState(CState.RUN)) && (((m_facingForward) && (m_xSpeed < 0)) || ((!(m_facingForward)) && (m_xSpeed > 0)))));
                    if ((((!(m_xSpeed == 0)) && (!((this.inState(CState.ATTACKING)) && (m_attack.Rocket)))) && (!(((((((((((((this.inState(CState.ATTACKING)) && (!(m_attack.CanFallOff))) || (this.inState(CState.GRABBING))) || (this.inState(CState.SHIELDING))) || (this.inState(CState.SHIELD_DROP))) || (this.inState(CState.TECH_ROLL))) || (this.inState(CState.DODGE_ROLL))) || (this.inState(CState.CRASH_LAND))) || (this.inState(CState.CRASH_GETUP))) || (this.inState(CState.ROLL))) || (this.inState(CState.SIDESTEP_DODGE))) && (m_collision.ground)) && (willFallOffRange((m_sprite.x + m_xSpeed), m_sprite.y, 10))))))
                    {
                        this.m_attemptToMove(m_xSpeed, 0);
                    };
                    if (((((m_collision.ground) && (!(this.m_runningSpeedLevel))) && (!((this.inState(CState.ATTACKING)) && ((m_attack.Frame == "a_forward") || (m_attack.IsThrow))))) && (!(this.inState(CState.GRABBING)))))
                    {
                        this.resetRotation();
                        Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                    };
                    if ((((m_collision.ground) && (!(this.inState(CState.CAUGHT)))) && (!(this.inState(CState.BARREL)))))
                    {
                        attachToGround();
                    }
                    else
                    {
                        if ((((((((!(m_collision.ground)) && (!(this.inState(CState.CAUGHT)))) && (!(m_xSpeed == 0))) && (!(this.inState(CState.ATTACKING)))) && (!(this.inState(CState.BARREL)))) && (!(this.m_left))) && (!(this.m_right))))
                        {
                            decel(this.m_characterStats.DecelRateAir);
                        };
                    };
                };
                if (this.inState(CState.LEDGE_HANG))
                {
                    if (((((this.m_left) && (!(this.m_right))) && (m_facingForward)) && (this.m_ledgeHangTimer.CurrentTime > 4)))
                    {
                        m_ySpeed = 0;
                        this.unnattachFromLedge();
                        this.setState(CState.IDLE);
                    };
                    if (((((!(this.m_left)) && (this.m_right)) && (!(m_facingForward))) && (this.m_ledgeHangTimer.CurrentTime > 4)))
                    {
                        m_ySpeed = 0;
                        this.unnattachFromLedge();
                        this.setState(CState.IDLE);
                    };
                };
                this.m_norm_xSpeed = _local_1;
                this.m_max_xSpeed = _local_2;
                this.m_characterStats.MaxJumpSpeed = _local_3;
            };
            if ((((((m_collision.ground) && ((this.inState(CState.WALK)) || (this.inState(CState.RUN)))) && (!(this.m_left))) && (!(this.m_right))) && (this.inFreeState())))
            {
                if (((this.inState(CState.RUN)) && (Utils.fastAbs(m_xSpeed) < this.m_max_xSpeed)))
                {
                    this.m_speedLetGo = false;
                    this.resetSpeedLevel();
                    this.m_dashReady = true;
                    this.resetSmashTimers();
                    this.m_dashReady = true;
                    this.setState(CState.SKID);
                }
                else
                {
                    if (((!(this.m_runningSpeedLevel)) || (m_xSpeed == 0)))
                    {
                        this.m_dashReady = true;
                        this.setState(CState.IDLE);
                    };
                };
            }
            else
            {
                if (((this.inState(CState.RUN)) && (!(this.m_right == this.m_left))))
                {
                    if (((this.m_right) && (!(m_facingForward))))
                    {
                        this.m_faceRight();
                    };
                    if (((this.m_left) && (m_facingForward)))
                    {
                        this.m_faceLeft();
                    };
                };
            };
        }

        private function jumpChamber():void
        {
            this.m_crouch = false;
            this.m_crouchFrame = -1;
            this.m_jumpStartup.reset();
            this.m_shortHop = false;
            this.m_jumpSpeedBuffer = m_xSpeed;
            if (this.inState(CState.TURN))
            {
                if (m_facingForward)
                {
                    this.m_faceLeft();
                }
                else
                {
                    this.m_faceRight();
                };
            };
            var _local_1:Object = this.getControls();
            this.setState(CState.JUMP_CHAMBER);
            this.resetBufferedCStick();
        }

        private function initGroundJump():void
        {
            if (this.inState(CState.ATTACKING))
            {
                this.forceEndAttack();
            };
            if (((Utils.fastAbs(this.m_jumpSpeedBuffer) > Utils.fastAbs(m_xSpeed)) && (!(this.m_jumpSpeedBuffer == 0))))
            {
                m_xSpeed = this.m_jumpSpeedBuffer;
            };
            var _local_1:Boolean;
            this.m_jumpSpeedMidairDelay.reset();
            this.m_fastFallLetGo = false;
            this.m_fastFallLetGoAttack = true;
            m_collision.ground = false;
            var _local_2:int;
            while (((this.testGroundWithCoord(m_sprite.x, (m_sprite.y + 1))) && (_local_2 < 40)))
            {
                _local_2++;
                m_sprite.y--;
            };
            if (_local_2 >= 40)
            {
                m_sprite.y = (m_sprite.y + _local_2);
            };
            m_yKnockback = 0;
            m_ySpeed = ((((this.m_crouch) || (this.m_charIsFull)) || (this.m_shortHop)) ? -(this.m_characterStats.ShortHopSpeed) : -(this.m_characterStats.JumpSpeed));
            if (this.m_sizeStatus != 0)
            {
                m_ySpeed = (m_ySpeed * ((this.m_sizeStatus == 1) ? 1.1 : 0.9));
            };
            m_xSpeed = (m_xSpeed + ((m_currentPlatform) ? m_currentPlatform.x_influence : 0));
            if (Utils.fastAbs(m_xSpeed) > this.m_max_xSpeed)
            {
                m_xSpeed = ((m_xSpeed > 0) ? this.m_max_xSpeed : -(this.m_max_xSpeed));
            };
            this.playCharacterSound("jump");
            this.m_jumpLetGo = (!(this.jumpIsPressed()));
            this.m_tapJumpLetGo = ((this.m_tap_jump) && (!(this.m_up)));
            if (this.jumpIsPressed())
            {
                this.m_jumpFullyReleased = false;
            };
            this.resetRotation();
            Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
            this.attachJumpEffect();
            this.m_jumpEffectTimer.reset();
            this.m_jumpStartup.reset();
            this.setState(CState.JUMP_RISING);
            this.m_doingBackFlip = false;
            if (((Utils.hasLabel(m_sprite.stance, "backflip")) && (((m_facingForward) && (this.m_left)) || ((!(m_facingForward)) && (this.m_right)))))
            {
                this.m_doingBackFlip = true;
                this.stancePlayFrame("backflip");
            }
            else
            {
                if (((HasStance) && (Utils.hasLabel(m_sprite.stance, "jump"))))
                {
                    this.stancePlayFrame("jump");
                };
            };
            _local_1 = currentFrameIs("jump");
            if (_local_1)
            {
            };
            this.m_ledge = null;
            this.m_lastLedge = null;
            this.m_crouchFrame = -1;
            this.m_crouch = false;
            if (((this.m_down) && (this.jumpIsPressed())))
            {
                if ((((((this.m_canHover) && (this.m_characterStats.MidAirHover > 0)) && (!(this.inState(CState.HOVER)))) && (!(this.inState(CState.ATTACKING)))) && (!(this.inState(CState.DISABLED)))))
                {
                    this.initHover();
                    this.m_attemptToMove(0, -3);
                };
            };
        }

        private function initMidairJump():void
        {
            if (this.inState(CState.ATTACKING))
            {
                this.forceEndAttack();
            };
            var _local_1:Boolean;
            this.m_hitLagCanCancel = false;
            this.m_jumpSpeedMidairDelay.reset();
            var _local_2:Number = -(this.m_characterStats.JumpSpeedMidAir);
            if (this.m_jumpSpeedList)
            {
                if (this.m_jumpCount < this.m_jumpSpeedList.length)
                {
                    _local_2 = -(this.m_jumpSpeedList[this.m_jumpCount]);
                }
                else
                {
                    _local_2 = -(this.m_jumpSpeedList[(this.m_jumpSpeedList.length - 1)]);
                };
            };
            if ((!((this.m_midAirJumpConstantDelay.MaxTime > 0) && (this.m_midAirJumpConstantTime.MaxTime > 0))))
            {
                m_ySpeed = _local_2;
            };
            if (this.m_sizeStatus != 0)
            {
                m_ySpeed = (m_ySpeed * ((this.m_sizeStatus == 1) ? 1.1 : 0.9));
            };
            if (((((this.m_right) && (!(this.m_left))) && (m_xSpeed < 0)) || (((this.m_left) && (!(this.m_right))) && (m_xSpeed > 0))))
            {
                m_xSpeed = 0;
            };
            m_yKnockback = 0;
            this.playCharacterSound("jump_midair");
            this.m_jumpCount++;
            this.m_jumpLetGo = (!(this.jumpIsPressed()));
            this.m_tapJumpLetGo = ((this.m_tap_jump) && (!(this.m_up)));
            this.m_jumpFullyReleased = false;
            this.resetRotation();
            Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
            this.m_lastLedge = null;
            this.m_fastFallLetGo = false;
            this.m_fastFallLetGoAttack = true;
            if (this.m_midAirJumpConstantTime.MaxTime > 0)
            {
                this.m_midAirJumpConstantTime.reset();
            };
            if (this.m_midAirJumpConstantDelay.MaxTime > 0)
            {
                this.m_midAirJumpConstantDelay.reset();
            };
            if ((((this.m_characterStats.MidAirTurn) && (this.m_right)) && (!(m_facingForward))))
            {
                this.m_faceRight();
                m_facingForward = true;
            }
            else
            {
                if ((((this.m_characterStats.MidAirTurn) && (this.m_left)) && (m_facingForward)))
                {
                    this.m_faceLeft();
                    m_facingForward = false;
                };
            };
            if ((!(this.m_characterStats.HoldJump)))
            {
                this.attachJumpMidairEffect();
                this.m_jumpEffectTimer.finish();
            };
            _local_1 = currentFrameIs("jump_midair");
            if (_local_1)
            {
                this.restartStance();
            };
            this.setState(CState.JUMP_MIDAIR_RISING);
        }

        private function initHover():void
        {
            this.resetRotation();
            m_ySpeed = 0;
            this.m_midAirHoverTime.reset();
            this.m_midAirHoverTime.MaxTime = this.m_characterStats.MidAirHover;
            this.m_canHover = false;
            this.setState(CState.HOVER);
        }

        private function m_charJump():void
        {
            var _local_1:Boolean;
            if (((this.m_characterStats.HoldJump) || (!(this.jumpIsPressed()))))
            {
                this.m_jumpFullyReleased = true;
            };
            this.m_jumpSpeedMidairDelay.tick();
            if (((m_collision.ground) && (this.jumpIsPressed())))
            {
                this.m_jumpTimer++;
            }
            else
            {
                _local_1 = ((!(this.m_jumpJustLetGo)) && (!(this.m_jumpTimer == 0)));
                this.m_jumpJustLetGo = (!(this.m_jumpTimer == 0));
                if ((!(_local_1)))
                {
                    this.m_jumpTimer = 0;
                };
            };
            if (((this.jumpIsPressed()) && (!(this.m_jumpLetGo))))
            {
                this.m_jumpTimer = 0;
            };
            if (this.inState(CState.JUMP_CHAMBER))
            {
                if ((((!(this.jumpIsPressed())) && (!((this.m_up) && (this.m_tap_jump)))) && (this.m_jumpStartup.CurrentTime <= (this.m_jumpStartup.MaxTime - 1))))
                {
                    this.m_shortHop = true;
                };
                if (((!(this.jumpIsPressed())) && ((this.m_jumpStartup.MaxTime <= 0) || (this.m_jumpStartup.IsComplete))))
                {
                    this.m_jumpJustLetGo = true;
                    this.initGroundJump();
                }
                else
                {
                    this.m_jumpJustLetGo = false;
                };
                if (this.m_cStickLetGo)
                {
                    if (((((!(this.m_c_up)) && (this.m_c_down)) && (!(this.m_c_left))) && (!(this.m_c_right))))
                    {
                        this.m_c_buffered_down = true;
                        this.m_cStickLetGo = false;
                    }
                    else
                    {
                        if (((((!(this.m_c_up)) && (!(this.m_c_down))) && (this.m_c_left)) && (!(this.m_c_right))))
                        {
                            this.m_c_buffered_left = true;
                            this.m_cStickLetGo = false;
                        }
                        else
                        {
                            if (((((!(this.m_c_up)) && (!(this.m_c_down))) && (!(this.m_c_left))) && (this.m_c_right)))
                            {
                                this.m_c_buffered_right = true;
                                this.m_cStickLetGo = false;
                            };
                        };
                    };
                };
            }
            else
            {
                this.resetBufferedCStick();
            };
            if (this.inState(CState.JUMP_CHAMBER))
            {
                if (this.m_jumpStartup.IsComplete)
                {
                    this.initGroundJump();
                }
                else
                {
                    this.m_jumpStartup.tick();
                };
            }
            else
            {
                if (((((((((this.inFreeState(false, false, true, false, false, false, false, false, true, false, true)) && (!(this.inState(CState.DASH_INIT)))) && (!((this.HoldingItem) && (!(this.m_item.CanJumpWith))))) && (this.m_jumpCount < this.m_characterStats.MaxJump)) && ((this.m_jumpSpeedMidairDelay.IsComplete) || (this.m_characterStats.HoldJump))) && (this.jumpIsPressed())) && (this.m_jumpFullyReleased)) && (m_collision.ground)))
                {
                    if (this.m_jumpStartup.MaxTime == 0)
                    {
                        this.initGroundJump();
                    }
                    else
                    {
                        this.jumpChamber();
                    };
                }
                else
                {
                    if ((((((((((((((this.jumpIsPressed()) || ((this.m_up) && (this.m_tap_jump))) && (this.inFreeState())) && (m_ySpeed > 0)) && ((m_ySpeed - m_gravity) <= 0)) && (this.m_canHover)) && (this.m_characterStats.MidAirHover > 0)) && (!(m_collision.ground))) && (!((this.HoldingItem) && (!(this.m_item.CanJumpWith))))) && (!(this.isLandingOrSkiddingOrChambering()))) && (!(this.m_charIsFull))) && (!(this.inState(CState.HOVER)))) && (!(this.inState(CState.DISABLED)))))
                    {
                        this.initHover();
                    }
                    else
                    {
                        if ((((((((((((this.jumpIsPressed()) || ((this.m_up) && (this.m_tap_jump))) && (this.m_down)) && (this.inFreeState())) && (this.m_canHover)) && (this.m_characterStats.MidAirHover > 0)) && (!(m_collision.ground))) && (!((this.HoldingItem) && (!(this.m_item.CanJumpWith))))) && (!(this.isLandingOrSkiddingOrChambering()))) && (!(this.m_charIsFull))) && (!(this.inState(CState.HOVER)))))
                        {
                            this.initHover();
                        }
                        else
                        {
                            if ((((((((((this.jumpIsPressed()) && ((this.m_jumpFullyReleased) || (this.m_tap_jump_btn))) && (!(m_collision.ground))) && (!((this.HoldingItem) && (!(this.m_item.CanJumpWith))))) && (this.m_jumpCount < this.m_characterStats.MaxJump)) && ((this.m_jumpSpeedMidairDelay.IsComplete) || (((this.m_characterStats.HoldJump) && (this.m_jumpCount > 1)) && (getStanceVar("done", true))))) && (this.inFreeState())) && (!(this.isLandingOrSkiddingOrChambering()))) && (!(this.inState(CState.HOVER)))))
                            {
                                this.initMidairJump();
                            }
                            else
                            {
                                if (((((this.inState(CState.LEDGE_HANG)) && (this.jumpIsPressed())) && ((this.m_jumpFullyReleased) || (this.m_tap_jump_btn))) && (this.m_ledgeHangTimer.CurrentTime > 15)))
                                {
                                    this.m_shieldLetGo = false;
                                    this.m_dodgeLetGo = false;
                                    this.m_shortHop = false;
                                    this.initGroundJump();
                                };
                            };
                        };
                    };
                };
            };
        }

        override public function checkMovingPlatforms(_arg_1:MovingPlatform):void
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            if (((((m_collision.ground) && (!(m_currentPlatform == null))) && (m_currentPlatform == _arg_1)) || (((this.inState(CState.LEDGE_HANG)) && (!(this.m_ledge == null))) && (_arg_1.LedgeList.indexOf(this.m_ledge) >= 0))))
            {
                _local_2 = (_arg_1.X - _arg_1.PreviousX);
                _local_3 = (_arg_1.Y - _arg_1.PreviousY);
                if (((this.inState(CState.LEDGE_HANG)) && (Utils.fastAbs(_local_3) > 400)))
                {
                    this.unnattachFromLedge();
                    this.setState(CState.IDLE);
                    this.m_ledge = null;
                    this.m_lastLedge = null;
                    return;
                };
                if ((!(this.testGroundWithCoord((m_sprite.x + _local_2), (m_sprite.y + _local_3)))))
                {
                    m_sprite.y = (m_sprite.y + _local_3);
                    m_sprite.x = (m_sprite.x + _local_2);
                }
                else
                {
                    this.m_attemptToMove(0, _local_3);
                    this.m_attemptToMove(_local_2, 0);
                };
                if ((!(this.inState(CState.LEDGE_HANG))))
                {
                    this.m_fsGlowHolderMC.x = m_sprite.x;
                    this.m_fsGlowHolderMC.y = m_sprite.y;
                }
                else
                {
                    _local_4 = Point.distance(new Point(this.m_ledge.x, this.m_ledge.y), new Point(m_sprite.x, m_sprite.y));
                    if (_local_4 > 500)
                    {
                        this.unnattachFromLedge();
                        this.setState(CState.IDLE);
                        this.m_ledge = null;
                        this.m_lastLedge = null;
                        return;
                    };
                    m_sprite.x = this.m_ledge.x;
                    m_sprite.y = this.m_ledge.y;
                };
            };
        }

        private function initGrab(_arg_1:Boolean=false):void
        {
            var _local_2:uint;
            if (((this.inState(CState.DASH)) && (!(m_xSpeed == 0))))
            {
                m_xSpeed = ((m_xSpeed > 0) ? this.m_max_xSpeed : -(this.m_max_xSpeed));
            };
            if (this.inState(CState.ATTACKING))
            {
                this.forceEndAttack();
            };
            m_attack.Frame = "grab";
            _local_2 = m_state;
            this.setState(CState.GRABBING);
            if (_local_2 == CState.SHIELDING)
            {
                this.m_deactivateShield();
                this.resetAttackLetGo();
            };
            if (((this.m_characterStats.TetherGrab) && (!(m_collision.ground))))
            {
                this.m_tetherCount++;
                this.stancePlayFrame("tether");
            }
            else
            {
                if ((((_local_2 == CState.DASH) || (_local_2 == CState.RUN)) && (Utils.hasLabel(m_sprite.stance, "dash_grab"))))
                {
                    this.stancePlayFrame("dash_grab");
                };
            };
            this.m_grabDelay = 0;
            this.resetSpeedLevel();
            this.m_grabKeyReleased = false;
            this.m_grabLetGo = false;
            this.m_crouch = false;
            this.m_crouchFrame = -1;
            this.m_grabbed = new Vector.<Character>();
            m_attack.importAttackStateData({"isAirAttack":((this.m_characterStats.TetherGrab) && (!(m_collision.ground)))});
            if ((!(_arg_1)))
            {
                if (_local_2 == CState.TURN)
                {
                    flip();
                }
                else
                {
                    if (((((_local_2 == CState.DASH) || (_local_2 == CState.RUN)) || (_local_2 == CState.IDLE)) || (_local_2 == CState.WALK)))
                    {
                        if (this.m_right)
                        {
                            this.m_faceRight();
                        }
                        else
                        {
                            if (this.m_left)
                            {
                                this.m_faceLeft();
                            };
                        };
                    };
                };
            };
        }

        private function removeUngrabbedCharacters():void
        {
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < this.m_grabbed.length)
            {
                if (this.m_grabbed[_local_1].State != CState.CAUGHT)
                {
                    this.m_grabbed.splice(_local_1, 1);
                    _local_1--;
                };
                _local_1++;
            };
        }

        public function grabReleaseOpponent():void
        {
            var _local_1:AttackDamage;
            var _local_2:int;
            var _local_3:Character;
            if (this.m_grabbed.length > 0)
            {
                _local_1 = new AttackDamage(m_player_id, this);
                _local_1.AttackID = Utils.getUID();
                _local_1.IsForward = m_facingForward;
                _local_1.Damage = 0;
                _local_1.Direction = 60;
                _local_1.XLoc = m_sprite.x;
                _local_1.YLoc = m_sprite.y;
                _local_1.Power = 14;
                _local_1.WeightKB = 40;
                _local_1.KBConstant = 60;
                _local_1.DisableHurtSound = true;
                _local_1.ReversableAngle = false;
                _local_2 = 0;
                while (_local_2 < this.m_grabbed.length)
                {
                    _local_3 = this.m_grabbed[_local_2];
                    _local_3.setState(CState.IDLE);
                    _local_3.takeDamage(_local_1);
                    _local_3.setVisibility(true);
                    _local_2++;
                };
                this.releaseOpponent();
            };
        }

        public function grabRelease():void
        {
            var _local_1:AttackDamage;
            _local_1 = new AttackDamage(-1, this);
            _local_1.AttackID = Utils.getUID();
            _local_1.Damage = 0;
            _local_1.Direction = 180;
            _local_1.IsForward = m_facingForward;
            _local_1.XLoc = ((_local_1.IsForward) ? (m_sprite.x + 5) : (m_sprite.x - 5));
            _local_1.YLoc = m_sprite.y;
            _local_1.Power = 7;
            _local_1.WeightKB = 40;
            _local_1.KBConstant = 60;
            _local_1.DisableHurtFallOff = true;
            _local_1.DisableLastHitUpdate = true;
            _local_1.DisableHurtSound = true;
            _local_1.ReversableAngle = false;
            this.setState(CState.IDLE);
            this.takeDamage(_local_1);
        }

        private function m_charGrab():void
        {
            var _local_1:int;
            var _local_2:Character;
            var _local_3:int;
            var _local_4:String;
            var _local_5:String;
            _local_1 = 0;
            if ((((!(this.m_grab)) && (!(this.inState(CState.GRABBING)))) && (this.m_grabbed.length == 0)))
            {
                this.m_grabKeyReleased = true;
            };
            if (((!(this.inState(CState.GRABBING))) && (this.m_grabDelay > 0)))
            {
                this.m_grabDelay--;
            };
            if (((((!(this.m_up)) && (!(this.m_down))) && (!(this.m_left))) && (!(this.m_right))))
            {
                this.m_struggleDirectionLetGo = true;
            };
            if ((!(this.m_a)))
            {
                this.m_struggleALetGo = true;
            };
            if ((!(this.m_b)))
            {
                this.m_struggleBLetGo = true;
            };
            if (((((((((((((((this.inState(CState.SHIELDING)) && (((this.m_a) && (this.m_attackLetGoA)) || ((this.m_grab) && (this.m_grabKeyReleased)))) && (this.m_shieldDelayTimer.IsComplete)) || ((((this.inState(CState.AIR_DODGE)) && (this.m_a)) && (this.m_characterStats.TetherGrab)) && (this.shieldIsPressed()))) || (((!(this.inState(CState.SHIELDING))) && (this.m_grab)) && (this.m_grabKeyReleased))) && (this.inFreeState(true, true, false, true, false, false, true, false, true, true))) && ((!(this.inState(CState.ATTACKING))) || (((this.inState(CState.ATTACKING)) && (!(m_attack.IsThrow))) && (m_attack.AllowFullInterrupt)))) && (!((!(m_collision.ground)) && (!(this.m_characterStats.TetherGrab))))) && ((!((this.inState(CState.GRABBING)) && (this.inState(CState.IDLE)))) || ((this.m_characterStats.TetherGrab) && (((this.inState(CState.JUMP_RISING)) || (this.inState(CState.JUMP_MIDAIR_RISING))) || (this.inState(CState.JUMP_FALLING)))))) && (!(this.HoldingItem))) && (this.m_characterStats.CanThrow)) && (this.m_grabDelay <= 0)) && (!(this.inState(CState.DODGE_ROLL)))) && (!(this.inState(CState.SIDESTEP_DODGE)))))
            {
                if (((this.m_characterStats.TetherGrab) && (!(m_collision.ground))))
                {
                    this.initGrab(true);
                }
                else
                {
                    if ((!(this.inState(CState.AIR_DODGE))))
                    {
                        this.initGrab();
                    };
                };
            }
            else
            {
                if (((((((((((((this.shieldIsPressed()) && (this.m_a)) && (this.m_attackLetGoA)) && (!(this.m_up))) && (!(this.m_right))) && (!(this.m_left))) && (!(this.m_down))) && (!((this.inState(CState.SHIELDING)) && (!(this.m_shieldDelayTimer.IsComplete))))) && (this.inFreeState(false, false, false, true, false, false, true, false, false, true))) && (!(this.isLandingOrSkiddingOrChambering()))) && (this.HoldingItem)) && (this.m_characterStats.CanThrow)))
                {
                    if (this.inState(CState.SHIELDING))
                    {
                        this.m_deactivateShield();
                    };
                    this.grabKeyItemToss();
                }
                else
                {
                    if (this.inState(CState.GRABBING))
                    {
                        this.m_calcGroundAngle();
                        if ((((this.m_grabbed.length == 0) && (m_collision.ground)) && (!(m_attack.IsAirAttack))))
                        {
                            _local_1 = 0;
                            while (((_local_1 < this.m_opponents.length) && (this.m_grabbed.length == 0)))
                            {
                                _local_2 = STAGEDATA.getPlayer(this.m_opponents[_local_1]);
                                InteractiveSprite.hitTest(this, _local_2, HitBoxSprite.GRAB, HitBoxSprite.HIT, this.reactionGrab);
                                _local_1++;
                            };
                        }
                        else
                        {
                            if (this.m_grabbed.length > 0)
                            {
                                if ((((this.inState(CState.GRABBING)) && (currentFrameIs("grab"))) && (this.currentStanceFrameIs("attack"))))
                                {
                                    this.removeUngrabbedCharacters();
                                    this.repositionGrabbedCharacter();
                                };
                                this.m_grabTimer--;
                                this.removeUngrabbedCharacters();
                                _local_1 = 0;
                                while (_local_1 < this.m_grabbed.length)
                                {
                                    if (this.m_grabbed[_local_1].State != CState.CAUGHT)
                                    {
                                        this.m_grabbed.splice(_local_1, 1);
                                        _local_1--;
                                    }
                                    else
                                    {
                                        _local_3 = this.m_grabbed[_local_1].Struggle();
                                        this.m_grabTimer = (this.m_grabTimer - ((_local_3 > 0) ? _local_3 : 0));
                                    };
                                    _local_1++;
                                };
                                if (this.m_grabbed.length == 0)
                                {
                                    this.setState(CState.IDLE);
                                    return;
                                };
                                if (getStanceVar("xframe", "attack"))
                                {
                                    m_attack.ExecTime++;
                                    m_attack.RefreshRateTimer++;
                                };
                                if (getStanceVar("xframe", "attack"))
                                {
                                    this.m_pummelTimer--;
                                }
                                else
                                {
                                    this.m_justPummeled = false;
                                };
                                if (((HasTouchBox) && (this.m_grabbed.length > 0)))
                                {
                                    this.repositionGrabbedCharacter();
                                };
                                if ((((this.m_grabTimer <= 0) && (this.inState(CState.GRABBING))) && (this.m_grabbed.length > 0)))
                                {
                                    this.grabReleaseOpponent();
                                    this.grabRelease();
                                };
                                if ((((this.inState(CState.GRABBING)) && (this.m_grabbed.length > 0)) && (!(this.currentStanceFrameIs("attack")))))
                                {
                                    if (this.m_grabLetGo)
                                    {
                                        if ((((this.m_right) && (!(this.m_left))) || ((this.m_c_right) && (!(this.m_c_left)))))
                                        {
                                            this.resetRotation();
                                            _local_4 = "throw_forward";
                                            if ((!(m_facingForward)))
                                            {
                                                _local_4 = "throw_back";
                                            };
                                            this.Attack(_local_4, 1);
                                        }
                                        else
                                        {
                                            if ((((this.m_left) && (!(this.m_right))) || ((this.m_c_left) && (!(this.m_c_right)))))
                                            {
                                                this.resetRotation();
                                                _local_5 = "throw_forward";
                                                if (m_facingForward)
                                                {
                                                    _local_5 = "throw_back";
                                                };
                                                this.Attack(_local_5, 1);
                                            }
                                            else
                                            {
                                                if (((this.m_down) || (this.m_c_down)))
                                                {
                                                    this.resetRotation();
                                                    this.Attack("throw_down", 1);
                                                }
                                                else
                                                {
                                                    if (((this.m_up) || (this.m_c_up)))
                                                    {
                                                        this.resetRotation();
                                                        this.Attack("throw_up", 1);
                                                    }
                                                    else
                                                    {
                                                        if ((((((this.m_a) && (this.m_attackLetGoA)) || ((this.m_grab) && (this.m_grabLetGo))) && (getStanceVar("xframe", "grab"))) && (this.m_grabLetGo)))
                                                        {
                                                            this.resetRotation();
                                                            m_attack.AttackID = Utils.getUID();
                                                            this.stancePlayFrame("attack");
                                                            m_attack.ExecTime = 0;
                                                            this.m_justPummeled = true;
                                                            this.m_attackLetGoA = false;
                                                            this.m_grabLetGo = false;
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    }
                                    else
                                    {
                                        if (((!(this.m_grab)) && (!(this.m_a))))
                                        {
                                            this.m_grabLetGo = true;
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        private function repositionGrabbedCharacter(_arg_1:int=0):void
        {
            var _local_2:Point;
            var _local_3:Rectangle;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Number;
            if ((((HasTouchBox) && (this.m_grabbed.length > 0)) && (_arg_1 < this.m_grabbed.length)))
            {
                _local_2 = new Point((HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.TOUCH)[0]).centerx * m_sprite.scaleX), (HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.TOUCH)[0]).centery * m_sprite.scaleY));
                _local_3 = new Rectangle(_local_2.x, _local_2.y, 1, 1);
                _local_3 = Utils.rotateRectangleAroundOrigin(_local_3, (360 - m_sprite.rotation));
                _local_2.x = (m_sprite.x + _local_3.x);
                _local_2.y = (m_sprite.y + _local_3.y);
                _local_4 = (_local_2.x - m_sprite.x);
                _local_5 = (_local_2.y - m_sprite.y);
                _local_6 = 0;
                if (checkLinearPathBetweenPoints(this.m_grabbed[_arg_1].Location, new Point(_local_2.x, _local_2.y)))
                {
                    this.m_grabbed[_arg_1].X = _local_2.x;
                    this.m_grabbed[_arg_1].Y = _local_2.y;
                }
                else
                {
                    this.m_grabbed[_arg_1].X = m_sprite.x;
                    this.m_grabbed[_arg_1].Y = m_sprite.y;
                    if (((_local_5 < 0) && (this.m_grabbed[_arg_1].Ground)))
                    {
                        this.m_grabbed[_arg_1].unnattachFromGround();
                    };
                    this.m_grabbed[_arg_1].moveSprite(_local_4, 0);
                    this.m_grabbed[_arg_1].moveSprite(0, _local_5);
                };
            };
        }

        private function m_charCrouch():void
        {
            var _local_1:Boolean;
            _local_1 = this.checkDoubleTap(1);
            if ((((this.inState(CState.LEDGE_HANG)) && (this.m_down)) && (this.m_ledgeHangTimer.CurrentTime > 4)))
            {
                m_ySpeed = 0;
                this.unnattachFromLedge();
                this.resetRotation();
                this.m_fallTiltTimer.reset();
                this.setState(CState.IDLE);
                this.setState(CState.JUMP_FALLING);
            }
            else
            {
                if ((((((this.m_down) && (this.inFreeState())) && (m_collision.ground)) && (!(this.isLandingOrSkiddingOrChambering()))) && (!((this.inState(CState.DASH)) && (m_framesSinceLastState < 4)))))
                {
                    if (this.inState(CState.DASH))
                    {
                        m_xSpeed = ((m_xSpeed > 0) ? Math.min(this.m_max_xSpeed, m_xSpeed) : ((m_xSpeed < 0) ? Math.max(m_xSpeed, -(this.m_max_xSpeed)) : 0));
                    };
                    this.setState(CState.CROUCH);
                }
                else
                {
                    if ((!(this.inState(CState.ATTACKING))))
                    {
                        this.m_crouchFrame = -1;
                    };
                };
            };
            if ((((((((this.inFreeState()) && (m_collision.ground)) && ((_local_1) || ((this.m_down) && (this.m_dash_btn)))) && (!(m_currentPlatform == null))) && (!(m_currentPlatform.noDropThrough == true))) && (!(this.isLandingOrSkiddingOrChambering()))) && (!((this.inState(CState.ATTACKING)) && (m_attack.Rocket)))))
            {
                this.m_fallthrough = true;
                this.m_crouch = false;
                this.m_crouchFrame = -1;
            };
            if (((this.m_fallthrough) && (OnPlatform)))
            {
                m_collision.ground = false;
                this.m_fallthroughPlatform = m_currentPlatform;
                m_currentPlatform = null;
                this.m_fallthroughTimer.reset();
                m_ySpeed = (m_max_ySpeed / 3);
                while (this.testGroundWithCoord(m_sprite.x, (m_sprite.y + 1)))
                {
                    m_sprite.y = (m_sprite.y + 2);
                };
                if (((this.inState(CState.DASH)) && (!(m_xSpeed == 0))))
                {
                    m_xSpeed = ((m_xSpeed > 0) ? this.m_max_xSpeed : -(this.m_max_xSpeed));
                };
            };
            if (this.inState(CState.CROUCH))
            {
                this.m_crouchLength++;
                if (((((((this.m_a) && (this.m_down)) && (!((this.HoldingItem) && (this.m_item.Ability == "toss")))) && (this.m_attackLetGoA)) && (this.m_attackDelay <= 0)) && (!(this.inState(CState.JUMP_CHAMBER)))))
                {
                    this.m_crouchFrame = m_sprite.stance.currentFrame;
                    this.Attack("crouch_attack", 1);
                }
                else
                {
                    if ((!(this.m_down)))
                    {
                        this.setState(CState.IDLE);
                    };
                };
            }
            else
            {
                if ((!((this.inState(CState.ATTACKING)) && (m_attack.Frame == "crouch_attack"))))
                {
                    this.m_crouchLength = 0;
                };
            };
        }

        private function initShield():void
        {
            this.grabReleaseOpponent();
            if (this.m_shieldPower < 25)
            {
                this.m_shieldPower = 25;
            };
            this.m_shieldTimer = 0;
            this.m_shieldLetGo = false;
            this.m_shieldDelay = 0;
            this.m_resizeShield();
            STAGEDATA.playSpecificSound("shield_brawl");
            this.m_shieldStartTimer = 0;
            if (((this.inState(CState.DASH)) && (!(m_xSpeed == 0))))
            {
                m_xSpeed = ((m_xSpeed > 0) ? this.m_max_xSpeed : -(this.m_max_xSpeed));
            };
            this.setState(CState.SHIELDING);
        }

        private function initDodgeRoll(_arg_1:Boolean=true):void
        {
            var _local_2:Boolean;
            if (this.inState(CState.ATTACKING))
            {
                this.forceEndAttack();
            };
            this.m_deactivateShield();
            STAGEDATA.playSpecificSound("roll_brawl");
            _local_2 = m_facingForward;
            if (_arg_1)
            {
                this.m_faceLeft();
            }
            else
            {
                this.m_faceRight();
            };
            this.m_rollTimer = 1;
            this.setState(CState.DODGE_ROLL);
            if ((((_local_2) && (this.m_right)) || ((!(_local_2)) && (this.m_left))))
            {
                if (Utils.hasLabel(m_sprite.stance, "forward"))
                {
                    this.stancePlayFrame("forward");
                };
            };
            this.m_dodgeLetGo = false;
            this.killAllSpeeds();
        }

        private function initSideStepDodge():void
        {
            if (this.inState(CState.ATTACKING))
            {
                this.forceEndAttack();
            };
            this.m_sideStepLetGo = false;
            this.m_deactivateShield();
            this.m_shieldLetGo = false;
            this.m_dodgeTimer = 0;
            STAGEDATA.playSpecificSound("brawl_dodge");
            this.setState(CState.SIDESTEP_DODGE);
            this.setIntangibility(true);
        }

        private function initAirDodge():void
        {
            var _local_1:Number;
            if (this.inState(CState.ATTACKING))
            {
                this.forceEndAttack();
            };
            this.m_shieldLetGo = false;
            STAGEDATA.playSpecificSound("brawl_dodge");
            this.m_midAirJumpConstantTime.CurrentTime = this.m_midAirJumpConstantTime.MaxTime;
            this.setState(CState.AIR_DODGE);
            if (STAGEDATA.MeleeAirDodge)
            {
                m_xSpeed = 0;
                m_ySpeed = 0;
                _local_1 = Utils.getControlsAngle(this.getControls());
                if (_local_1 >= 0)
                {
                    stackKnockback(this.m_characterStats.AirDodgeSpeed, _local_1, m_xKnockback, m_yKnockback);
                };
            };
        }

        private function m_charShield():void
        {
            if (((this.inState(CState.SHIELDING)) && (this.m_shieldTimer == this.m_shieldStartFrame)))
            {
                this.m_activateShield();
            };
            if (((((!(this.m_down)) && (!(this.inState(CState.DODGE_ROLL)))) && (!(this.inState(CState.AIR_DODGE)))) && (!(this.inState(CState.SIDESTEP_DODGE)))))
            {
                this.m_sideStepLetGo = true;
            };
            if (((((((!(this.m_left)) && (!(this.m_right))) && (!(this.inState(CState.DODGE_ROLL)))) && (!(this.inState(CState.AIR_DODGE)))) && (!(this.inState(CState.SIDESTEP_DODGE)))) && (this.m_dodgeTimer > 1)))
            {
                this.m_dodgeLetGo = true;
            };
            if (((((((((((!(m_collision.ground)) && (this.shieldIsPressed())) && (this.m_shieldLetGo)) && (this.inFreeState(true))) && (!((this.HoldingItem) && (!(this.m_item.CanShieldWith))))) && (!(this.isLandingOrSkiddingOrChambering()))) && (this.m_characterStats.CanDodge)) && (this.m_dodgeLetGo)) && (!(this.inState(CState.TUMBLE_FALL)))) && (!((this.inState(CState.ATTACKING)) && (!(m_attack.AllowFullInterrupt))))))
            {
                this.initAirDodge();
            };
            if (((this.inState(CState.SIDESTEP_DODGE)) && (!(m_collision.ground))))
            {
                this.setState(CState.TUMBLE_FALL);
            };
            if (((((this.inState(CState.DODGE_ROLL)) || (this.inState(CState.AIR_DODGE))) || (this.inState(CState.SIDESTEP_DODGE))) && (!(isHitStunOrParalysis()))))
            {
                if ((!(this.shieldIsPressed())))
                {
                    this.m_shieldLetGo = true;
                };
            }
            else
            {
                if (((!(this.inState(CState.SHIELDING))) && (!(isHitStunOrParalysis()))))
                {
                    if ((!(this.shieldIsPressed())))
                    {
                        this.m_shieldLetGo = true;
                    };
                    this.m_dodgeTimer = (this.m_dodgeTimer + (1 / 15));
                };
            };
            if ((((((((this.shieldIsPressed()) && (m_collision.ground)) && (this.inFreeState(false))) && (!((this.HoldingItem) && (!(this.m_item.CanShieldWith))))) && (!(this.isLandingOrSkiddingOrChambering()))) && (!(this.inState(CState.TUMBLE_FALL)))) && (this.m_characterStats.CanShield)))
            {
                this.initShield();
            }
            else
            {
                if (((((((!(this.shieldIsPressed())) && (this.inState(CState.SHIELDING))) && (this.m_shieldLetGo)) && (!(isHitStunOrParalysis()))) && (this.m_shieldDelayTimer.IsComplete)) && (this.m_shieldTimer > this.m_shieldStartFrame)))
                {
                    this.m_deactivateShield();
                    this.m_shieldDropLag.reset();
                    this.setState(CState.SHIELD_DROP);
                    this.stancePlayFrame("shielddrop");
                };
            };
            if (((((this.inState(CState.SHIELDING)) || (this.inState(CState.DODGE_ROLL))) || (this.inState(CState.AIR_DODGE))) || (this.inState(CState.SIDESTEP_DODGE))))
            {
                this.m_shieldDelay++;
                if ((!(this.shieldIsPressed())))
                {
                    this.m_shieldLetGo = true;
                };
            };
            if (((this.inState(CState.SHIELDING)) && (this.m_shieldTimer >= this.m_shieldStartFrame)))
            {
                if ((((((((((this.m_left) && (!(this.m_right))) && (this.m_dodgeTimer >= 5)) && (this.m_characterStats.CanDodge)) && (this.m_dodgeLetGo)) && (!(this.m_grab))) && (this.m_shieldDelayTimer.IsComplete)) && (!(isHitStunOrParalysis()))) && (m_collision.ground)))
                {
                    this.initDodgeRoll(false);
                }
                else
                {
                    if (((((((((((((this.m_right) && (!(this.m_left))) && (this.m_dodgeTimer >= 5)) && (!(this.inState(CState.DODGE_ROLL)))) && (!(this.inState(CState.AIR_DODGE)))) && (!(this.inState(CState.SIDESTEP_DODGE)))) && (this.m_characterStats.CanDodge)) && (this.m_dodgeLetGo)) && (!(this.m_grab))) && (this.m_shieldDelayTimer.IsComplete)) && (!(isHitStunOrParalysis()))) && (m_collision.ground)))
                    {
                        this.initDodgeRoll(true);
                    }
                    else
                    {
                        if (((((((((this.m_down) && (this.m_dodgeTimer >= 5)) && (this.m_characterStats.CanDodge)) && (this.m_sideStepLetGo)) && (!(this.m_grab))) && (this.m_shieldDelayTimer.IsComplete)) && (!(isHitStunOrParalysis()))) && (m_collision.ground)))
                        {
                            this.initSideStepDodge();
                        }
                        else
                        {
                            if (((((((((!((this.HoldingItem) && (!(this.m_item.CanJumpWith)))) && (this.m_jumpCount < this.m_characterStats.MaxJump)) && ((this.m_jumpSpeedMidairDelay.IsComplete) || ((this.m_characterStats.HoldJump) && (getStanceVar("done", true))))) && (this.jumpIsPressed())) && (this.m_jumpFullyReleased)) && (m_collision.ground)) && (this.m_shieldTimer >= (this.m_shieldStartFrame + 1))) && (this.m_shieldDelayTimer.IsComplete)))
                            {
                                this.m_deactivateShield();
                                this.jumpChamber();
                            };
                        };
                    };
                };
            };
            if (this.inState(CState.SHIELD_DROP))
            {
                this.m_shieldDropLag.tick();
                if (this.m_shieldDropLag.IsComplete)
                {
                    this.setState(CState.IDLE);
                };
            };
        }

        private function m_activateShield():void
        {
            if ((!(this.m_characterStats.CustomShield)))
            {
                this.m_shieldHolderMC.scaleX = (m_sizeRatio * this.m_characterStats.ShieldScale);
                this.m_shieldHolderMC.scaleY = (m_sizeRatio * this.m_characterStats.ShieldScale);
                this.m_shieldHolderMC.x = ((m_facingForward) ? (m_sprite.x + (this.m_characterStats.ShieldXOffset * m_sizeRatio)) : (m_sprite.x - (this.m_characterStats.ShieldXOffset * m_sizeRatio)));
                this.m_shieldHolderMC.y = ((m_sprite.y - ((m_height / 3) * m_sizeRatio)) + (this.m_characterStats.ShieldYOffset * m_sizeRatio));
                this.m_shield_originalWidth = this.m_shieldHolderMC.width;
                this.m_shield_originalHeight = this.m_shieldHolderMC.height;
                this.m_resizeShield();
                STAGE.addChild(this.m_shieldHolderMC);
            };
        }

        private function m_deactivateShield():void
        {
            if (this.m_shieldHolderMC.parent)
            {
                this.m_shieldHolderMC.parent.removeChild(this.m_shieldHolderMC);
            };
        }

        private function m_resizeShield():void
        {
            var _local_1:int;
            if ((!(this.m_characterStats.CustomShield)))
            {
                this.m_shieldHolderMC.width = (this.m_shield_originalWidth * ((this.m_shieldPower / 100) + 0.4));
                this.m_shieldHolderMC.height = (this.m_shield_originalHeight * ((this.m_shieldPower / 100) + 0.4));
                this.m_shieldHolderMC.x = ((m_facingForward) ? (m_sprite.x + (this.m_characterStats.ShieldXOffset * m_sizeRatio)) : (m_sprite.x - (this.m_characterStats.ShieldXOffset * m_sizeRatio)));
                this.m_shieldHolderMC.y = ((m_sprite.y - ((m_height / 3) * m_sizeRatio)) + (this.m_characterStats.ShieldYOffset * m_sizeRatio));
            }
            else
            {
                if (this.m_characterStats.CustomShield)
                {
                    if (((currentFrameIs("defend")) && (HasStance)))
                    {
                        _local_1 = m_sprite.stance.totalFrames;
                        if (("startup" in m_sprite.stance))
                        {
                            if (!m_sprite.stance.startup)
                            {
                                Utils.tryToGotoAndStop(m_sprite.stance, ((this.m_characterStats.CustomShieldStartup + 1) + Math.ceil(((1 - (this.m_shieldPower / 100)) * (_local_1 - this.m_characterStats.CustomShieldStartup)))));
                            };
                        }
                        else
                        {
                            Utils.tryToGotoAndStop(m_sprite.stance, Math.ceil(((1 - (this.m_shieldPower / 100)) * _local_1)));
                        };
                    };
                };
            };
        }

        private function m_breakShield():void
        {
            var _local_1:AttackDamage;
            this.m_deactivateShield();
            this.setState(CState.IDLE);
            _local_1 = new AttackDamage(m_player_id, this);
            _local_1.importAttackDamageData({
                "power":this.m_characterStats.ShieldBreakPower,
                "kbConstant":this.m_characterStats.ShieldBreakKBConstant,
                "weightKB":this.m_characterStats.ShieldBreakWeightKB,
                "atk_id":-1,
                "isForward":m_facingForward,
                "direction":90,
                "dizzy":90,
                "xloc":m_sprite.x,
                "yloc":m_sprite.y,
                "hurtSelf":true
            });
            this.killAllSpeeds();
            this.m_shieldPower = 60;
            this.m_shieldLetGo = true;
            this.takeDamage(_local_1);
            this.playGlobalSound("shieldbreak");
            this.m_dizzyShield = true;
            this.setInvincibility(true);
            this.m_revivalInvincibility.reset();
            this.m_revivalInvincibility.CurrentTime = (this.m_revivalInvincibility.MaxTime - 15);
        }

        private function removeChargeGlow():void
        {
            var _local_1:Boolean;
            var _local_2:*;
            if (this.m_chargeGlowHolderMC == null)
            {
                return;
            };
            _local_1 = false;
            for (_local_2 in m_attack.ChargedAttacks)
            {
                if (((!(_local_1)) && (this.attackIsCharged(_local_2))))
                {
                    _local_1 = true;
                };
            };
            if ((!(_local_1)))
            {
                this.toggleEffect(this.m_chargeGlowHolderMC, false);
                this.m_chargeGlowHolderMC = null;
            };
        }

        override public function isInvincible():Boolean
        {
            return (((((((this.inState(CState.ATTACKING)) && (getStanceVar("canHurt", false))) || (m_invincible)) || ((this.inState(CState.ATTACKING)) && (m_attack.Invincible))) || (!(this.m_revivalInvincibility.IsComplete))) || (!(this.m_starmanInvincibilityTimer.IsComplete))) ? true : false);
        }

        private function initRoll(_arg_1:Boolean):void
        {
            var _local_2:Boolean;
            STAGEDATA.playSpecificSound("roll_brawl");
            _local_2 = m_facingForward;
            if (_arg_1)
            {
                this.m_faceLeft();
            }
            else
            {
                this.m_faceRight();
            };
            this.m_rollTimer = Math.max(1, this.m_characterStats.GetupRollDelay);
            this.setState(CState.ROLL);
            if ((((_local_2) && (this.m_right)) || ((!(_local_2)) && (this.m_left))))
            {
                if (Utils.hasLabel(m_sprite.stance, "forward"))
                {
                    this.stancePlayFrame("forward");
                };
            };
            this.checkRollOff();
        }

        private function initTechRoll(_arg_1:Boolean):void
        {
            var _local_2:Boolean;
            this.killAllSpeeds();
            STAGEDATA.playSpecificSound("roll_brawl");
            _local_2 = m_facingForward;
            if (_arg_1)
            {
                this.m_faceLeft();
            }
            else
            {
                this.m_faceRight();
            };
            this.m_rollTimer = 1;
            this.setState(CState.TECH_ROLL);
            if ((((_local_2) && (this.m_right)) || ((!(_local_2)) && (this.m_left))))
            {
                if (Utils.hasLabel(m_sprite.stance, "forward"))
                {
                    this.stancePlayFrame("forward");
                };
            };
        }

        private function checkRollOff():void
        {
            var _local_1:Number;
            var _local_2:int;
            _local_1 = this.netXSpeed();
            if (((!(_local_1 == 0)) && (willFallOffRange((m_sprite.x + _local_1), m_sprite.y))))
            {
                _local_2 = 50;
                while ((!(this.testGroundWithCoord((m_sprite.x + _local_1), (m_sprite.y + 1)))))
                {
                    if (this.netXSpeed() > 0)
                    {
                        _local_1--;
                        if (_local_1 < 0)
                        {
                            _local_1 = 0;
                        };
                    }
                    else
                    {
                        _local_1++;
                        if (_local_1 > 0)
                        {
                            _local_1 = 0;
                        };
                    };
                    if (_local_1 == 0) break;
                    if (_local_2-- <= 0)
                    {
                        _local_1 = 0;
                        break;
                    };
                };
                moveSprite(_local_1, 0);
                this.killAllSpeeds();
            };
        }

        private function m_charRoll():void
        {
            var _local_1:Number;
			var tmpDiff:Number;
            if ((((this.inState(CState.LEDGE_HANG)) && (this.shieldIsPressed())) && (this.m_ledgeHangTimer.CurrentTime > 15)))
            {
                this.m_ledgeHangTimer.reset();
                this.m_rollTimer = Math.max(1, this.m_characterStats.RollDelay);
                m_sprite.x = (m_sprite.x + ((m_facingForward) ? 4 : -4));
                m_sprite.y = (m_sprite.y + 5);
                _local_1 = 0;
                while (((!(testTerrainWithCoord(m_sprite.x, m_sprite.y))) && (_local_1 < 10)))
                {
                    m_sprite.x = (m_sprite.x + ((m_facingForward) ? 1 : -1));
                    _local_1++;
                };
                if (_local_1 >= 10)
                {
                    m_sprite.x = (m_sprite.x - ((m_facingForward) ? _local_1 : -(_local_1)));
                };
                attachToGround();
                this.setState(CState.LEDGE_ROLL);
            }
            else
            {
                if ((((this.inState(CState.LEDGE_HANG)) && (((m_facingForward) && (this.m_right)) || ((!(m_facingForward)) && (this.m_left)))) && (this.m_ledgeHangTimer.CurrentTime > 15)))
                {
                    this.m_ledgeHangTimer.reset();
                    m_sprite.x = (m_sprite.x + ((m_facingForward) ? 4 : -4));
                    m_sprite.y = (m_sprite.y + 5);
                    _local_1 = 0;
                    while (((!(testTerrainWithCoord(m_sprite.x, m_sprite.y))) && (_local_1 < 10)))
                    {
                        m_sprite.x = (m_sprite.x + ((m_facingForward) ? 2 : -2));
                        _local_1++;
                    };
                    if (_local_1 >= 10)
                    {
                        m_sprite.x = (m_sprite.x - ((m_facingForward) ? _local_1 : -(_local_1)));
                    };
                    m_collision.ground = true;
                    this.m_groundCollisionTest();
                    this.setState(CState.LEDGE_CLIMB);
                }
                else
                {
                    if ((((((m_collision.ground) && (this.inState(CState.CRASH_LAND))) && (!(this.m_right == this.m_left))) && (getStanceVar("ready", true))) && (this.m_getUpTimer <= 100)))
                    {
                        this.initRoll(this.m_right);
                    }
                    else
                    {
                        if ((((this.inState(CState.LEDGE_ROLL)) || (this.inState(CState.ROLL))) && (!(isHitStunOrParalysis()))))
                        {
                            attachToGround();
                            this.m_rollTimer--;
                            if ((!(m_collision.ground)))
                            {
                                this.killAllSpeeds();
                                this.setState(CState.IDLE);
                                return;
                            };
                            if (this.m_rollTimer == 0)
                            {
                                m_xSpeed = ((m_facingForward) ? this.m_characterStats.RollSpeed : -(this.m_characterStats.RollSpeed));
                                this.m_currentRollSpeed = m_xSpeed;
                                if (this.inState(CState.ROLL))
                                {
                                    m_xSpeed = (m_xSpeed * -1);
                                    this.m_currentRollSpeed = m_xSpeed;
                                };
                            }
                            else
                            {
                                if (this.m_rollTimer < 0)
                                {
                                    m_xSpeed = this.m_currentRollSpeed;
                                    if (m_currentPlatform)
                                    {
                                        m_xSpeed = (m_xSpeed * ((m_xSpeed != 0) ? (this.m_characterStats.RollDecay * m_currentPlatform.accel_friction) : 0));
                                    }
                                    else
                                    {
                                        m_xSpeed = (m_xSpeed * ((m_xSpeed != 0) ? this.m_characterStats.RollDecay : 0));
                                    };
                                    this.m_currentRollSpeed = m_xSpeed;
                                    if (((this.inState(CState.ROLL)) && (Utils.fastAbs(this.m_currentRollSpeed) < 0.5)))
                                    {
                                        m_xSpeed = 0;
                                    };
                                };
                            };
                            this.checkRollOff();
                        }
                        else
                        {
                            if (((this.inState(CState.TECH_ROLL)) && (!(isHitStunOrParalysis()))))
                            {
                                attachToGround();
                                this.m_rollTimer--;
                                if ((!(m_collision.ground)))
                                {
                                    this.killAllSpeeds();
                                    this.setState(CState.IDLE);
                                    return;
                                };
                                if (this.m_rollTimer == 0)
                                {
                                    m_xSpeed = ((m_facingForward) ? -(this.m_characterStats.RollSpeed) : this.m_characterStats.RollSpeed);
                                    this.m_currentRollSpeed = m_xSpeed;
                                }
                                else
                                {
                                    m_xSpeed = this.m_currentRollSpeed;
                                    if (m_currentPlatform)
                                    {
                                        m_xSpeed = (m_xSpeed * ((m_xSpeed != 0) ? (this.m_characterStats.RollDecay * m_currentPlatform.accel_friction) : 0));
                                    }
                                    else
                                    {
                                        m_xSpeed = (m_xSpeed * ((m_xSpeed != 0) ? this.m_characterStats.RollDecay : 0));
                                    };
                                    this.m_currentRollSpeed = m_xSpeed;
                                    if (Utils.fastAbs(this.m_currentRollSpeed) < 0.5)
                                    {
                                        m_xSpeed = 0;
                                    };
                                };
                                this.checkRollOff();
                            }
                            else
                            {
                                if (((this.inState(CState.DODGE_ROLL)) && (!(isHitStunOrParalysis()))))
                                {
                                    attachToGround();
                                    this.m_rollTimer--;
                                    if (this.m_rollTimer == 0)
                                    {
                                        m_xSpeed = ((m_facingForward) ? -(this.m_characterStats.DodgeSpeed) : this.m_characterStats.DodgeSpeed);
                                        this.m_currentRollSpeed = m_xSpeed;
                                    }
                                    else
                                    {
                                        if (this.m_characterStats.DodgeDecel > 0)
                                        {
                                            this.m_currentRollSpeed = (this.m_currentRollSpeed * this.m_characterStats.DodgeDecel);
                                        }
                                        else
                                        {
                                            if (this.m_characterStats.DodgeDecel < 0)
                                            {
                                                if (this.m_currentRollSpeed !== 0)
                                                {
                                                    tmpDiff = ((this.m_currentRollSpeed > 0) ? this.m_characterStats.DodgeDecel : -(this.m_characterStats.DodgeDecel));
                                                    this.m_currentRollSpeed = (this.m_currentRollSpeed + tmpDiff);
                                                    if ((((this.m_currentRollSpeed < 0) && ((this.m_currentRollSpeed - tmpDiff) > 0)) || ((this.m_currentRollSpeed > 0) && ((this.m_currentRollSpeed - tmpDiff) < 0))))
                                                    {
                                                        this.m_currentRollSpeed = 0;
                                                    };
                                                };
                                            };
                                        };
                                        m_xSpeed = this.m_currentRollSpeed;
                                        if (Utils.fastAbs(this.m_currentRollSpeed) < 0.5)
                                        {
                                            m_xSpeed = 0;
                                        };
                                        if ((!(m_collision.ground)))
                                        {
                                            this.killAllSpeeds();
                                            this.setState(CState.IDLE);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        private function initLedgeGrab(_arg_1:MovieClip):void
        {
            this.m_jumpSpeedBuffer = 0;
            if (this.inState(CState.ATTACKING))
            {
                this.forceEndAttack();
            };
            m_attack.Rocket = false;
            this.m_ledge = _arg_1;
            this.m_ledgeDelay = 15;
            this.m_glideReady = true;
            this.playGlobalSound("common_cliffcatch");
            this.playCharacterSound("ledge_grab");
            setBrightness(0);
            this.resetRotation();
            Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
            if (this.inState(CState.SHIELDING))
            {
                this.m_deactivateShield();
            };
            this.m_jumpLetGo = false;
            this.m_tapJumpLetGo = false;
            this.m_jumpFullyReleased = false;
            if (STAGEPARENT.getChildByName(("energy" + m_player_id)) != null)
            {
                STAGEPARENT.removeChild(STAGEPARENT.getChildByName(("energy" + m_player_id)));
            };
            m_intangible = true;
            this.m_jumpCount = 0;
            this.m_wallJumpCount = 0;
            this.m_wallStickTime.MaxTime = this.m_characterStats.WallStick;
            this.m_midAirJumpConstantTime.CurrentTime = this.m_midAirJumpConstantTime.MaxTime;
            this.m_canHover = true;
            this.releaseOpponent();
            m_currentPlatform = null;
            m_collision.ground = false;
            this.resetMovement();
            this.setState(CState.LEDGE_HANG);
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_LEDGE_GRAB, {"caller":this}));
        }

        private function attachToLedge(_arg_1:Boolean):void
        {
            var _local_2:Number;
            if (this.m_ledge)
            {
                _local_2 = Point.distance(new Point(this.m_ledge.x, this.m_ledge.y), new Point(m_sprite.x, m_sprite.y));
                if (_local_2 > 500)
                {
                    this.unnattachFromLedge();
                    this.setState(CState.IDLE);
                    this.m_ledge = null;
                    this.m_lastLedge = null;
                    return;
                };
                m_sprite.x = this.m_ledge.x;
                m_sprite.y = this.m_ledge.y;
                if (this.m_chargeGlowHolderMC != null)
                {
                    this.m_chargeGlowHolderMC.x = m_sprite.x;
                    this.m_chargeGlowHolderMC.y = (m_sprite.y + m_height);
                };
                if (this.m_item2)
                {
                    this.m_fsGlowHolderMC.x = m_sprite.x;
                    this.m_fsGlowHolderMC.y = (m_sprite.y + m_height);
                };
                this.m_ledgeHangTimer.reset();
                this.killAllSpeeds();
                if (_arg_1)
                {
                    this.m_faceRight();
                }
                else
                {
                    this.m_faceLeft();
                };
                this.m_midAirJumpConstantTime.CurrentTime = this.m_midAirJumpConstantTime.MaxTime;
            };
        }

        private function m_charHang():void
        {
            var _local_1:int;
            var _local_2:int;
            var _local_4:Boolean;
            _local_1 = 0;
            _local_2 = 0;
            var _local_3:int;
            _local_4 = false;
            if (((((!(this.inState(CState.LEDGE_HANG))) && (!(this.inState(CState.LEDGE_ROLL)))) && (!(this.inState(CState.LEDGE_CLIMB)))) && (this.m_ledgeDelay > 0)))
            {
                this.m_ledgeDelay--;
                if (this.m_ledgeDelay <= 0)
                {
                    this.m_lastLedge = null;
                };
            };
            if ((((((((!(this.m_down)) && (this.m_ledgeDelay <= 0)) && (!(m_collision.ground))) && (!(this.m_standby))) && (!((this.HoldingItem) && (!(this.m_item.CanHangWith))))) && (this.inFreeState(true, false, false, false, false, true))) && (!((!(this.inState(CState.ATTACKING))) && (m_ySpeed < 0)))))
            {
                _local_1 = 0;
                while (((_local_1 < this.m_ledges[0].length) && (!(this.inState(CState.LEDGE_HANG)))))
                {
                    _local_4 = false;
                    _local_2 = 0;
                    while (((_local_2 < this.m_opponents.length) && (!(_local_4))))
                    {
                        if (STAGEDATA.getPlayer(this.m_opponents[_local_2]).Ledge == this.m_ledges[0][_local_1])
                        {
                            _local_4 = true;
                        };
                        _local_2++;
                    };
                    if (((((!(_local_4)) && (!(this.m_lastLedge == this.m_ledges[0][_local_1]))) && (!((this.inState(CState.GRABBING)) && (!(m_facingForward))))) && (!(((this.inState(CState.ATTACKING)) && (!(m_facingForward))) && (m_attack.FacedLedgesOnly)))))
                    {
                        if (((HasHand) && (HitBoxSprite.hitTestArray(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.HAND), HitBoxAnimation(this.m_ledges[0][_local_1].hitBoxAnim).getHitBoxes(1, HitBoxSprite.LEDGE), Location, new Point(this.m_ledges[0][_local_1].x, this.m_ledges[0][_local_1].y), (!(m_facingForward)), false, CurrentScale, new Point(1, 1), CurrentRotation, 0).length > 0)))
                        {
                            this.initLedgeGrab(this.m_ledges[0][_local_1]);
                            _local_1 = (_local_1 - 1);
                        };
                    };
                    _local_1++;
                };
                if (this.inState(CState.LEDGE_HANG))
                {
                    this.attachToLedge(true);
                }
                else
                {
                    _local_1 = 0;
                    while (((_local_1 < this.m_ledges[1].length) && (!(this.inState(CState.LEDGE_HANG)))))
                    {
                        _local_4 = false;
                        _local_2 = 0;
                        while (((_local_2 < this.m_opponents.length) && (!(_local_4))))
                        {
                            if (STAGEDATA.getPlayer(this.m_opponents[_local_2]).Ledge == this.m_ledges[1][_local_1])
                            {
                                _local_4 = true;
                            };
                            _local_2++;
                        };
                        if (((((!(_local_4)) && (!(this.m_lastLedge == this.m_ledges[1][_local_1]))) && (!((this.inState(CState.GRABBING)) && (m_facingForward)))) && (!(((this.inState(CState.ATTACKING)) && (m_facingForward)) && (m_attack.FacedLedgesOnly)))))
                        {
                            if (((HasHand) && (HitBoxSprite.hitTestArray(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.HAND), HitBoxAnimation(this.m_ledges[1][_local_1].hitBoxAnim).getHitBoxes(1, HitBoxSprite.LEDGE), Location, new Point(this.m_ledges[1][_local_1].x, this.m_ledges[1][_local_1].y), (!(m_facingForward)), false, CurrentScale, new Point(1, 1), CurrentRotation, 0).length > 0)))
                            {
                                this.initLedgeGrab(this.m_ledges[1][_local_1]);
                                _local_1 = (_local_1 - 1);
                            };
                        };
                        _local_1++;
                    };
                    if (this.inState(CState.LEDGE_HANG))
                    {
                        this.attachToLedge(false);
                    };
                };
            };
        }

        private function unnattachFromLedge():void
        {
            if (this.m_ledge != null)
            {
                m_sprite.y = (m_sprite.y + ((m_height * 1.25) * m_sizeRatio));
                m_sprite.x = (m_sprite.x + ((m_facingForward) ? (-(m_width) * m_sizeRatio) : (m_width * m_sizeRatio)));
                this.m_lastLedge = this.m_ledge;
                this.m_ledge = null;
                this.m_shieldLetGo = false;
                this.m_dodgeLetGo = false;
            };
        }

        private function m_checkTeching():void
        {
            var _local_1:Boolean;
            if (this.m_canTech)
            {
                if (this.m_techReady)
                {
                    _local_1 = Boolean(this.m_techTimer.IsComplete);
                    this.m_techTimer.tick();
                    if (((this.m_techTimer.IsComplete) && (_local_1)))
                    {
                        this.m_techReady = false;
                    }
                    else
                    {
                        if (((this.m_techLetGo) && (this.shieldIsPressed())))
                        {
                            this.m_techReady = false;
                            this.m_canTech = false;
                            this.m_techDelay.reset();
                            this.m_techLetGo = false;
                        };
                    };
                    if (((this.m_techReady) && (!(this.shieldIsPressed()))))
                    {
                        this.m_techLetGo = true;
                    };
                }
                else
                {
                    if (this.m_techDelay.IsComplete)
                    {
                        if (((this.m_techLetGo) && (this.shieldIsPressed())))
                        {
                            this.m_techLetGo = false;
                            this.m_techReady = true;
                            this.m_techTimer.reset();
                            this.m_techDelay.reset();
                        }
                        else
                        {
                            if ((!(this.shieldIsPressed())))
                            {
                                this.m_techLetGo = true;
                            };
                        };
                    }
                    else
                    {
                        this.m_techDelay.tick();
                    };
                };
            }
            else
            {
                this.m_techDelay.tick();
                if (this.m_techDelay.IsComplete)
                {
                    this.m_canTech = true;
                    this.m_techDelay.reset();
                };
            };
        }

        private function willFallOffForces():Boolean
        {
            return (!((this.inState(CState.SHIELDING)) || ((!(((((((this.inState(CState.ATTACKING)) && (m_collision.ground)) && (!(m_attack.CanFallOff))) || (((this.inState(CState.ROLL)) || (this.inState(CState.TECH_GROUND))) || (this.inState(CState.TECH_ROLL)))) || (this.inState(CState.DODGE_ROLL))) || (((this.inState(CState.FLYING)) || (this.inState(CState.INJURED))) && (this.m_disableHurtFallOff))) && (willFallOffRange((m_sprite.x + this.netXSpeed()), m_sprite.y)))) && (!(((((!(this.inState(CState.ATTACKING))) && (m_collision.ground)) && (!(this.inState(CState.INJURED)))) && (!(this.inState(CState.FLYING)))) && (willFallOffRange((m_sprite.x + this.netXSpeed()), m_sprite.y)))))));
        }

        private function decel_knockback():void
        {
            var _local_1:Boolean;
            var _local_2:Boolean;
            if (((m_xKnockback == 0) && (m_yKnockback == 0)))
            {
                return;
            };
            _local_1 = (m_xKnockback > 0);
            _local_2 = (m_yKnockback < 0);
            if (m_xKnockback != 0)
            {
                m_xKnockback = (m_xKnockback + m_xKnockbackDecay);
            };
            if (m_yKnockback != 0)
            {
                m_yKnockback = (m_yKnockback + m_yKnockbackDecay);
            };
            if (((((_local_1) && (m_xKnockback < 0)) || ((!(_local_1)) && (m_xKnockback > 0))) || (Utils.fastAbs(m_xKnockback) < 0.0001)))
            {
                m_xKnockback = 0;
            };
            if (((((_local_2) && (m_yKnockback > 0)) || ((!(_local_2)) && (m_yKnockback < 0))) || (Utils.fastAbs(m_yKnockback) < 0.0001)))
            {
                m_yKnockback = 0;
            };
        }

        private function m_forces():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:MovieClip;
            if (isNaN(m_xKnockback))
            {
                m_xKnockback = 0;
                if (MenuController.debugConsole)
                {
                    MenuController.debugConsole.alert("X KB NaN Detected!!! Something broke X knockback, please attempt to reproduce, verify, and report the problem.");
                };
            };
            if (isNaN(m_yKnockback))
            {
                m_yKnockback = 0;
                if (MenuController.debugConsole)
                {
                    MenuController.debugConsole.alert("Y KB NaN Detected!!!  Something broke Y knockback, please attempt to reproduce, verify, and report the problem.");
                };
            };
            if (isNaN(m_xSpeed))
            {
                m_xSpeed = 0;
                if (MenuController.debugConsole)
                {
                    MenuController.debugConsole.alert("X SPEED NaN Detected!!!  Something broke X Speed, please attempt to reproduce, verify, and report the problem.");
                };
            };
            if (isNaN(m_ySpeed))
            {
                m_ySpeed = 0;
                if (MenuController.debugConsole)
                {
                    MenuController.debugConsole.alert("Y SPEED NaN Detected!!!  Something broke Y Speed, please attempt to reproduce, verify, and report the problem.");
                };
            };
            if (((((!(this.inState(CState.CAUGHT))) && (!(this.inState(CState.BARREL)))) && (!(isHitStunOrParalysis()))) && (!(this.inState(CState.DEAD)))))
            {
                if ((((this.inKnockback()) && (m_collision.ground)) && (m_yKnockback > 0)))
                {
                    m_yKnockback = 0;
                };
                if (((!((((m_collision.ground) && ((this.inState(CState.FLYING)) || (this.inState(CState.INJURED)))) && (this.m_disableHurtFallOff)) && (willFallOffRange((m_sprite.x + m_xKnockback), m_sprite.y)))) && (!(((this.inState(CState.ATTACKING)) && (!(m_attack.CanFallOff))) && (willFallOffRange((m_sprite.x + m_xKnockback), m_sprite.y))))))
                {
                    this.m_attemptToMove(m_xKnockback, 0);
                };
                this.m_attemptToMove(0, m_yKnockback);
                this.decel_knockback();
                if (Main.FRAMERATE == 30)
                {
                    if (((!((((m_collision.ground) && ((this.inState(CState.FLYING)) || (this.inState(CState.INJURED)))) && (this.m_disableHurtFallOff)) && (willFallOffRange((m_sprite.x + m_xKnockback), m_sprite.y)))) && (!(((this.inState(CState.ATTACKING)) && (!(m_attack.CanFallOff))) && (willFallOffRange((m_sprite.x + m_xKnockback), m_sprite.y))))))
                    {
                        this.m_attemptToMove(m_xKnockback, 0);
                    };
                    this.m_attemptToMove(0, m_yKnockback);
                    this.decel_knockback();
                };
                if (((this.inState(CState.FLYING)) || (this.inState(CState.INJURED))))
                {
                    if (((!(isHitStunOrParalysis())) && (this.inState(CState.INJURED))))
                    {
                        this.m_hitLagLandDelay.tick();
                    };
                    if (((this.netYSpeed(false, false) >= 0) && (!(this.m_hasArced))))
                    {
                        this.m_dustTimer.finish();
                        this.m_hasArced = true;
                    };
                    if ((((this.inState(CState.FLYING)) && (this.m_calcAngles)) && (currentFrameIs("flying"))))
                    {
                        _local_1 = Utils.getAngleBetween(new Point(0, 0), new Point(this.netXSpeed(), this.netYSpeed()));
                        _local_2 = Utils.forceBase360(((!(m_facingForward)) ? -(_local_1) : (-(_local_1) + 180)));
                        m_sprite.rotation = _local_2;
                    };
                    if ((((this.m_hitLag <= 0) && (!(isHitStunOrParalysis()))) && (!(((this.inState(CState.INJURED)) && (!(this.m_hitLagLandDelay.IsComplete))) && (!(this.m_forceTumbleFall))))))
                    {
                        if (((this.m_forceTumbleFall) && (m_collision.ground)))
                        {
                            this.initiateCrash();
                        }
                        else
                        {
                            if (((this.inState(CState.FLYING)) && (!(m_collision.ground))))
                            {
                                this.resetRotation();
                                this.m_fallTiltTimer.reset();
                                this.setState(CState.TUMBLE_FALL);
                            }
                            else
                            {
                                this.setState(CState.IDLE);
                            };
                        };
                        this.resetRotation();
                        this.m_hitLagLandDelay.reset();
                    };
                };
                if (((((this.inState(CState.FLYING)) && (this.inKnockback())) && (this.m_starKOTimer.IsComplete)) && (!(this.m_dustTimer.IsComplete))))
                {
                    _local_3 = this.netXSpeed();
                    _local_4 = this.netYSpeed();
                    this.m_dustTimer.tick();
                    if (Math.sqrt((Math.pow(_local_4, 2) + Math.pow(_local_3, 2))) >= 2)
                    {
                        _local_5 = STAGEDATA.attachEffectOverlay("dust");
                        _local_5.width = (_local_5.width * m_sizeRatio);
                        _local_5.height = (_local_5.height * m_sizeRatio);
                        if (Utils.random() > 0.5)
                        {
                            _local_5.scaleX = (_local_5.scaleX * -1);
                        };
                        _local_5.x = (OverlayX + Utils.randomInteger(-8, 8));
                        _local_5.y = (OverlayY + Utils.randomInteger(-8, 8));
                        _local_5.rotation = Utils.randomInteger(0, 360);
                        _local_5.alpha = 0.5;
                    };
                };
            };
        }

        public function isLandingOrSkiddingOrChambering():Boolean
        {
            return (((((this.isLanding()) || (this.isSkidding())) || (this.isJumpChambering())) || (this.inState(CState.TECH_GROUND))) || (this.inState(CState.TECH_ROLL)));
        }

        public function isLanding():Boolean
        {
            return (this.inState(CState.LAND));
        }

        public function isSkidding():Boolean
        {
            return (this.inState(CState.SKID));
        }

        public function isJumpChambering():Boolean
        {
            return (this.inState(CState.JUMP_CHAMBER));
        }

        public function isStandBy():Boolean
        {
            return (this.m_standby);
        }

        public function releaseLedge():void
        {
            if (this.inState(CState.LEDGE_HANG))
            {
                this.unnattachFromLedge();
                this.setState(CState.IDLE);
            };
            this.m_ledge = null;
            this.m_lastLedge = null;
        }

        public function releaseOpponent(_arg_1:int=-1):void
        {
            var _local_2:int;
            if (this.m_grabbed.length > 0)
            {
                if (_arg_1 >= 0)
                {
                    this.m_grabbed[_arg_1].Uncapture();
                    this.m_grabbed[_arg_1].setVisibility(true);
                    this.m_grabbed.splice(_arg_1, 1);
                    this.m_justReleased = false;
                }
                else
                {
                    _local_2 = 0;
                    while (_local_2 < this.m_grabbed.length)
                    {
                        if (((this.m_grabbed[_local_2].Caught()) && (!(this.m_grabbed[_local_2].StandBy))))
                        {
                            this.m_grabbed[_local_2].Uncapture();
                            this.m_grabbed[_local_2].setVisibility(true);
                        };
                        _local_2++;
                    };
                    this.m_justReleased = false;
                    while (this.m_grabbed.length > 0)
                    {
                        this.m_grabbed.splice(0, 1);
                    };
                };
            };
            if (((this.m_grabbed.length == 0) && (this.inState(CState.GRABBING))))
            {
                this.setState(CState.IDLE);
            };
        }

        public function shootOutOpponent():void
        {
            var _local_1:int;
            var _local_2:Character;
            if (this.m_grabbed.length > 0)
            {
                _local_1 = 0;
                while (_local_1 < this.m_grabbed.length)
                {
                    _local_2 = this.m_grabbed[_local_1];
                    _local_2.setVisibility(true);
                    _local_2.Uncapture();
                    if (this.m_characterStats.LinkageID == "kirby")
                    {
                        _local_2.shootingStar(m_facingForward, m_player_id);
                        _local_2.dealDamage((10 * Math.min(this.totalMoveDecay("kirby_star_spit"), 10)));
                        this.queueMove("kirby_star_spit");
                    };
                    _local_1++;
                };
                this.m_grabbed = new Vector.<Character>();
            };
        }

        public function shootingStar(shootRight:Boolean, otherPlayerID:Number):void
        {
            this.m_starTimer = 6;
            this.playFrame("star");
            this.resetSpeedLevel();
            m_sprite.rotation = 0;
            this.resetAttackLetGo();
            Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
            if ((!(shootRight)))
            {
                this.m_faceRight();
            }
            else
            {
                this.m_faceLeft();
            };
            this.killAllSpeeds();
            m_attack.simpleReset();
            m_attack.importAttackStateData({
                "refreshRate":50,
                "canFallOff":true,
                "isForward":(!(m_facingForward))
            });
            m_attack.IsAirAttack = (!(m_collision.ground));
            m_attack.AttackType = 1;
            m_attack.LetGo = false;
            m_attack.AttackID = Utils.getUID();
            m_attack.Frame = "star";
            this.setIntangibility(true);
            STAGEDATA.getPlayer(otherPlayerID).stackAttackID(m_attack.AttackID);
            this.checkLinkedProjectiles();
            this.setState(CState.KIRBY_STAR);
            this.setVisibility(false);
            this.toggleEffect(this.m_kirbyStarMC, true);
            this.m_kirbyStarMC.x = m_sprite.x;
            this.m_kirbyStarMC.y = m_sprite.y;
            updateAttackBoxStats(1, {
                "team_id":STAGEDATA.getPlayer(otherPlayerID).Team,
                "otherPlayerID":otherPlayerID
            });
            createTimer(1, 6, function ():void
            {
                setXSpeed(((m_facingForward) ? -15 : 15));
            });
            addEventListener(SSF2Event.ATTACK_HIT, function (_arg_1:*):void
            {
                setIntangibility(false);
                endAttack();
                killAllSpeeds(false, false);
                setXSpeed(0);
                unnattachFromGround();
                setYSpeed(-12);
                toggleEffect(m_kirbyStarMC, false);
                setVisibility(true);
                resetRotation();
                m_fallTiltTimer.reset();
                setState(CState.JUMP_FALLING);
            });
        }

        private function m_charFall():void
        {
            var _local_1:Number;
            if (((((m_ySpeed > 0) || (this.inKnockback())) && (!(this.m_fastFallLetGo))) && (!(this.m_down))))
            {
                this.m_fastFallLetGo = true;
            };
            if (((((((((((((((((!(m_collision.ground)) && (!(isHitStunOrParalysis()))) && (!(this.inState(CState.LEDGE_HANG)))) && (!(this.inState(CState.CAUGHT)))) && (!(this.inState(CState.BARREL)))) && (!(this.inState(CState.LEDGE_ROLL)))) && (!(this.inState(CState.ROLL)))) && (!(this.inState(CState.REVIVAL)))) && (!(this.inState(CState.KIRBY_STAR)))) && (!(this.inState(CState.GLIDING)))) && (!((this.inState(CState.ATTACKING)) && (m_attack.Rocket)))) && (this.m_starKOTimer.IsComplete)) && (!(this.inState(CState.WALL_CLING)))) && (!(this.inState(CState.REVIVAL)))) && (!(this.inState(CState.DEAD)))) && (!((STAGEDATA.MeleeAirDodge) && (this.inState(CState.AIR_DODGE))))))
            {
                _local_1 = m_ySpeed;
                if (((!(this.inState(CState.FLYING))) && (!(this.inState(CState.INJURED)))))
                {
                    if (m_ySpeed < m_max_ySpeed)
                    {
                        m_ySpeed = (m_ySpeed + ((((this.inState(CState.HOVER)) || (this.m_attackHovering)) || (!(this.m_midAirJumpConstantTime.IsComplete))) ? 0 : ((!(this.inState(CState.EGG))) ? m_gravity : (m_gravity * 0.75))));
                        if (m_ySpeed >= m_max_ySpeed)
                        {
                            m_ySpeed = m_max_ySpeed;
                        };
                    };
                }
                else
                {
                    if (m_ySpeed < m_max_ySpeed)
                    {
                        m_ySpeed = Math.min((m_ySpeed + m_gravity), m_max_ySpeed);
                    };
                };
                if ((((((((((((((((((this.m_down) && (this.m_fastFallLetGo)) && (m_ySpeed < this.m_characterStats.FastFallSpeed)) && ((m_ySpeed > 0) || (!(this.netYSpeed(true, false) == 0)))) && (!((this.inState(CState.ATTACKING)) && (!(m_attack.AllowFastFall))))) && (!(this.inState(CState.HOVER)))) && (!(this.m_attackHovering))) && (this.m_midAirJumpConstantTime.IsComplete)) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.PITFALL)))) && (!(this.inState(CState.WALL_CLING)))) && (!(this.inState(CState.SLEEP)))) && (!(this.inState(CState.FLYING)))) && (!(this.inState(CState.INJURED)))) && (!(this.inState(CState.EGG)))))
                {
                    m_ySpeed = this.m_characterStats.FastFallSpeed;
                    if ((!((((((this.inState(CState.ATTACKING)) && (m_attack.AirEase >= 0)) && (!(this.inState(CState.HOVER)))) && (!(this.m_attackHovering))) && (!(this.inState(CState.HOVER)))) && (this.m_midAirJumpConstantTime.IsComplete))))
                    {
                        this.m_fastFallLetGoAttack = false;
                        attachEffect("effect_fastFall");
                    };
                };
                if (((((((this.inState(CState.ATTACKING)) && (m_attack.AirEase >= 0)) && (!(this.inState(CState.HOVER)))) && (!(this.m_attackHovering))) && (!(this.inState(CState.HOVER)))) && (this.m_midAirJumpConstantTime.IsComplete)))
                {
                    if (m_ySpeed >= m_attack.AirEase)
                    {
                        m_ySpeed = m_attack.AirEase;
                    };
                };
                if (((((((this.inState(CState.ATTACKING)) && (this.m_justHit)) && (!(m_attack.HitEase == 0))) && (!(this.m_attackHovering))) && (!(this.inState(CState.HOVER)))) && (this.m_midAirJumpConstantTime.IsComplete)))
                {
                    if (((m_attack.HitEase > 0) && (m_ySpeed > m_attack.HitEase)))
                    {
                        m_ySpeed = m_attack.HitEase;
                    }
                    else
                    {
                        if (((m_attack.HitEase < 0) && (m_ySpeed > m_attack.HitEase)))
                        {
                            m_ySpeed = m_attack.HitEase;
                        };
                    };
                };
                if (this.inState(CState.EGG))
                {
                    if (m_ySpeed > (m_max_ySpeed * 0.5))
                    {
                        m_ySpeed = (m_max_ySpeed * 0.5);
                    };
                };
                if (((((((((this.m_canHover) && (!(this.inState(CState.FLYING)))) && (!(this.inState(CState.INJURED)))) && (this.m_characterStats.MidAirHover > 0)) && (this.inFreeState())) && (!(this.inState(CState.HOVER)))) && ((_local_1 < 0) && (m_ySpeed >= 0))) && ((this.jumpIsPressed()) || (this.m_tap_jump_btn))))
                {
                    this.initHover();
                };
                this.m_attemptToMove(0, m_ySpeed);
                if (this.inState(CState.SHIELDING))
                {
                    this.m_deactivateShield();
                    this.m_crouch = false;
                    this.m_crouchFrame = -1;
                    this.resetRotation();
                    this.m_fallTiltTimer.reset();
                    this.setState(CState.TUMBLE_FALL);
                };
                if (this.inState(CState.DISABLED))
                {
                    this.m_blinkTimer++;
                    if (this.m_blinkTimer > 5)
                    {
                        this.alternateBlink();
                    };
                };
                if (((((((((((this.m_glideReady) && (!(this.inState(CState.DISABLED)))) && (!(this.inState(CState.FLYING)))) && (!(this.inState(CState.INJURED)))) && ((this.jumpIsPressed()) || ((this.m_left) && (this.m_right)))) && (this.m_jumpCount > 0)) && (!(this.inState(CState.ATTACKING)))) && (this.m_characterStats.GlideSpeed > 0)) && (!(this.inState(CState.GLIDING)))) && (m_ySpeed > 0)))
                {
                    this.startGlide();
                };
            }
            else
            {
                if (((((((!(this.inState(CState.FLYING))) && (!(this.inState(CState.INJURED)))) && (!(this.inState(CState.ATTACKING)))) && (!(isHitStunOrParalysis()))) && (!(this.inState(CState.GLIDING)))) && (this.m_midAirJumpConstantTime.IsComplete)))
                {
                    m_ySpeed = 0;
                };
            };
        }

        public function startGlide():void
        {
            if (((((((((((((((!(m_collision.ground)) && (!(isHitStunOrParalysis()))) && (!(this.inState(CState.LEDGE_HANG)))) && (!(this.m_usingSpecialAttack))) && (!(this.inState(CState.CAUGHT)))) && (!(this.inState(CState.BARREL)))) && (!(this.inState(CState.LEDGE_ROLL)))) && (!(this.inState(CState.TECH_GROUND)))) && (!(this.inState(CState.TECH_ROLL)))) && (!(this.inState(CState.ROLL)))) && (!(this.inState(CState.REVIVAL)))) && (!(this.inState(CState.FLYING)))) && (!(this.inState(CState.INJURED)))) && (!(this.inState(CState.GLIDING)))))
            {
                this.forceEndAttack();
                this.m_glideMaxHeight = m_sprite.y;
                this.m_glideAngle = 20;
                this.m_glideDelay = 0;
                this.m_glideReady = false;
                this.setState(CState.GLIDING);
                this.stancePlayFrame("glide");
            };
        }

        private function m_charGlide():void
        {
            var _local_1:Number;
            var _local_2:Number;
            if (this.inState(CState.GLIDING))
            {
                if (this.m_glideDelay < 10)
                {
                    this.m_glideDelay++;
                };
                if (this.m_glideDelay >= 10)
                {
                    if ((((this.m_up) && (!(this.m_down))) && (this.m_glideAngle > -70)))
                    {
                        this.m_glideAngle = (this.m_glideAngle - 10);
                    }
                    else
                    {
                        if ((((this.m_down) && (!(this.m_up))) && (this.m_glideAngle < 70)))
                        {
                            this.m_glideAngle = (this.m_glideAngle + 10);
                        };
                    };
                };
                _local_1 = m_sprite.x;
                _local_2 = m_sprite.y;
                m_xSpeed = (((m_facingForward) ? this.m_characterStats.GlideSpeed : -(this.m_characterStats.GlideSpeed)) * Math.cos(((this.m_glideAngle * Math.PI) / 180)));
                m_ySpeed = (this.m_characterStats.GlideSpeed * Math.sin(((this.m_glideAngle * Math.PI) / 180)));
                this.m_attemptToMove(m_xSpeed, 0);
                this.m_attemptToMove(0, m_ySpeed);
                if (Utils.fastAbs((m_sprite.x - _local_1)) < 0.5)
                {
                    this.m_glideDelay++;
                };
                m_sprite.rotation = ((m_facingForward) ? this.m_glideAngle : -(this.m_glideAngle));
                if (((m_sprite.y < this.m_glideMaxHeight) || (this.m_glideDelay > 40)))
                {
                    m_sprite.y = _local_2;
                    m_ySpeed = 0;
                    this.resetRotation();
                    this.m_fallTiltTimer.reset();
                    Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                    this.setState(CState.JUMP_FALLING);
                    if (this.m_jumpCount >= this.m_characterStats.MaxJump)
                    {
                        this.setState(CState.DISABLED);
                    };
                };
            };
        }

        private function m_charWallCling():void
        {
            var _local_1:int;
            var _local_2:Rectangle;
            var _local_3:Boolean;
            this.m_wallClingDelay.tick();
            this.m_wallClingDelay.reset();
            if (this.inState(CState.WALL_CLING))
            {
                if ((((this.jumpIsPressed()) || ((this.m_right) && (m_facingForward))) || ((this.m_left) && (!(m_facingForward)))))
                {
                    if (this.m_characterStats.WallJump)
                    {
                        m_ySpeed = -(this.m_characterStats.JumpSpeedMidAir);
                        this.m_wallStickTime.MaxTime = (this.m_wallStickTime.MaxTime - Math.round((this.m_wallStickTime.MaxTime / 2)));
                        if (this.m_wallStickTime.MaxTime < 1)
                        {
                            this.m_wallStickTime.MaxTime = 1;
                        };
                        if (m_facingForward)
                        {
                            m_xSpeed = (this.m_characterStats.MaxJumpSpeed / 2);
                        }
                        else
                        {
                            m_xSpeed = (-(this.m_characterStats.MaxJumpSpeed) / 2);
                        };
                        this.setState(CState.JUMP_MIDAIR_RISING);
                    }
                    else
                    {
                        this.setState(CState.JUMP_FALLING);
                    };
                    this.m_wallClingDelay.reset();
                }
                else
                {
                    this.m_wallStickTime.tick();
                    if (this.m_wallStickTime.IsComplete)
                    {
                        this.m_wallStickTime.MaxTime = (this.m_wallStickTime.MaxTime - Math.round((this.m_wallStickTime.MaxTime / 2)));
                        this.setState(CState.JUMP_FALLING);
                        this.m_wallClingDelay.reset();
                    };
                };
            }
            else
            {
                if ((((this.inFreeState()) && ((this.m_characterStats.WallJump) || (this.m_characterStats.WallStick > 0))) && (HasHitBox)))
                {
                    _local_1 = 0;
                    while (_local_1 < this.m_walls.length)
                    {
                        _local_2 = BoundsRect;
                        _local_3 = this.m_walls[_local_1].hitTestRect(BoundsRect);
                        if (((_local_3) && (((this.m_characterStats.WallStick > 0) || ((((m_sprite.x > this.m_walls[_local_1].X) && (this.jumpIsPressed())) || (this.m_right)) && (m_xSpeed <= 0))) || ((m_sprite.x < (this.m_walls[_local_1].X + this.m_walls[_local_1].Width)) && (((this.jumpIsPressed()) || (this.m_left)) && (m_xSpeed <= 0))))))
                        {
                            if ((((this.m_characterStats.WallStick <= 0) && (this.m_characterStats.WallJump)) && (m_ySpeed >= 0)))
                            {
                                m_ySpeed = (-(this.m_characterStats.JumpSpeedMidAir) * Math.pow(0.9, this.m_wallJumpCount));
                                if (this.m_characterStats.WallStick == 0)
                                {
                                    this.m_wallJumpCount++;
                                };
                                if (((m_sprite.x > this.m_walls[_local_1].X) && ((this.jumpIsPressed()) || (this.m_right))))
                                {
                                    m_xSpeed = (this.m_characterStats.MaxJumpSpeed / 2);
                                    this.m_faceRight();
                                }
                                else
                                {
                                    m_xSpeed = (-(this.m_characterStats.MaxJumpSpeed) / 2);
                                    this.m_faceLeft();
                                };
                                this.setState(CState.JUMP_MIDAIR_RISING);
                                return;
                            };
                            if ((((this.m_characterStats.WallStick > 0) && (((m_sprite.x > this.m_walls[_local_1].X) && (this.m_left)) || ((m_sprite.x < (this.m_walls[_local_1].X + this.m_walls[_local_1].Width)) && (this.m_right)))) && (this.m_wallClingDelay.IsComplete)))
                            {
                                if (m_sprite.x > this.m_walls[_local_1].X)
                                {
                                    this.m_faceRight();
                                }
                                else
                                {
                                    this.m_faceLeft();
                                };
                                this.setState(CState.WALL_CLING);
                                this.m_wallStickTime.reset();
                                return;
                            };
                        };
                        _local_1++;
                    };
                };
            };
        }

        private function resetSmashTimers():void
        {
            this.m_smashTimer = 0;
            this.m_smashTimerUp = 0;
            this.m_smashTimerDown = 0;
            this.m_smashTimerSide = 0;
            this.m_upSpecialTimer = 0;
        }

        private function killSmashTimers():void
        {
            this.m_smashTimer = 99;
            this.m_smashTimerUp = 99;
            this.m_smashTimerDown = 99;
            this.m_smashTimerSide = 99;
            this.m_upSpecialTimer = 99;
        }

        private function neutralSpecialFlipCheck(_arg_1:String):void
        {
            if ((((((!(this.m_specialTurnTimer.IsComplete)) && (_arg_1)) && (m_attackData.getAttack(_arg_1))) && (!(m_attackData.getAttack(_arg_1).IsDisabled))) && (m_attackData.getAttack(_arg_1).Enabled)))
            {
                if (((!(m_facingForward)) && (this.m_specialTurnRight)))
                {
                    this.m_faceRight();
                }
                else
                {
                    if (((m_facingForward) && (!(this.m_specialTurnRight))))
                    {
                        this.m_faceLeft();
                    };
                };
            };
        }

        private function attackFlipCheck(_arg_1:String):void
        {
            if (((((_arg_1) && (m_attackData.getAttack(_arg_1))) && (!(m_attackData.getAttack(_arg_1).IsDisabled))) && (m_attackData.getAttack(_arg_1).Enabled)))
            {
                if (((this.m_right) && (!(m_facingForward))))
                {
                    this.m_faceRight();
                }
                else
                {
                    if (((this.m_left) && (m_facingForward)))
                    {
                        this.m_faceLeft();
                    };
                };
            };
        }

        private function resetAttackLetGo():void
        {
            this.m_attackLetGoA = false;
            this.m_attackLetGoB = false;
        }

        private function m_charAttack():void
        {
            var _local_1:int;
            var _local_4:int;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:int;
            var _local_8:Character;
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:Platform;
            var _local_12:Boolean;
            var _local_13:Vector.<HitBoxCollisionResult>;
            var _local_14:Number;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:Number;
            var _local_18:Point;
            var _local_19:Point;
            var _local_20:Point;
            var _local_21:MovieClip;
            var _local_22:Point;
            var _local_23:Boolean;
            var _local_24:int;
            var _local_25:int;
            var _local_26:MovieClip;
            var _local_27:int;
            _local_1 = 0;
            var _local_2:int;
            var _local_3:Boolean = this.inState(CState.ATTACKING);
            if (((((!(this.m_a)) && (!((this.inState(CState.ATTACKING)) && (!(m_attack.AllowFullInterrupt))))) && (!(this.m_transformingSpecial))) && (!(this.m_usingSpecialAttack))))
            {
                this.m_attackLetGoA = true;
            };
            if (((((!(this.m_b)) && (!((this.inState(CState.ATTACKING)) && (!(m_attack.AllowFullInterrupt))))) && (!(this.m_transformingSpecial))) && (!(this.m_usingSpecialAttack))))
            {
                this.m_attackLetGoB = true;
            };
            if (((((!(this.m_c_up)) && (!(this.m_c_down))) && (!(this.m_c_left))) && (!(this.m_c_right))))
            {
                this.m_cStickLetGo = true;
            };
            if (((this.m_left) || (this.m_right)))
            {
                this.m_specialTurnRight = (((this.m_right) && (!(this.m_left))) ? true : (((this.m_left) && (!(this.m_right))) ? false : this.m_specialTurnRight));
                this.m_specialTurnTimer.reset();
            };
            if (((((!((this.HoldingItem) && (!(this.m_item.CanAttackWith)))) && (this.m_charIsFull)) && (this.m_attackDelay <= 0)) && (!(this.isLandingOrSkiddingOrChambering()))))
            {
                if (((this.m_a) && (this.m_attackLetGoA)))
                {
                    this.m_charIsFull = false;
                    this.m_justReleased = true;
                    this.Attack("b", 1);
                }
                else
                {
                    if ((((this.m_b) && (this.m_attackLetGoB)) || (this.m_down)))
                    {
                        this.m_charIsFull = false;
                        this.m_justReleased = true;
                        this.Attack("b", 2);
                    };
                };
            }
            else
            {
                if (((((((this.inState(CState.ATTACKING)) && (this.m_grabbed.length > 0)) && (this.m_currentPower == null)) && (this.m_characterStats.LinkageID == "kirby")) && ((m_attack.Frame == "b") || (m_attack.Frame == "b_air"))) && (this.m_justReleased)))
                {
                    if (this.currentStanceFrameIs("sucking"))
                    {
                        if (m_attack.AttackType == 2)
                        {
                            this.setStanceVar("power", this.m_grabbed[0].KirbyPower);
                            _local_4 = 0;
                            while (_local_4 < this.m_grabbed.length)
                            {
                                this.m_grabbed[_local_4].dealDamage(6);
                                _local_4++;
                            };
                            this.stancePlayFrame("swallow");
                        }
                        else
                        {
                            this.stancePlayFrame("spit");
                        };
                    };
                };
            };
            if (((this.HoldingItem) && (currentFrameIs("a"))))
            {
            };
            if (((((this.inFreeState(true, false, false, false, false, false, false, true, false, true)) && (!((this.inState(CState.ATTACKING)) && (!(m_attack.AllowFullInterrupt))))) && (this.m_attackDelay <= 0)) && (!((this.HoldingItem) && (!(this.m_item.CanAttackWith))))))
            {
                if (m_collision.ground)
                {
                    if (((this.inState(CState.CROUCH)) && (!(this.m_up))))
                    {
                        if ((((this.m_a) && (!(this.m_b))) && (this.m_attackLetGoA)))
                        {
                            if ((((((((this.m_down) && (!(this.m_left))) && (!(this.m_right))) && (this.m_smashTimer < 4)) && (this.m_crouchLength < 3)) && (Utils.fastAbs(m_xSpeed) < 0.5)) && (!((this.HoldingItem) && (this.m_item.Ability == "toss")))))
                            {
                                this.Attack("a_down", 1);
                            }
                            else
                            {
                                if (((this.HoldingItem) && ((!(this.inState(CState.JUMP_CHAMBER))) || (this.m_item.Ability == "toss"))))
                                {
                                    this.m_item.AttackStateData.Frame = Item.ATTACK_NEUTRAL;
                                    this.m_useItem();
                                };
                            };
                        }
                        else
                        {
                            if (((((this.m_b) && (!(this.m_a))) && (!(this.inState(CState.JUMP_CHAMBER)))) && (this.m_attackLetGoB)))
                            {
                                if ((((this.m_left) && (!(this.m_right))) || ((this.m_right) && (!(this.m_left)))))
                                {
                                    if (this.m_up)
                                    {
                                        this.attackFlipCheck("b_up");
                                        this.Attack("b_up", 2);
                                    }
                                    else
                                    {
                                        if (this.m_down)
                                        {
                                            this.attackFlipCheck("b_down");
                                            this.Attack("b_down", 2);
                                        }
                                        else
                                        {
                                            this.attackFlipCheck("b_forward");
                                            this.Attack("b_forward", 2);
                                        };
                                    };
                                }
                                else
                                {
                                    if (this.m_down)
                                    {
                                        this.Attack("b_down", 2);
                                    }
                                    else
                                    {
                                        if (((this.m_hasFinalSmash) && (!(this.m_transformingSpecial))))
                                        {
                                            this.m_useItemSpecial();
                                        }
                                        else
                                        {
                                            this.Attack("b", 2);
                                        };
                                    };
                                };
                            }
                            else
                            {
                                if (((this.m_cStickLetGo) && (((((this.m_c_up) && (!(this.m_c_down))) || ((this.m_c_down) && (!(this.m_c_up)))) || ((this.m_c_left) && (!(this.m_c_right)))) || ((this.m_c_right) && (!(this.m_c_left))))))
                                {
                                    if (((!((this.HoldingItem) && (this.m_item.Ability == "attack"))) && (!((this.HoldingItem) && (this.m_item.Ability == "toss")))))
                                    {
                                        if (this.m_c_up)
                                        {
                                            this.Attack("a_up", 1, true);
                                        }
                                        else
                                        {
                                            if (this.m_c_down)
                                            {
                                                this.Attack("a_down", 1, true);
                                            }
                                            else
                                            {
                                                if (this.m_c_left)
                                                {
                                                    this.m_faceLeft();
                                                    this.Attack("a_forwardsmash", 1, true);
                                                }
                                                else
                                                {
                                                    if (this.m_c_right)
                                                    {
                                                        this.m_faceRight();
                                                        this.Attack("a_forwardsmash", 1, true);
                                                    };
                                                };
                                            };
                                        };
                                    }
                                    else
                                    {
                                        if (this.HoldingItem)
                                        {
                                            if (((this.m_item.Ability == "attack") && (this.m_characterStats.CanUseItems)))
                                            {
                                                if ((((((!(this.m_c_up)) && (!(this.m_c_down))) && (this.m_c_left)) && (!(this.m_c_right))) || ((((!(this.m_c_up)) && (!(this.m_c_down))) && (!(this.m_c_left))) && (this.m_c_right))))
                                                {
                                                    if (this.m_smashTimer < 4)
                                                    {
                                                        if (this.m_c_left)
                                                        {
                                                            this.m_faceLeft();
                                                        }
                                                        else
                                                        {
                                                            this.m_faceRight();
                                                        };
                                                        this.m_item.AttackStateData.Frame = Item.ATTACK_SMASH;
                                                    }
                                                    else
                                                    {
                                                        this.m_item.AttackStateData.Frame = Item.ATTACK_NEUTRAL;
                                                    };
                                                    this.m_useItem();
                                                };
                                            }
                                            else
                                            {
                                                if (this.m_item.Ability == "toss")
                                                {
                                                    this.m_item.AttackStateData.Frame = Item.ATTACK_NEUTRAL;
                                                    this.m_useItem();
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    }
                    else
                    {
                        if ((((this.m_a) && (!(this.m_b))) && (this.m_attackLetGoA)))
                        {
                            if (((((this.m_up) && (!((this.inState(CState.JUMP_CHAMBER)) && ((this.m_left) || (this.m_right))))) && (this.m_smashTimer < 4)) && (!((this.HoldingItem) && (this.m_item.Ability == "toss")))))
                            {
                                if (((this.inState(CState.DASH)) && (Utils.fastAbs(m_xSpeed) > this.m_max_xSpeed)))
                                {
                                    m_xSpeed = ((m_xSpeed > 0) ? this.m_max_xSpeed : -(this.m_max_xSpeed));
                                };
                                this.Attack("a_up", 1);
                            }
                            else
                            {
                                if (((this.m_up) && (!((this.HoldingItem) && (this.m_item.Ability == "toss")))))
                                {
                                    if (((this.inState(CState.DASH)) && (!(m_xSpeed == 0))))
                                    {
                                        m_xSpeed = ((m_xSpeed > 0) ? this.m_max_xSpeed : -(this.m_max_xSpeed));
                                    };
                                    this.Attack("a_up_tilt", 1);
                                }
                                else
                                {
                                    if ((((((!(this.m_right == this.m_left)) && (this.m_smashTimer < 4)) && (!((this.HoldingItem) && (this.m_characterStats.CanUseItems)))) && (!(this.inState(CState.DASH)))) && (!(this.inState(CState.JUMP_CHAMBER)))))
                                    {
                                        this.attackFlipCheck("a_forwardsmash");
                                        this.Attack("a_forwardsmash", 1);
                                    }
                                    else
                                    {
                                        if (((!(this.inState(CState.JUMP_CHAMBER))) && (((((this.m_left) && (!(this.m_right))) && (!(m_facingForward))) && (!(this.HoldingItem))) || ((((this.m_right) && (!(this.m_left))) && (m_facingForward)) && (!((this.HoldingItem) && (this.m_characterStats.CanUseItems)))))))
                                        {
                                            if (((!(this.m_runningSpeedLevel)) && (!(this.inState(CState.DASH)))))
                                            {
                                                this.Attack("a_forward_tilt", 1);
                                            }
                                            else
                                            {
                                                if (((this.m_runningSpeedLevel) || (this.inState(CState.DASH))))
                                                {
                                                    this.Attack("a_forward", 1);
                                                };
                                            };
                                        }
                                        else
                                        {
                                            if ((((((this.m_smashTimer < 4) && (this.m_down)) && (!((this.HoldingItem) && (this.m_item.Ability == "toss")))) && (!(this.inState(CState.DASH)))) && (!(this.inState(CState.JUMP_CHAMBER)))))
                                            {
                                                this.Attack("a_down", 1);
                                            }
                                            else
                                            {
                                                if ((!(this.inState(CState.DASH))))
                                                {
                                                    if (((!((this.HoldingItem) && (this.m_characterStats.CanUseItems))) && (!(this.inState(CState.JUMP_CHAMBER)))))
                                                    {
                                                        if (this.m_left != this.m_right)
                                                        {
                                                            if (this.m_left)
                                                            {
                                                                faceLeft();
                                                            }
                                                            else
                                                            {
                                                                faceRight();
                                                            };
                                                            this.Attack("a_forward_tilt", 1);
                                                        }
                                                        else
                                                        {
                                                            if (this.m_down)
                                                            {
                                                                this.Attack("crouch_attack", 1);
                                                            }
                                                            else
                                                            {
                                                                this.Attack("a", 1);
                                                            };
                                                        };
                                                    }
                                                    else
                                                    {
                                                        if ((((this.HoldingItem) && (this.m_characterStats.CanUseItems)) && ((!(this.inState(CState.JUMP_CHAMBER))) || (this.m_item.Ability == "toss"))))
                                                        {
                                                            if (((!(this.m_left == this.m_right)) && (this.m_smashTimer < 4)))
                                                            {
                                                                if (this.m_left)
                                                                {
                                                                    this.m_faceLeft();
                                                                }
                                                                else
                                                                {
                                                                    this.m_faceRight();
                                                                };
                                                                this.m_item.AttackStateData.Frame = Item.ATTACK_SMASH;
                                                            }
                                                            else
                                                            {
                                                                this.m_item.AttackStateData.Frame = Item.ATTACK_NEUTRAL;
                                                            };
                                                            this.m_useItem();
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        }
                        else
                        {
                            if (((((this.m_b) && (!(this.m_a))) && (!(this.inState(CState.JUMP_CHAMBER)))) && (this.m_attackLetGoB)))
                            {
                                if ((((this.m_left) && (!(this.m_right))) || ((this.m_right) && (!(this.m_left)))))
                                {
                                    if (this.m_up)
                                    {
                                        if (((this.inState(CState.DASH)) && (!(m_xSpeed == 0))))
                                        {
                                            m_xSpeed = ((m_xSpeed > 0) ? this.m_max_xSpeed : -(this.m_max_xSpeed));
                                        };
                                        this.attackFlipCheck("b_up");
                                        this.Attack("b_up", 2);
                                    }
                                    else
                                    {
                                        if (((this.m_down) && (!(this.inState(CState.DASH)))))
                                        {
                                            this.attackFlipCheck("b_down");
                                            this.Attack("b_down", 2);
                                        }
                                        else
                                        {
                                            if (this.inState(CState.DASH))
                                            {
                                                m_xSpeed = ((m_xSpeed > 0) ? this.m_max_xSpeed : ((m_xSpeed < 0) ? -(this.m_max_xSpeed) : 0));
                                            };
                                            this.attackFlipCheck("b_forward");
                                            this.Attack("b_forward", 2);
                                        };
                                    };
                                }
                                else
                                {
                                    if ((((this.m_down) && (!(this.m_up))) && (!(this.inState(CState.DASH)))))
                                    {
                                        this.Attack("b_down", 2);
                                    }
                                    else
                                    {
                                        if ((((this.m_up) && (!(this.m_down))) && (!(this.inState(CState.DASH)))))
                                        {
                                            this.Attack("b_up", 2);
                                        }
                                        else
                                        {
                                            if (((this.m_hasFinalSmash) && (!(this.m_transformingSpecial))))
                                            {
                                                this.m_useItemSpecial();
                                            }
                                            else
                                            {
                                                if ((!(this.inState(CState.DASH))))
                                                {
                                                    this.Attack("b", 2);
                                                };
                                            };
                                        };
                                    };
                                };
                            }
                            else
                            {
                                if (((((this.m_b) && (!(this.m_a))) && (this.inState(CState.JUMP_CHAMBER))) && (this.m_attackLetGoB)))
                                {
                                    if (this.m_up)
                                    {
                                        this.attackFlipCheck("b_up");
                                        this.Attack("b_up", 2);
                                    };
                                }
                                else
                                {
                                    if (((this.m_cStickLetGo) && ((((this.m_c_up) || (this.m_c_down)) || (this.m_c_left)) || (this.m_c_right))))
                                    {
                                        if (((!((this.HoldingItem) && (this.m_item.Ability == "attack"))) && (!((this.HoldingItem) && (this.m_item.Ability == "toss")))))
                                        {
                                            if (((!(this.inState(CState.DASH))) && (!(this.inState(CState.RUN)))))
                                            {
                                                if (((this.m_c_up) && (!(this.m_c_down))))
                                                {
                                                    if (((this.inState(CState.DASH)) && (Utils.fastAbs(m_xSpeed) > this.m_max_xSpeed)))
                                                    {
                                                        m_xSpeed = ((m_xSpeed > 0) ? this.m_max_xSpeed : -(this.m_max_xSpeed));
                                                    };
                                                    this.Attack("a_up", 1, true);
                                                }
                                                else
                                                {
                                                    if ((((!(this.m_c_up)) && (this.m_c_down)) && (!(this.inState(CState.JUMP_CHAMBER)))))
                                                    {
                                                        this.Attack("a_down", 1, true);
                                                    }
                                                    else
                                                    {
                                                        if ((((this.m_c_left) && (!(this.m_c_right))) && (!(this.inState(CState.JUMP_CHAMBER)))))
                                                        {
                                                            this.m_faceLeft();
                                                            this.Attack("a_forwardsmash", 1, true);
                                                        }
                                                        else
                                                        {
                                                            if ((((!(this.m_c_left)) && (this.m_c_right)) && (!(this.inState(CState.JUMP_CHAMBER)))))
                                                            {
                                                                this.m_faceRight();
                                                                this.Attack("a_forwardsmash", 1, true);
                                                            };
                                                        };
                                                    };
                                                };
                                            }
                                            else
                                            {
                                                if (((((((this.m_runningSpeedLevel) || (this.inState(CState.DASH))) && (this.m_c_up)) && (!(this.m_c_left))) && (!(this.m_c_down))) && (!(this.m_c_right))))
                                                {
                                                    if (((this.inState(CState.DASH)) && (Utils.fastAbs(m_xSpeed) > this.m_max_xSpeed)))
                                                    {
                                                        m_xSpeed = ((m_xSpeed > 0) ? this.m_max_xSpeed : -(this.m_max_xSpeed));
                                                    };
                                                    this.Attack("a_up", 1, true);
                                                }
                                                else
                                                {
                                                    if ((((this.m_runningSpeedLevel) || (this.inState(CState.DASH))) && (((this.m_c_right) || (this.m_c_left)) || (this.m_c_down))))
                                                    {
                                                        this.Attack("a_forward", 1);
                                                    };
                                                };
                                            };
                                        }
                                        else
                                        {
                                            if ((((((this.HoldingItem) && (this.m_characterStats.CanUseItems)) && (!(this.inState(CState.DASH)))) && (!(this.inState(CState.DASH)))) && ((!(this.inState(CState.JUMP_CHAMBER))) || (this.m_item.Ability == "toss"))))
                                            {
                                                if (((this.m_item.Ability == "attack") && (this.m_characterStats.CanUseItems)))
                                                {
                                                    if ((((((!(this.m_c_up)) && (!(this.m_c_down))) && (this.m_c_left)) && (!(this.m_c_right))) || ((((!(this.m_c_up)) && (!(this.m_c_down))) && (!(this.m_c_left))) && (this.m_c_right))))
                                                    {
                                                        if (this.m_smashTimer < 4)
                                                        {
                                                            if (this.m_c_left)
                                                            {
                                                                this.m_faceLeft();
                                                            }
                                                            else
                                                            {
                                                                this.m_faceRight();
                                                            };
                                                            this.m_item.AttackStateData.Frame = Item.ATTACK_SMASH;
                                                        }
                                                        else
                                                        {
                                                            this.m_item.AttackStateData.Frame = Item.ATTACK_NEUTRAL;
                                                        };
                                                        this.m_useItem();
                                                    };
                                                }
                                                else
                                                {
                                                    if (this.m_item.Ability == "toss")
                                                    {
                                                        this.m_item.AttackStateData.Frame = Item.ATTACK_NEUTRAL;
                                                        this.m_useItem();
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                }
                else
                {
                    if ((((((this.m_a) || (((this.m_grab) && (this.m_grabKeyReleased)) && (!(this.m_characterStats.TetherGrab)))) && (!(this.m_b))) && (this.m_attackLetGoA)) || (((this.m_c_buffered_down) || (this.m_c_buffered_left)) || (this.m_c_buffered_right))))
                    {
                        if ((((((this.m_down) && (!(this.m_c_buffered_left))) && (!(this.m_c_buffered_right))) || (this.m_c_buffered_down)) && (!((((this.HoldingItem) && (this.m_item.UseInAir)) && (!(this.inState(CState.HOVER)))) && (!(this.m_item.Ability == "attack"))))))
                        {
                            this.Attack("a_air_down", 1);
                        }
                        else
                        {
                            if (((((((((((this.m_left) && (!(this.m_right))) && (!(this.m_c_buffered_left))) && (!(this.m_c_buffered_right))) && (!(this.m_c_buffered_down))) || ((this.inState(CState.GLIDING)) && (!(m_facingForward)))) || ((this.m_c_buffered_left) && (!(m_facingForward)))) && (!(m_facingForward))) || ((((((((!(this.m_left)) && (this.m_right)) && (!(this.m_c_buffered_left))) && (!(this.m_c_buffered_right))) && (!(this.m_c_buffered_down))) || ((this.inState(CState.GLIDING)) && (m_facingForward))) || ((this.m_c_buffered_right) && (m_facingForward))) && (m_facingForward))) && (!((((this.HoldingItem) && (this.m_item.UseInAir)) && (!(this.m_item.Ability == "attack"))) && (!(this.inState(CState.HOVER)))))))
                            {
                                this.Attack("a_air_forward", 1);
                            }
                            else
                            {
                                if (((((((((((this.m_left) && (!(this.m_right))) && (m_facingForward)) && (!(this.m_c_buffered_left))) && (!(this.m_c_buffered_right))) && (!(this.m_c_buffered_down))) || ((((((this.m_right) && (!(this.m_left))) && (!(m_facingForward))) && (!(this.m_c_buffered_left))) && (!(this.m_c_buffered_right))) && (!(this.m_c_buffered_down)))) || ((this.m_c_buffered_left) && (m_facingForward))) || ((this.m_c_buffered_right) && (!(m_facingForward)))) && (!((((this.HoldingItem) && (this.m_item.UseInAir)) && (!(this.inState(CState.HOVER)))) && (!(this.m_item.Ability == "attack"))))))
                                {
                                    this.Attack("a_air_backward", 1);
                                }
                                else
                                {
                                    if ((((((this.m_up) && (!(this.m_c_buffered_left))) && (!(this.m_c_buffered_right))) && (!(this.m_c_buffered_down))) && (!((((this.HoldingItem) && (this.m_item.UseInAir)) && (!(this.inState(CState.HOVER)))) && (!(this.m_item.Ability == "attack"))))))
                                    {
                                        this.Attack("a_air_up", 1);
                                    }
                                    else
                                    {
                                        if ((!(((this.HoldingItem) && (this.m_item.UseInAir)) && (!(this.inState(CState.HOVER))))))
                                        {
                                            this.Attack("a_air", 1);
                                        }
                                        else
                                        {
                                            if (((this.HoldingItem) && (this.m_item.UseInAir)))
                                            {
                                                this.m_item.AttackStateData.Frame = Item.ATTACK_NEUTRAL;
                                                this.m_useItem();
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    }
                    else
                    {
                        if (((((this.m_b) && (!(this.m_a))) && (!(this.inState(CState.GLIDING)))) && (this.m_attackLetGoB)))
                        {
                            if ((((this.m_left) && (!(this.m_right))) || ((this.m_right) && (!(this.m_left)))))
                            {
                                if (this.m_up)
                                {
                                    this.attackFlipCheck("b_up_air");
                                    this.Attack("b_up_air", 2);
                                }
                                else
                                {
                                    if (this.m_down)
                                    {
                                        this.attackFlipCheck("b_down_air");
                                        this.Attack("b_down_air", 2);
                                    }
                                    else
                                    {
                                        this.attackFlipCheck("b_forward_air");
                                        this.Attack("b_forward_air", 2);
                                    };
                                };
                            }
                            else
                            {
                                if (((this.m_down) && (!(this.m_up))))
                                {
                                    this.Attack("b_down_air", 2);
                                }
                                else
                                {
                                    if (((this.m_up) && (!(this.m_down))))
                                    {
                                        this.Attack("b_up_air", 2);
                                    }
                                    else
                                    {
                                        if ((((this.m_hasFinalSmash) && (!(this.m_transformingSpecial))) && (m_attackData.getAttack("special").CanUseInAir)))
                                        {
                                            this.m_useItemSpecial();
                                        }
                                        else
                                        {
                                            this.neutralSpecialFlipCheck("b_air");
                                            this.Attack("b_air", 2);
                                        };
                                    };
                                };
                            };
                        }
                        else
                        {
                            if (((this.m_cStickLetGo) && ((((this.m_c_up) || (this.m_c_down)) || (this.m_c_left)) || (this.m_c_right))))
                            {
                                if ((((!(this.inState(CState.JUMP_CHAMBER))) && (!(this.inState(CState.DASH)))) && (!(this.inState(CState.RUN)))))
                                {
                                    if ((!((this.HoldingItem) && (this.m_item.Ability == "toss"))))
                                    {
                                        if (((((this.m_c_up) && (!(this.m_c_left))) && (!(this.m_c_down))) && (!(this.m_c_right))))
                                        {
                                            this.Attack("a_air_up", 1, true);
                                        }
                                        else
                                        {
                                            if (((((!(this.m_c_up)) && (this.m_c_down)) && (!(this.m_c_left))) && (!(this.m_c_right))))
                                            {
                                                this.Attack("a_air_down", 1, true);
                                            }
                                            else
                                            {
                                                if (((((!(this.m_c_up)) && (!(this.m_c_down))) && (this.m_c_left)) && (!(this.m_c_right))))
                                                {
                                                    if (m_facingForward)
                                                    {
                                                        this.Attack("a_air_backward", 1, true);
                                                    }
                                                    else
                                                    {
                                                        this.Attack("a_air_forward", 1, true);
                                                    };
                                                }
                                                else
                                                {
                                                    if (((((!(this.m_c_up)) && (!(this.m_c_down))) && (!(this.m_c_left))) && (this.m_c_right)))
                                                    {
                                                        if (m_facingForward)
                                                        {
                                                            this.Attack("a_air_forward", 1, true);
                                                        }
                                                        else
                                                        {
                                                            this.Attack("a_air_backward", 1, true);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    }
                                    else
                                    {
                                        if (((this.HoldingItem) && (this.m_item.Ability == "toss")))
                                        {
                                            this.m_item.AttackStateData.Frame = Item.ATTACK_NEUTRAL;
                                            this.m_useItem();
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            if (this.inState(CState.ATTACKING))
            {
                this.charAttackCollisionTest();
                if (((this.inState(CState.ATTACKING)) && (m_attackData.getAttack(m_attack.Frame).ChargeRetain)))
                {
                    if ((((((this.attackIsCharged(m_attack.Frame)) || ((((((this.m_b) && (m_attack.LetGo)) && (m_attack.AttackType == 2)) && (!(m_attack.MustCharge))) || ((((this.m_a) && (m_attack.LetGo)) && (m_attack.AttackType == 1)) && (!(m_attack.MustCharge)))) || ((!(m_attackData.getAttack(m_attack.Frame).ChargeInAir)) && (m_attack.IsAirAttack)))) && (!(this.currentStanceFrameIs("attack")))) && (!(this.currentStanceFrameIs("attack2")))) && (!(this.currentStanceFrameIs(undefined)))))
                    {
                        m_attack.ChargeTime = m_attackData.getAttack(m_attack.Frame).ChargeTime;
                        this.playFrame(m_attack.Frame);
                        if (m_attack.Frame == "item")
                        {
                            this.updateItemHolding();
                        };
                        if (this.attackIsCharged(m_attack.Frame))
                        {
                            if (((this.HoldingItem) && (currentFrameIs("item"))))
                            {
                                if (this.m_item.DoingSmash)
                                {
                                    this.stancePlayFrame((this.m_item.Frame + "2_attack2"));
                                }
                                else
                                {
                                    this.stancePlayFrame((this.m_item.Frame + "_attack2"));
                                };
                            }
                            else
                            {
                                this.stancePlayFrame(((Utils.hasLabel(m_sprite.stance, "attack2")) ? "attack2" : "attack"));
                            };
                        }
                        else
                        {
                            if (((this.HoldingItem) && (currentFrameIs("item"))))
                            {
                                if (this.m_item.DoingSmash)
                                {
                                    this.stancePlayFrame((this.m_item.Frame + "2_attack"));
                                }
                                else
                                {
                                    this.stancePlayFrame((this.m_item.Frame + "_attack"));
                                };
                            }
                            else
                            {
                                this.stancePlayFrame("attack");
                            };
                        };
                        this.unsetCharge(m_attack.Frame);
                        this.removeChargeGlow();
                        if (STAGEPARENT.getChildByName(("energy" + m_player_id)) != null)
                        {
                            STAGEPARENT.removeChild(STAGEPARENT.getChildByName(("energy" + m_player_id)));
                        };
                    }
                    else
                    {
                        if ((((((m_attackData.getAttack(m_attack.Frame).ChargeTime < m_attackData.getAttack(m_attack.Frame).ChargeTimeMax) && (!(this.attackIsCharged(m_attack.Frame)))) && (!(this.currentStanceFrameIs("attack")))) && (!(this.currentStanceFrameIs("attack2")))) && (!((!(m_attackData.getAttack(m_attack.Frame).ChargeInAir)) && (m_attack.IsAirAttack)))))
                        {
                            this.incrementCharge(m_attack.Frame, m_attack.LinkCharge);
                            if (((!(STAGEPARENT.getChildByName(("energy" + m_player_id)) == null)) && (!(MovieClip(STAGEPARENT.getChildByName(("energy" + m_player_id))).percentage == null))))
                            {
                                MovieClip(STAGEPARENT.getChildByName(("energy" + m_player_id))).percentage.scaleX = (m_attackData.getAttack(m_attack.Frame).ChargeTime / m_attackData.getAttack(m_attack.Frame).ChargeTimeMax);
                                STAGEPARENT.getChildByName(("energy" + m_player_id)).x = (m_sprite.x + STAGE.x);
                                STAGEPARENT.getChildByName(("energy" + m_player_id)).y = (m_sprite.y + STAGE.y);
                            };
                        };
                    };
                    if (((((((this.inState(CState.ATTACKING)) && (m_attackData.getAttack(m_attack.Frame).ChargeTime >= m_attackData.getAttack(m_attack.Frame).ChargeTimeMax)) && (!(this.attackIsCharged(m_attack.Frame)))) && (!(this.currentStanceFrameIs("attack")))) && (!(this.currentStanceFrameIs("attack2")))) && (!((!(m_attackData.getAttack(m_attack.Frame).ChargeInAir)) && (m_attack.IsAirAttack)))))
                    {
                        this.setCharge(m_attack.Frame, m_attack.LinkCharge);
                        if ((!(m_attackData.getAttack(m_attack.Frame).ForceUseAtMaxCharge)))
                        {
                            if (this.m_chargeGlowHolderMC == null)
                            {
                                if (m_attackData.getAttack(m_attack.Frame).CustomChargeGlow != null)
                                {
                                    this.m_chargeGlowHolderMC = Main.getLibraryMC(((m_attackData.getAttack(m_attack.Frame).CustomChargeGlow != null) ? m_attackData.getAttack(m_attack.Frame).CustomChargeGlow : "charge_glow"));
                                }
                                else
                                {
                                    this.m_chargeGlowHolderMC = new MovieClip();
                                };
                                this.m_chargeGlowHolderMC.x = m_sprite.x;
                                this.m_chargeGlowHolderMC.y = m_sprite.y;
                                this.toggleEffect(this.m_chargeGlowHolderMC, true);
                            };
                        };
                        if (STAGEPARENT.getChildByName(("energy" + m_player_id)) != null)
                        {
                            STAGEPARENT.removeChild(STAGEPARENT.getChildByName(("energy" + m_player_id)));
                        };
                        this.endAttack();
                    }
                    else
                    {
                        if ((((((this.inState(CState.ATTACKING)) && (this.shieldIsPressed())) && (!(this.currentStanceFrameIs("attack")))) && (!(this.currentStanceFrameIs("attack2")))) && (this.inState(CState.ATTACKING))))
                        {
                            if (STAGEPARENT.getChildByName(("energy" + m_player_id)) != null)
                            {
                                STAGEPARENT.removeChild(STAGEPARENT.getChildByName(("energy" + m_player_id)));
                            };
                            this.endAttack();
                        }
                        else
                        {
                            if (((((((this.inState(CState.ATTACKING)) && (!(this.m_left == this.m_right))) && (!(this.currentStanceFrameIs("attack")))) && (!(this.currentStanceFrameIs("attack2")))) && (this.inState(CState.ATTACKING))) && (m_collision.ground)))
                            {
                                this.endAttack();
                                if (STAGEPARENT.getChildByName(("energy" + m_player_id)) != null)
                                {
                                    STAGEPARENT.removeChild(STAGEPARENT.getChildByName(("energy" + m_player_id)));
                                };
                                this.initDodgeRoll(this.m_right);
                            };
                        };
                        if (((this.inState(CState.ATTACKING)) && ((((!(this.m_a)) && (!(this.m_grab))) && (m_attack.AttackType == 1)) || ((!(this.m_b)) && (m_attack.AttackType == 2)))))
                        {
                            m_attack.LetGo = true;
                        };
                    };
                }
                else
                {
                    if (((this.inState(CState.ATTACKING)) && (m_attackData.getAttack(m_attack.Frame).ChargeTimeMax > 0)))
                    {
                        if (m_attackData.getAttack(m_attack.Frame).ChargeTime < m_attackData.getAttack(m_attack.Frame).ChargeTimeMax)
                        {
                            this.incrementCharge(m_attack.Frame, m_attack.LinkCharge);
                        };
                        if ((((m_attackData.getAttack(m_attack.Frame).ChargeTime <= 3) && (this.m_cStickUse)) && ((((this.m_a) && (m_attack.AttackType == 1)) || ((this.m_b) && (m_attack.AttackType == 2))) || (this.m_grab))))
                        {
                            this.playGlobalSound("chargeclick");
                            this.m_cStickUse = false;
                            m_attack.LetGo = false;
                        };
                        if (((((((m_attackData.getAttack(m_attack.Frame).ChargeTime >= m_attackData.getAttack(m_attack.Frame).ChargeTimeMax) || (((m_attack.LetGo) && (this.currentStanceFrameIs("charging"))) && (!(this.m_cStickUse)))) || (((this.m_cStickUse) && (m_attackData.getAttack(m_attack.Frame).ChargeTime > 3)) && (this.currentStanceFrameIs("charging")))) && (!(((m_attack.HoldRepeat) && (!(m_attack.LetGo))) && (!(m_attackData.getAttack(m_attack.Frame).ForceUseAtMaxCharge))))) && (!(this.currentStanceFrameIs("attack")))) && (!(this.currentStanceFrameIs("attack2")))))
                        {
                            if (((((this.HoldingItem) && (currentFrameIs("item"))) && (!(this.currentStanceFrameIs("finish")))) && (!(this.currentStanceFrameIs("attack")))))
                            {
                                if (this.m_item.DoingSmash)
                                {
                                    this.stancePlayFrame((this.m_item.Frame + "2_attack"));
                                }
                                else
                                {
                                    this.stancePlayFrame((this.m_item.Frame + "_attack"));
                                };
                                m_attack.ChargeTime = m_attackData.getAttack(m_attack.Frame).ChargeTime;
                            }
                            else
                            {
                                if ((((!(this.currentStanceFrameIs("attack"))) && (!(this.currentStanceFrameIs("attack2")))) && (!(this.currentStanceFrameIs("finish")))))
                                {
                                    m_attack.ChargeTime = m_attackData.getAttack(m_attack.Frame).ChargeTime;
                                    if (((m_attackData.getAttack(m_attack.Frame).ChargeTime >= m_attackData.getAttack(m_attack.Frame).ChargeTimeMax) && (Utils.hasLabel(m_sprite.stance, "attack2"))))
                                    {
                                        this.stancePlayFrame("attack2");
                                    }
                                    else
                                    {
                                        this.stancePlayFrame("attack");
                                    };
                                };
                            };
                        };
                        if (((m_attackData.getAttack(m_attack.Frame).ComboMax >= 1) && (this.currentStanceFrameIs("attack"))))
                        {
                            if (m_attackData.getAttack(m_attack.Frame).ComboMax >= 1)
                            {
                                if (m_attack.ComboTotal < m_attack.ComboMax)
                                {
                                    if ((((!(m_attack.ForceComboContinue)) && ((((((this.m_a) && (m_attack.LetGo)) && (m_attack.AttackType == 1)) || (((this.m_b) && (m_attack.LetGo)) && (m_attack.AttackType == 2))) || ((((m_attack.HoldRepeat) && (this.m_a)) && (m_attack.AttackType == 1)) && (!(m_attack.LetGo)))) || ((((m_attack.HoldRepeat) && (this.m_b)) && (m_attack.AttackType == 2)) && (!(m_attack.LetGo))))) && (getStanceVar("handled", false))))
                                    {
                                        m_attack.ComboTotal++;
                                        this.setStanceVar("continuePlaying", true);
                                        this.setStanceVar("handled", true);
                                        m_attack.LetGo = false;
                                    }
                                    else
                                    {
                                        if ((((m_attack.ForceComboContinue) && ((((this.m_a) && (m_attack.LetGo)) && (m_attack.AttackType == 1)) || (((this.m_b) && (m_attack.LetGo)) && (m_attack.AttackType == 2)))) && (getStanceVar("handled", false))))
                                        {
                                            m_attack.ComboTotal++;
                                            this.setStanceVar("continuePlaying", true);
                                            this.setStanceVar("handled", true);
                                            m_attack.LetGo = false;
                                            if (m_attack.NextComboFrame != null)
                                            {
                                                this.stancePlayFrame(m_attack.NextComboFrame);
                                            }
                                            else
                                            {
                                                this.stancePlayFrame(("combo" + m_attack.ComboTotal));
                                            };
                                        };
                                    };
                                };
                            };
                        };
                        if (((((!(this.m_a)) && (!(this.m_grab))) && (m_attack.AttackType == 1)) || ((!(this.m_b)) && (m_attack.AttackType == 2))))
                        {
                            m_attack.LetGo = true;
                        };
                    }
                    else
                    {
                        if (((this.inState(CState.ATTACKING)) && (m_attackData.getAttack(m_attack.Frame).ComboMax >= 1)))
                        {
                            if ((((!(m_attack.ForceComboContinue)) && ((((((this.m_a) && (m_attack.LetGo)) && (m_attack.AttackType == 1)) || (((this.m_b) && (m_attack.LetGo)) && (m_attack.AttackType == 2))) || ((((m_attack.HoldRepeat) && (this.m_a)) && (m_attack.AttackType == 1)) && (!(m_attack.LetGo)))) || ((((m_attack.HoldRepeat) && (this.m_b)) && (m_attack.AttackType == 2)) && (!(m_attack.LetGo))))) && (getStanceVar("handled", false))))
                            {
                                m_attack.ComboTotal++;
                                if (this.m_down)
                                {
                                };
                                this.setStanceVar("continuePlaying", true);
                                this.setStanceVar("handled", true);
                                m_attack.LetGo = false;
                            }
                            else
                            {
                                if ((((m_attack.ForceComboContinue) && ((((this.m_a) && (m_attack.LetGo)) && (m_attack.AttackType == 1)) || (((this.m_b) && (m_attack.LetGo)) && (m_attack.AttackType == 2)))) && (getStanceVar("handled", false))))
                                {
                                    m_attack.ComboTotal++;
                                    this.setStanceVar("continuePlaying", true);
                                    this.setStanceVar("handled", true);
                                    m_attack.LetGo = false;
                                    if (m_attack.NextComboFrame != null)
                                    {
                                        this.stancePlayFrame(m_attack.NextComboFrame);
                                    }
                                    else
                                    {
                                        this.stancePlayFrame(("combo" + m_attack.ComboTotal));
                                    };
                                };
                            };
                            if (((((!(this.m_a)) && (!(this.m_grab))) && (m_attack.AttackType == 1)) || ((!(this.m_b)) && (m_attack.AttackType == 2))))
                            {
                                m_attack.LetGo = true;
                            };
                        }
                        else
                        {
                            if (this.inState(CState.ATTACKING))
                            {
                                if (((((!(this.m_a)) && (!(this.m_grab))) && (m_attack.AttackType == 1)) || ((!(this.m_b)) && (m_attack.AttackType == 2))))
                                {
                                    m_attack.LetGo = true;
                                };
                                if ((((!(m_attack.SecondaryAttack == null)) && (((!(m_attack.HoldRepeat)) && (((this.m_a) && (m_attack.LetGo)) && (m_attack.AttackType == 1))) || (((this.m_b) && (m_attack.LetGo)) && (m_attack.AttackType == 2)))) || ((m_attack.HoldRepeat) && (((this.m_a) && (m_attack.AttackType == 1)) || ((this.m_b) && (m_attack.AttackType == 2))))))
                                {
                                    this.resetAttackLetGo();
                                    this.stancePlayFrame(m_attack.SecondaryAttack);
                                    m_attack.SecondaryAttack = null;
                                };
                            };
                        };
                    };
                };
            }
            else
            {
                if (this.inState(CState.KIRBY_STAR))
                {
                    this.charAttackCollisionTest();
                };
            };
            if (((this.inState(CState.ATTACKING)) && (this.m_usingSpecialAttack)))
            {
                this.charAttackCollisionTest();
                if (this.m_characterStats.SpecialType != 1)
                {
                    if (((this.m_characterStats.SpecialType == 2) || (this.m_characterStats.SpecialType == 3)))
                    {
                        if (m_attack.ExecTime == 1)
                        {
                            _local_5 = m_sprite.x;
                            _local_6 = m_sprite.y;
                            _local_7 = 0;
                            while (_local_7 < this.m_opponents.length)
                            {
                                _local_8 = STAGEDATA.getPlayer(this.m_opponents[_local_7]);
                                _local_9 = ((m_sprite.x + _local_8.X) / 2);
                                _local_10 = (((m_sprite.y - m_height) + _local_8.Y) / 2);
                                _local_11 = m_currentPlatform;
                                _local_12 = (!(this.testGroundWithCoord(_local_9, _local_10) == null));
                                _local_13 = null;
                                m_currentPlatform = _local_11;
                                if (((((((((((((HasRange) && (!(_local_8.StandBy))) && (!(_local_8.IsCaught))) && (!(_local_8.Invincible))) && (!(_local_8.Dead))) && (!(_local_8.Hanging))) && (!(_local_8.AirDodge))) && (!(_local_8.SidestepDodge))) && ((_local_13 = HitBoxSprite.hitTestArray(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.RANGE), _local_8.CurrentAnimation.getHitBoxes(_local_8.CurrentFrameNum, HitBoxSprite.HIT), Location, _local_8.Location, (!(m_facingForward)), (!(_local_8.FacingForward)), CurrentScale, _local_8.CurrentScale, CurrentRotation, _local_8.CurrentRotation)).length > 0)) && (!((_local_8.Team == m_team_id) && (m_team_id > 0)))) && (!(_local_12))) && (!(_local_8.UsingFinalSmash))))
                                {
                                    _local_8.Capture(m_player_id);
                                    this.m_grabbed.push(_local_8);
                                    m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_GRAB, {
                                        "caller":this,
                                        "grabbed":_local_8
                                    }));
                                    _local_14 = m_sprite.x;
                                    _local_15 = m_sprite.y;
                                    _local_14 = (_local_14 * m_sizeRatio);
                                    _local_15 = (_local_15 * m_sizeRatio);
                                    if (((this.m_characterStats.FSMagnet) && (((m_facingForward) && (m_sprite.x < _local_8.X)) || ((!(m_facingForward)) && (m_sprite.x > _local_8.X)))))
                                    {
                                        _local_5 = _local_8.X;
                                        _local_6 = _local_8.Y;
                                    };
                                    _local_8.MC.x = (_local_8.MC.x + (((m_sprite.x + _local_14) - _local_8.X) / 10));
                                    _local_8.MC.y = (_local_8.MC.y + (((m_sprite.y + _local_15) - _local_8.Y) / 10));
                                };
                                _local_7++;
                            };
                            if (this.m_characterStats.FSMagnet)
                            {
                                m_sprite.x = _local_5;
                                m_sprite.y = _local_6;
                                _local_1 = 0;
                                while (_local_1 < this.m_grabbed.length)
                                {
                                    this.m_grabbed[_local_1].X = m_sprite.x;
                                    this.m_grabbed[_local_1].Y = m_sprite.y;
                                    _local_1++;
                                };
                            };
                            if (this.m_grabbed.length > 0)
                            {
                                m_xSpeed = 0;
                                m_ySpeed = 0;
                            };
                        }
                        else
                        {
                            if (m_attack.ExecTime > 1)
                            {
                                _local_1 = 0;
                                while (_local_1 < this.m_grabbed.length)
                                {
                                    if (((!(HasTouchBox)) && (Math.sqrt((Math.pow((m_sprite.x - this.m_grabbed[_local_1].X), 2) + Math.pow((m_sprite.y - this.m_grabbed[_local_1].Y), 2))) > 2)))
                                    {
                                        _local_16 = 0;
                                        _local_17 = 0;
                                        _local_16 = (_local_16 * m_sizeRatio);
                                        _local_17 = (_local_17 * m_sizeRatio);
                                        this.m_grabbed[_local_1].MC.x = (this.m_grabbed[_local_1].MC.x + (((m_sprite.x + _local_16) - this.m_grabbed[_local_1].X) / 10));
                                        this.m_grabbed[_local_1].MC.y = (this.m_grabbed[_local_1].MC.y + (((m_sprite.y + _local_17) - this.m_grabbed[_local_1].Y) / 10));
                                    }
                                    else
                                    {
                                        this.repositionGrabbedCharacter(_local_1);
                                    };
                                    _local_1++;
                                };
                            };
                        };
                    }
                    else
                    {
                        if (this.m_characterStats.SpecialType == 4)
                        {
                            this.m_transformLimit--;
                            if (this.m_transformLimit > 0)
                            {
                                if (getStanceVar("canTarget", true))
                                {
                                    if (this.m_attachedReticule == null)
                                    {
                                        this.m_attachedReticule = STAGEDATA.attachUniqueMovieHUD((this.m_characterStats.LinkageID + "_targetreticule"));
                                        this.updateColorFilter(this.m_attachedReticule, ((ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)) ? null : m_team_id), this.CostumeName, this.m_costume_id);
                                        _local_19 = new Point((Main.Width / 2), (Main.Height / 2));
                                        this.m_attachedReticule.x = STAGEDATA.HudForegroundRef.globalToLocal(_local_19).x;
                                        this.m_attachedReticule.y = STAGEDATA.HudForegroundRef.globalToLocal(_local_19).y;
                                    };
                                    if ((!(m_attackData.getAttack("special").LockXTarget)))
                                    {
                                        if (((this.m_right) && (!(this.m_left))))
                                        {
                                            this.m_attachedReticule.x = (this.m_attachedReticule.x + 8);
                                        }
                                        else
                                        {
                                            if (((this.m_left) && (!(this.m_right))))
                                            {
                                                this.m_attachedReticule.x = (this.m_attachedReticule.x - 8);
                                            };
                                        };
                                    };
                                    if ((!(m_attackData.getAttack("special").LockYTarget)))
                                    {
                                        if (((this.m_up) && (!(this.m_down))))
                                        {
                                            this.m_attachedReticule.y = (this.m_attachedReticule.y - 8);
                                        }
                                        else
                                        {
                                            if (((this.m_down) && (!(this.m_up))))
                                            {
                                                this.m_attachedReticule.y = (this.m_attachedReticule.y + 8);
                                            };
                                        };
                                    };
                                    _local_18 = STAGEDATA.HudForegroundRef.localToGlobal(new Point(this.m_attachedReticule.x, this.m_attachedReticule.y));
                                    if (_local_18.x < 0)
                                    {
                                        _local_18.x = 0;
                                    };
                                    if (_local_18.x > Main.Width)
                                    {
                                        _local_18.x = Main.Width;
                                    };
                                    if (_local_18.y < 0)
                                    {
                                        _local_18.y = 0;
                                    };
                                    if (_local_18.y > Main.Height)
                                    {
                                        _local_18.y = Main.Height;
                                    };
                                    _local_18 = STAGEDATA.HudForegroundRef.globalToLocal(_local_18);
                                    this.m_attachedReticule.x = _local_18.x;
                                    this.m_attachedReticule.y = _local_18.y;
                                };
                                if (getStanceVar("canShoot", true))
                                {
                                    _local_20 = new Point(this.m_attachedReticule.x, this.m_attachedReticule.y);
                                    if (this.m_a)
                                    {
                                        this.stancePlayFrame("standard_attack");
                                        Utils.tryToGotoAndPlay(this.m_attachedFPS, "standard_attack");
                                        _local_20 = STAGEDATA.HudForegroundRef.localToGlobal(_local_20);
                                        _local_20 = STAGE.globalToLocal(_local_20);
                                        this.fireProjectile("fs_proj_1", _local_20.x, _local_20.y, true);
                                    }
                                    else
                                    {
                                        if (this.m_b)
                                        {
                                            this.stancePlayFrame("special_attack");
                                            Utils.tryToGotoAndPlay(this.m_attachedFPS, "special_attack");
                                            _local_20 = STAGEDATA.HudForegroundRef.localToGlobal(_local_20);
                                            _local_20 = STAGE.globalToLocal(_local_20);
                                            this.fireProjectile("fs_proj_2", _local_20.x, _local_20.y, true);
                                        };
                                    };
                                };
                            }
                            else
                            {
                                if (this.m_attachedReticule != null)
                                {
                                    this.stancePlayFrame("end");
                                    Utils.tryToGotoAndPlay(this.m_attachedFPS, "end");
                                    this.m_attachedFPS = null;
                                    if (this.m_attachedReticule.parent)
                                    {
                                        STAGEDATA.HudForegroundRef.removeChild(this.m_attachedReticule);
                                    };
                                    this.m_attachedReticule = null;
                                    CAM.brighten();
                                };
                            };
                        }
                        else
                        {
                            if (this.m_characterStats.SpecialType == 5)
                            {
                                this.m_transformLimit--;
                                if (this.m_transformLimit <= 0)
                                {
                                    CAM.brighten();
                                };
                            }
                            else
                            {
                                if (this.m_characterStats.SpecialType == 6)
                                {
                                    this.m_transformLimit--;
                                    if (this.m_transformLimit > 0)
                                    {
                                        if (((((this.m_grabbed.length > 0) && (!(STAGEDATA.FSCutscene))) && (!(HasGrabBox))) && (!(this.m_specialInit))))
                                        {
                                            this.m_specialInit = true;
                                            _local_21 = STAGEDATA.WeatherRef;
                                            this.m_attachedFPS = STAGEDATA.attachUniqueMovieWeather((this.m_characterStats.LinkageID + "_hud"));
                                            this.updateColorFilter(this.m_attachedFPS, ((ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)) ? null : m_team_id), this.CostumeName, this.m_costume_id);
                                            _local_22 = new Point((Main.Width / 2), Main.Height);
                                            this.m_attachedFPS.x = _local_21.globalToLocal(_local_22).x;
                                            this.m_attachedFPS.y = _local_21.globalToLocal(_local_22).y;
                                            unnattachFromGround();
                                            _local_23 = true;
                                            _local_24 = 1;
                                            while (_local_24 <= Main.MAXPLAYERS)
                                            {
                                                if (this.m_attachedFPS[("p" + _local_24)] == null)
                                                {
                                                    _local_23 = false;
                                                    break;
                                                };
                                                _local_24++;
                                            };
                                            if (_local_23)
                                            {
                                                _local_25 = 0;
                                                while (_local_25 < this.m_grabbed.length)
                                                {
                                                    if (this.m_grabbed[_local_25].HasStance)
                                                    {
                                                        _local_26 = Main.getLibraryMC(this.m_grabbed[_local_25].LinkageName);
                                                        this.updateColorFilter(_local_26, ((ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)) ? null : this.m_grabbed[_local_25].Team), this.m_grabbed[_local_25].CostumeName, this.m_grabbed[_local_25].CostumeID);
                                                        Utils.tryToGotoAndStop(_local_26, "hurt");
                                                        _local_26.bypassTicker = true;
                                                        _local_26.scaleX = 2;
                                                        _local_26.scaleY = 2;
                                                        this.m_attachedFPS[("p" + this.m_grabbed[_local_25].ID)].addChild(_local_26);
                                                    };
                                                    _local_25++;
                                                };
                                            };
                                            STAGEDATA.triggerFSCutscene();
                                        };
                                        if (this.m_grabbed.length > 0)
                                        {
                                            _local_27 = 0;
                                            while (_local_27 < this.m_grabbed.length)
                                            {
                                                this.repositionGrabbedCharacter(_local_27);
                                                _local_27++;
                                            };
                                        };
                                    }
                                    else
                                    {
                                        this.m_attachedFPS = null;
                                        STAGEDATA.killFSCutscene();
                                        CAM.brighten();
                                    };
                                };
                            };
                        };
                    };
                };
            };
            if (((!(this.inState(CState.JUMP_CHAMBER))) && ((((this.m_c_up) || (this.m_c_down)) || (this.m_c_left)) || (this.m_c_right))))
            {
                this.m_cStickLetGo = false;
            };
        }

        private function performAttackChecks():void
        {
            var _local_1:int;
            var _local_2:HitBoxSprite;
            var _local_3:Number;
            var _local_4:Boolean;
            var _local_5:Number;
            var _local_6:String;
            var _local_7:Number;
            var _local_8:String;
            var _local_9:Boolean;
            var _local_10:Boolean;
            var _local_11:Boolean;
            var _local_12:Boolean;
            var _local_13:Number;
            var _local_14:Vector.<HitBoxCollisionResult>;
            var _local_15:Character;
            var _local_16:Item;
            var _local_17:TargetTestTarget;
            _local_1 = 0;
            if ((((this.inState(CState.ATTACKING)) && ((currentFrameIs("stand")) || (currentFrameIs("fall")))) && (m_attack.ExecTime > 1)))
            {
                this.forceEndAttack();
            };
            if (((((this.inState(CState.ATTACKING)) && (!(m_collision.ground))) && (m_attack.CancelWhenAirborne)) && ((!(m_attack.IsAirAttack)) || ((m_attack.IsAirAttack) && (m_attack.HasLanded)))))
            {
                this.forceEndAttack();
            };
            if (((this.inState(CState.ATTACKING)) && (HasCamBox)))
            {
                _local_2 = this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.CAM)[0];
                if (((m_sprite.camOverride) && (m_sprite.camOverride is Rectangle)))
                {
                    m_sprite.camOverride.x = _local_2.x;
                    m_sprite.camOverride.y = _local_2.y;
                    m_sprite.camOverride.width = _local_2.width;
                    m_sprite.camOverride.height = _local_2.height;
                }
                else
                {
                    m_sprite.camOverride = new Rectangle(_local_2.x, _local_2.y, _local_2.width, _local_2.height);
                };
            }
            else
            {
                m_sprite.camOverride = null;
            };
            if (((this.inState(CState.ATTACKING)) && (m_attack.Rotate)))
            {
                _local_3 = Utils.getAngleBetween(new Point(), new Point(m_xSpeed, m_ySpeed));
                _local_3 = Utils.forceBase360(((m_facingForward) ? -(_local_3) : (-(_local_3) + 180)));
                m_sprite.rotation = _local_3;
            }
            else
            {
                if ((((this.inState(CState.ATTACKING)) && (m_collision.ground)) && ((m_attack.Frame == "a_forward") || (m_attack.IsThrow))))
                {
                    this.m_calcGroundAngle();
                };
            };
            if (((this.inState(CState.ATTACKING)) && (((!(m_collision.ground)) && (m_attack.AllowControl)) || (((m_collision.ground) && (m_attack.AllowControl)) && (m_attack.AllowControlGround)))))
            {
                if (m_collision.ground)
                {
                    if (((this.m_right) && (!(this.m_left))))
                    {
                        if (m_attack.XSpeedAccel != 0)
                        {
                            if ((!(this.m_runningSpeedLevel)))
                            {
                                m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_norm_xSpeed) ? m_attack.XSpeedAccel : 0));
                            }
                            else
                            {
                                m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_max_xSpeed) ? m_attack.XSpeedAccel : 0));
                            };
                        }
                        else
                        {
                            if ((!(this.m_runningSpeedLevel)))
                            {
                                m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_norm_xSpeed) ? (this.m_characterStats.AccelRate * m_currentPlatform.accel_friction) : 0));
                            }
                            else
                            {
                                m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_max_xSpeed) ? (this.m_characterStats.AccelRate * m_currentPlatform.accel_friction) : 0));
                            };
                        };
                        if ((!(((m_collision.ground) && (!(m_attack.CanFallOff))) && (!(willFallOffRange((m_sprite.x + m_xSpeed), m_sprite.y))))))
                        {
                            this.m_attemptToMove(m_xSpeed, 0);
                        };
                    }
                    else
                    {
                        if (((this.m_left) && (!(this.m_right))))
                        {
                            if (m_attack.XSpeedAccel != 0)
                            {
                                if ((!(this.m_runningSpeedLevel)))
                                {
                                    m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_norm_xSpeed)) ? m_attack.XSpeedAccel : 0));
                                }
                                else
                                {
                                    m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_max_xSpeed)) ? m_attack.XSpeedAccel : 0));
                                };
                            }
                            else
                            {
                                if ((!(this.m_runningSpeedLevel)))
                                {
                                    m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_norm_xSpeed)) ? (this.m_characterStats.AccelRate * m_currentPlatform.accel_friction) : 0));
                                }
                                else
                                {
                                    m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_max_xSpeed)) ? (this.m_characterStats.AccelRate * m_currentPlatform.accel_friction) : 0));
                                };
                            };
                            if ((!(((m_collision.ground) && (!(m_attack.CanFallOff))) && (!(willFallOffRange((m_sprite.x + m_xSpeed), m_sprite.y))))))
                            {
                                this.m_attemptToMove(m_xSpeed, 0);
                            };
                        };
                    };
                }
                else
                {
                    if (((this.m_right) && (!(this.m_left))))
                    {
                        if (this.m_runningSpeedLevel)
                        {
                            if (m_attack.XSpeedAccelAir != 0)
                            {
                                m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_characterStats.MaxJumpSpeed) ? m_attack.XSpeedAccelAir : 0));
                            }
                            else
                            {
                                m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_characterStats.MaxJumpSpeed) ? this.m_characterStats.AccelRateAir : 0));
                            };
                        }
                        else
                        {
                            if (m_attack.XSpeedAccelAir != 0)
                            {
                                m_xSpeed = (m_xSpeed + ((m_xSpeed < (this.m_characterStats.MaxJumpSpeed / 2)) ? m_attack.XSpeedAccelAir : 0));
                            }
                            else
                            {
                                m_xSpeed = (m_xSpeed + ((m_xSpeed < (this.m_characterStats.MaxJumpSpeed / 2)) ? this.m_characterStats.AccelRateAir : 0));
                            };
                        };
                    }
                    else
                    {
                        if (((this.m_left) && (!(this.m_right))))
                        {
                            if (this.m_runningSpeedLevel)
                            {
                                if (m_attack.XSpeedAccelAir != 0)
                                {
                                    m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_characterStats.MaxJumpSpeed)) ? m_attack.XSpeedAccelAir : 0));
                                }
                                else
                                {
                                    m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_characterStats.MaxJumpSpeed)) ? this.m_characterStats.AccelRateAir : 0));
                                };
                            }
                            else
                            {
                                if (m_attack.XSpeedAccelAir != 0)
                                {
                                    m_xSpeed = (m_xSpeed - ((m_xSpeed > (-(this.m_characterStats.MaxJumpSpeed) / 2)) ? m_attack.XSpeedAccelAir : 0));
                                }
                                else
                                {
                                    m_xSpeed = (m_xSpeed - ((m_xSpeed > (-(this.m_characterStats.MaxJumpSpeed) / 2)) ? this.m_characterStats.AccelRateAir : 0));
                                };
                            };
                        };
                    };
                };
                if (((m_attack.XSpeedCap >= 0) && (Utils.fastAbs(m_xSpeed) > m_attack.XSpeedCap)))
                {
                    m_xSpeed = ((m_xSpeed > 0) ? m_attack.XSpeedCap : -(m_attack.XSpeedCap));
                };
            };
            if ((((((this.inState(CState.ATTACKING)) && (m_collision.ground)) && (m_attack.AllowJump)) && (((this.jumpIsPressed()) && (this.m_jumpFullyReleased)) || (this.m_bufferedAttackJump))) && (!(isHitStunOrParalysis()))))
            {
                if (m_attack.JumpCancelAttack)
                {
                    this.forceEndAttack();
                    this.jumpChamber();
                    this.resetSmashTimers();
                    this.m_charAttack();
                }
                else
                {
                    unnattachFromGround();
                    m_ySpeed = ((this.m_down) ? (-(this.m_characterStats.JumpSpeed) * 0.6) : -(this.m_characterStats.JumpSpeed));
                    if (this.m_charIsFull)
                    {
                        m_ySpeed = (m_ySpeed / 2);
                    };
                    this.m_jumpLetGo = false;
                    this.m_tapJumpLetGo = false;
                    this.m_jumpFullyReleased = false;
                    this.resetRotation();
                    Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                    this.attachJumpEffect();
                    this.m_jumpEffectTimer.reset();
                };
            };
            if ((((((((this.inState(CState.ATTACKING)) && (!(m_collision.ground))) && (this.m_jumpSpeedMidairDelay.IsComplete)) && (m_attack.AllowDoubleJump)) && (this.m_jumpCount < this.m_characterStats.MaxJump)) && (((this.jumpIsPressed()) && (this.m_jumpFullyReleased)) || (this.m_bufferedAttackJump))) && (!(isHitStunOrParalysis()))))
            {
                this.m_jumpSpeedMidairDelay.reset();
                this.m_jumpCount++;
                this.m_tapJumpLetGo = false;
                this.m_jumpLetGo = false;
                this.m_jumpFullyReleased = false;
                unnattachFromGround();
                m_ySpeed = -(this.m_characterStats.JumpSpeedMidAir);
                if (this.m_charIsFull)
                {
                    m_ySpeed = (m_ySpeed / 2);
                };
                this.resetRotation();
                Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                if (this.m_midAirJumpConstantTime.MaxTime > 0)
                {
                    this.m_midAirJumpConstantTime.reset();
                };
                if (m_attack.DoubleJumpCancelAttack)
                {
                    this.forceEndAttack();
                    this.initMidairJump();
                };
            };
            if ((((((((this.inState(CState.ATTACKING)) && ((this.jumpIsPressed()) && (this.m_jumpFullyReleased))) && (m_actionShot)) && (!(m_paralysis))) && (m_attack.AllowJump)) && (m_collision.ground)) && (this.m_jumpCount < this.m_characterStats.MaxJump)))
            {
                this.m_bufferedAttackJump = true;
            };
            if (((this.inState(CState.ATTACKING)) && (m_attack.AllowRun)))
            {
                if ((((m_collision.ground) && (getStanceVar("action", "standing"))) && ((!(m_xSpeed == 0)) || (!(this.m_right == this.m_left)))))
                {
                    this.stancePlayFrame("moving");
                }
                else
                {
                    if ((((m_collision.ground) && (getStanceVar("action", "moving"))) && (m_xSpeed == 0)))
                    {
                        this.stancePlayFrame("standing");
                    }
                    else
                    {
                        if ((((m_attack.AllowJump) && (!(m_collision.ground))) && (m_attack.IsAirAttack)))
                        {
                            if (((getStanceVar("action", "rising")) && (m_ySpeed > 0)))
                            {
                                this.stancePlayFrame("falling");
                            };
                        };
                    };
                };
                _local_4 = (m_xSpeed > 0);
                if (((!(m_collision.ground)) && (!(this.m_right == this.m_left))))
                {
                    if (this.m_right)
                    {
                        if (m_attack.XSpeedAccelAir != 0)
                        {
                            if ((!(this.m_runningSpeedLevel)))
                            {
                                m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_norm_xSpeed) ? m_attack.XSpeedAccelAir : 0));
                            }
                            else
                            {
                                m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_max_xSpeed) ? m_attack.XSpeedAccelAir : 0));
                            };
                        }
                        else
                        {
                            if ((!(this.m_runningSpeedLevel)))
                            {
                                m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_norm_xSpeed) ? this.m_characterStats.AccelRateAir : 0));
                            }
                            else
                            {
                                m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_max_xSpeed) ? m_attack.XSpeedAccelAir : 0));
                            };
                        };
                    }
                    else
                    {
                        if (m_attack.XSpeedAccelAir != 0)
                        {
                            if ((!(this.m_runningSpeedLevel)))
                            {
                                m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_norm_xSpeed)) ? m_attack.XSpeedAccelAir : 0));
                            }
                            else
                            {
                                m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_max_xSpeed)) ? m_attack.XSpeedAccelAir : 0));
                            };
                        }
                        else
                        {
                            if ((!(this.m_runningSpeedLevel)))
                            {
                                m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_norm_xSpeed)) ? this.m_characterStats.AccelRateAir : 0));
                            }
                            else
                            {
                                m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_max_xSpeed)) ? this.m_characterStats.AccelRateAir : 0));
                            };
                        };
                    };
                }
                else
                {
                    if (((m_collision.ground) && (!(this.m_right == this.m_left))))
                    {
                        if (m_attack.XSpeedAccel != 0)
                        {
                            if (this.m_right)
                            {
                                if ((!(this.m_runningSpeedLevel)))
                                {
                                    m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_norm_xSpeed) ? m_attack.XSpeedAccel : 0));
                                }
                                else
                                {
                                    m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_max_xSpeed) ? m_attack.XSpeedAccel : 0));
                                };
                            }
                            else
                            {
                                if ((!(this.m_runningSpeedLevel)))
                                {
                                    m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_norm_xSpeed)) ? m_attack.XSpeedAccel : 0));
                                }
                                else
                                {
                                    m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_max_xSpeed)) ? m_attack.XSpeedAccel : 0));
                                };
                            };
                        }
                        else
                        {
                            if (this.m_right)
                            {
                                if ((!(this.m_runningSpeedLevel)))
                                {
                                    m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_norm_xSpeed) ? (this.m_characterStats.AccelRate * m_currentPlatform.accel_friction) : 0));
                                }
                                else
                                {
                                    m_xSpeed = (m_xSpeed + ((m_xSpeed < this.m_max_xSpeed) ? (this.m_characterStats.AccelRate * m_currentPlatform.accel_friction) : 0));
                                };
                            }
                            else
                            {
                                if ((!(this.m_runningSpeedLevel)))
                                {
                                    m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_norm_xSpeed)) ? (this.m_characterStats.AccelRate * m_currentPlatform.accel_friction) : 0));
                                }
                                else
                                {
                                    m_xSpeed = (m_xSpeed - ((m_xSpeed > -(this.m_max_xSpeed)) ? (this.m_characterStats.AccelRate * m_currentPlatform.accel_friction) : 0));
                                };
                            };
                        };
                        if ((((!(_local_4)) && (m_xSpeed > 0)) || ((_local_4) && (m_xSpeed < 0))))
                        {
                            m_xSpeed = ((this.m_right) ? (this.m_characterStats.AccelStart * this.m_norm_xSpeed) : (this.m_characterStats.AccelStart * -(this.m_norm_xSpeed)));
                            if (((Utils.hasLabel(m_sprite.stance, "turn")) && (!(m_sprite.stance.currentLabel == "turn"))))
                            {
                                this.stancePlayFrame("turn");
                            };
                        };
                    };
                };
                if (((m_attack.XSpeedCap >= 0) && (Utils.fastAbs(m_xSpeed) > m_attack.XSpeedCap)))
                {
                    m_xSpeed = ((m_xSpeed > 0) ? m_attack.XSpeedCap : -(m_attack.XSpeedCap));
                }
                else
                {
                    if (((!(this.m_runningSpeedLevel)) && (Utils.fastAbs(m_xSpeed) > this.m_norm_xSpeed)))
                    {
                        m_xSpeed = ((m_xSpeed > 0) ? this.m_norm_xSpeed : -(this.m_norm_xSpeed));
                    };
                };
                this.resetRotation();
                Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                if ((((m_collision.ground) && (!(this.inState(CState.CAUGHT)))) && (!(this.inState(CState.BARREL)))))
                {
                    attachToGround();
                };
            };
            if (((this.inState(CState.ATTACKING)) && (!((!(this.m_left == this.m_right)) && ((((!(m_collision.ground)) && (m_attack.AllowControl)) || (((m_collision.ground) && (m_attack.AllowControl)) && (m_attack.AllowControlGround))) || (m_attack.AllowRun))))))
            {
                if (m_collision.ground)
                {
                    if (m_attack.XSpeedDecay == 0)
                    {
                        decel(this.m_characterStats.DecelRate);
                    }
                    else
                    {
                        decel(m_attack.XSpeedDecay);
                    };
                }
                else
                {
                    if (m_attack.XSpeedDecayAir == 0)
                    {
                        decel(this.m_characterStats.DecelRateAir);
                    }
                    else
                    {
                        decel(m_attack.XSpeedDecayAir);
                    };
                };
            };
            if (((((this.inState(CState.ATTACKING)) && (m_attack.AllowTurn)) && (m_collision.ground)) && (!(m_sprite.stance.currentLabel == "turn"))))
            {
                if ((((this.m_right) && (!(this.m_left))) && (!(m_facingForward))))
                {
                    this.m_faceRight();
                    m_attack.IsForward = true;
                    if (((Utils.hasLabel(m_sprite.stance, "turn")) && (!(m_sprite.stance.currentLabel == "turn"))))
                    {
                        this.stancePlayFrame("turn");
                    };
                }
                else
                {
                    if ((((this.m_left) && (!(this.m_right))) && (m_facingForward)))
                    {
                        this.m_faceLeft();
                        m_attack.IsForward = false;
                    };
                };
            };
            if (((this.inState(CState.ATTACKING)) && (m_attack.LinkFrames)))
            {
                if (((!(m_collision.ground)) && (!(m_attack.IsAirAttack))))
                {
                    m_attack.IsAirAttack = true;
                    _local_5 = m_attackData.getAttack(m_attack.Frame).ChargeTime;
                    m_attack.Frame = (m_attack.Frame + "_air");
                    m_attackData.getAttack(m_attack.Frame).OverrideMap.clear();
                    m_attackData.setAttackVar(m_attack.Frame, "chargetime", _local_5);
                    m_attack.LinkCharge = m_attackData.getAttack(m_attack.Frame).LinkCharge;
                    _local_6 = ((HasStance) ? m_sprite.stance.xframe : null);
                    this.playFrame(m_attack.Frame);
                    if ((((HasStance) && (!(_local_6 == null))) && (Utils.hasLabel(m_sprite.stance, _local_6))))
                    {
                        this.stancePlayFrame(_local_6);
                    };
                }
                else
                {
                    if (((m_collision.ground) && (m_attack.IsAirAttack)))
                    {
                        m_attack.IsAirAttack = false;
                        _local_7 = m_attackData.getAttack(m_attack.Frame).ChargeTime;
                        m_attack.Frame = m_attack.Frame.substring(0, m_attack.Frame.lastIndexOf("_"));
                        m_attackData.getAttack(m_attack.Frame).OverrideMap.clear();
                        m_attackData.setAttackVar(m_attack.Frame, "chargetime", _local_7);
                        m_attack.LinkCharge = m_attackData.getAttack(m_attack.Frame).LinkCharge;
                        _local_8 = ((HasStance) ? m_sprite.stance.xframe : null);
                        this.playFrame(m_attack.Frame);
                        if ((((HasStance) && (!(_local_8 == null))) && (Utils.hasLabel(m_sprite.stance, _local_8))))
                        {
                            this.stancePlayFrame(_local_8);
                        };
                    };
                };
            };
            if (this.inState(CState.ATTACKING))
            {
                m_attack.XLoc = MC.x;
                m_attack.YLoc = MC.y;
                if ((((m_attack.Cancel) && ((m_attack.LetGo) && (((this.m_a) && (m_attack.AttackType == 1)) || ((this.m_b) && (m_attack.AttackType == 2))))) && (getStanceVar("waiting", true))))
                {
                    m_ySpeed = ((m_collision.ground) ? 0 : -4);
                    m_attack.Cancel = false;
                    m_attack.WasCancelled = true;
                    this.stancePlayFrame("finish");
                };
                if ((((m_attack.AirCancel) && (((this.m_a) && (m_attack.LetGo)) || (((((this.m_c_up) || (this.m_c_down)) || (this.m_c_left)) || (this.m_c_right)) && (this.m_cStickLetGo)))) && (!(m_collision.ground))))
                {
                    _local_9 = ((((((this.m_up) && (!(this.m_c_up))) && (!(this.m_c_down))) && (!(this.m_c_left))) && (!(this.m_c_right))) || (this.m_c_up));
                    _local_10 = ((((((this.m_down) && (!(this.m_c_up))) && (!(this.m_c_down))) && (!(this.m_c_left))) && (!(this.m_c_right))) || (this.m_c_down));
                    _local_11 = ((((((this.m_left) && (!(this.m_c_up))) && (!(this.m_c_down))) && (!(this.m_c_left))) && (!(this.m_c_right))) || (this.m_c_left));
                    _local_12 = ((((((this.m_right) && (!(this.m_c_up))) && (!(this.m_c_down))) && (!(this.m_c_left))) && (!(this.m_c_right))) || (this.m_c_right));
                    if ((((((_local_11) && (!(_local_12))) && (!(m_facingForward))) && (!((this.HoldingItem) && (this.m_item.UseInAir)))) || ((((_local_12) && (!(_local_11))) && (m_facingForward)) && (!((this.HoldingItem) && (this.m_item.UseInAir))))))
                    {
                        if (m_attack.DisableJump)
                        {
                            this.m_jumpCount = this.m_characterStats.MaxJump;
                        };
                        if (((this.HoldingItem) && (this.m_item.Ability == "toss")))
                        {
                            this.endAttack();
                            this.normalItemToss();
                        }
                        else
                        {
                            this.Attack("a_air_forward", 1);
                        };
                    }
                    else
                    {
                        if ((((((_local_11) && (!(_local_12))) && (m_facingForward)) && (!((this.HoldingItem) && (this.m_item.UseInAir)))) || ((((_local_12) && (!(_local_11))) && (!(m_facingForward))) && (!((this.HoldingItem) && (this.m_item.UseInAir))))))
                        {
                            if (m_attack.DisableJump)
                            {
                                this.m_jumpCount = this.m_characterStats.MaxJump;
                            };
                            if (((this.HoldingItem) && (this.m_item.Ability == "toss")))
                            {
                                this.endAttack();
                                this.normalItemToss();
                            }
                            else
                            {
                                this.Attack("a_air_backward", 1);
                            };
                        }
                        else
                        {
                            if (((_local_10) && (!((this.HoldingItem) && (this.m_item.UseInAir)))))
                            {
                                if (m_attack.DisableJump)
                                {
                                    this.m_jumpCount = this.m_characterStats.MaxJump;
                                };
                                if (((this.HoldingItem) && (this.m_item.Ability == "toss")))
                                {
                                    this.endAttack();
                                    this.normalItemToss();
                                }
                                else
                                {
                                    this.Attack("a_air_down", 1);
                                };
                            }
                            else
                            {
                                if (((_local_9) && (!((this.HoldingItem) && (this.m_item.UseInAir)))))
                                {
                                    if (m_attack.DisableJump)
                                    {
                                        this.m_jumpCount = this.m_characterStats.MaxJump;
                                    };
                                    if (((this.HoldingItem) && (this.m_item.Ability == "toss")))
                                    {
                                        this.endAttack();
                                        this.normalItemToss();
                                    }
                                    else
                                    {
                                        this.Attack("a_air_up", 1);
                                    };
                                }
                                else
                                {
                                    if ((!((this.HoldingItem) && (this.m_item.UseInAir))))
                                    {
                                        if (m_attack.DisableJump)
                                        {
                                            this.m_jumpCount = this.m_characterStats.MaxJump;
                                        };
                                        this.Attack("a_air", 1);
                                    }
                                    else
                                    {
                                        if (((this.HoldingItem) && (this.m_item.UseInAir)))
                                        {
                                            this.m_item.AttackStateData.Frame = Item.ATTACK_NEUTRAL;
                                            this.m_useItem();
                                        };
                                    };
                                };
                            };
                        };
                    };
                }
                else
                {
                    if (((((m_attack.AirCancelSpecial) && (this.m_b)) && (m_attack.LetGo)) && (!(m_collision.ground))))
                    {
                        if (((((this.m_left) && (!(this.m_right))) && (!(m_facingForward))) || (((this.m_right) && (!(this.m_left))) && (m_facingForward))))
                        {
                            if (m_attack.DisableJump)
                            {
                                this.m_jumpCount = this.m_characterStats.MaxJump;
                            };
                            this.Attack("b_forward_air", 2);
                        }
                        else
                        {
                            if (((((this.m_left) && (!(this.m_right))) && (m_facingForward)) || (((this.m_right) && (!(this.m_left))) && (!(m_facingForward)))))
                            {
                                if (m_facingForward)
                                {
                                    this.m_faceLeft();
                                }
                                else
                                {
                                    this.m_faceRight();
                                };
                                if (m_attack.DisableJump)
                                {
                                    this.m_jumpCount = this.m_characterStats.MaxJump;
                                };
                                this.Attack("b_forward_air", 2);
                            }
                            else
                            {
                                if (this.m_down)
                                {
                                    if (m_attack.DisableJump)
                                    {
                                        this.m_jumpCount = this.m_characterStats.MaxJump;
                                    };
                                    this.Attack("b_down_air", 2);
                                }
                                else
                                {
                                    if (this.m_up)
                                    {
                                        if (m_attack.DisableJump)
                                        {
                                            this.m_jumpCount = this.m_characterStats.MaxJump;
                                        };
                                        this.Attack("b_up_air", 2);
                                    }
                                    else
                                    {
                                        if (m_attack.DisableJump)
                                        {
                                            this.m_jumpCount = this.m_characterStats.MaxJump;
                                        };
                                        this.neutralSpecialFlipCheck("b_air");
                                        this.Attack("b_air", 2);
                                    };
                                };
                            };
                        };
                    };
                };
                if (HasHoming)
                {
                    if (m_attack.HomingTarget == null)
                    {
                        _local_13 = 99999999;
                        _local_14 = null;
                        _local_15 = null;
                        _local_16 = null;
                        _local_17 = null;
                        m_attack.HomingTarget = null;
                        _local_1 = 0;
                        while (((_local_1 < STAGEDATA.ItemsRef.MAXITEMS) && (m_attack.HomingTarget == null)))
                        {
                            _local_16 = STAGEDATA.ItemsRef.ItemsInUse[_local_1];
                            if (((((!(_local_16 == null)) && (!(_local_16.MC.hitBox == null))) && (_local_16.IsSmashBall)) && ((_local_14 = HitBoxSprite.hitTestArray(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.HOMING), _local_16.CurrentAnimation.getHitBoxes(_local_16.CurrentFrameNum, HitBoxSprite.HIT), Location, _local_16.Location, (!(m_facingForward)), (!(_local_16.FacingForward)), CurrentScale, _local_16.CurrentScale, CurrentRotation, _local_16.CurrentRotation)).length > 0)))
                            {
                                m_attack.HomingTarget = _local_16;
                                m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HOMING_TARGET, {
                                    "caller":this,
                                    "target":_local_16,
                                    "type":"Item"
                                }));
                            };
                            _local_1++;
                        };
                        _local_1 = 0;
                        while (_local_1 < this.m_opponents.length)
                        {
                            _local_15 = STAGEDATA.getPlayer(this.m_opponents[_local_1]);
                            if (((((((((!(_local_15.StandBy)) && (!(_local_15.Revival))) && (!(_local_15.AirDodge))) && (_local_15.HasHitBox)) && (!(_local_15.Dead))) && (!(_local_15.Invincible))) && ((m_attack.HomingTarget == null) || (this.getDistanceFrom(m_attack.HomingTarget.X, m_attack.HomingTarget.Y) < _local_13))) && ((_local_14 = HitBoxSprite.hitTestArray(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.HOMING), _local_15.CurrentAnimation.getHitBoxes(_local_15.CurrentFrameNum, HitBoxSprite.HIT), Location, _local_15.Location, (!(m_facingForward)), (!(_local_15.FacingForward)), CurrentScale, _local_15.CurrentScale, CurrentRotation, _local_15.CurrentRotation)).length > 0)))
                            {
                                m_attack.HomingTarget = _local_15;
                                _local_13 = this.getDistanceFrom(m_attack.HomingTarget.X, m_attack.HomingTarget.Y);
                                m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HOMING_TARGET, {
                                    "caller":this,
                                    "target":_local_15,
                                    "type":"Character"
                                }));
                            };
                            _local_1++;
                        };
                        _local_1 = 0;
                        while (_local_1 < STAGEDATA.Targets.length)
                        {
                            _local_17 = STAGEDATA.Targets[_local_1];
                            if ((((!(_local_17.Broken)) && ((m_attack.HomingTarget == null) || (this.getDistanceFrom(m_attack.HomingTarget.X, m_attack.HomingTarget.Y) < _local_13))) && ((_local_14 = HitBoxSprite.hitTestArray(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.HOMING), _local_17.CurrentAnimation.getHitBoxes(_local_17.CurrentFrameNum, HitBoxSprite.HIT), Location, _local_17.Location, (!(m_facingForward)), (!(_local_17.FacingForward)), CurrentScale, _local_17.CurrentScale, CurrentRotation, _local_17.CurrentRotation)).length > 0)))
                            {
                                m_attack.HomingTarget = _local_17;
                                _local_13 = this.getDistanceFrom(m_attack.HomingTarget.X, m_attack.HomingTarget.Y);
                                m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HOMING_TARGET, {
                                    "caller":this,
                                    "target":_local_17,
                                    "type":"Target"
                                }));
                            };
                            _local_1++;
                        };
                    };
                };
                if (((this.inState(CState.ATTACKING)) && (m_attack.Frame == "item")))
                {
                    this.updateItemHolding();
                };
            };
            if (((!(this.inState(CState.ATTACKING))) && (!(this.inState(CState.KIRBY_STAR)))))
            {
                this.charAttackCollisionTest();
            };
        }

        private function attachCeilingBounceEffect(_arg_1:Boolean, _arg_2:Boolean):void
        {
            var _local_3:MovieClip;
            _local_3 = STAGEDATA.attachEffectOverlay("ground_bounce");
            _local_3.rotation = 180;
            _local_3.width = (_local_3.width * m_sizeRatio);
            _local_3.height = (_local_3.height * m_sizeRatio);
            _local_3.x = OverlayX;
            _local_3.y = (OverlayY - m_height);
            if (_arg_2)
            {
                _local_3.rotation = (_local_3.rotation + ((_arg_1) ? 45 : -45));
            };
        }

        private function attachGroundBounceEffect():void
        {
            var _local_1:MovieClip;
            _local_1 = STAGEDATA.attachEffectOverlay("ground_bounce");
            _local_1.width = (_local_1.width * m_sizeRatio);
            _local_1.height = (_local_1.height * m_sizeRatio);
            _local_1.x = OverlayX;
            _local_1.y = OverlayY;
        }

        private function attachWallBounceEffect(_arg_1:Boolean, _arg_2:Boolean):void
        {
            var _local_3:MovieClip;
            _local_3 = STAGEDATA.attachEffectOverlay("ground_bounce");
            _local_3.rotation = ((!(_arg_1)) ? 90 : 270);
            _local_3.width = (_local_3.width * m_sizeRatio);
            _local_3.height = (_local_3.height * m_sizeRatio);
            _local_3.x = (OverlayX + ((!(this.m_flyingRight)) ? ((-(m_width) / 2) * m_sizeRatio) : ((m_width / 2) * m_sizeRatio)));
            _local_3.y = (OverlayY - (m_height / 2));
            if (_arg_2)
            {
                _local_3.rotation = (_local_3.rotation + ((_arg_1) ? 45 : -45));
            };
        }

        private function attachJumpEffect():void
        {
            var _local_1:MovieClip;
            _local_1 = STAGEDATA.attachEffectOverlay("effect_jump");
            _local_1.width = (_local_1.width * m_sizeRatio);
            _local_1.height = (_local_1.height * m_sizeRatio);
            _local_1.alpha = 0.75;
            if ((!(m_facingForward)))
            {
                _local_1.scaleX = -(Utils.fastAbs(_local_1.scaleX));
            };
            _local_1.x = OverlayX;
            _local_1.y = OverlayY;
        }

        private function attachJumpMidairEffect():void
        {
            var _local_1:MovieClip;
            _local_1 = STAGEDATA.attachEffectOverlay("effect_doublejump");
            _local_1.width = (_local_1.width * m_sizeRatio);
            _local_1.height = (_local_1.height * m_sizeRatio);
            _local_1.alpha = 0.75;
            if ((!(m_facingForward)))
            {
                _local_1.scaleX = -(Utils.fastAbs(_local_1.scaleX));
            };
            _local_1.x = OverlayX;
            _local_1.y = OverlayY;
        }

        private function attachRunEffect():void
        {
            var _local_1:MovieClip;
            _local_1 = STAGEDATA.attachEffectOverlay("effect_run");
            _local_1.width = (_local_1.width * m_sizeRatio);
            _local_1.height = (_local_1.height * m_sizeRatio);
            _local_1.alpha = 0.75;
            if ((!(m_facingForward)))
            {
                _local_1.scaleX = (_local_1.scaleX * -1);
            };
            _local_1.x = OverlayX;
            _local_1.y = OverlayY;
        }

        private function attachLandEffect():void
        {
            var _local_1:MovieClip;
            _local_1 = STAGEDATA.attachEffectOverlay("effect_land");
            _local_1.width = (_local_1.width * m_sizeRatio);
            _local_1.height = (_local_1.height * m_sizeRatio);
            _local_1.alpha = 0.75;
            if ((!(m_facingForward)))
            {
                _local_1.scaleX = (_local_1.scaleX * -1);
            };
            _local_1.x = OverlayX;
            _local_1.y = OverlayY;
        }

        private function forceEndAttack():void
        {
            var _local_1:AttackObject;
            var _local_2:int;
            if (m_state == CState.ATTACKING)
            {
                m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_ATTACK_COMPLETE, {"caller":this}));
            };
            _local_1 = m_attackData.getAttack(m_attack.Frame);
            this.turnOffInvincibility();
            if (this.inState(CState.ATTACKING))
            {
                if (_local_1)
                {
                    _local_1.OverrideMap.clear();
                };
                this.killSmashTimers();
                if ((!(m_collision.ground)))
                {
                    if (this.m_attackHovering)
                    {
                        this.setState(CState.HOVER);
                    }
                    else
                    {
                        this.setState(CState.JUMP_FALLING);
                    };
                }
                else
                {
                    this.m_attackHovering = false;
                };
                if (this.m_usingSpecialAttack)
                {
                    STAGEDATA.killFSCutscene();
                    this.m_hasFinalSmash = false;
                    if (this.m_item2 != null)
                    {
                        this.m_item2.destroy();
                    };
                    this.m_item2 = null;
                    CAM.brighten();
                };
                m_attack.LetGo = false;
                this.m_justReleased = false;
                if (m_attack.Rocket)
                {
                    m_attack.Rocket = false;
                };
                if (((m_attack.Frame == "item") && (!(this.m_item == null))))
                {
                    this.m_item.CurrentAttackState.IsAttacking = false;
                };
                if ((!(this.m_charIsFull)))
                {
                    this.releaseOpponent();
                };
                this.m_attackDelay = m_attack.AttackDelay;
                if (((!(m_collision.ground)) && (m_attack.DisableJump)))
                {
                    this.m_jumpCount = this.m_characterStats.MaxJump;
                };
                m_attack.Frame = null;
                if (((this.m_usingSpecialAttack) && ((this.m_characterStats.SpecialType == 2) || (this.m_characterStats.SpecialType == 3))))
                {
                    this.releaseOpponent();
                };
                if (this.inState(CState.GRABBING))
                {
                    this.releaseOpponent();
                };
                this.m_usingSpecialAttack = false;
                if (STAGEPARENT.getChildByName(("energy" + m_player_id)) != null)
                {
                    STAGEPARENT.removeChild(STAGEPARENT.getChildByName(("energy" + m_player_id)));
                };
                m_attack.Rocket = false;
                if (m_attack.CancelSoundOnEnd)
                {
                    this.stopSoundID(this.m_lastSFX);
                    this.m_lastSFX = -1;
                };
                if (m_attack.CancelVoiceOnEnd)
                {
                    this.stopSoundID(this.m_lastVFX);
                    this.m_lastVFX = -1;
                };
                if ((((this.m_usingSpecialAttack) && (this.m_characterStats.SpecialType == 6)) && (STAGEDATA.FSCutscene)))
                {
                    STAGEDATA.killFSCutscene();
                    this.releaseOpponent();
                };
            };
            this.resetRotation();
            if (this.inState(CState.SHIELDING))
            {
                this.m_deactivateShield();
            };
            if (this.inState(CState.LEDGE_ROLL))
            {
                _local_2 = 0;
                while (((_local_2 < 10) && (!(m_collision.ground))))
                {
                    m_sprite.y++;
                    m_collision.ground = (!((m_currentPlatform = this.testGroundWithCoord(m_sprite.x, (m_sprite.y + 1))) == null));
                    _local_2++;
                };
                if ((!(m_collision.ground)))
                {
                    m_sprite.y = (m_sprite.y - 10);
                };
            }
            else
            {
                if ((((this.inState(CState.ROLL)) || (this.inState(CState.DODGE_ROLL))) || (this.inState(CState.LEDGE_ROLL))))
                {
                    m_xSpeed = 0;
                };
            };
            if (this.inState(CState.ITEM_TOSS))
            {
                if (((this.m_attackHovering) && (!(m_collision.ground))))
                {
                    this.setState(CState.HOVER);
                }
                else
                {
                    this.m_attackHovering = false;
                    this.setState(CState.IDLE);
                };
                if (this.m_item != null)
                {
                    this.tossItem(this.m_itemThrowInfo.x, this.m_itemThrowInfo.y);
                };
            };
            if (((STAGEDATA.MeleeAirDodge) && (this.inState(CState.AIR_DODGE))))
            {
                this.setState(CState.DISABLED);
            }
            else
            {
                if ((((((!(this.inState(CState.DISABLED))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.STUNNED)))) && (!(this.m_attackHovering))))
                {
                    this.setState(CState.IDLE);
                }
                else
                {
                    if (this.inState(CState.DIZZY))
                    {
                        this.playFrame("dizzy");
                    };
                };
            };
            this.m_attackHovering = false;
            this.m_ledge = null;
            this.m_lastLedge = null;
            m_sprite.cam_width = this.m_characterStats.CamWidth;
            m_sprite.cam_height = this.m_characterStats.CamHeight;
            m_sprite.cam_x_offset = this.m_characterStats.CamXOffset;
            m_sprite.cam_y_offset = this.m_characterStats.CamYOffset;
            m_sprite.camOverride = null;
        }

        private function getDistanceFrom(_arg_1:Number, _arg_2:Number):Number
        {
            return (Math.sqrt((Math.pow((_arg_1 - m_sprite.x), 2) + Math.pow((_arg_2 - m_sprite.y), 2))));
        }

        private function checkLinkedProjectiles():void
        {
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < this.m_projectile.length)
            {
                if (this.m_projectile[_local_1] != null)
                {
                    if (((!(this.m_projectile[_local_1].Dead)) && (this.m_projectile[_local_1].ProjectileAttackObj.LinkAttackID)))
                    {
                        this.m_projectile[_local_1].Attack.AttackID = m_attack.AttackID;
                    };
                };
                _local_1++;
            };
        }

        private function checkSyncedProjectiles():void
        {
            var _local_1:int;
            _local_1 = 0;
            while (((_local_1 < this.m_projectile.length) && (HasPLockBox)))
            {
                if (this.m_projectile[_local_1] != null)
                {
                    if (((!(this.m_projectile[_local_1].Dead)) && (this.m_projectile[_local_1].ProjectileAttackObj.LockTrajectory)))
                    {
                        this.m_projectile[_local_1].syncPosition();
                    };
                };
                _local_1++;
            };
        }

        private function checkDeadProjectiles():void
        {
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < this.m_projectile.length)
            {
                if (((!(this.m_projectile[_local_1] == null)) && (this.m_projectile[_local_1].Dead)))
                {
                    this.m_projectile[_local_1] = null;
                };
                _local_1++;
            };
        }

        public function destroyAllProjectiles():void
        {
            var _local_1:int;
            _local_1 = 0;
            while (((_local_1 < this.m_characterStats.MaxProjectile) && (_local_1 < this.m_projectile.length)))
            {
                if (this.m_projectile[_local_1] != null)
                {
                    this.m_projectile[_local_1].destroy();
                    this.m_projectile[_local_1] = null;
                };
                _local_1++;
            };
        }

        private function getIndexOfOldestProjectile(_arg_1:String):int
        {
            var _local_2:int;
            var _local_3:int;
            _local_2 = -1;
            _local_3 = 0;
            while (((_local_3 < this.m_characterStats.MaxProjectile) && (_local_3 < this.m_projectile.length)))
            {
                if ((((!(this.m_projectile[_local_3] == null)) && (this.m_projectile[_local_3].LinkageID == _arg_1)) && ((_local_2 < 0) || (this.m_projectile[_local_3].Time > this.m_projectile[_local_2].Time))))
                {
                    _local_2 = _local_3;
                };
                _local_3++;
            };
            return (_local_2);
        }

        public function fireProjectile(_arg_1:*, _arg_2:Number=0, _arg_3:Number=0, _arg_4:Boolean=false, _arg_5:Object=null):Boolean
        {
            var _local_6:Boolean;
            var _local_7:ProjectileAttack;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            _local_6 = false;
            _local_7 = null;
            if ((_arg_1 as String))
            {
                _local_7 = m_attackData.getProjectile(_arg_1);
            }
            else
            {
                _local_7 = new ProjectileAttack();
                _local_7.importProjectileData(_arg_1);
            };
            if ((!(_arg_5)))
            {
                _arg_5 = {};
            };
            if (_local_7 != null)
            {
                _local_8 = 0;
                while ((((_local_8 < this.m_characterStats.MaxProjectile) && (_local_8 < this.m_projectile.length)) && (!(_local_6))))
                {
                    if (((((this.m_projectile[_local_8] == null) || (_local_7.LimitOverwrite)) && (!(_local_7.StatsName == null))) && ((this.getProjectileLimit(_local_7.StatsName) < _local_7.Limit) || (_local_7.LimitOverwrite))))
                    {
                        _local_9 = _local_8;
                        if (((_local_7.LimitOverwrite) && (this.getProjectileLimit(_local_7.StatsName) >= _local_7.Limit)))
                        {
                            _local_8 = this.getIndexOfOldestProjectile(_local_7.StatsName);
                            if (_local_8 < 0)
                            {
                                return (false);
                            };
                            this.m_projectile[_local_8].destroy();
                            this.m_projectile[_local_8] = null;
                        }
                        else
                        {
                            if (_local_7.LimitOverwrite)
                            {
                                _local_8 = this.getIndexOfOldestProjectile(_local_7.StatsName);
                                _local_10 = 0;
                                while (_local_10 < this.m_projectile.length)
                                {
                                    if (this.m_projectile[_local_10] == null)
                                    {
                                        _local_8 = _local_10;
                                        break;
                                    };
                                    _local_10++;
                                };
                            };
                        };
                        this.m_projectile[_local_8] = new Projectile({
                            "player_id":m_player_id,
                            "x_start":m_sprite.x,
                            "y_start":m_sprite.y,
                            "sizeRatio":m_sizeRatio,
                            "facingForward":m_facingForward,
                            "chargetime":((_arg_5.chargetime) || (m_attack.ChargeTime)),
                            "chargetime_max":((_arg_5.chargetime_max) || (m_attack.ChargeTimeMax)),
                            "frame":(_local_7.StatsName + "_proj"),
                            "staleMultiplier":this.totalMoveDecay((_local_7.StatsName + "_proj")),
                            "sizeStatus":this.m_sizeStatus,
                            "opponents":this.m_opponents,
                            "terrains":m_terrains,
                            "platforms":m_platforms,
                            "team_id":m_team_id,
                            "keys":this.m_key,
                            "volume_sfx":this.m_characterStats.VolumeSFX,
                            "volume_vfx":this.m_characterStats.VolumeVFX
                        }, _local_7, STAGEDATA);
                        _local_6 = true;
                        this.checkLinkedProjectiles();
                        this.m_lastProjectile = _local_8;
                        if (((!(_arg_2 == 0)) || (!(_arg_3 == 0))))
                        {
                            if (_arg_4)
                            {
                                this.m_projectile[_local_8].X = _arg_2;
                                this.m_projectile[_local_8].Y = _arg_3;
                                this.m_projectile[_local_8].X = (this.m_projectile[_local_8].X + ((m_facingForward) ? (_local_7.XOffset * m_sizeRatio) : (-(_local_7.XOffset) * m_sizeRatio)));
                                this.m_projectile[_local_8].Y = (this.m_projectile[_local_8].Y + (_local_7.YOffset * m_sizeRatio));
                            }
                            else
                            {
                                this.m_projectile[_local_8].X = (this.m_projectile[_local_8].X + ((m_facingForward) ? _arg_2 : -(_arg_2)));
                                this.m_projectile[_local_8].Y = (this.m_projectile[_local_8].Y + (_arg_3 * m_sizeRatio));
                                this.m_projectile[_local_8].X = (this.m_projectile[_local_8].X + ((m_facingForward) ? (_local_7.XOffset * m_sizeRatio) : (-(_local_7.XOffset) * m_sizeRatio)));
                                this.m_projectile[_local_8].Y = (this.m_projectile[_local_8].Y + (_local_7.YOffset * m_sizeRatio));
                            };
                        }
                        else
                        {
                            this.m_projectile[_local_8].X = (this.m_projectile[_local_8].X + ((m_facingForward) ? (_local_7.XOffset * m_sizeRatio) : (-(_local_7.XOffset) * m_sizeRatio)));
                            this.m_projectile[_local_8].Y = (this.m_projectile[_local_8].Y + (_local_7.YOffset * m_sizeRatio));
                        };
                        break;
                    };
                    _local_8++;
                };
            };
            return (_local_6);
        }

        public function rocketCharacter(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Boolean):void
        {
            if (this.m_characterStats.StatsName == "samus")
            {
                if (((((((this.inState(CState.LEDGE_CLIMB)) || (this.inState(CState.LEDGE_HANG))) || (this.inState(CState.LEDGE_ROLL))) || (this.inState(CState.GRABBING))) || (this.inState(CState.INJURED))) || (this.inState(CState.FLYING))))
                {
                    return;
                };
                if (((!(this.inState(CState.ATTACKING))) || (m_attack.Frame.indexOf("b_down") >= 0)))
                {
                    if (((_arg_2 > 180) && (_arg_2 < 360)))
                    {
                        _arg_2 = Utils.forceBase360((90 + (270 - _arg_2)));
                    };
                    if (this.inState(CState.SHIELDING))
                    {
                        this.m_deactivateShield();
                        this.setState(CState.IDLE);
                    }
                    else
                    {
                        if (((this.inState(CState.DODGE_ROLL)) || (this.inState(CState.SIDESTEP_DODGE))))
                        {
                            this.setState(CState.IDLE);
                        };
                    };
                    this.forceAttack("b_down_air");
                }
                else
                {
                    return;
                };
            }
            else
            {
                if (this.m_characterStats.StatsName == "ness")
                {
                    this.endAttack();
                    this.setState(CState.IDLE);
                    this.forceAttack("b_up_air");
                };
            };
            if (this.inState(CState.SHIELDING))
            {
                this.m_deactivateShield();
            };
            _arg_2 = Utils.forceBase360(_arg_2);
            this.m_rocketSpeed = _arg_1;
            this.m_rocketAngle = _arg_2;
            this.m_rocketRotation = _arg_4;
            this.m_rocketDecay = _arg_3;
            if (((m_collision.ground) && ((this.m_rocketAngle >= 260) && (this.m_rocketAngle <= 280))))
            {
                this.endAttack();
                this.resetRotation();
                this.toBounce();
            }
            else
            {
                if (((m_collision.ground) && ((this.m_rocketAngle > 180) && (this.m_rocketAngle < 360))))
                {
                    this.m_rocketAngle = ((this.m_rocketAngle < 270) ? 180 : 0);
                    this.resetRotation();
                };
                m_attack.Rocket = true;
                if (_arg_4)
                {
                    if ((((this.m_rocketAngle <= 90) && (this.m_rocketAngle >= 0)) || ((this.m_rocketAngle >= 270) && (this.m_rocketAngle < 360))))
                    {
                        this.m_faceRight();
                    }
                    else
                    {
                        this.m_faceLeft();
                    };
                };
                if (((this.m_rocketAngle < 180) && (this.m_rocketAngle > 0)))
                {
                    unnattachFromGround();
                };
                this.stancePlayFrame("rocket");
                m_xSpeed = Utils.calculateXSpeed(this.m_rocketSpeed, this.m_rocketAngle);
                m_ySpeed = -(Utils.calculateYSpeed(this.m_rocketSpeed, this.m_rocketAngle));
            };
        }

        private function fixRocketRotation():void
        {
            var _local_1:Number;
            if (this.m_rocketRotation)
            {
                _local_1 = this.m_rocketAngle;
                _local_1 = Utils.forceBase360(((m_facingForward) ? -(this.m_rocketAngle) : (-(this.m_rocketAngle) + 180)));
                m_sprite.rotation = _local_1;
            };
        }

        private function checkRocket():void
        {
            var _local_1:Number;
            var _local_2:Number;
            if (((this.inState(CState.ATTACKING)) && (m_attack.Rocket)))
            {
                this.fixRocketRotation();
                this.m_attemptToMove(m_xSpeed, 0);
                this.m_attemptToMove(0, m_ySpeed);
                if (this.m_rocketDecay >= 0)
                {
                    decel(Utils.fastAbs(Utils.calculateXSpeed(this.m_rocketDecay, this.m_rocketAngle)));
                    decel_air(Utils.fastAbs(Utils.calculateYSpeed(this.m_rocketDecay, this.m_rocketAngle)));
                }
                else
                {
                    decel(-(Utils.fastAbs(Utils.calculateXSpeed(this.m_rocketDecay, this.m_rocketAngle))));
                    decel_air(-(Utils.fastAbs(Utils.calculateYSpeed(this.m_rocketDecay, this.m_rocketAngle))));
                };
                if (this.testGroundWithCoord(m_sprite.x, (m_sprite.y + 1)))
                {
                    if (((this.m_rocketAngle > 200) && (this.m_rocketAngle < 340)))
                    {
                        m_attack.Rocket = false;
                        _local_1 = m_xSpeed;
                        _local_2 = m_ySpeed;
                        this.toBounce();
                        m_xSpeed = (_local_1 / 2);
                        m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_ROCKET_COMPLETE, {"caller":this}));
                    }
                    else
                    {
                        if (((this.m_rocketAngle >= 160) && ((this.m_rocketAngle >= 340) || (this.m_rocketAngle <= 20))))
                        {
                            this.resetRotation();
                        };
                    };
                };
            };
        }

        private function resetItemDamageCounter():void
        {
            this.m_itemDamageCounter = 36;
        }

        private function m_checkItem():void
        {
            if ((!(this.m_a)))
            {
                this.m_itemLetGo = true;
            }
            else
            {
                this.m_itemTimer--;
            };
            if (((this.m_transformedSpecial) && (!(this.m_item2 == null))))
            {
                this.m_item2.destroy();
            };
            var _local_1:Boolean;
            var _local_2:Item;
            if ((((this.inState(CState.IDLE)) && (this.m_item)) && ((this.m_item is AssistTrophyItem) || (this.m_item is EnergyTank))))
            {
                this.m_itemSpawnTimer.tick();
                if (this.m_itemSpawnTimer.IsComplete)
                {
                    this.m_itemSpawnTimer.tick();
                    if (this.m_itemSpawnTimer.IsComplete)
                    {
                        this.m_item.consumeAction();
                    };
                };
            }
            else
            {
                this.m_itemSpawnTimer.reset();
            };
            if (((!(this.m_item2 == null)) && (this.m_item2.Dead)))
            {
                this.m_item2.destroy();
                this.m_item2 = null;
            };
            if (((((((((this.m_grab) && (this.m_grabKeyReleased)) && (this.m_itemLetGo)) && (!(this.m_item == null))) && (this.inFreeState(false, false, false, false, false, false, false, false, false, true))) && ((this.m_item.Ability == "attack") || (this.m_item.Ability == "toss"))) && (!(this.m_item is AssistTrophyItem))) && (!(this.m_item is EnergyTank))))
            {
                this.grabKeyItemToss();
            };
        }

        public function checkItemDeath():void
        {
            if (((!(this.m_item == null)) && (this.m_item.Dead)))
            {
                this.m_item = null;
                this.updateItemHolding();
            };
        }

        private function normalItemToss():void
        {
            this.m_itemThrowWeak = false;
            this.m_itemThrowSmash = ((this.m_smashTimer < 2) && (!(this.m_left == this.m_right)));
            this.m_item.AttackStateData.Frame = Item.ATTACK_THROW;
            this.m_itemThrowInfo.x = 0;
            this.m_itemThrowInfo.y = 0;
            this.m_itemThrowInfo.width = 0;
            this.m_itemThrowInfo.height = 0;
            if (((((((((!(this.m_left)) && (!(this.m_right))) && (!(this.m_up))) && (!(this.m_down))) && (!(this.m_c_up))) && (!(this.m_c_down))) && (!(this.m_c_left))) && (!(this.m_c_right))))
            {
                this.m_itemThrowInfo.width = ((m_facingForward) ? Utils.calculateXSpeed(this.m_item.ThrowSpeed, 20) : -(Utils.calculateXSpeed(this.m_item.ThrowSpeed, 20)));
                this.m_itemThrowInfo.height = -(Utils.calculateYSpeed(this.m_item.ThrowSpeed, 20));
            }
            else
            {
                if ((((this.m_down) && (!(this.m_up))) || (((this.m_c_down) && (!(this.m_c_up))) && (this.m_cStickLetGo))))
                {
                    this.m_itemThrowInfo.width = 0;
                    this.m_itemThrowInfo.height = -(Utils.calculateYSpeed(this.m_item.ThrowSpeed, 270));
                }
                else
                {
                    if (((this.m_up) || ((this.m_c_up) && (this.m_cStickLetGo))))
                    {
                        this.m_itemThrowInfo.width = 0;
                        this.m_itemThrowInfo.height = -(Utils.calculateYSpeed(this.m_item.ThrowSpeed, 90));
                    }
                    else
                    {
                        if (((this.m_right) || ((this.m_c_right) && (this.m_cStickLetGo))))
                        {
                            this.m_faceRight();
                            this.m_itemThrowInfo.width = ((m_facingForward) ? Utils.calculateXSpeed(this.m_item.ThrowSpeed, 20) : -(Utils.calculateXSpeed(this.m_item.ThrowSpeed, 20)));
                            this.m_itemThrowInfo.height = -(Utils.calculateYSpeed(this.m_item.ThrowSpeed, 20));
                        }
                        else
                        {
                            if (((this.m_left) || ((this.m_c_left) && (this.m_cStickLetGo))))
                            {
                                this.m_faceLeft();
                                this.m_itemThrowInfo.width = ((m_facingForward) ? Utils.calculateXSpeed(this.m_item.ThrowSpeed, 20) : -(Utils.calculateXSpeed(this.m_item.ThrowSpeed, 20)));
                                this.m_itemThrowInfo.height = -(Utils.calculateYSpeed(this.m_item.ThrowSpeed, 20));
                                m_facingForward = false;
                            };
                        };
                    };
                };
            };
            if (m_ySpeed > m_max_ySpeed)
            {
                m_ySpeed = m_max_ySpeed;
                this.m_itemThrowInfo.height = (this.m_itemThrowInfo.height * 1.2);
            };
            this.m_cStickLetGo = false;
            this.m_itemThrowInfo.y = 25;
            this.m_itemThrowInfo.x = ((m_width / 2) * m_sizeRatio);
            this.m_itemThrowInfo.y = (((this.m_itemThrowInfo.height > 0) && (!(m_collision.ground))) ? ((m_height / 2) * m_sizeRatio) : -(this.m_itemThrowInfo.y));
            this.m_itemThrowInfo.width;
            this.m_itemThrowInfo.height;
            if (this.inState(CState.HOVER))
            {
                this.m_attackHovering = true;
            };
            if (((Utils.hasLabel(m_sprite, "toss")) && (false)))
            {
                this.setState(CState.ITEM_TOSS);
            }
            else
            {
                if ((!(this.inState(CState.HOVER))))
                {
                    this.setState(CState.IDLE);
                };
                this.tossItem(this.m_itemThrowInfo.x, this.m_itemThrowInfo.y);
            };
        }

        private function grabKeyItemToss():void
        {
            this.m_itemThrowWeak = true;
            this.m_itemThrowSmash = ((this.m_smashTimer < 2) && (!(this.m_left == this.m_right)));
            this.m_item.AttackStateData.Frame = Item.ATTACK_THROW;
            this.m_itemThrowInfo.x = 0;
            this.m_itemThrowInfo.y = 0;
            this.m_itemThrowInfo.width = 0;
            this.m_itemThrowInfo.height = 0;
            if (((((!(this.m_left)) && (!(this.m_right))) && (!(this.m_up))) && (!(this.m_down))))
            {
                if (((this.m_item.CanBackToss) && (m_collision.ground)))
                {
                    if (this.m_item.Ability === "attack")
                    {
                        this.m_item.AttackStateData.Frame = Item.ATTACK_TOSS;
                        this.m_itemThrowInfo.width = ((m_facingForward) ? -(Utils.calculateXSpeed(this.m_item.TossSpeed, 20)) : Utils.calculateXSpeed(this.m_item.TossSpeed, 20));
                        this.m_itemThrowInfo.height = -(Utils.calculateYSpeed(this.m_item.ThrowSpeed, 20));
                    }
                    else
                    {
                        this.m_item.AttackStateData.Frame = Item.ATTACK_THROW;
                        this.m_itemThrowInfo.width = ((m_facingForward) ? Utils.calculateXSpeed(this.m_item.ThrowSpeed, 20) : -(Utils.calculateXSpeed(this.m_item.ThrowSpeed, 20)));
                    };
                };
            }
            else
            {
                if (((this.m_down) && (!(this.m_up))))
                {
                    this.m_itemThrowInfo.width = 0;
                    this.m_itemThrowInfo.height = -(Utils.calculateYSpeed(this.m_item.ThrowSpeed, 270));
                }
                else
                {
                    if (this.m_up)
                    {
                        this.m_itemThrowInfo.width = 0;
                        this.m_itemThrowInfo.height = -(Utils.calculateYSpeed(this.m_item.ThrowSpeed, 90));
                    }
                    else
                    {
                        if (this.m_right)
                        {
                            this.m_faceRight();
                            this.m_itemThrowInfo.width = Utils.calculateXSpeed(this.m_item.ThrowSpeed, 20);
                            this.m_itemThrowInfo.height = -(Utils.calculateYSpeed(this.m_item.ThrowSpeed, 20));
                        }
                        else
                        {
                            if (this.m_left)
                            {
                                this.m_faceLeft();
                                this.m_itemThrowInfo.width = -(Utils.calculateXSpeed(this.m_item.ThrowSpeed, 20));
                                this.m_itemThrowInfo.height = -(Utils.calculateYSpeed(this.m_item.ThrowSpeed, 20));
                            };
                        };
                    };
                };
            };
            this.m_grabLetGo = false;
            this.m_grabKeyReleased = false;
            if (m_ySpeed > m_max_ySpeed)
            {
                m_ySpeed = m_max_ySpeed;
                this.m_itemThrowInfo.height = (this.m_itemThrowInfo.height * 1.2);
            };
            this.m_itemThrowInfo.y = ((m_height < 30) ? 30 : m_height);
            this.m_itemThrowInfo.x = ((m_width / 2) * m_sizeRatio);
            this.m_itemThrowInfo.y = (((this.m_itemThrowInfo.height > 0) && (!(m_collision.ground))) ? ((m_height / 2) * m_sizeRatio) : -(this.m_itemThrowInfo.y));
            this.m_itemThrowInfo.width;
            this.m_itemThrowInfo.height;
            if (this.inState(CState.HOVER))
            {
                this.m_attackHovering = true;
            };
            if (((Utils.hasLabel(m_sprite, "toss")) && (false)))
            {
                this.setState(CState.ITEM_TOSS);
            }
            else
            {
                this.tossItem(this.m_itemThrowInfo.x, this.m_itemThrowInfo.y);
                if ((!(this.inState(CState.HOVER))))
                {
                    this.setState(CState.IDLE);
                };
            };
        }

        public function tossItem(_arg_1:Number, _arg_2:Number):void
        {
            if ((!(m_facingForward)))
            {
                _arg_1 = (_arg_1 * -1);
            };
            if (this.m_itemThrowSmash)
            {
                this.m_itemThrowInfo.width = (this.m_itemThrowInfo.width * 1.2);
                this.m_itemThrowInfo.height = (this.m_itemThrowInfo.height * 1.2);
            }
            else
            {
                if (((this.m_itemThrowInfo.width === 0) && (this.m_itemThrowInfo.height < 0)))
                {
                    this.m_itemThrowInfo.height = (this.m_itemThrowInfo.height * 1.75);
                };
            };
            this.m_item.Toss((m_sprite.x + _arg_1), (m_sprite.y + _arg_2), this.m_itemThrowInfo.width, this.m_itemThrowInfo.height, this.m_itemThrowWeak);
            this.resetAttackLetGo();
            this.resetSpeedLevel();
            this.m_itemLetGo = false;
            this.m_itemTimer = 5;
            this.m_item = null;
            this.m_attackDelay = 10;
            this.playGlobalSound(((this.m_itemThrowWeak) ? "itemdrop" : "item_throw"));
            if (HasItemBox)
            {
                m_sprite.stance.itemBox.visible = false;
            };
        }

        public function m_useItem():void
        {
            var _local_1:AssistTrophy;
            if (((!(this.m_item == null)) && (!((this.m_item is AssistTrophyItem) && (!(m_collision.ground))))))
            {
                if (this.m_item.Ability == "attack")
                {
                    this.m_item.Attack(this.m_item.AttackStateData.Frame, m_facingForward);
                    this.Attack("item", 1);
                    if ((this.m_item is AssistTrophyItem))
                    {
                        _local_1 = STAGEDATA.spawnAssist(AssistTrophyItem(this.m_item).AssistClass, m_sprite.x, m_sprite.y, m_player_id);
                        attachEffect("at_open");
                    };
                    this.updateItemHolding();
                }
                else
                {
                    if (((this.m_item.Ability == "toss") && (this.m_itemLetGo)))
                    {
                        if (this.inState(CState.GLIDING))
                        {
                            this.endAttack();
                        };
                        this.normalItemToss();
                    };
                };
            }
            else
            {
                if (this.m_item2 != null)
                {
                    this.m_useItemSpecial();
                };
            };
        }

        private function m_useItemSpecial():void
        {
            var _local_1:Point;
            var _local_2:Point;
            if (((this.m_characterStats.SpecialType == 0) && (!(this.m_transformedSpecial))))
            {
                if (this.m_item2 != null)
                {
                    this.m_item2.destroy();
                };
                this.m_transformingSpecial = true;
                this.playFrame("special");
                this.toggleEffect(this.m_fsGlowHolderMC, false);
                this.SpecialAttack();
            }
            else
            {
                if (((this.m_characterStats.SpecialType == 0) && (this.m_transformedSpecial)))
                {
                    if (this.m_item2 != null)
                    {
                        this.m_item2.destroy();
                    };
                }
                else
                {
                    if ((((this.m_characterStats.SpecialType == 1) || (this.m_characterStats.SpecialType == 2)) || (this.m_characterStats.SpecialType == 3)))
                    {
                        if (this.m_item2 != null)
                        {
                            this.m_item2.destroy();
                        };
                        this.toggleEffect(this.m_fsGlowHolderMC, false);
                        this.SpecialAttack();
                    }
                    else
                    {
                        if (this.m_characterStats.SpecialType == 4)
                        {
                            if (this.m_item2 != null)
                            {
                                this.m_item2.destroy();
                            };
                            this.m_attachedReticule = null;
                            this.playFrame("special");
                            this.toggleEffect(this.m_fsGlowHolderMC, false);
                            this.m_transformLimit = this.m_characterStats.FSTimer;
                            this.SpecialAttack();
                            this.m_attachedFPS = STAGEDATA.attachUniqueMovieHUD((this.m_characterStats.LinkageID + "_hud"));
                            this.updateColorFilter(this.m_attachedFPS, ((ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)) ? null : m_team_id), this.CostumeName, this.m_costume_id);
                            _local_1 = new Point((Main.Width / 2), Main.Height);
                            this.m_attachedFPS.x = STAGEDATA.HudForegroundRef.globalToLocal(_local_1).x;
                            this.m_attachedFPS.y = STAGEDATA.HudForegroundRef.globalToLocal(_local_1).y;
                            unnattachFromGround();
                        }
                        else
                        {
                            if (this.m_characterStats.SpecialType == 5)
                            {
                                if (this.m_item2 != null)
                                {
                                    this.m_item2.destroy();
                                };
                                this.playFrame("special");
                                this.toggleEffect(this.m_fsGlowHolderMC, false);
                                this.m_transformLimit = this.m_characterStats.FSTimer;
                                this.SpecialAttack();
                                this.m_attachedFPS = STAGEDATA.attachUniqueMovieHUD((this.m_characterStats.LinkageID + "_hud"));
                                this.updateColorFilter(this.m_attachedFPS, ((ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)) ? null : m_team_id), this.CostumeName, this.m_costume_id);
                                _local_2 = new Point((Main.Width / 2), Main.Height);
                                this.m_attachedFPS.x = STAGEDATA.HudForegroundRef.globalToLocal(_local_2).x;
                                this.m_attachedFPS.y = STAGEDATA.HudForegroundRef.globalToLocal(_local_2).y;
                                unnattachFromGround();
                            }
                            else
                            {
                                if (this.m_characterStats.SpecialType == 6)
                                {
                                    if (this.m_item2 != null)
                                    {
                                        this.m_item2.destroy();
                                    };
                                    this.playFrame("special");
                                    this.toggleEffect(this.m_fsGlowHolderMC, false);
                                    this.m_transformLimit = this.m_characterStats.FSTimer;
                                    this.SpecialAttack();
                                };
                            };
                        };
                    };
                };
            };
        }

        private function updateItemHolding():void
        {
            var _local_1:Rectangle;
            var _local_2:Number;
            _local_1 = new Rectangle(0, 0, 1, 1);
            if (this.HoldingItem)
            {
                if (HasItemBox)
                {
                    this.m_item.setVisibility(true);
                    this.m_item.MC.x = (HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.ITEM)[0]).xreg * m_sprite.scaleX);
                    this.m_item.MC.y = (HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.ITEM)[0]).yreg * m_sprite.scaleY);
                    this.m_item.MC.scaleX = 1;
                    this.m_item.MC.scaleY = 1;
                    if (m_facingForward)
                    {
                        this.m_item.faceRight();
                    }
                    else
                    {
                        this.m_item.faceLeft();
                    };
                    _local_2 = ((m_facingForward) ? HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.ITEM)[0]).rotation : -(HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.ITEM)[0]).rotation));
                    this.m_item.MC.scaleX = (this.m_item.MC.scaleX * HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.ITEM)[0]).scaleX);
                    this.m_item.MC.scaleY = (this.m_item.MC.scaleY * HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.ITEM)[0]).scaleY);
                    this.m_item.MC.rotation = ((_local_2 + m_sprite.stance.rotation) + m_sprite.rotation);
                    _local_1.x = this.m_item.MC.x;
                    _local_1.y = this.m_item.MC.y;
                    _local_1 = Utils.rotateRectangleAroundOrigin(_local_1, (360 - m_sprite.rotation));
                    this.m_item.MC.x = (m_sprite.x + _local_1.x);
                    this.m_item.MC.y = (m_sprite.y + _local_1.y);
                    if (((HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.ITEM)[0]).depth == 0) && (Depth < this.m_item.Depth)))
                    {
                        Utils.swapDepths(m_sprite, this.m_itemMC);
                    }
                    else
                    {
                        if (((!(HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.ITEM)[0]).depth == 0)) && (Depth > this.m_item.Depth)))
                        {
                            Utils.swapDepths(m_sprite, this.m_item.MC);
                        };
                    };
                }
                else
                {
                    this.m_item.X = m_sprite.x;
                    this.m_item.Y = (m_sprite.y - (m_height / 2));
                    this.m_item.setVisibility(false);
                };
            };
            if (((!(this.m_currentPower == null)) && (HasHatBox)))
            {
                if (this.m_hatHolder == null)
                {
                    this.m_hatHolder = Main.getLibraryMC(("hat_" + this.m_currentPower), this.m_expansion_id);
                    while (this.m_hatMC.numChildren > 0)
                    {
                        this.m_hatMC.removeChildAt(0);
                    };
                    this.m_hatMC.addChild(this.m_hatHolder);
                    STAGE.addChild(this.m_hatMC);
                };
                if ((!(this.m_hatHolder)))
                {
                    return;
                };
                this.m_hatMC.x = (HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.HAT)[0]).xreg * m_sprite.scaleX);
                this.m_hatMC.y = (HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.HAT)[0]).yreg * m_sprite.scaleY);
                this.m_hatMC.scaleX = m_sprite.scaleX;
                this.m_hatMC.scaleY = m_sprite.scaleY;
                this.m_hatMC.rotation = m_sprite.rotation;
                this.m_hatHolder.scaleX = HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.HAT)[0]).scaleX;
                this.m_hatHolder.scaleY = HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.HAT)[0]).scaleY;
                this.m_hatHolder.rotation = (HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.HAT)[0]).rotation + m_sprite.stance.rotation);
                if (HasStance)
                {
                    this.m_hatHolder.scaleX = (this.m_hatHolder.scaleX * m_sprite.stance.scaleX);
                    this.m_hatHolder.scaleY = (this.m_hatHolder.scaleY * m_sprite.stance.scaleY);
                };
                if (HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.HAT)[0]).transform.a < 0)
                {
                    this.m_hatMC.scaleY = (this.m_hatMC.scaleY * -1);
                };
                _local_1.x = this.m_hatMC.x;
                _local_1.y = this.m_hatMC.y;
                _local_1 = Utils.rotateRectangleAroundOrigin(_local_1, (360 - m_sprite.rotation));
                this.m_hatMC.x = (m_sprite.x + _local_1.x);
                this.m_hatMC.y = (m_sprite.y + _local_1.y);
                if ((!(this.m_hatMC.parent)))
                {
                    STAGE.addChild(this.m_hatMC);
                };
                if (((HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.HAT)[0]).depth == 0) && (Depth < this.m_hatMC.parent.getChildIndex(this.m_hatMC))))
                {
                    Utils.swapDepths(m_sprite, this.m_hatMC);
                }
                else
                {
                    if (((!(HitBoxSprite(this.CurrentAnimation.getHitBoxes(CurrentFrameNum, HitBoxSprite.HAT)[0]).depth == 0)) && (Depth > this.m_hatMC.parent.getChildIndex(this.m_hatMC))))
                    {
                        Utils.swapDepths(m_sprite, this.m_hatMC);
                    };
                };
            }
            else
            {
                if (((this.m_currentPower == null) || (!(HasHatBox))))
                {
                    if (this.m_hatHolder)
                    {
                        while (this.m_hatMC.numChildren > 0)
                        {
                            this.m_hatMC.removeChildAt(0);
                        };
                        this.m_hatHolder = null;
                    };
                };
            };
        }

        public function killItem(_arg_1:Number):void
        {
            if (this.m_item != null)
            {
                STAGEDATA.ItemsRef.killItem(this.m_item.Slot);
                this.m_item = null;
            };
        }

        public function dropItem():void
        {
            if (this.m_item != null)
            {
                this.m_item.Drop();
                this.m_item = null;
            };
        }

        public function getBrightnessIncreaser():Number
        {
            var _local_1:Number;
            var _local_2:int;
            var _local_3:int;
            var _local_4:Character;
            if (((STAGEDATA.GameRef.GameMode == Mode.TRAINING) || (!(STAGEDATA.GameRef.LevelData.teams))))
            {
                return (0);
            };
            _local_1 = 0;
            _local_2 = 0;
            _local_3 = 0;
            while (_local_3 < Main.MAXPLAYERS)
            {
                _local_4 = STAGEDATA.getPlayer(_local_3);
                if (_local_4 != null)
                {
                    if (((((_local_2 == 0) && (_local_4.Team == m_team_id)) && (_local_4.ID == m_player_id)) && (_local_4.StatsName == this.StatsName))) break;
                    if ((((_local_4.Team == m_team_id) && (!(_local_4.ID == m_player_id))) && (_local_4.StatsName == this.StatsName)))
                    {
                        _local_2++;
                    };
                };
                _local_3++;
            };
            if (_local_2 == 1)
            {
                _local_1 = (_local_1 + 75);
            }
            else
            {
                if (_local_2 == 2)
                {
                    _local_1 = (_local_1 - 75);
                };
            };
            return (_local_1);
        }

        public function updateColorFilter(_arg_1:DisplayObject, _arg_2:int, _arg_3:String, _arg_4:int=-1):void
        {
            var _local_5:String;
            var _local_6:Object;
            _local_5 = Utils.getColorString(_arg_2);
            _local_6 = Main.getCostume(_arg_3, _local_5, _arg_4);
            if (_local_6 == null)
            {
                _local_6 = Utils.getCostumeObject();
            };
            if (_local_6 != null)
            {
                _local_6.brightness = (_local_6.brightness + this.getBrightnessIncreaser());
                Utils.setColorFilter(_arg_1, _local_6);
            };
        }

        public function replaceCharacter(_arg_1:String, _arg_2:String=null, _arg_3:String=null):void
        {
            var _local_4:CharacterData;
            var _local_5:String;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Vector.<MovieClip>;
            var _local_9:Boolean;
            var _local_10:Boolean;
            var _local_11:MovieClip;
            this.setIntangibility(false);
            if (this.m_sizeStatus != 0)
            {
                this.setSizeStatus(0);
            };
            Stats.setPresets({
                "level":this.m_characterStats.Level,
                "x_start":this.m_characterStats.XStart,
                "y_start":this.m_characterStats.YStart,
                "x_respawn":this.m_characterStats.XRespawn,
                "y_respawn":this.m_characterStats.YRespawn,
                "player_id":m_player_id,
                "sizeRatio":m_sizeRatio
            });
            _local_4 = Stats.getStats(_arg_1, this.m_expansion_id);
            _local_5 = m_sprite.xframe;
            if (this.m_grabbed.length > 0)
            {
                this.grabReleaseOpponent();
                this.grabRelease();
            };
            _local_6 = m_sprite.x;
            _local_7 = m_sprite.y;
            _local_8 = new Vector.<MovieClip>();
            _local_8.push(m_sprite);
            _local_9 = CAM.hasTargets(_local_8);
            if (_local_9)
            {
                CAM.deleteTargets(_local_8);
            };
            _local_10 = m_sprite.visible;
            m_sprite.parent.removeChild(m_sprite);
            _local_11 = Main.getLibraryMC(_local_4.LinkageID, this.m_expansion_id);
            _local_11.name = ("p" + m_player_id);
            _local_11.player_id = m_player_id;
            _local_11.ACTIVE = true;
            m_sprite = MovieClip(STAGE.addChild(_local_11));
            if (_local_9)
            {
                _local_8 = new Vector.<MovieClip>();
                _local_8.push(m_sprite);
                CAM.addTargets(_local_8);
            };
            m_sprite.x = _local_6;
            m_sprite.y = _local_7;
            if (this.inState(CState.CAUGHT))
            {
                this.setVisibility(_local_10);
            };
            this.resetChargedAttacks();
            m_attack.Rocket = false;
            m_attackData.resetCharges();
            this.toggleEffect(this.m_chargeGlowHolderMC, false);
            this.m_chargeGlowHolderMC = null;
            if (STAGEPARENT.getChildByName(("energy" + m_player_id)) != null)
            {
                STAGEPARENT.removeChild(STAGEPARENT.getChildByName(("energy" + m_player_id)));
            };
            this.setStats(_local_4);
            if ((!(m_facingForward)))
            {
                this.m_faceLeft();
            }
            else
            {
                this.m_faceRight();
            };
            if (((!(_local_5 == null)) && (_arg_2 == null)))
            {
                this.playFrame(_local_5);
                m_attack.Frame = _local_5;
                if (_arg_3 != null)
                {
                    this.stancePlayFrame(_arg_3);
                };
            }
            else
            {
                if (_arg_2 != null)
                {
                    this.playFrame(_arg_2);
                    m_attack.Frame = _arg_2;
                    if (_arg_3 != null)
                    {
                        this.stancePlayFrame(_arg_3);
                    };
                };
            };
            if (HasStance)
            {
            };
            if ((!(this.inState(CState.ATTACKING))))
            {
                this.setState(((m_collision.ground) ? CState.IDLE : CState.JUMP_FALLING));
            };
            this.applySpecialModeEffects();
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_TRANSFORM, {"caller":this}));
        }

        public function activateFinalForm():void
        {
            var _local_1:CharacterData;
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Vector.<MovieClip>;
            var _local_5:Boolean;
            var _local_6:Boolean;
            var _local_7:MovieClip;
            if (this.m_transformingSpecial)
            {
                this.setIntangibility(false);
                if (this.m_sizeStatus != 0)
                {
                    this.setSizeStatus(0);
                };
                Stats.setPresets({
                    "level":this.m_characterStats.Level,
                    "x_start":this.m_characterStats.XStart,
                    "y_start":this.m_characterStats.YStart,
                    "x_respawn":this.m_characterStats.XRespawn,
                    "y_respawn":this.m_characterStats.YRespawn,
                    "player_id":m_player_id,
                    "sizeRatio":m_sizeRatio
                });
                _local_1 = Stats.getStats(this.m_characterStats.SpecialStatsID, this.m_expansion_id);
                this.releaseOpponent();
                CAM.brighten();
                this.m_hasFinalSmash = false;
                if (this.m_item2 != null)
                {
                    this.m_item2.destroy();
                    STAGE.removeChild(this.m_item2.ItemInstance);
                    this.m_item2 = null;
                };
                this.m_transformingSpecial = false;
                this.m_transformedSpecial = true;
                this.m_transformTime = 0;
                this.m_transformLimit = this.m_characterStats.FSTimer;
                this.HealthBox.fsmeter.visible = true;
                _local_2 = m_sprite.x;
                _local_3 = m_sprite.y;
                _local_4 = new Vector.<MovieClip>();
                _local_4.push(m_sprite);
                _local_5 = CAM.hasTargets(_local_4);
                if (_local_5)
                {
                    CAM.deleteTargets(_local_4);
                };
                _local_6 = m_sprite.visible;
                m_sprite.parent.removeChild(m_sprite);
                _local_7 = Main.getLibraryMC(_local_1.LinkageID, this.m_expansion_id);
                _local_7.name = ("p" + m_player_id);
                _local_7.player_id = m_player_id;
                _local_7.ACTIVE = true;
                m_sprite = MovieClip(STAGE.addChild(_local_7));
                if (_local_5)
                {
                    _local_4 = new Vector.<MovieClip>();
                    _local_4.push(m_sprite);
                    CAM.addTargets(_local_4);
                };
                m_sprite.x = _local_2;
                m_sprite.y = _local_3;
                this.setSizeStatus(0);
                if (this.inState(CState.CAUGHT))
                {
                    this.setVisibility(_local_6);
                };
                this.playFrame("special");
                this.resetChargedAttacks();
                m_attackData.resetCharges();
                this.toggleEffect(this.m_chargeGlowHolderMC, false);
                this.m_chargeGlowHolderMC = null;
                this.toggleEffect(this.m_fsGlowHolderMC, false);
                this.setStats(_local_1);
                if ((!(m_facingForward)))
                {
                    this.m_faceLeft();
                }
                else
                {
                    this.m_faceRight();
                };
            };
        }

        private function setStats(_arg_1:CharacterData):void
        {
            var _local_2:String;
            var _local_3:Array;
            var _local_4:int;
            var _local_5:MovieClip;
            this.resetStaleMoves();
            this.m_characterStats.Sounds = new Array();
            this.m_characterStats.importData(_arg_1.exportCharacterData());
            this.m_jumpStartup = new FrameTimer(_arg_1.JumpStartup);
            _local_2 = _arg_1.JumpSpeedList;
            while (((_local_2) && (_local_2.indexOf(" ") >= 0)))
            {
                _local_2 = _local_2.replace(" ", "");
            };
            _local_3 = ((_arg_1.JumpSpeedList) ? _local_2.split(",") : null);
            this.m_jumpSpeedList = null;
            this.m_jumpSpeedList = new Array();
            _local_4 = 0;
            while (((!(_local_3 == null)) && (_local_4 < _local_3.length)))
            {
                this.m_jumpSpeedList.push(((isNaN(parseFloat(_local_3[_local_4]))) ? 0 : parseFloat(_local_3[_local_4])));
                _local_4++;
            };
            this.m_jumpSpeedList = _local_3;
            m_gravity = _arg_1.Gravity;
            this.m_norm_xSpeed = _arg_1.NormalXSpeed;
            this.m_max_xSpeed = _arg_1.MaxXSpeed;
            m_max_ySpeed = _arg_1.MaxYSpeed;
            m_attackData = _arg_1.Attacks;
            m_attackData.Owner = this;
            this.m_characterStats.Power = _arg_1.Power;
            m_weight1 = _arg_1.Weight1;
            m_weight2 = (Utils.VELOCITY_SCALE * Utils.WEIGHT2_BASE);
            this.buildHitBoxData(this.m_characterStats.LinkageID);
            if (Main.DEBUG)
            {
                verifiyHitBoxData();
            };
            this.generatePummelData();
            if (((m_attackData.getAttack("grab")) && (m_attackData.getAttack("grab").AttackBoxes.length > 0)))
            {
                m_attackData.getAttack("grab").AttackBoxes[0].importAttackData({
                    "team_id":m_team_id,
                    "refreshRate":3,
                    "damage":this.m_characterStats.GrabDamage,
                    "hasEffect":false,
                    "bypassNonGrabbed":true,
                    "effectSound":this.m_characterStats.Sounds["pummel"],
                    "staleMultiplier":this.totalMoveDecay("grab")
                });
            };
            this.m_wallStickTime = new FrameTimer(this.m_characterStats.WallStick);
            this.m_forceTransformTime = new FrameTimer(_arg_1.ForceTransformTime);
            if (Stats.getStats(this.m_characterStats.ForceTransformID, this.m_expansion_id) == null)
            {
                this.m_forceTransformTime.MaxTime = 0;
            };
            this.m_midAirHoverTime = new FrameTimer(this.m_characterStats.MidAirHover);
            this.m_midAirJumpConstantTime = new FrameTimer(_arg_1.MidAirJumpConstant);
            this.m_midAirJumpConstantDelay = new FrameTimer(_arg_1.MidAirJumpConstantDelay);
            this.m_damageIncreaseInterval = new FrameTimer(_arg_1.DamageIncreaseInterval);
            m_sprite.scaleX = ((m_sprite.scaleX > 0) ? m_sizeRatio : -(m_sizeRatio));
            m_sprite.scaleY = ((m_sprite.scaleY > 0) ? m_sizeRatio : -(m_sizeRatio));
            this.HealthBox.charName.text = this.m_characterStats.DisplayName.toUpperCase();
            if (this.HealthBox.charHead.numChildren > 0)
            {
                this.HealthBox.charHead.removeChild(this.HealthBox.charHead.getChildByName("charhead"));
            };
            if (this.HealthBox.icon.numChildren > 0)
            {
                this.HealthBox.icon.removeChild(this.HealthBox.icon.getChildByName("icon"));
            };
            m_width = _arg_1.Width;
            m_height = _arg_1.Height;
            m_sprite.cam_width = _arg_1.CamWidth;
            m_sprite.cam_height = _arg_1.CamHeight;
            m_sprite.cam_x_offset = this.m_characterStats.CamXOffset;
            m_sprite.cam_y_offset = this.m_characterStats.CamYOffset;
            m_sprite.camOverride = null;
            if (((!(this.m_item == null)) && (!(this.m_characterStats.CanHoldItems))))
            {
                this.m_item.destroy();
            };
            m_attackData.resetDisabledAttacks();
            _local_5 = Main.getLibraryMC(this.m_characterStats.Thumbnail, this.m_expansion_id);
            if (_local_5 != null)
            {
                _local_5.name = "charhead";
                this.HealthBox.charHead.addChild(_local_5);
            };
            _local_5 = Main.getLibraryMC(this.m_characterStats.SeriesIcon, this.m_expansion_id);
            if (_local_5 != null)
            {
                _local_5.name = "icon";
                this.HealthBox.icon.addChild(_local_5);
                if (((m_team_id > 0) && (!(ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)))))
                {
                    this.updateColorFilter(this.HealthBox.charHead, m_team_id, this.CostumeName, this.m_costume_id);
                    switch (m_team_id)
                    {
                        case 1:
                            Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 90, 0, 0, 0);
                            break;
                        case 2:
                            Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 0, 90, 0, 0);
                            break;
                        case 3:
                            Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 0, 0, 90, 0);
                            break;
                    };
                }
                else
                {
                    this.updateColorFilter(this.HealthBox.charHead, ((ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)) ? null : m_team_id), this.CostumeName, this.m_costume_id);
                    switch (m_player_id)
                    {
                        case 1:
                            Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 90, 0, 0, 0);
                            break;
                        case 2:
                            Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 0, 90, 0, 0);
                            break;
                        case 3:
                            Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 90, 90, 0, 0);
                            break;
                        case 4:
                            Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 0, 0, 90, 0);
                            break;
                    };
                    if ((((STAGEDATA.GameRef.GameMode == Mode.TRAINING) && (m_player_id > 1)) || (!(this.m_human))))
                    {
                        Utils.setTint(this.HealthBox.icon, 1, 1, 1, 1, 0, 0, 0, 0);
                    };
                };
            };
            if (SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.LIGHT))
            {
                m_gravity = (m_gravity / 2);
                m_max_ySpeed = (m_max_ySpeed / 2);
            }
            else
            {
                if (SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.HEAVY))
                {
                    m_gravity = (m_gravity * 2);
                    m_max_ySpeed = (m_max_ySpeed * 2);
                };
            };
            if (this.m_starKOMC.parent)
            {
                this.m_starKOMC.parent.removeChild(this.m_starKOMC);
            };
            this.m_starKOMC = null;
            this.m_starKOMC = Main.getLibraryMC(this.m_characterStats.LinkageID);
            this.updateColorFilter(this.m_starKOMC, ((ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)) ? null : m_team_id), this.CurrentStatsName, this.m_costume_id);
            Utils.tryToGotoAndStop(this.m_starKOMC, "falling");
            Utils.recursiveMovieClipPlay(this.m_starKOMC, false);
            if ((!(this.m_human)))
            {
                this.CPU.refreshRecoveryAttackList();
                this.CPU.refreshDisabledAttackList();
            };
            this.updateColorFilter(m_sprite, ((ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)) ? null : m_team_id), this.CostumeName, this.m_costume_id);
        }

        public function Attack(_arg_1:String, _arg_2:Number, _arg_3:Boolean=false):void
        {
            var _local_5:String;
            var _local_6:AttackObject;
            var _local_7:MovieClip;
            if (m_attackData.getAttack(_arg_1).IsDisabled)
            {
                return;
            };
            if (this.inState(CState.ATTACKING))
            {
                if (m_attack.AllowFullInterrupt)
                {
                    if ((((_arg_1 === this.m_lastAttackUsedTurbo) || ((_arg_1 + "_air") === this.m_lastAttackUsedTurbo)) || (_arg_1 === (this.m_lastAttackUsedTurbo + "_air"))))
                    {
                        return;
                    };
                    if (m_attack.Rocket)
                    {
                        m_attack.Rocket = false;
                        m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_ROCKET_COMPLETE, {"caller":this}));
                        this.resetRotation();
                    };
                    m_actionShot = false;
                    this.grabReleaseOpponent();
                };
                flushTimers();
            };
            this.m_cStickUse = _arg_3;
            var _local_4:Boolean = m_collision.ground;
            if (((!(m_attackData.getAttack(_arg_1).IsDisabled)) && (m_attackData.getAttack(_arg_1).Enabled)))
            {
                if (m_attackData.getAttack(_arg_1) != null)
                {
                    m_attackData.getAttack(_arg_1).LastUsedPrevious = m_attackData.getAttack(_arg_1).LastUsed;
                    m_attackData.getAttack(_arg_1).LastUsed = 0;
                    if (((_arg_1 == "b") || (_arg_1 == "b_air")))
                    {
                        m_attackData.getAttack(((_arg_1 == "b") ? "b_air" : "b")).LastUsedPrevious = m_attackData.getAttack(((_arg_1 == "b") ? "b_air" : "b")).LastUsed;
                        m_attackData.getAttack(((_arg_1 == "b") ? "b_air" : "b")).LastUsed = 0;
                    }
                    else
                    {
                        if (((_arg_1 == "b_up") || (_arg_1 == "b_up_air")))
                        {
                            m_attackData.getAttack(((_arg_1 == "b_up") ? "b_up_air" : "b_up")).LastUsedPrevious = m_attackData.getAttack(((_arg_1 == "b_up") ? "b_up_air" : "b_up")).LastUsed;
                            m_attackData.getAttack(((_arg_1 == "b_up") ? "b_up_air" : "b_up")).LastUsed = 0;
                        }
                        else
                        {
                            if (((_arg_1 == "b_forward") || (_arg_1 == "b_forward_air")))
                            {
                                m_attackData.getAttack(((_arg_1 == "b_forward") ? "b_forward_air" : "b")).LastUsedPrevious = m_attackData.getAttack(((_arg_1 == "b_forward") ? "b_forward_air" : "b")).LastUsed;
                                m_attackData.getAttack(((_arg_1 == "b_forward") ? "b_forward_air" : "b")).LastUsed = 0;
                            }
                            else
                            {
                                if (((_arg_1 == "b_down") || (_arg_1 == "b_down_air")))
                                {
                                    m_attackData.getAttack(((_arg_1 == "b_down") ? "b_down_air" : "b_down")).LastUsedPrevious = m_attackData.getAttack(((_arg_1 == "b_down") ? "b_down_air" : "b_down")).LastUsed;
                                    m_attackData.getAttack(((_arg_1 == "b_down") ? "b_down_air" : "b_down")).LastUsed = 0;
                                };
                            };
                        };
                    };
                };
                _local_5 = _arg_1;
                _local_6 = m_attackData.getAttack((((this.inState(CState.GLIDING)) && (!(m_attackData.getAttack("glide") == null))) ? "glide" : _arg_1));
                if (_arg_1 == "item")
                {
                    this.m_item.Uses++;
                    m_attackData.getAttack("item").init();
                    if (this.m_item.AttackDataObj.getAttack(this.m_item.AttackStateData.Frame))
                    {
                        m_attackData.getAttack("item").importAttackData(this.m_item.AttackDataObj.getAttack(this.m_item.AttackStateData.Frame).exportAttackData());
                    }
                    else
                    {
                        throw (new Error("Error, null item stats detected."));
                    };
                    _local_6 = this.m_item.AttackDataObj.getAttack(this.m_item.AttackStateData.Frame);
                    this.playFrame(_arg_1);
                    this.stancePlayFrame(((this.m_item.DoingSmash) ? (this.m_item.Frame + "2") : this.m_item.Frame));
                };
                if ((((!(this.jumpIsPressed())) && (!((this.m_up) && (this.m_tap_jump)))) && ((m_ySpeed < 0) || ((this.m_midAirJumpConstantTime.MaxTime > 0) && (!(this.m_midAirJumpConstantTime.IsComplete))))))
                {
                    if ((((_local_6.JumpCancel) && (this.m_jumpCount == 0)) && (!(m_collision.ground))))
                    {
                        m_ySpeed = 0;
                        this.m_midAirJumpConstantTime.CurrentTime = this.m_midAirJumpConstantTime.MaxTime;
                    }
                    else
                    {
                        if ((((_local_6.DoubleJumpCancel) && (this.m_jumpCount > 0)) && (!(m_collision.ground))))
                        {
                            m_ySpeed = 0;
                            this.m_midAirJumpConstantTime.CurrentTime = this.m_midAirJumpConstantTime.MaxTime;
                        };
                    };
                };
                m_attack.RefreshRateTimer = 1;
                m_attack.RefreshRateReady = false;
                m_attack.SizeStatus = this.m_sizeStatus;
                this.m_attackIDIncremented = true;
                m_attack.ForceFallThrough = _local_6.ForceFallThrough;
                m_attack.MaintainSpeed = _local_6.MaintainSpeed;
                m_attack.FacedLedgesOnly = _local_6.FacedLedgesOnly;
                m_attackData.getAttack(_arg_1).OverrideMap.clear();
                m_attackData.getAttack(_arg_1).ReenableTimerCount = m_attackData.getAttack(_arg_1).ReenableTimer;
                if (((m_collision.ground) && (!(m_attack.MaintainSpeed))))
                {
                    this.resetSpeedLevel();
                };
                if (((_local_6.ChargeClick) && (!(this.m_cStickUse))))
                {
                    this.playGlobalSound("chargeclick");
                };
                if (_local_6.Flip)
                {
                    if (m_facingForward)
                    {
                        this.m_faceLeft();
                    }
                    else
                    {
                        this.m_faceRight();
                    };
                };
                if (this.jumpIsPressed())
                {
                    this.m_tapJumpLetGo = false;
                    this.m_jumpLetGo = false;
                    this.m_jumpFullyReleased = false;
                };
                this.m_fastFallLetGo = false;
                m_attack.IsTurning = false;
                m_attack.IsAccelerating = false;
                m_attack.HoldRepeat = _local_6.HoldRepeat;
                m_attack.AttackType = _arg_2;
                if ((!(_local_6.ConserveJumpConstant)))
                {
                    if ((!(this.m_midAirJumpConstantTime.IsComplete)))
                    {
                        m_ySpeed = 0;
                    };
                    this.m_midAirJumpConstantTime.CurrentTime = this.m_midAirJumpConstantTime.MaxTime;
                };
                this.m_bufferedAttackJump = false;
                m_attack.AirEase = _local_6.AirEase;
                m_attack.XSpeedCap = _local_6.XSpeedCap;
                m_attack.IsForward = m_facingForward;
                m_attack.StaleMultiplier = this.totalMoveDecay(_arg_1);
                m_attack.Invincible = m_attackData.getAttack(_arg_1).Invincible;
                m_attack.SuperArmor = m_attackData.getAttack(_arg_1).SuperArmor;
                m_attack.HeavyArmor = m_attackData.getAttack(_arg_1).HeavyArmor;
                m_attack.XSpeedAccel = _local_6.XSpeedAccel;
                m_attack.XSpeedAccelAir = _local_6.XSpeedAccelAir;
                m_attack.XSpeedDecay = _local_6.XSpeedDecay;
                m_attack.XSpeedDecayAir = _local_6.XSpeedDecayAir;
                m_attack.ComboTotal = 0;
                m_attack.ComboMax = _local_6.ComboMax;
                m_attack.ForceComboContinue = _local_6.ForceComboContinue;
                m_attack.ForceGrabbable = _local_6.ForceGrabbable;
                m_attack.LetGo = false;
                m_attack.NextComboFrame = null;
                m_attack.AttackID = Utils.getUID();
                this.checkLinkedProjectiles();
                m_attack.Frame = _arg_1;
                m_attack.ExecTime = 0;
                m_attack.SecondaryAttack = _local_6.SecondaryAttack;
                m_attack.RefreshRate = _local_6.RefreshRate;
                m_attack.HomingSpeed = _local_6.HomingSpeed;
                m_attack.ControlDirection = _local_6.ControlDirection;
                m_attack.ChargeTimeMax = _local_6.ChargeTimeMax;
                m_attack.LinkCharge = _local_6.LinkCharge;
                m_attack.AllowControl = _local_6.AllowControl;
                m_attack.AllowControlGround = _local_6.AllowControlGround;
                m_attack.AllowJump = _local_6.AllowJump;
                m_attack.AllowFastFall = _local_6.AllowFastFall;
                m_attack.AllowRun = _local_6.AllowRun;
                m_attack.AllowTurn = _local_6.AllowTurn;
                m_attack.AllowFullInterrupt = _local_6.AllowFullInterrupt;
                m_attack.AllowDoubleJump = _local_6.AllowDoubleJump;
                m_attack.LinkFrames = _local_6.LinkFrames;
                if (_arg_2 == 1)
                {
                    this.m_attackLetGoA = false;
                }
                else
                {
                    if (_arg_2 == 2)
                    {
                        this.m_attackLetGoB = false;
                    };
                };
                m_attack.Cancel = _local_6.Cancel;
                m_attack.CancelWhenAirborne = _local_6.CancelWhenAirborne;
                m_attack.HasLanded = m_collision.ground;
                m_attack.Rotate = _local_6.Rotate;
                m_attack.CancelSoundOnEnd = _local_6.CancelSoundOnEnd;
                m_attack.CancelVoiceOnEnd = _local_6.CancelVoiceOnEnd;
                m_attack.WasCancelled = false;
                m_attack.XLoc = MC.x;
                m_attack.YLoc = MC.y;
                m_attack.DisableJump = _local_6.DisableJump;
                m_attack.JumpCancelAttack = _local_6.JumpCancelAttack;
                m_attack.DoubleJumpCancelAttack = _local_6.DoubleJumpCancelAttack;
                m_attack.AttackDelay = _local_6.AttackDelay;
                m_attack.IsThrow = (_arg_1.substring(0, 6) == "throw_");
                m_attack.ChargeInAir = _local_6.ChargeInAir;
                m_attack.MustCharge = _local_6.MustCharge;
                m_attack.CanFallOff = _local_6.CanFallOff;
                m_attack.CanBeAbsorbed = _local_6.CanBeAbsorbed;
                m_attack.AirCancel = _local_6.AirCancel;
                m_attack.AirCancelSpecial = _local_6.AirCancelSpecial;
                m_attack.IsAirAttack = (!(m_collision.ground));
                this.resetRotation();
                Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                if (_local_6.ResetMovement)
                {
                    m_xSpeed = 0;
                    m_ySpeed = 0;
                };
                if ((!(_local_6.ChargeRetain)))
                {
                    _local_6.ChargeTime = 0;
                }
                else
                {
                    if (((_local_6.UseChargeBar) && (STAGEPARENT.getChildByName(("energy" + m_player_id)) == null)))
                    {
                        _local_7 = Main.getLibraryMC("energy");
                        _local_7.name = ("energy" + m_player_id);
                        STAGEPARENT.addChild(_local_7);
                        STAGEPARENT.getChildByName(("energy" + m_player_id)).x = (m_sprite.x + STAGE.x);
                        STAGEPARENT.getChildByName(("energy" + m_player_id)).y = (m_sprite.y + STAGE.y);
                        STAGEPARENT.getChildByName(("energy" + m_player_id)).width = (STAGEPARENT.getChildByName(("energy" + m_player_id)).width * m_sizeRatio);
                        STAGEPARENT.getChildByName(("energy" + m_player_id)).height = (STAGEPARENT.getChildByName(("energy" + m_player_id)).height * m_sizeRatio);
                    };
                };
                this.m_attackHovering = (((this.inState(CState.HOVER)) && (m_attack.IsAirAttack)) && (_arg_2 == 1));
                if (_local_6.JumpFrame != null)
                {
                    this.playFrame(_arg_1);
                    this.stancePlayFrame(_local_6.JumpFrame);
                }
                else
                {
                    this.playFrame(_arg_1);
                };
                this.setState(CState.ATTACKING);
                if (((SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.TURBO)) && (!(m_attack.Frame === "special"))))
                {
                    addEventListener(SSF2Event.ATTACK_HIT, this.allowTurboCancel);
                    addEventListener(SSF2Event.ATTACK_HIT_SHIELD, this.allowTurboCancel);
                    addEventListener(SSF2Event.ATTACK_HIT_POWER_SHIELD, this.allowTurboCancel);
                    addEventListener(SSF2Event.CHAR_GRAB, this.allowTurboCancel);
                };
            };
        }

        private function SpecialAttack():void
        {
            var _local_2:MovieClip;
            this.m_forceTransformTime.MaxTime = 0;
            m_attack.SizeStatus = this.m_sizeStatus;
            var _local_1:Boolean = m_collision.ground;
            this.m_specialInit = false;
            m_attack.Frame = "special";
            m_attack.IsAirAttack = (!(m_collision.ground));
            MC.rotation = 0;
            Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
            this.m_attackIDIncremented = true;
            if (m_attackData.getAttack(m_attack.Frame).Flip)
            {
                if (m_facingForward)
                {
                    this.m_faceLeft();
                }
                else
                {
                    this.m_faceRight();
                };
            };
            if (((!(this.jumpIsPressed())) && ((m_ySpeed < 0) || ((this.m_midAirJumpConstantTime.MaxTime > 0) && (!(this.m_midAirJumpConstantTime.IsComplete))))))
            {
                if (((m_attackData.getAttack(m_attack.Frame).JumpCancel) && (this.m_jumpCount == 0)))
                {
                    m_ySpeed = 0;
                    this.m_midAirJumpConstantTime.CurrentTime = this.m_midAirJumpConstantTime.MaxTime;
                }
                else
                {
                    if ((((m_attackData.getAttack(m_attack.Frame).DoubleJumpCancel) && (this.m_jumpCount > 0)) && (!(m_collision.ground))))
                    {
                        m_ySpeed = 0;
                        this.m_midAirJumpConstantTime.CurrentTime = this.m_midAirJumpConstantTime.MaxTime;
                    };
                };
            };
            if (this.jumpIsPressed())
            {
                this.m_tapJumpLetGo = false;
                this.m_jumpLetGo = false;
                this.m_jumpFullyReleased = false;
            };
            this.m_bufferedAttackJump = false;
            m_attack.FacedLedgesOnly = m_attackData.getAttack(m_attack.Frame).FacedLedgesOnly;
            m_attack.ComboTotal = 0;
            m_attack.ChargeTime = m_attackData.getAttack(m_attack.Frame).ChargeTime;
            m_attack.ChargeTimeMax = m_attackData.getAttack(m_attack.Frame).ChargeTimeMax;
            m_attack.LinkCharge = m_attackData.getAttack(m_attack.Frame).LinkCharge;
            m_attack.ComboMax = m_attackData.getAttack(m_attack.Frame).ComboMax;
            m_attack.ForceComboContinue = m_attackData.getAttack(m_attack.Frame).ForceComboContinue;
            m_attack.IsThrow = false;
            m_attackData.getAttack(m_attack.Frame).OverrideMap.clear();
            m_attackData.getAttack(m_attack.Frame).ReenableTimerCount = m_attackData.getAttack(m_attack.Frame).ReenableTimer;
            m_attack.ForceFallThrough = m_attackData.getAttack(m_attack.Frame).ForceFallThrough;
            m_attack.MaintainSpeed = m_attackData.getAttack(m_attack.Frame).MaintainSpeed;
            m_attack.IsForward = m_facingForward;
            m_attack.Rocket = false;
            STAGEDATA.ItemsRef.SmashBallReady.reset();
            STAGEDATA.ItemsRef.SmashBallReady.MaxTime = this.m_characterStats.FSTimer;
            m_attack.RefreshRateTimer = 1;
            m_attack.RefreshRateReady = false;
            m_attack.IsTurning = false;
            m_attack.IsAccelerating = false;
            m_attack.Invincible = m_attackData.getAttack(m_attack.Frame).Invincible;
            m_attack.SuperArmor = m_attackData.getAttack(m_attack.Frame).SuperArmor;
            m_attack.HeavyArmor = m_attackData.getAttack(m_attack.Frame).HeavyArmor;
            m_attack.XSpeedAccel = m_attackData.getAttack(m_attack.Frame).XSpeedAccel;
            m_attack.XSpeedAccelAir = m_attackData.getAttack(m_attack.Frame).XSpeedAccelAir;
            m_attack.XSpeedDecay = m_attackData.getAttack(m_attack.Frame).XSpeedDecay;
            m_attack.XSpeedDecayAir = m_attackData.getAttack(m_attack.Frame).XSpeedDecayAir;
            m_attack.LetGo = false;
            m_attack.HoldRepeat = false;
            m_attack.AttackType = 2;
            m_attack.AttackID = Utils.getUID();
            this.checkLinkedProjectiles();
            m_attack.HomingSpeed = m_attackData.getAttack(m_attack.Frame).HomingSpeed;
            m_attack.DisableJump = m_attackData.getAttack(m_attack.Frame).DisableJump;
            m_attack.JumpCancelAttack = m_attackData.getAttack(m_attack.Frame).JumpCancelAttack;
            m_attack.DoubleJumpCancelAttack = m_attackData.getAttack(m_attack.Frame).DoubleJumpCancelAttack;
            m_attack.ControlDirection = m_attackData.getAttack(m_attack.Frame).ControlDirection;
            m_attack.ChargeInAir = m_attackData.getAttack(m_attack.Frame).ChargeInAir;
            m_attack.AirEase = m_attackData.getAttack(m_attack.Frame).AirEase;
            m_attack.XSpeedCap = m_attackData.getAttack(m_attack.Frame).XSpeedCap;
            m_attack.RefreshRate = m_attackData.getAttack(m_attack.Frame).RefreshRate;
            m_attack.ExecTime = -1;
            m_attack.SecondaryAttack = m_attackData.getAttack(m_attack.Frame).SecondaryAttack;
            m_attack.AllowControl = m_attackData.getAttack(m_attack.Frame).AllowControl;
            m_attack.AllowControlGround = m_attackData.getAttack(m_attack.Frame).AllowControlGround;
            m_attack.AllowJump = m_attackData.getAttack(m_attack.Frame).AllowJump;
            m_attack.AllowFastFall = m_attackData.getAttack(m_attack.Frame).AllowFastFall;
            m_attack.AllowRun = m_attackData.getAttack(m_attack.Frame).AllowRun;
            m_attack.AllowTurn = m_attackData.getAttack(m_attack.Frame).AllowTurn;
            m_attack.AllowFullInterrupt = m_attackData.getAttack(m_attack.Frame).AllowFullInterrupt;
            m_attack.AllowDoubleJump = m_attackData.getAttack(m_attack.Frame).AllowDoubleJump;
            m_attack.LinkFrames = m_attackData.getAttack(m_attack.Frame).LinkFrames;
            m_attack.Cancel = m_attackData.getAttack(m_attack.Frame).Cancel;
            m_attack.CancelWhenAirborne = m_attackData.getAttack(m_attack.Frame).CancelWhenAirborne;
            m_attack.HasLanded = m_collision.ground;
            m_attack.CancelSoundOnEnd = m_attackData.getAttack(m_attack.Frame).CancelSoundOnEnd;
            m_attack.CancelVoiceOnEnd = m_attackData.getAttack(m_attack.Frame).CancelVoiceOnEnd;
            m_attack.Rotate = m_attackData.getAttack(m_attack.Frame).Rotate;
            m_attack.WasCancelled = false;
            m_attack.XLoc = MC.x;
            m_attack.YLoc = MC.y;
            this.m_attackLetGoB = false;
            m_attack.AttackDelay = m_attackData.getAttack(m_attack.Frame).AttackDelay;
            this.m_usingSpecialAttack = true;
            m_attack.CanFallOff = m_attackData.getAttack(m_attack.Frame).CanFallOff;
            m_attack.CanBeAbsorbed = m_attackData.getAttack(m_attack.Frame).CanBeAbsorbed;
            m_attack.AirCancel = m_attackData.getAttack(m_attack.Frame).AirCancel;
            m_attack.AirCancelSpecial = m_attackData.getAttack(m_attack.Frame).AirCancelSpecial;
            CAM.darken();
            if (m_attackData.getAttack(m_attack.Frame).ResetMovement)
            {
                m_xSpeed = 0;
                m_ySpeed = 0;
            };
            if ((!(m_attackData.getAttack(m_attack.Frame).ChargeRetain)))
            {
                m_attackData.getAttack(m_attack.Frame).ChargeTime = 0;
            }
            else
            {
                if (((m_attackData.getAttack(m_attack.Frame).UseChargeBar) && (STAGEPARENT.getChildByName(("energy" + m_player_id)) == null)))
                {
                    _local_2 = Main.getLibraryMC("energy");
                    _local_2.name = ("energy" + m_player_id);
                    STAGEPARENT.addChild(_local_2);
                    STAGEPARENT.getChildByName(("energy" + m_player_id)).x = (m_sprite.x + STAGE.x);
                    STAGEPARENT.getChildByName(("energy" + m_player_id)).y = (m_sprite.y + STAGE.y);
                    STAGEPARENT.getChildByName(("energy" + m_player_id)).width = (STAGEPARENT.getChildByName(("energy" + m_player_id)).width * m_sizeRatio);
                    STAGEPARENT.getChildByName(("energy" + m_player_id)).height = (STAGEPARENT.getChildByName(("energy" + m_player_id)).height * m_sizeRatio);
                };
            };
            this.setState(CState.ATTACKING);
            if (SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.TURBO))
            {
                addEventListener(SSF2Event.ATTACK_HIT, this.allowTurboCancel);
                addEventListener(SSF2Event.ATTACK_HIT_SHIELD, this.allowTurboCancel);
                addEventListener(SSF2Event.ATTACK_HIT_POWER_SHIELD, this.allowTurboCancel);
                addEventListener(SSF2Event.CHAR_GRAB, this.allowTurboCancel);
            };
        }

        private function allowTurboCancel(_arg_1:SSF2Event):void
        {
            var _local_2:AttackObject;
            var _local_3:String;
            _local_2 = m_attackData.getAttack(m_attack.Frame);
            if ((!(_local_2)))
            {
                return;
            };
            _local_3 = ((_local_2.ParentAttack) || (m_attack.Frame));
            if ((((((!(this.m_lastAttackUsedTurbo == _local_3)) && (!((this.m_lastAttackUsedTurbo + "_air") == _local_3))) && (!(this.m_lastAttackUsedTurbo == (_local_3 + "_air")))) && (!(this.inState(CState.GRABBING)))) && (!(((_arg_1.data) && (_arg_1.data.attackBoxData)) && (!(_arg_1.data.attackBoxData.allowTurboInterrupt))))))
            {
                this.setAttackEnabled(true, this.m_lastAttackUsedTurbo);
                this.setAttackEnabled(false, _local_3);
                updateAttackStats({
                    "allowJump":true,
                    "allowDoubleJump":true,
                    "airCancel":true,
                    "airCancelSpecial":true,
                    "allowFullInterrupt":true,
                    "jumpCancelAttack":true,
                    "doubleJumpCancelAttack":true
                });
                removeEventListener(SSF2Event.ATTACK_HIT, this.allowTurboCancel);
                removeEventListener(SSF2Event.ATTACK_HIT_SHIELD, this.allowTurboCancel);
                removeEventListener(SSF2Event.ATTACK_HIT_POWER_SHIELD, this.allowTurboCancel);
                addEventListener(SSF2Event.CHAR_ATTACK_COMPLETE, this.reenableOnEnd);
                addEventListener(SSF2Event.CHAR_HURT, this.reenableOnEnd);
                addEventListener(SSF2Event.CHAR_GRABBED, this.reenableOnEnd);
                this.m_lastAttackUsedTurbo = _local_3;
            };
        }

        private function reenableOnEnd(_arg_1:*=null):void
        {
            if (this.m_lastAttackUsedTurbo)
            {
                this.setAttackEnabled(true, this.m_lastAttackUsedTurbo);
            };
            if (((this.inState(CState.ATTACKING)) && (m_attack.IsThrow)))
            {
                this.grabReleaseOpponent();
            };
            this.m_lastAttackUsedTurbo = null;
        }

        private function checkTurbo():void
        {
            if (((SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.TURBO)) && (this.m_lastAttackUsedTurbo)))
            {
                this.setAttackEnabled(true, this.m_lastAttackUsedTurbo);
                this.m_lastAttackUsedTurbo = null;
            };
        }

        public function hitBoxAttackTest(_arg_1:String, _arg_2:String):AttackDamage
        {
            var _local_3:AttackDamage;
            var _local_4:AttackObject;
            _local_3 = new AttackDamage(m_player_id, this);
            _local_4 = m_attackData.getAttack(_arg_1);
            if (_local_4)
            {
                if (_local_4.AttackBoxes[_arg_2])
                {
                    _local_3.importAttackDamageData(_local_4.AttackBoxes[_arg_2]);
                    _local_3.importAttackDamageData({
                        "atk_id":m_attack.AttackID,
                        "team_id":m_team_id
                    });
                };
            };
            return (_local_3);
        }

        override public function reactionShield(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            var _local_3:AttackDamage;
            _local_3 = m_attackData.getAttackBoxData(m_attack.Frame, _arg_2.FirstHitBox.Name).syncState(m_attack);
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CONNECT_SHIELD, {
                "caller":this,
                "receiver":_arg_1,
                "attackBoxData":_local_3.exportAttackDamageData()
            }));
            if ((_arg_1 as Character))
            {
                if (Character(_arg_1).takeShieldDamage(_local_3, _arg_2.OverlapHitBox))
                {
                    m_attack.RefreshRateReady = true;
                    m_eventManager.dispatchEvent(new SSF2Event(((Character(_arg_1).PerfectShield) ? SSF2Event.ATTACK_HIT_POWER_SHIELD : SSF2Event.ATTACK_HIT_SHIELD), {
                        "caller":this,
                        "receiver":_arg_1,
                        "attackBoxData":_local_3.exportAttackDamageData()
                    }));
                    return (true);
                };
            };
            return (false);
        }

        override public function reactionShieldAttack(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            var _local_3:AttackDamage;
            _local_3 = m_attackData.getAttackBoxData(m_attack.Frame, _arg_2.FirstHitBox.Name).syncState(m_attack);
            if (((_local_3.Priority < 7) && (_local_3.Priority > -1)))
            {
                attachEffect("effect_cancel", (((_arg_2) && (_arg_2.OverlapHitBox)) ? {
    "x":_arg_2.OverlapHitBox.centerx,
    "y":_arg_2.OverlapHitBox.centery,
    "absolute":true
} : null));
                this.endAttack();
                _arg_1.pushBackSlightly((_arg_1.X > m_sprite.x));
                return (true);
            };
            return (false);
        }

        override public function reactionAbsorb(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            var _local_3:AttackDamage;
            _local_3 = m_attackData.getAttackBoxData(m_attack.Frame, _arg_2.FirstHitBox.Name).syncState(m_attack);
            if ((((m_attack.CanBeAbsorbed) && (_arg_1.HasAbsorbBox)) && (_arg_1.LastAttackID.indexOf(m_attack.AttackID) < 0)))
            {
                if (_arg_1.recover(Utils.calculateChargeDamage(_local_3, _local_3.AbsorbDamage)))
                {
                    _arg_1.stackAttackID(_local_3.AttackID);
                    m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_ABSORB, {
                        "caller":this,
                        "projectile":_arg_1,
                        "attackBoxData":_local_3.exportAttackDamageData()
                    }));
                    return (true);
                };
            };
            return (false);
        }

        override public function reactionGrab(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            var _local_3:Character;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            _local_3 = null;
            if (((this.inState(CState.GRABBING)) && (_arg_1 as Character)))
            {
                _local_3 = Character(_arg_1);
                if (((((((((((((((((!(_local_3.Invincible)) && (!(_local_3.Intangible))) || ((_local_3.inState(CState.ATTACKING)) && (_local_3.AttackStateData.ForceGrabbable))) && (!(_local_3.Dead))) && (!(_local_3.Revival))) && (!(_local_3.Caught()))) && (!(_local_3.Grabbed.length > 0))) && (!(_local_3.Frozen))) && (!(((_local_3.Team == m_team_id) && (m_team_id > 0)) && (!(STAGEDATA.TeamDamage))))) && (!(_local_3.UsingFinalSmash))) && (!(_local_3.StandBy))) && (!(_local_3.inState(CState.CRASH_LAND)))) && (!(_local_3.Egg))) && (!(_local_3.Frozen))) && (!(_local_3.Pitfall))) && (checkLinearPathBetweenPoints(new Point(m_sprite.x, (m_sprite.y - (m_sprite.height / 2))), new Point(_local_3.X, (_local_3.Y - (_local_3.Height / 2)))))))
                {
                    if ((!(_local_3.Capture(m_player_id))))
                    {
                        return (false);
                    };
                    this.playGlobalSound("grab");
                    this.stancePlayFrame("grabbed");
                    m_attack.AttackID = Utils.getUID();
                    this.checkLinkedProjectiles();
                    this.m_grabLetGo = false;
                    this.m_grabbed = new Vector.<Character>();
                    this.m_grabbed.push(_local_3);
                    this.m_grabTimer = ((90 + (_local_3.getDamage() * 1.7)) / 2);
                    this.m_pummelTimer = ((this.m_grabTimer / 13) * 3);
                    this.m_justPummeled = false;
                    _local_3.FaceForward((!(m_facingForward)));
                    this.m_attackLetGoA = true;
                    this.m_grabLetGo = false;
                    if (HasTouchBox)
                    {
                        this.repositionGrabbedCharacter();
                    };
                    if (_local_3.Depth > this.Depth)
                    {
                        swapDepths(_local_3);
                    };
                    m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_GRAB, {
                        "caller":this,
                        "grabbed":_local_3
                    }));
                    return (true);
                };
            }
            else
            {
                if (((!(this.inState(CState.GRABBING))) && (_arg_1 as Character)))
                {
                    _local_3 = Character(_arg_1);
                    if (((((this.m_grabbed.length == 0) || ((this.m_usingSpecialAttack) && (this.m_characterStats.SpecialType == 6))) && (!(((this.m_usingSpecialAttack) && ((this.m_characterStats.SpecialType == 2) || (this.m_characterStats.SpecialType == 3))) && (!(checkLinearPathBetweenPoints(new Point(m_sprite.x, (m_sprite.y - (m_height / 2))), new Point(_arg_1.X, (_arg_1.Y - (_arg_1.Height / 2))))))))) && (!(_local_3.Caught()))))
                    {
                        if (_local_3.Capture(m_player_id))
                        {
                            this.m_grabbed.push(_local_3);
                            _local_4 = m_sprite.x;
                            _local_5 = m_sprite.y;
                            _local_4 = (_local_4 * m_sizeRatio);
                            _local_5 = (_local_5 * m_sizeRatio);
                            if ((((this.m_characterStats.LinkageID == "kirby") && ((m_attack.Frame == "b") || (m_attack.Frame == "b_air"))) && (this.m_currentPower == null)))
                            {
                                this.m_kirbyLastGrabbed = _local_3.ID;
                                _local_6 = m_sprite.x;
                                _local_7 = m_sprite.y;
                                _local_6 = (_local_6 * m_sizeRatio);
                                _local_7 = (_local_7 * m_sizeRatio);
                                this.m_grabbed[0].MC.x = (this.m_grabbed[0].MC.x + (((m_sprite.x + _local_6) - this.m_grabbed[0].X) / 6));
                                this.m_grabbed[0].MC.y = m_sprite.y;
                                this.updateItemHolding();
                                this.m_charIsFull = true;
                                this.m_holdTimer = 60;
                                this.m_grabbed[0].setVisibility(false);
                                if (this.inState(CState.ATTACKING))
                                {
                                    m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_ATTACK_COMPLETE, {"caller":this}));
                                    flushTimers();
                                    removeAllTempEvents();
                                };
                                this.setState(CState.IDLE);
                            };
                            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_GRAB, {
                                "caller":this,
                                "grabbed":_local_3
                            }));
                            return (true);
                        };
                    };
                };
            };
            return (false);
        }

        override public function reactionReverse(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            if ((_arg_1 as Projectile))
            {
                Projectile(_arg_1).reverse(m_player_id, m_team_id, m_facingForward);
            }
            else
            {
                if ((_arg_1 as Item))
                {
                    Item(_arg_1).reverse(m_player_id, m_team_id, m_facingForward);
                };
            };
            return (false);
        }

        override public function reactionClank(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            var _local_3:Character;
            var _local_4:AttackDamage;
            var _local_5:AttackDamage;
            if (((_arg_1 as Character) && (!((((this.m_usingSpecialAttack) && (this.m_characterStats.SpecialType == 3)) && (m_attack.ExecTime > 1)) && (!((_arg_1 as Character) && (Character(_arg_1).Caught())))))))
            {
                _local_3 = Character(_arg_1);
                _local_4 = m_attackData.getAttackBoxData(m_attack.Frame, _arg_2.FirstHitBox.Name).syncState(m_attack);
                _local_5 = _arg_1.AttackDataObj.getAttackBoxData(_arg_1.AttackStateData.Frame, _arg_2.SecondHitBox.Name).syncState(m_attack);
                if ((((((((((((((!(_local_3.AttackStateData.Invincible)) && (_local_4.Priority == _local_5.Priority)) && (!(isIntangible()))) && (_local_5.HasEffect)) && (_local_4.HasEffect)) && (_local_4.Priority < 7)) && (_local_4.Priority > -1)) && (m_collision.ground)) && (_local_3.CollisionObj.ground)) && (!(m_attack.IsThrow))) && (!(_local_4.Priority == 1))) && (m_lastAttackID.indexOf(_local_5.AttackID) < 0)) && (!(((_local_3.AttackStateData.AttackType == 2) && (_local_4.IsAirAttack)) || ((_local_3.AttackStateData.IsAirAttack) && (m_attack.AttackType == 2))))))
                {
                    m_attack.RefreshRateReady = true;
                    m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CLANK, {
                        "caller":this,
                        "receiver":_arg_1,
                        "callerAttackBoxData":_local_4.exportAttackDamageData(),
                        "receiverAttackBoxData":_local_5.exportAttackDamageData()
                    }));
                    _arg_1.EventManagerObj.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CLANK, {
                        "caller":_arg_1,
                        "receiver":this,
                        "callerAttackBoxData":_local_5.exportAttackDamageData(),
                        "receiverAttackBoxData":_local_4.exportAttackDamageData()
                    }));
                    CAM.shake(10);
                    this.playReflectSound();
                    attachEffect("effect_cancel", (((_arg_2) && (_arg_2.OverlapHitBox)) ? {
    "x":_arg_2.OverlapHitBox.centerx,
    "y":_arg_2.OverlapHitBox.centery,
    "absolute":true
} : null));
                    _local_3.attachEffect("effect_cancel", (((_arg_2) && (_arg_2.OverlapHitBox)) ? {
    "x":_arg_2.OverlapHitBox.centerx,
    "y":_arg_2.OverlapHitBox.centery,
    "absolute":true
} : null));
                    _local_3.cancelAttack();
                    this.cancelAttack();
                    if (_local_4.Power >= 2)
                    {
                        CAM.shake(15);
                        this.repel(_local_3.X);
                        _local_3.repel(m_attack.XLoc);
                    };
                    return (true);
                };
                if (((((((((((!(_local_3.AttackStateData.Invincible)) && (_local_4.Priority > _local_5.Priority)) && (_local_5.Priority < 7)) && (_local_5.HasEffect)) && (_local_4.HasEffect)) && (m_collision.ground)) && (_local_3.CollisionObj.ground)) && (_local_5.Priority > -1)) && (!(m_attack.IsThrow))) && (!(_local_3.AttackStateData.IsThrow))))
                {
                    m_attack.RefreshRateReady = true;
                    m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CONNECT, {
                        "caller":this,
                        "receiver":_arg_1,
                        "attackBoxData":_local_4.exportAttackDamageData()
                    }));
                    _arg_1.EventManagerObj.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CONNECT, {
                        "caller":_arg_1,
                        "receiver":this,
                        "attackBoxData":_local_5.exportAttackDamageData()
                    }));
                    _local_3.attachEffect("effect_cancel", (((_arg_2) && (_arg_2.OverlapHitBox)) ? {
    "x":_arg_2.OverlapHitBox.centerx,
    "y":_arg_2.OverlapHitBox.centery,
    "absolute":true
} : null));
                    _local_3.cancelAttack();
                    if (_local_3.takeDamage(_local_4, _arg_2.OverlapHitBox))
                    {
                        m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_HIT, {
                            "caller":this,
                            "receiver":_arg_1,
                            "attackBoxData":_local_4.exportAttackDamageData()
                        }));
                        _arg_1.EventManagerObj.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_HIT, {
                            "caller":_arg_1,
                            "receiver":this,
                            "attackBoxData":_local_5.exportAttackDamageData()
                        }));
                        this.m_hitsDealtCounter++;
                        if (((!(m_attack.IsThrow)) && (_local_3.Depth > this.Depth)))
                        {
                            swapDepths(_local_3);
                        };
                        this.queueMove(m_attack.Frame);
                        m_attack.StaleMultiplier = this.totalMoveDecay(m_attack.Frame);
                        this.increaseComboCount(_local_4, _arg_1.ID);
                        this.transformExtend(_local_4.Damage);
                        m_attack.HomingTarget = null;
                        if (((((_local_4.ReverseCharacter) && (_arg_1 as Character)) || ((_local_4.ReverseProjectile) && (_arg_1 as Projectile))) || ((_local_4.ReverseItem) && (_arg_1 as Item))))
                        {
                            if (_arg_1.reverse(_local_4.PlayerID, _local_4.TeamID, _local_4.IsForward))
                            {
                                _arg_1.EventManagerObj.dispatchEvent(new SSF2Event(SSF2Event.REVERSE, {
                                    "caller":_arg_1,
                                    "opponent":this,
                                    "attackBoxData":_local_4.exportAttackDamageData()
                                }));
                            };
                        };
                        this.resetJustHitTimer();
                    };
                    return (true);
                };
                if ((((((((((((((!(isIntangible())) && (_local_5.HasEffect)) && (_local_4.HasEffect)) && (_local_4.Priority < _local_5.Priority)) && (!(_local_4.IsAirAttack))) && (!(_local_5.IsAirAttack))) && (_local_4.Priority < 7)) && (_local_4.Priority > -1)) && (!(m_attack.IsThrow))) && (!(_local_3.AttackStateData.IsThrow))) && (m_lastAttackID.indexOf(_local_5.AttackID) < 0)) && (m_collision.ground)) && (_local_3.CollisionObj.ground)))
                {
                    m_attack.RefreshRateReady = true;
                    m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CONNECT, {
                        "caller":this,
                        "receiver":_arg_1,
                        "attackBoxData":_local_4.exportAttackDamageData()
                    }));
                    _arg_1.EventManagerObj.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CONNECT, {
                        "caller":_arg_1,
                        "receiver":this,
                        "attackBoxData":_local_5.exportAttackDamageData()
                    }));
                    attachEffect("effect_cancel", (((_arg_2) && (_arg_2.OverlapHitBox)) ? {
    "x":_arg_2.OverlapHitBox.centerx,
    "y":_arg_2.OverlapHitBox.centery,
    "absolute":true
} : null));
                    this.cancelAttack();
                    if (_local_5.ReverseCharacter)
                    {
                        if (this.reverse(_local_5.PlayerID, _local_5.TeamID, _local_5.IsForward))
                        {
                            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.REVERSE, {
                                "caller":this,
                                "opponent":_arg_1,
                                "attackBoxData":_local_5.exportAttackDamageData()
                            }));
                        };
                    };
                    return (true);
                };
            };
            return (false);
        }

        override public function reactionHit(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            var _local_3:AttackDamage;
            if ((((_arg_1 as Character) && (_arg_1.inState(CState.EGG))) && (_arg_2.SecondHitBox.Type == HitBoxSprite.HIT)))
            {
                return (false);
            };
            if ((((_arg_1 as Character) && (_arg_1.inState(CState.FROZEN))) && (_arg_2.SecondHitBox.Type == HitBoxSprite.HIT)))
            {
                return (false);
            };
            _local_3 = m_attackData.getAttackBoxData(m_attack.Frame, _arg_2.FirstHitBox.Name).syncState(m_attack);
            if (((((_local_3.ReverseProjectile) && (_arg_1 as Projectile)) && (!((_arg_1.Team == m_team_id) && (m_team_id > 0)))) && (!((_arg_1.ID == m_player_id) && (!(Projectile(_arg_1).WasReversed))))))
            {
                Projectile(_arg_1).reverse(m_player_id, m_team_id, m_facingForward);
            };
            if ((!((((this.m_usingSpecialAttack) && (this.m_characterStats.SpecialType == 3)) && (m_attack.ExecTime > 1)) && (!((_arg_1 as Character) && (Character(_arg_1).Caught()))))))
            {
                if (_arg_1.takeDamage(_local_3, _arg_2.OverlapHitBox))
                {
                    m_attack.RefreshRateReady = true;
                    m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CONNECT, {
                        "caller":this,
                        "receiver":_arg_1,
                        "attackBoxData":_local_3.exportAttackDamageData()
                    }));
                    m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_HIT, {
                        "caller":this,
                        "receiver":_arg_1,
                        "attackBoxData":_local_3.exportAttackDamageData()
                    }));
                    this.m_hitsDealtCounter++;
                    if (((!(m_attack.IsThrow)) && (_arg_1.Depth > this.Depth)))
                    {
                        swapDepths(_arg_1);
                    };
                    if ((_arg_1 is Character))
                    {
                        this.queueMove(m_attack.Frame);
                        m_attack.StaleMultiplier = this.totalMoveDecay(m_attack.Frame);
                        this.increaseComboCount(_local_3, _arg_1.ID);
                    };
                    this.transformExtend(_local_3.Damage);
                    m_attack.HomingTarget = null;
                    this.m_smashDISelf = true;
                    if ((!(this.inState(CState.GRABBING))))
                    {
                        startActionShot(Utils.calculateSelfHitStun(_local_3.SelfHitStun, Utils.calculateChargeDamage(_local_3)));
                    };
                    if (((((_local_3.ReverseCharacter) && (_arg_1 as Character)) || ((_local_3.ReverseProjectile) && (_arg_1 as Projectile))) || ((_local_3.ReverseItem) && (_arg_1 as Item))))
                    {
                        if (_arg_1.reverse(_local_3.PlayerID, _local_3.TeamID, _local_3.IsForward))
                        {
                            _arg_1.EventManagerObj.dispatchEvent(new SSF2Event(SSF2Event.REVERSE, {
                                "caller":_arg_1,
                                "opponent":this,
                                "attackBoxData":_local_3.exportAttackDamageData()
                            }));
                        };
                    };
                    if (((((_local_3.ReverseItem) && (_arg_1 as Item)) && (!((_arg_1.Team == m_team_id) && (m_team_id > 0)))) && (!((_arg_1.ID == m_player_id) && (!(Item(_arg_1).WasReversed))))))
                    {
                        Item(_arg_1).reverse(m_player_id, m_team_id, m_facingForward);
                    };
                    if ((_arg_1 as Item))
                    {
                        Item(_arg_1).activate(_local_3, Character);
                        Item(_arg_1).checkBreak();
                    };
                    this.resetJustHitTimer();
                    return (true);
                };
                if ((((_arg_1.Invincible) && (!(_arg_1.attackIDArrayContains(m_attack.AttackID)))) && (validateOnlyAffects(_local_3))))
                {
                    m_attack.RefreshRateReady = true;
                    m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.ATTACK_CONNECT, {
                        "caller":this,
                        "receiver":_arg_1,
                        "attackBoxData":_local_3.exportAttackDamageData()
                    }));
                    _arg_1.stackAttackID(m_attack.AttackID);
                    this.m_smashDISelf = true;
                    startActionShot(Utils.calculateSelfHitStun(_local_3.SelfHitStun, Utils.calculateChargeDamage(_local_3)));
                    m_attack.HomingTarget = null;
                    if (((_arg_1 as Character) && (!(Character(_arg_1).DizzyShield))))
                    {
                        _arg_1.attachEffect("effect_cancel", (((_arg_2) && (_arg_2.OverlapHitBox)) ? {
    "x":_arg_2.OverlapHitBox.centerx,
    "y":_arg_2.OverlapHitBox.centery,
    "absolute":true
} : null));
                    };
                    return (true);
                };
            };
            return (false);
        }

        override public function reactionCounter(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            var _local_3:AttackDamage;
            _local_3 = _arg_1.AttackDataObj.getAttackBoxData(_arg_1.AttackStateData.Frame, _arg_2.SecondHitBox.Name).syncState(m_attack);
            if (((_local_3.Damage > 0) && (!((((_arg_1 is Item) && (_arg_1.inState(IState.ATTACKING))) && ((_arg_1.AttackStateData.Frame === Item.ATTACK_THROW) || (_arg_1.AttackStateData.Frame === Item.ATTACK_TOSS))) && (_arg_1.ID === m_player_id)))))
            {
                m_counterAttackData = _local_3.exportAttackDamageData();
                m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_COUNTER, {
                    "caller":this,
                    "receiver":_arg_1,
                    "attackBoxData":m_counterAttackData
                }));
                return (true);
            };
            return (false);
        }

        override public function reactionCatch(_arg_1:InteractiveSprite, _arg_2:HitBoxCollisionResult):Boolean
        {
            var _local_3:Boolean;
            var _local_4:Item;
            if ((!(_arg_1 as Item)))
            {
                return (false);
            };
            _local_3 = (((this.inFreeState(true, false, false, false, false, false, true)) && (this.m_characterStats.CanHoldItems)) && (!(this.inState(CState.DODGE_ROLL))));
            _local_4 = Item(_arg_1);
            if (((((((!(_local_4.Consume)) && (_local_4.AutoPickup)) && (_local_4.CanPickup)) && (this.m_item == null)) && (_local_3)) && (!(_local_4.PickedUp))))
            {
                this.m_item = _local_4;
                this.m_item.PickedUp = true;
                this.m_item.resetTime();
                this.resetItemDamageCounter();
                this.m_item.CurrentAttackState.IsAttacking = false;
                this.m_itemLetGo = false;
                this.m_itemTimer = 5;
                this.m_item.SetPlayer(m_player_id);
                this.updateItemHolding();
                this.playGlobalSound("pickup");
                if (this.m_item.Recover > 0)
                {
                    this.recover(this.m_item.Recover);
                }
                else
                {
                    this.updateItemHolding();
                };
                return (true);
            };
            if ((((((((!(_local_4.Consume)) && (_local_4.CanPickup)) && (this.m_item == null)) && (!(_local_4.PickedUp))) && ((((this.m_a) && (this.m_itemLetGo)) && (m_collision.ground)) || (((((this.m_a) && (this.m_itemLetGo)) || ((this.m_grab) && (this.m_grabKeyReleased))) && (!(m_collision.ground))) && (_local_4.MidairPickup)))) && (_local_3)) && (!(((((_local_4.Thrown) && (_local_4.PlayerID == m_player_id)) && (_local_4.CurrentAttackState.ExecTime < 5)) && (!(_local_4.HasHitPlayer))) && (!(_local_4.BackToss))))))
            {
                this.m_attackLetGoA = false;
                this.m_item = _local_4;
                this.m_item.PickedUp = true;
                this.m_item.resetTime();
                this.resetItemDamageCounter();
                this.m_item.CurrentAttackState.IsAttacking = false;
                this.m_itemLetGo = false;
                this.m_itemTimer = 5;
                this.m_item.SetPlayer(m_player_id);
                this.updateItemHolding();
                this.playGlobalSound("pickup");
                if (this.m_grab)
                {
                    this.m_grabLetGo = false;
                    this.m_grabKeyReleased = false;
                };
                if (((this.m_item.Ability == "special") && (this.m_transformedSpecial)))
                {
                    trace("look here in check item");
                };
                if ((!(this.inState(CState.ATTACKING))))
                {
                    this.resetAttackLetGo();
                };
                if (this.m_item.Recover > 0)
                {
                    this.recover(this.m_item.Recover);
                }
                else
                {
                    this.updateItemHolding();
                };
                return (true);
            };
            if (((((_local_4.Consume) && (_local_4.AutoPickup)) && (_local_4.CanPickup)) && (!(_local_4.PickedUp))))
            {
                _local_4.PickedUp = true;
                this.resetItemDamageCounter();
                _local_4.CurrentAttackState.IsAttacking = false;
                this.m_itemLetGo = false;
                this.m_itemTimer = 5;
                _local_4.SetPlayer(m_player_id);
                this.playGlobalSound("pickup");
                if (_local_4.Recover > 0)
                {
                    this.recover(_local_4.Recover);
                };
                _local_4.consumeAction();
                STAGEDATA.ItemsRef.killItem(_local_4.Slot);
            }
            else
            {
                if (((((((_local_4.Consume) && (_local_4.CanPickup)) && (!(_local_4.PickedUp))) && ((((this.m_a) && (this.m_itemLetGo)) && (m_collision.ground)) || (((((this.m_a) && (this.m_itemLetGo)) || ((this.m_grab) && (this.m_grabKeyReleased))) && (!(m_collision.ground))) && (_local_4.MidairPickup)))) && (_local_3)) && (!(((((_local_4.Thrown) && (_local_4.PlayerID == m_player_id)) && (_local_4.CurrentAttackState.ExecTime < 5)) && (!(_local_4.HasHitPlayer))) && (!(_local_4.BackToss))))))
                {
                    this.m_attackLetGoA = false;
                    _local_4.PickedUp = true;
                    this.resetItemDamageCounter();
                    _local_4.CurrentAttackState.IsAttacking = false;
                    this.m_itemLetGo = false;
                    this.m_itemTimer = 5;
                    _local_4.SetPlayer(m_player_id);
                    this.playGlobalSound("pickup");
                    if (this.m_grab)
                    {
                        this.m_grabLetGo = false;
                        this.m_grabKeyReleased = false;
                    };
                    if (((_local_4.Ability == "special") && (this.m_transformedSpecial)))
                    {
                        trace("look here in check item");
                    };
                    if ((!(this.inState(CState.ATTACKING))))
                    {
                        this.resetAttackLetGo();
                    };
                    if (_local_4.Recover > 0)
                    {
                        this.recover(_local_4.Recover);
                    };
                    _local_4.consumeAction();
                    STAGEDATA.ItemsRef.killItem(_local_4.Slot);
                    return (true);
                };
            };
            return (false);
        }

        private function charAttackCollisionTest():void
        {
            var _local_1:int;
            var _local_2:Character;
            var _local_3:Enemy;
            var _local_4:Item;
            var _local_5:TargetTestTarget;
            var _local_10:Projectile;
            if (m_bypassCollisionTesting)
            {
                return;
            };
            _local_1 = 0;
            _local_2 = null;
            _local_3 = null;
            _local_4 = null;
            _local_5 = null;
            var _local_6:Vector.<HitBoxCollisionResult>;
            var _local_7:int;
            var _local_8:Boolean;
            var _local_9:Array;
            _local_10 = null;
            if (this.m_justHit)
            {
                this.m_justHitTimer--;
                if (this.m_justHitTimer == 0)
                {
                    this.m_justHit = false;
                };
            };
            _local_1 = 0;
            while (_local_1 < STAGEDATA.ItemsRef.MAXITEMS)
            {
                _local_4 = STAGEDATA.ItemsRef.getItemData(_local_1);
                if (((!(_local_4 == null)) && (!((_local_4.PickedUp) && (_local_4.PlayerID == m_player_id)))))
                {
                    InteractiveSprite.hitTest(this, _local_4, HitBoxSprite.HIT, HitBoxSprite.CATCH, this.reactionCatch);
                    InteractiveSprite.hitTest(this, _local_4, HitBoxSprite.CATCH, HitBoxSprite.HIT, this.reactionCatch);
                    InteractiveSprite.hitTest(this, _local_4, HitBoxSprite.CATCH, HitBoxSprite.CATCH, this.reactionCatch);
                    InteractiveSprite.hitTest(this, _local_4, HitBoxSprite.HIT, HitBoxSprite.HIT, this.reactionCatch);
                    InteractiveSprite.hitTest(this, _local_4, HitBoxSprite.COUNTER, HitBoxSprite.ATTACK, this.reactionCounter);
                    InteractiveSprite.hitTest(this, _local_4, HitBoxSprite.ATTACK, HitBoxSprite.HIT, this.reactionHit);
                };
                _local_1++;
            };
            if (((this.m_a) && (this.m_item == null)))
            {
                this.m_itemLetGo = false;
                this.m_itemTimer = 5;
            };
            _local_1 = 0;
            while (_local_1 < this.m_opponents.length)
            {
                _local_2 = STAGEDATA.getPlayer(this.m_opponents[_local_1]);
                if ((((((((!(_local_2 == null)) && (!(((_local_2.Team == m_team_id) && (m_team_id > 0)) && (!(STAGEDATA.TeamDamage))))) && (!(_local_2.StandBy))) && (!(_local_2.Dead))) && (!(_local_2.inState(CState.STAR_KO)))) && (!(_local_2.inState(CState.SCREEN_KO)))) && (!(_local_2.inState(CState.REVIVAL)))))
                {
                    InteractiveSprite.hitTest(this, _local_2, HitBoxSprite.COUNTER, HitBoxSprite.ATTACK, this.reactionCounter);
                    InteractiveSprite.hitTest(_local_2, this, HitBoxSprite.COUNTER, HitBoxSprite.ATTACK, _local_2.reactionCounter);
                    InteractiveSprite.hitTest(this, _local_2, HitBoxSprite.ATTACK, HitBoxSprite.SHIELD, this.reactionShield);
                    InteractiveSprite.hitTest(this, _local_2, HitBoxSprite.ATTACK, HitBoxSprite.SHIELDATTACK, this.reactionShieldAttack);
                    InteractiveSprite.hitTest(this, _local_2, HitBoxSprite.ATTACK, HitBoxSprite.ABSORB, this.reactionAbsorb);
                    InteractiveSprite.hitTest(this, _local_2, HitBoxSprite.GRAB, HitBoxSprite.HIT, this.reactionGrab);
                    InteractiveSprite.hitTest(this, _local_2, HitBoxSprite.REVERSE, HitBoxSprite.ATTACK, this.reactionReverse);
                    InteractiveSprite.hitTest(this, _local_2, HitBoxSprite.REVERSE, HitBoxSprite.HIT, this.reactionReverse);
                    InteractiveSprite.hitTest(this, _local_2, HitBoxSprite.ATTACK, HitBoxSprite.ATTACK, this.reactionClank);
                    InteractiveSprite.hitTest(this, _local_2, HitBoxSprite.ATTACK, HitBoxSprite.HIT, this.reactionHit);
                    InteractiveSprite.hitTest(this, _local_2, HitBoxSprite.STAR, HitBoxSprite.HIT, this.reactionHit);
                    InteractiveSprite.hitTest(this, _local_2, HitBoxSprite.ATTACK, HitBoxSprite.EGG, this.reactionHit);
                    InteractiveSprite.hitTest(this, _local_2, HitBoxSprite.ATTACK, HitBoxSprite.FREEZE, this.reactionHit);
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < STAGEDATA.Enemies.length)
            {
                _local_3 = STAGEDATA.Enemies[_local_1];
                if (_local_3 != null)
                {
                    InteractiveSprite.hitTest(this, _local_3, HitBoxSprite.COUNTER, HitBoxSprite.ATTACK, this.reactionCounter);
                    InteractiveSprite.hitTest(this, _local_3, HitBoxSprite.STAR, HitBoxSprite.HIT, this.reactionHit);
                    InteractiveSprite.hitTest(this, _local_3, HitBoxSprite.ATTACK, HitBoxSprite.HIT, this.reactionHit);
                };
                _local_1++;
            };
            if (STAGEDATA.GameRef.GameMode == Mode.TARGET_TEST)
            {
                _local_1 = 0;
                while (_local_1 < STAGEDATA.Targets.length)
                {
                    _local_5 = STAGEDATA.Targets[_local_1];
                    if (_local_5 != null)
                    {
                        InteractiveSprite.hitTest(this, _local_5, HitBoxSprite.ATTACK, HitBoxSprite.HIT, this.reactionHit);
                    };
                    _local_1++;
                };
            };
            _local_1 = 0;
            while (_local_1 < STAGEDATA.Projectiles.length)
            {
                _local_10 = STAGEDATA.Projectiles[_local_1];
                if (_local_10 != null)
                {
                    InteractiveSprite.hitTest(this, _local_10, HitBoxSprite.COUNTER, HitBoxSprite.ATTACK, this.reactionCounter);
                    InteractiveSprite.hitTest(this, _local_10, HitBoxSprite.STAR, HitBoxSprite.HIT, this.reactionHit);
                    InteractiveSprite.hitTest(this, _local_10, HitBoxSprite.ATTACK, HitBoxSprite.ATTACK, this.reactionHit);
                    InteractiveSprite.hitTest(this, _local_10, HitBoxSprite.REVERSE, HitBoxSprite.ATTACK, this.reactionReverse);
                };
                _local_1++;
            };
            this.removeUngrabbedCharacters();
            if (((this.inState(CState.ATTACKING)) && (this.m_grabbed.length > 0)))
            {
                this.repositionGrabbedCharacter();
            };
        }

        public function giveFinalSmash(_arg_1:Item):void
        {
            this.m_item2 = _arg_1;
            this.m_item2.SetPlayer(m_player_id);
            this.m_hasFinalSmash = true;
            _arg_1.MC.visible = false;
            this.m_fsGlowHolderMC.scaleX = m_sizeRatio;
            this.m_fsGlowHolderMC.scaleY = m_sizeRatio;
            this.m_fsGlowHolderMC.x = m_sprite.x;
            this.m_fsGlowHolderMC.y = m_sprite.y;
            this.toggleEffect(this.m_fsGlowHolderMC, true);
        }

        public function giveItem(_arg_1:Item):void
        {
            if (this.m_item != null)
            {
                this.m_item.destroy();
            };
            this.m_item = _arg_1;
            this.m_item.SetPlayer(m_player_id);
        }

        public function getOpponentByID(_arg_1:Number):Number
        {
            var _local_2:*;
            for (_local_2 in this.m_opponents)
            {
                if (this.m_opponents[_local_2] == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (-1);
        }

        public function resetJustHitTimer():void
        {
            this.m_justHit = true;
            this.m_justHitTimer = 5;
        }

        public function resetJumps():void
        {
            this.m_jumpCount = 0;
        }

        public function getCPULevel():int
        {
            return (this.m_characterStats.Level);
        }

        public function getCPUAction():int
        {
            if ((!(this.CPU)))
            {
                return (-1);
            };
            return (this.CPU.Action);
        }

        public function getCPUForcedAction():int
        {
            if ((!(this.CPU)))
            {
                return (-1);
            };
            return (this.CPU.ForcedAction);
        }

        public function getCPUTarget():Character
        {
            if ((((this.m_human) || (!(this.CPU))) || (!(this.CPU.CurrentTarget))))
            {
                return (null);
            };
            return (this.CPU.CurrentTarget.PlayerSprite);
        }

        public function setCPUAttackQueue(_arg_1:String):void
        {
            if (((this.m_human) || (!(this.CPU))))
            {
                return;
            };
            this.CPU.addToAttackQueue(_arg_1);
        }

        public function inLowerLeftWarningBounds():Boolean
        {
            this.updateWarningCollision();
            return (m_collision.lbound_lower);
        }

        public function inUpperLeftWarningBounds():Boolean
        {
            this.updateWarningCollision();
            return (m_collision.lbound_upper);
        }

        public function inLowerRightWarningBounds():Boolean
        {
            this.updateWarningCollision();
            return (m_collision.rbound_lower);
        }

        public function inUpperRightWarningBounds():Boolean
        {
            this.updateWarningCollision();
            return (m_collision.rbound_upper);
        }

        public function importCPUControls(_arg_1:Array):void
        {
            if (this.CPU)
            {
                this.CPU.importControlOverrides(_arg_1);
            };
        }

        public function resetCPUControls():void
        {
            if (this.CPU)
            {
                this.CPU.resetControlOverrides();
            };
        }

        public function usingCPUControls():Boolean
        {
            return ((((!(this.m_human)) && (this.CPU)) && (this.CPU.ControlOverrides)) && (this.CPU.ControlOverrides.length > 0));
        }

        public function isForcedCrash():Boolean
        {
            return (this.m_forcedCrash);
        }

        public function isRecovering():Boolean
        {
            return (this.m_recoveryAmount > 0);
        }

        public function forceAttack(_arg_1:String, _arg_2:*=null, _arg_3:Boolean=false):void
        {
            if (((this.inFreeState(true, true)) && (!(_arg_1 == null))))
            {
                this.releaseOpponent();
                this.Attack(_arg_1, ((arguments.length == 3) ? ((_arg_3) ? 2 : 1) : ((this.inState(CState.ATTACKING)) ? m_attack.AttackType : 1)));
                if (_arg_2 !== null)
                {
                    this.stancePlayFrame(_arg_2);
                };
            };
        }

        public function getSizeStatus():int
        {
            return (this.m_sizeStatus);
        }

        public function getCurrentKirbyPower():String
        {
            return (this.m_currentPower);
        }

        public function getDamage():int
        {
            return (this.m_damage);
        }

        public function getExecTime():int
        {
            return (m_attack.ExecTime);
        }

        public function getCurrentAttackFrame():String
        {
            return (m_attack.Frame);
        }

        public function stealStock():void
        {
            this.m_lives--;
            this.updateLivesDisplay();
        }

        public function getLives():int
        {
            return (this.m_lives);
        }

        public function getControls(_arg_1:Boolean=false):Object
        {
            var _local_2:Object;
            _local_2 = new Object();
            _local_2["UP"] = this.m_up;
            _local_2["DOWN"] = this.m_down;
            _local_2["LEFT"] = this.m_left;
            _local_2["RIGHT"] = this.m_right;
            _local_2["JUMP"] = ((_arg_1) ? this.m_jump : this.jumpIsPressed());
            _local_2["BUTTON1"] = this.m_b;
            _local_2["BUTTON2"] = this.m_a;
            _local_2["GRAB"] = this.m_grab;
            _local_2["START"] = this.m_pause;
            _local_2["TAUNT"] = this.m_taunt;
            _local_2["SHIELD"] = ((_arg_1) ? this.m_shield_btn : this.shieldIsPressed());
            _local_2["JUMP2"] = this.m_jump2;
            _local_2["C_UP"] = this.m_c_up;
            _local_2["C_DOWN"] = this.m_c_down;
            _local_2["C_LEFT"] = this.m_c_left;
            _local_2["C_RIGHT"] = this.m_c_right;
            _local_2["DASH"] = this.m_dash_btn;
            _local_2["TAP_JUMP"] = this.m_tap_jump;
            _local_2["AUTO_DASH"] = this.m_auto_dash;
            _local_2["DT_DASH"] = this.m_dt_dash;
            _local_2["SHIELD2"] = this.m_shield_btn2;
            return (_local_2);
        }

        public function getLastUsed(_arg_1:String=null):int
        {
            if (m_attackData.getAttack(((_arg_1 != null) ? _arg_1 : m_attack.Frame)) != null)
            {
                return (m_attackData.getAttack(((_arg_1 != null) ? _arg_1 : m_attack.Frame)).LastUsedPrevious);
            };
            return (-1);
        }

        public function getHitsDealtCounter():int
        {
            return (this.m_hitsDealtCounter);
        }

        public function resetHitsDealtCounter():void
        {
            this.m_hitsDealtCounter = 0;
        }

        public function getHitsReceivedCounter():int
        {
            return (this.m_hitsReceivedCounter);
        }

        public function resetHitsReceivedCounter():void
        {
            this.m_hitsReceivedCounter = 0;
        }

        public function generateItem(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=true):void
        {
            var _local_4:Item;
            _local_4 = STAGEDATA.ItemsRef.generateItemObj(((_arg_3) ? m_attackData.getItem(_arg_1) : STAGEDATA.ItemsRef.getItemByLinkage(_arg_1)), m_sprite.x, (m_sprite.y - 10), _arg_3);
            if (_local_4 != null)
            {
                _local_4.OriginalPlayerID = m_player_id;
            };
            if ((((!(_local_4 == null)) && (_arg_2)) && (this.m_item == null)))
            {
                this.m_item = _local_4;
                this.m_item.PickedUp = true;
                this.m_itemLetGo = false;
                this.m_itemTimer = 5;
                m_attack.LetGo = false;
                this.m_item.ItemInstance.visible = false;
                this.m_item.SetPlayer(m_player_id);
                this.m_item.inheritPalette();
            };
        }

        public function applyPalette(_arg_1:MovieClip):void
        {
            this.updateColorFilter(_arg_1, ((STAGEDATA.GameRef.GameMode == Mode.TRAINING) ? -1 : m_team_id), this.m_characterStats.NormalStatsID, this.m_costume_id);
        }

        public function removeItem():void
        {
            if (this.m_item != null)
            {
                STAGEDATA.ItemsRef.killItem(this.m_item.Slot);
                this.m_item = null;
            };
        }

        public function maxOutJumps():void
        {
            this.m_jumpCount = this.m_characterStats.MaxJump;
        }

        public function setAttackEnabled(_arg_1:Boolean, _arg_2:String=null, _arg_3:int=-1):void
        {
            if (((_arg_2 == null) && (this.inState(CState.ATTACKING))))
            {
                _arg_2 = m_attack.Frame;
            };
            if (((!(_arg_2 == null)) && (!(m_attackData.getAttack(_arg_2) == null))))
            {
                m_attackData.getAttack(_arg_2).IsDisabled = (!(_arg_1));
                if ((!(_arg_1)))
                {
                    m_attackData.getAttack(_arg_2).ReenableTimerCount = ((_arg_3 < 0) ? m_attackData.getAttack(_arg_2).ReenableTimer : _arg_3);
                };
            };
        }

        public function setLastUsed(_arg_1:String, _arg_2:int):void
        {
            if (((!(_arg_1 == null)) && (!(m_attackData.getAttack(_arg_1) == null))))
            {
                m_attackData.getAttack(_arg_1).LastUsedPrevious = _arg_2;
                m_attackData.getAttack(_arg_1).LastUsed = _arg_2;
            };
        }

        override public function setXSpeed(_arg_1:Number, _arg_2:Boolean=true):void
        {
            if (((this.inState(CState.STAR_KO)) || (this.inState(CState.SCREEN_KO))))
            {
                return;
            };
            super.setXSpeed(_arg_1, _arg_2);
        }

        override public function setYSpeed(_arg_1:Number):void
        {
            if (((this.inState(CState.STAR_KO)) || (this.inState(CState.SCREEN_KO))))
            {
                return;
            };
            if (_arg_1 != 0)
            {
                this.m_attackHovering = false;
            };
            super.setYSpeed(_arg_1);
        }

        public function setSizeStatus(_arg_1:int):void
        {
            if (this.m_sizeStatusPermanent)
            {
                return;
            };
            if (this.m_sizeStatus == 1)
            {
                if (_arg_1 == 1)
                {
                    this.m_sizeStatusTimer.reset();
                    return;
                };
                if (_arg_1 == -1)
                {
                    _arg_1 = 0;
                };
            }
            else
            {
                if (this.m_sizeStatus == -1)
                {
                    if (_arg_1 == -1)
                    {
                        this.m_sizeStatusTimer.reset();
                        return;
                    };
                    if (_arg_1 == 1)
                    {
                        _arg_1 = 0;
                    };
                };
            };
            if (_arg_1 == 1)
            {
                m_sizeRatio = (this.m_originalSizeRatio * 2);
                m_sprite.scaleX = ((m_sprite.scaleX > 0) ? m_sizeRatio : -(m_sizeRatio));
                m_sprite.scaleY = ((m_sprite.scaleY > 0) ? m_sizeRatio : -(m_sizeRatio));
                this.m_sizeStatus = _arg_1;
                m_attack.SizeStatus = this.m_sizeStatus;
                this.m_sizeStatusTimer.reset();
                if (this.m_grabbed.length > 0)
                {
                    this.grabReleaseOpponent();
                    this.grabRelease();
                };
                if ((!(this.inState(CState.ENTRANCE))))
                {
                    this.endAttack();
                };
                this.killAllSpeeds();
            }
            else
            {
                if (_arg_1 == -1)
                {
                    m_sizeRatio = (this.m_originalSizeRatio / 2);
                    m_sprite.scaleX = ((m_sprite.scaleX > 0) ? m_sizeRatio : -(m_sizeRatio));
                    m_sprite.scaleY = ((m_sprite.scaleY > 0) ? m_sizeRatio : -(m_sizeRatio));
                    this.m_sizeStatus = _arg_1;
                    this.m_sizeStatusTimer.reset();
                    m_attack.SizeStatus = this.m_sizeStatus;
                    if (this.m_grabbed.length > 0)
                    {
                        this.grabReleaseOpponent();
                        this.grabRelease();
                    };
                    if ((!(this.inState(CState.ENTRANCE))))
                    {
                        this.endAttack();
                    };
                    this.killAllSpeeds();
                }
                else
                {
                    if (_arg_1 == 0)
                    {
                        m_sizeRatio = this.m_originalSizeRatio;
                        m_sprite.scaleX = ((m_sprite.scaleX > 0) ? m_sizeRatio : -(m_sizeRatio));
                        m_sprite.scaleY = ((m_sprite.scaleY > 0) ? m_sizeRatio : -(m_sizeRatio));
                        this.m_sizeStatus = _arg_1;
                        this.m_sizeStatusTimer.finish();
                        m_attack.SizeStatus = this.m_sizeStatus;
                    };
                };
            };
        }

        override public function addToCamera():void
        {
        }

        override public function removeFromCamera():void
        {
        }

        public function setInvisibilityTimer(_arg_1:int):void
        {
            this.m_invisibleTimer.reset();
            this.m_invisibleTimer.MaxTime = _arg_1;
            this.setVisibility(false);
        }

        public function setInvincibility(_arg_1:Boolean):void
        {
            if (((m_invincible) && (!(_arg_1))))
            {
                m_invincible = _arg_1;
                if ((!(m_intangible)))
                {
                    this.turnOffInvincibility();
                };
            }
            else
            {
                m_invincible = _arg_1;
            };
        }

        public function setIntangibility(_arg_1:Boolean):void
        {
            if (((m_intangible) && (!(_arg_1))))
            {
                m_intangible = _arg_1;
                if ((!(m_invincible)))
                {
                    this.turnOffInvincibility();
                };
            }
            else
            {
                m_intangible = _arg_1;
            };
        }

        public function getShieldPower():Number
        {
            return (this.m_shieldPower / 100);
        }

        public function getSmashTimer():int
        {
            return (this.m_smashTimer);
        }

        public function getGrabbedOpponent():Character
        {
            return ((this.m_grabbed.length == 0) ? null : this.m_grabbed[0]);
        }

        public function getItem():Item
        {
            return (this.m_item);
        }

        public function getTeammates():Array
        {
            var _local_1:Array;
            var _local_2:int;
            _local_1 = new Array();
            _local_2 = 0;
            while (_local_2 < this.m_opponents.length)
            {
                if (((m_team_id > 0) && (m_team_id == STAGEDATA.getPlayer(this.m_opponents[_local_2]).Team)))
                {
                    _local_1.push(STAGEDATA.getPlayer(this.m_opponents[_local_2]));
                };
                _local_2++;
            };
            return (_local_1);
        }

        private function getBike():Item
        {
            var _local_1:String;
            var _local_2:int;
            _local_1 = "wario_bike";
            if (this.m_characterStats.LinkageID == "kirby")
            {
                _local_1 = "kirby_bike";
            };
            _local_2 = 0;
            while (_local_2 < STAGEDATA.ItemsRef.ItemsInUse.length)
            {
                if ((((!(STAGEDATA.ItemsRef.ItemsInUse[_local_2] == null)) && (STAGEDATA.ItemsRef.ItemsInUse[_local_2].OriginalPlayerID == m_player_id)) && (STAGEDATA.ItemsRef.ItemsInUse[_local_2].LinkageID == _local_1)))
                {
                    return (STAGEDATA.ItemsRef.ItemsInUse[_local_2]);
                };
                _local_2++;
            };
            return (null);
        }

        public function bikeExists():Boolean
        {
            return (Boolean((!(this.getBike() == null))));
        }

        public function gotoGrabbedCharacter():void
        {
            if (this.m_grabbed.length > 0)
            {
                m_sprite.x = this.m_grabbed[0].X;
                m_sprite.y = this.m_grabbed[0].Y;
            };
        }

        public function damageSelf(_arg_1:int):void
        {
            this.dealDamage(_arg_1);
        }

        public function isRocketing():Boolean
        {
            return ((this.inState(CState.ATTACKING)) && (m_attack.Rocket));
        }

        override public function forceHitStun(_arg_1:int, _arg_2:Number=-1):void
        {
            if (_arg_2 > 0)
            {
                this.m_smashDIAmount = (this.SDI_BASE * _arg_2);
            };
            startActionShot(_arg_1);
        }

        public function forceGrabbedHurtFrame(_arg_1:String):void
        {
            var _local_2:int;
            if (this.m_grabbed.length > 0)
            {
                _local_2 = 0;
                while (_local_2 < this.m_grabbed.length)
                {
                    if (((this.m_grabbed[_local_2].HasStance) && (Utils.hasLabel(this.m_grabbed[_local_2].MC.stance, _arg_1))))
                    {
                        Utils.tryToGotoAndPlay(this.m_grabbed[_local_2].MC.stance, _arg_1);
                    };
                    _local_2++;
                };
            };
        }

        public function shakeCamera(_arg_1:int):void
        {
            CAM.shake(_arg_1);
        }

        public function swapDepthsWithGrabbedOpponent(_arg_1:Boolean):void
        {
            if (((this.m_grabbed.length > 0) && (this.m_grabbed[0].IsCaught)))
            {
                if (((_arg_1) && (Depth < this.m_grabbed[0].Depth)))
                {
                    swapDepths(this.m_grabbed[0]);
                }
                else
                {
                    if (((!(_arg_1)) && (Depth > this.m_grabbed[0].Depth)))
                    {
                        swapDepths(this.m_grabbed[0]);
                    };
                };
            };
        }

        public function resetMovement(_arg_1:*=null):void
        {
            m_xSpeed = 0;
            m_ySpeed = 0;
            if (((_arg_1) && (_arg_1 is SSF2Event)))
            {
                m_eventManager.removeEventListener(SSF2Event(_arg_1).type, this.resetMovement);
            };
        }

        public function isCPU():Boolean
        {
            return (!(this.m_human));
        }

        override protected function m_faceRight():void
        {
            super.m_faceRight();
        }

        override protected function m_faceLeft():void
        {
            super.m_faceLeft();
        }

        public function switchAttackData(_arg_1:String, _arg_2:String, _arg_3:*=null):void
        {
            if (((this.inState(CState.ATTACKING)) && (!(m_attackData.getAttack(_arg_2) == null))))
            {
                m_attackData.setAttack(_arg_1, m_attackData.getAttack(_arg_2).Clone());
                if ((!(this.m_human)))
                {
                    this.CPU.refreshRecoveryAttackList();
                    this.CPU.refreshDisabledAttackList();
                };
            };
        }

        public function switchAttack(_arg_1:String, _arg_2:*=null):void
        {
            if ((((!(_arg_1 == null)) && (Utils.hasLabel(m_sprite, _arg_1))) && (!(m_attackData.getAttack(_arg_1) == null))))
            {
                m_attack.Frame = _arg_1;
                m_attackData.getAttack(_arg_1).OverrideMap.clear();
                this.playFrame(m_attack.Frame);
                if (_arg_2 !== null)
                {
                    this.stancePlayFrame(_arg_2);
                };
            };
        }

        public function clearAttackControlsArr():void
        {
            while (this.m_attackControlsArr.length > 0)
            {
                this.m_attackControlsArr.splice(0, 1);
            };
        }

        public function endAttack(_arg_1:String=null, _arg_2:String=null):void
        {
            var _local_3:uint;
            var _local_4:String;
            var _local_5:int;
            var _local_6:Array;
            if ((((((m_player_id == 1) && (this.inState(CState.ATTACKING))) && (Main.DEBUG)) && (MenuController.debugConsole)) && (MenuController.debugConsole.ControlsCapture)))
            {
                _local_4 = "[ ";
                _local_5 = 0;
                while (_local_5 < this.m_attackControlsArr.length)
                {
                    if (_local_5 != 0)
                    {
                        _local_4 = (_local_4 + ", ");
                    };
                    _local_4 = (_local_4 + ("" + this.m_attackControlsArr[_local_5]));
                    _local_5++;
                };
                _local_4 = (_local_4 + " ]");
                MenuController.debugConsole.writeEndAttackControls(_local_4);
                this.clearAttackControlsArr();
            };
            _local_3 = CState.IDLE;
            if (((!(_arg_1 == null)) && (Utils.hasLabel(m_sprite, _arg_1))))
            {
                _local_6 = new Array();
                _local_6["stand"] = CState.IDLE;
                _local_6["walk"] = CState.WALK;
                _local_6["run"] = CState.RUN;
                _local_6["jump"] = CState.JUMP_RISING;
                _local_6["jump_midair"] = CState.JUMP_MIDAIR_RISING;
                _local_6["fall"] = CState.JUMP_FALLING;
                _local_6["land"] = CState.LAND;
                _local_6["crouch"] = CState.CROUCH;
                _local_6["falling"] = CState.TUMBLE_FALL;
                if ((!(_local_6[_arg_1])))
                {
                    _local_3 = _local_6[_arg_1];
                }
                else
                {
                    _arg_1 = null;
                };
            }
            else
            {
                _arg_1 = null;
            };
            if (m_collision.ground)
            {
                this.forceEndAttack();
                if (_arg_1)
                {
                    this.setState(_local_3);
                };
                this.m_checkTaunt();
                if ((((HasStance) && (!(_arg_2 == null))) && (Utils.hasLabel(m_sprite.stance, _arg_2))))
                {
                    this.stancePlayFrame(_arg_2);
                };
            }
            else
            {
                this.forceEndAttack();
                if ((((HasStance) && (!(_arg_2 == null))) && (Utils.hasLabel(m_sprite.stance, _arg_2))))
                {
                    this.stancePlayFrame(_arg_2);
                };
            };
            this.checkEdgeLean();
            this.updateTint();
        }

        public function endFinalForm():void
        {
            if (this.m_transformedSpecial)
            {
                this.m_transformTime = this.m_transformLimit;
                STAGEDATA.ItemsRef.SmashBallReady.CurrentTime = STAGEDATA.ItemsRef.SmashBallReady.MaxTime;
            };
        }

        public function transformTimerExtend(_arg_1:Number):void
        {
            this.m_transformTime = (this.m_transformTime - _arg_1);
        }

        public function transformExtend(_arg_1:Number):void
        {
            if (this.m_characterStats.LinkageID == "kgoku")
            {
                this.m_forceTransformTime.reset();
            };
        }

        public function cancelAttack():void
        {
            this.setState(CState.IDLE);
        }

        override public function stopActionShot(_arg_1:Boolean=true, _arg_2:Boolean=true):void
        {
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            if (((!(_arg_1)) && (!(_arg_2))))
            {
                return;
            };
            if (isHitStunOrParalysis())
            {
                if (_arg_1)
                {
                    m_actionShot = false;
                };
                if (_arg_2)
                {
                    if (m_paralysis)
                    {
                        m_maxParalysisTime.reset();
                    };
                    m_paralysis = false;
                };
                this.m_controlFrames();
                if (((this.inState(CState.FLYING)) || (this.inState(CState.INJURED))))
                {
                    _local_3 = Utils.calculateSpeed(m_xKnockback, m_yKnockback);
                    _local_4 = Utils.getAngleBetween(new Point(0, 0), new Point(m_xKnockback, m_yKnockback));
                    _local_5 = this.calculateDI(_local_3, _local_4);
                    m_xKnockback = Utils.calculateXSpeed(_local_3, _local_5);
                    m_yKnockback = -(Utils.calculateYSpeed(_local_3, _local_5));
                    resetKnockbackDecay();
                };
            };
        }

        public function playReflectSound():void
        {
            this.playGlobalSound("reflected");
        }

        public function repel(_arg_1:Number):void
        {
            var _local_2:Number;
            var _local_3:int;
            _local_2 = 3;
            if (m_sprite.x > _arg_1)
            {
                stackKnockback(_local_2, 0, m_xKnockback, m_yKnockback);
            }
            else
            {
                stackKnockback(_local_2, 180, m_xKnockback, m_yKnockback);
            };
            m_collision.ground = false;
            _local_3 = 0;
            while (((this.testGroundWithCoord(m_sprite.x, (m_sprite.y + 1))) && (_local_3 < 40)))
            {
                _local_3++;
                m_sprite.y--;
            };
            if (_local_3 >= 40)
            {
                m_sprite.y = (m_sprite.y + 40);
            };
            this.m_smashDISelf = true;
            startActionShot(5);
        }

        public function queueMove(_arg_1:String):void
        {
            var _local_2:int;
            _local_2 = (this.m_staleMovesArr.length - 1);
            while (_local_2 > 0)
            {
                if (_local_2 > 0)
                {
                    this.m_staleMovesArr[_local_2] = this.m_staleMovesArr[(_local_2 - 1)];
                };
                _local_2--;
            };
            this.m_staleMovesArr[0] = _arg_1;
        }

        public function resetStaleMoves():void
        {
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < this.m_staleMovesArr.length)
            {
                this.m_staleMovesArr[_local_1] = null;
                _local_1++;
            };
        }

        private function totalMoveDecay(_arg_1:String):Number
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:int;
            if (ModeFeatures.hasFeature(ModeFeatures.IGNORE_STALE_DECAY, STAGEDATA.GameRef.GameMode))
            {
                return (1);
            };
            _local_2 = 0;
            _local_3 = 0;
            _local_4 = 0;
            while (_local_4 != -1)
            {
                _local_4 = this.m_staleMovesArr.indexOf(_arg_1, _local_3);
                if (_local_4 >= 0)
                {
                    _local_3 = (_local_4 + 1);
                    _local_2 = (_local_2 + this.m_staleMoveVals[_local_4]);
                };
            };
            if (_local_2 == 0)
            {
                return (1.05);
            };
            return (1 - _local_2);
        }

        override public function reverse(_arg_1:int, _arg_2:int, _arg_3:Boolean):Boolean
        {
            if (this.m_forceTimer <= 0)
            {
                if (this.inState(CState.ATTACKING))
                {
                    m_attack.IsForward = (!(m_attack.IsForward));
                };
                m_xSpeed = (m_xSpeed * -1);
                this.m_jumpSpeedBuffer = (this.m_jumpSpeedBuffer * -1);
                m_xKnockback = (m_xKnockback * -1);
                resetKnockbackDecay();
                this.m_flyingRight = (!(this.m_flyingRight));
                if (m_facingForward)
                {
                    this.m_faceLeft();
                }
                else
                {
                    this.m_faceRight();
                };
                if (((!(this.inState(CState.ATTACKING))) && (!(m_xSpeed == 0))))
                {
                    this.m_forceRight = m_facingForward;
                    this.m_forceTimer = 8;
                };
                return (true);
            };
            return (false);
        }

        public function calculateHitLag(_arg_1:Number, _arg_2:Number):int
        {
			//trace(this.m_hitLagHack);
            /*if (this.m_hitLagHack != Number.MAX_VALUE)
            {
                return (Utils.calculateHitlag(_arg_1, this.m_hitLagHack));
            };*/
            return (Utils.calculateHitlag(_arg_1, _arg_2));
        }

        override protected function validateBypass(_arg_1:AttackDamage):Boolean
        {
            if (((_arg_1.BypassGrabbed) && (this.inState(CState.CAUGHT))))
            {
                return (false);
            };
            if (((_arg_1.BypassNonGrabbed) && (!(this.inState(CState.CAUGHT)))))
            {
                return (false);
            };
            if (((((_arg_1.Owner as Projectile) && (_arg_1.BypassNonLatched)) && (Projectile(_arg_1.Owner).Latched)) && (Projectile(_arg_1.Owner).LatchID == this)))
            {
                return (false);
            };
            return (true);
        }

        private function calculateDI(_arg_1:Number, _arg_2:Number):Number
        {
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:Number;
            if ((!(this.m_canDI)))
            {
                return (_arg_2);
            };
            _local_3 = _arg_2;
            _local_4 = Utils.getControlsAngle(this.getControls());
            _local_5 = Utils.getControlsAngle({
                "UP":this.m_c_up,
                "DOWN":this.m_c_down,
                "LEFT":this.m_c_left,
                "RIGHT":this.m_c_right
            });
            _local_6 = (((_local_4 >= 0) && (_local_5 >= 0)) ? (_local_4 + (_local_5 / 2)) : ((_local_4 >= 0) ? _local_4 : ((_local_5 >= 0) ? _local_5 : -1)));
            if (((Utils.forceBase360((_local_3 - _local_6)) >= (180 - 22.5)) && (Utils.forceBase360((_local_3 - _local_6)) <= (180 + 22.5))))
            {
                return (_local_3);
            };
            if (_local_6 >= 0)
            {
                _local_7 = ((_arg_1 * 0.325) * Math.cos(((_local_6 * Math.PI) / 180)));
                _local_8 = ((_arg_1 * 0.325) * Math.sin(((_local_6 * Math.PI) / 180)));
                _local_9 = (_arg_1 * Math.cos(((_arg_2 * Math.PI) / 180)));
                _local_10 = (_arg_1 * Math.sin(((_arg_2 * Math.PI) / 180)));
                _local_3 = ((Math.atan2((_local_10 + _local_8), (_local_9 + _local_7)) * 180) / Math.PI);
            };
            return (_local_3);
        }

        public function killAllSpeeds(_arg_1:Boolean=false, _arg_2:Boolean=false):void
        {
            if ((!(_arg_1)))
            {
                m_xSpeed = 0;
                m_ySpeed = 0;
            };
            if ((!(_arg_2)))
            {
                m_xKnockback = 0;
                m_yKnockback = 0;
            };
        }

        override public function netXSpeed(_arg_1:Boolean=false, _arg_2:Boolean=false):Number
        {
            var _local_3:Number;
            _local_3 = 0;
            if ((!(_arg_1)))
            {
                _local_3 = (_local_3 + m_xSpeed);
            };
            if ((!(_arg_2)))
            {
                _local_3 = (_local_3 + m_xKnockback);
                if (((Main.FRAMERATE == 30) && (!(m_xKnockback == 0))))
                {
                    _local_3 = (_local_3 + (m_xKnockback - m_xKnockbackDecay));
                };
            };
            return (_local_3);
        }

        override public function netYSpeed(_arg_1:Boolean=false, _arg_2:Boolean=false):Number
        {
            var _local_3:Number;
            _local_3 = 0;
            if ((!(_arg_1)))
            {
                _local_3 = (_local_3 + m_ySpeed);
            };
            if ((!(_arg_2)))
            {
                _local_3 = (_local_3 + m_yKnockback);
                if (((Main.FRAMERATE == 30) && (!(m_yKnockback == 0))))
                {
                    _local_3 = (_local_3 + (m_yKnockback - m_yKnockbackDecay));
                };
            };
            return (_local_3);
        }

        override public function takeDamage(_arg_1:AttackDamage, _arg_2:HitBoxSprite=null):Boolean
        {
            var _local_3:uint;
            var _local_5:Boolean;
            var _local_6:Boolean;
            var _local_7:Boolean;
            var _local_8:Boolean;
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:Number;
            var _local_12:Number;
            var _local_13:Number;
            var _local_14:Number;
            var _local_15:Boolean;
            var _local_16:Number;
            var _local_17:Number;
            var _local_18:Boolean;
            var _local_19:Number;
            var _local_20:Number;
            var _local_21:Number;
            var _local_22:Number;
            var _local_23:Number;
            var _local_24:Boolean;
            var _local_25:Boolean;
            var _local_26:Boolean;
            var _local_27:Number;
            var _local_28:Number;
            var _local_29:MovieClip;
            var _local_30:MovieClip;
            var _local_31:Boolean;
            var _local_32:MovieClip;
            if (((m_intangible) || (this.m_usingSpecialAttack)))
            {
                return (false);
            };
            if (SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.FREEZE))
            {
                _arg_1.Freeze = 90;
            }
            else
            {
                if (SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.EGG))
                {
                    _arg_1.Egg = true;
                };
            };
            _local_3 = m_state;
            var _local_4:int;
            _local_5 = true;
            _local_6 = true;
            _local_7 = true;
            _local_8 = false;
            _local_9 = 0;
            _local_10 = this.m_damage;
            _local_11 = 0;
            _local_12 = 0;
            _local_13 = m_xKnockback;
            _local_14 = m_yKnockback;
            _local_15 = false;
            _local_16 = 0;
            _local_17 = 0;
            _local_18 = true;
            _local_19 = this.m_characterStats.HeavyArmor;
            _local_20 = ((_arg_1.SizeStatus == 0) ? 1 : ((_arg_1.SizeStatus > 0) ? 2 : 0.5));
            if (((HasStance) && (m_sprite.stance.heavyArmor)))
            {
                _local_19 = m_sprite.stance.heavyArmor;
            };
            _local_21 = ((_arg_1.Damage <= 0) ? 0 : Utils.calculateChargeDamage(_arg_1));
            _local_22 = Utils.calculateVelocity(Utils.calculateKnockback(_arg_1.KBConstant, _arg_1.Power, _arg_1.WeightKB, _local_21, _local_10, m_weight1, ((this.inState(CState.ATTACKING)) && (this.currentStanceFrameIs("charging"))), this.m_damageRatio));
            if (this.m_transformedSpecial)
            {
                _local_22 = (_local_22 / 2);
            };
            if (this.m_sizeStatus != 0)
            {
                _local_22 = (_local_22 * ((this.m_sizeStatus == 1) ? 0.75 : 1.5));
            };
            if ((((((m_paralysis) || (((((this.inState(CState.CAUGHT)) && (this.m_grabberID > 0)) && (_arg_1.PlayerID == this.m_grabberID)) && (STAGEDATA.getPlayer(this.m_grabberID).Grabbed.indexOf(this) >= 0)) && (!(_arg_1.Owner is Character)))) || ((((((this.inState(CState.CAUGHT)) && (this.m_grabberID > 0)) && (!(_arg_1.PlayerID == this.m_grabberID))) && (STAGEDATA.getPlayer(this.m_grabberID).Grabbed.indexOf(this) >= 0)) && (_local_22 < this.HEAVY_KNOCKBACK_THRESHOLD)) && (!((STAGEDATA.getPlayer(this.m_grabberID).UsingFinalSmash) && (STAGEDATA.getPlayer(this.m_grabberID).SpecialType == 6))))) || (this.inState(CState.PITFALL))) && (!(_arg_1.ForceTumbleFall))))
            {
                _local_19 = -(this.HEAVY_KNOCKBACK_THRESHOLD);
            };
            if ((((((_arg_1.Paralysis > 0) && (m_paralysis)) || (this.inState(CState.EGG))) || ((this.inState(CState.ATTACKING)) && ((m_attack.SuperArmor) || ((!(m_attack.HeavyArmor == 0)) && (((m_attack.HeavyArmor > 0) && (_local_21 <= m_attack.HeavyArmor)) || (((m_attack.HeavyArmor < 0) && (_local_22)) <= -(m_attack.HeavyArmor))))))) || ((!(_local_19 == 0)) && (((_local_19 > 0) && (_local_21 <= _local_19)) || ((_local_19 < 0) && (_local_22 <= -(_local_19)))))))
            {
                _local_15 = true;
                _local_18 = _arg_1.HasEffect;
                _local_16 = _arg_1.Power;
                _local_17 = _arg_1.KBConstant;
                _arg_1.Power = 0;
                _arg_1.KBConstant = 0;
                _arg_1.HasEffect = false;
            };
            if (((_arg_1.Power >= 200) && (MenuController.debugConsole)))
            {
                MenuController.debugConsole.alert((("Alert!!! A power level of " + _arg_1.Power) + " has been detected. This should be lowered to a more reasonable value. The engine has forced this value to be 0 instead."));
            }
            else
            {
                if (((_arg_1.Power < 0) && (MenuController.debugConsole)))
                {
                    MenuController.debugConsole.alert((("Alert!!! A power level of " + _arg_1.Power) + " has been detected. Negative values are no good in SSF2's KB formula, please use weightKB instead."));
                };
            };
            if (_arg_1.Power >= 200)
            {
                _arg_1.Power = 0;
            };
            if ((((((((((((((!(this.m_standby)) && (!(_arg_1 == null))) && (_arg_1.HasEffect)) && (this.validateBypass(_arg_1))) && (validateOnlyAffects(_arg_1))) && (!(isIntangible()))) && (!(this.isInvincible()))) && (!(attackIDArrayContains(_arg_1.AttackID)))) && (!((this.inState(CState.ATTACKING)) && (m_attack.Invincible)))) && (!((!(_arg_1.HurtSelf)) && (_arg_1.PlayerID == m_player_id)))) && (!(this.inState(CState.REVIVAL)))) && (!(this.m_usingSpecialAttack))) && (!(((((!(_arg_1.HurtSelf)) && (!(_arg_1.AttackID == -1))) && (m_team_id == _arg_1.TeamID)) && (m_team_id > 0)) && (!(this.m_teamDamage))))))
            {
                m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_HURT, {
                    "caller":this,
                    "opponent":_arg_1.Owner,
                    "attackBoxData":_arg_1.exportAttackDamageData()
                }));
                this.m_disableHurtFallOff = _arg_1.DisableHurtFallOff;
                setBrightness(0);
                if ((!(this.m_human)))
                {
                    this.CPU.resetControlOverrides();
                };
                if (this.m_characterStats.LinkageID == "kgoku")
                {
                    this.m_forceTransformTime.reset();
                };
                this.m_hitsReceivedCounter++;
                this.resetSmashTimers();
                this.m_usingSpecialAttack = false;
                _local_23 = 0;
                if (this.m_grabbed.length > 0)
                {
                    this.grabReleaseOpponent();
                };
                if (_arg_1.IsThrow)
                {
                    this.Uncapture();
                    unnattachFromGround();
                };
                this.m_hitLagStunTimer.reset();
                if (STAGEPARENT.getChildByName(("energy" + m_player_id)) != null)
                {
                    STAGEPARENT.removeChild(STAGEPARENT.getChildByName(("energy" + m_player_id)));
                };
                if (((this.inState(CState.CAUGHT)) && (this.m_hitForceVisible)))
                {
                    this.setVisibility(m_sprite.visible);
                };
                if (((this.inState(CState.CAUGHT)) && (this.m_grabberID > 0)))
                {
                    if ((!((STAGEDATA.getPlayer(this.m_grabberID).UsingFinalSmash) && (!(_arg_1.HasEffect)))))
                    {
                        STAGEDATA.getPlayer(this.m_grabberID).releaseOpponent(STAGEDATA.getPlayer(this.m_grabberID).Grabbed.indexOf(this));
                        if ((!(STAGEDATA.getPlayer(this.m_grabberID).inState(CState.ATTACKING))))
                        {
                            STAGEDATA.getPlayer(this.m_grabberID).grabRelease();
                        };
                    };
                };
                if (this.inState(CState.SHIELDING))
                {
                    this.m_deactivateShield();
                };
                this.m_smashDIAmount = (this.SDI_BASE * _arg_1.SDIDistance);
                this.m_jumpStartup.reset();
                this.m_charIsFull = false;
                this.m_justReleased = false;
                if (this.inState(CState.LEDGE_HANG))
                {
                    this.unnattachFromLedge();
                };
                this.m_ledge = null;
                this.m_lastLedge = null;
                _local_24 = this.inState(CState.DIZZY);
                this.m_dizzyTimer = 0;
                _local_25 = this.inState(CState.PITFALL);
                this.toggleEffect(this.m_pitfallEffect, false);
                this.m_stunTimer = 0;
                this.m_sleepingTimer = 0;
                this.m_midAirJumpConstantTime.CurrentTime = this.m_midAirJumpConstantTime.MaxTime;
                this.m_fastFallLetGo = false;
                if (m_attack.CancelSoundOnEnd)
                {
                    this.stopSoundID(this.m_lastSFX);
                    this.m_lastSFX = -1;
                };
                if (m_attack.CancelVoiceOnEnd)
                {
                    this.stopSoundID(this.m_lastVFX);
                    this.m_lastVFX = -1;
                };
                if (((this.inState(CState.ATTACKING)) && (m_attackData.getAttack(m_attack.Frame).ChargeRetain)))
                {
                    m_attackData.getAttack(m_attack.Frame).ChargeTime = 0;
                };
                if ((((this.inState(CState.ATTACKING)) && (!(m_collision.ground))) && (m_attack.DisableJump)))
                {
                    this.m_jumpCount = this.m_characterStats.MaxJump;
                };
                m_attack.Rocket = false;
                if (this.inState(CState.LEDGE_HANG))
                {
                };
                this.m_crouchFrame = -1;
                this.m_canWallTech = true;
                _local_11 = 0;
                _local_9 = ((_arg_1.Damage <= 0) ? 0 : Utils.calculateChargeDamage(_arg_1));
                _local_9 = (_local_9 * _arg_1.StaleMultiplier);
                if (((_arg_1.Damage > 0) && (_local_9 <= 0)))
                {
                    _local_9 = 1;
                };
                if (this.m_transformedSpecial)
                {
                    _local_9 = (_local_9 / 2);
                };
                if (((_local_9 == 0) && (_arg_1.Damage > 0)))
                {
                };
                if (_local_9 != 0)
                {
                    this.throbDamageCounter();
                };
                if ((!(STAGEDATA.GameEnded)))
                {
                    this.m_matchResults.DamageTaken = (this.m_matchResults.DamageTaken + _local_9);
                };
                if (this.m_recoveryAmount > 0)
                {
                    this.m_recoveryAmount = (this.m_recoveryAmount - _local_9);
                    if (this.m_recoveryAmount <= 0)
                    {
                        _local_9 = -(this.m_recoveryAmount);
                        this.m_recoveryAmount = 0;
                    }
                    else
                    {
                        _local_9 = 0;
                    };
                };
                this.setDamage((this.m_damage + _local_9));
                this.m_kirbyDamageCounter = (this.m_kirbyDamageCounter - _local_9);
                this.m_itemDamageCounter = (this.m_itemDamageCounter - _local_9);
                if ((!(m_attack.DisableLastHitUpdate)))
                {
                    m_lastHitID = _arg_1.PlayerID;
                };
                if (m_lastHitID > 0)
                {
                    STAGEDATA.getPlayer(m_lastHitID).getMatchResults().DamageGiven = (STAGEDATA.getPlayer(m_lastHitID).getMatchResults().DamageGiven + _local_9);
                    STAGEDATA.getPlayer(m_lastHitID).resetDroughtTimer();
                    if (SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.VAMPIRE))
                    {
                        STAGEDATA.getPlayer(m_lastHitID).recover((_local_9 / 2));
                    }
                    else
                    {
                        if (SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.VENGEANCE))
                        {
                            STAGEDATA.getPlayer(m_lastHitID).dealDamage((_local_9 / 2));
                            STAGEDATA.getPlayer(m_lastHitID).throbDamageCounter();
                        };
                    };
                };
                if (_arg_1.AttackID != -1)
                {
                    stackAttackID(_arg_1.AttackID);
                };
                this.m_smashDISelf = false;
                if (m_paralysis)
                {
                    this.stopActionShot();
                    m_paralysisHitCount = 3;
                }
                else
                {
                    startActionShot(Utils.calculateHitStun(_arg_1.HitStun, _local_9, _arg_1.Shock, (_local_3 == CState.CROUCH)), _arg_1.Paralysis);
                };
                this.m_smashDILetGo = true;
                this.m_smashDILetGoCStick = true;
                this.checkDI();
                _local_12 = Utils.calculateKnockback(_arg_1.KBConstant, _arg_1.Power, _arg_1.WeightKB, _local_21, _local_10, m_weight1, ((this.inState(CState.ATTACKING)) && (this.currentStanceFrameIs("charging"))), this.m_damageRatio);
                _local_11 = Utils.calculateVelocity(_local_12);
                if (this.m_transformedSpecial)
                {
                    _local_11 = (_local_11 / 2);
                };
                if (this.m_sizeStatus != 0)
                {
                    _local_11 = (_local_11 * ((this.m_sizeStatus == 1) ? 0.75 : 1.5));
                };
                _local_26 = this.inState(CState.CRASH_LAND);
                this.m_forceTumbleFall = ((!(this.inState(CState.CRASH_LAND))) && ((_local_11 >= this.HEAVY_KNOCKBACK_THRESHOLD) || (_arg_1.ForceTumbleFall)));
                this.m_hitLag = this.calculateHitLag(_local_12, _arg_1.HitLag);
                if (((_local_11 < this.HEAVY_KNOCKBACK_THRESHOLD) || (this.m_hitLag < this.HEAVY_KNOCKBACK_HITLAG_THRESHOLD)))
                {
                    if ((!(_arg_1.DisableHurtSound)))
                    {
                        if (((!(this.inState(CState.CAUGHT))) && (Utils.random() > 0.6)))
                        {
                            this.playCharacterSound("hurt");
                        };
                    };
                    if (((!(this.inState(CState.FROZEN))) && (!(this.inState(CState.CAUGHT)))))
                    {
                        this.setState(CState.INJURED);
                    };
                    if (_arg_1.Power >= 1000)
                    {
                        CAM.shake(6);
                    };
                }
                else
                {
                    if ((!(_arg_1.DisableHurtSound)))
                    {
                        if ((((!(this.inState(CState.CAUGHT))) && (!(this.inState(CState.FLYING)))) && (_local_11 > 24)))
                        {
                            this.playCharacterSound("hurtBad");
                        }
                        else
                        {
                            this.playCharacterSound("hurt");
                        };
                    };
                    if ((!(this.inState(CState.FLYING))))
                    {
                        this.m_ricochetTimer.reset();
                        this.m_ricochetCount.reset();
                        this.m_ricochetX.finish();
                        this.m_ricochetY.finish();
                    };
                    if (((!(this.inState(CState.FROZEN))) && (!(((this.inState(CState.CAUGHT)) && (this.m_grabberID > 0)) && (STAGEDATA.getPlayer(this.m_grabberID).UsingFinalSmash)))))
                    {
                        this.setState(CState.FLYING);
                    };
                    if (((this.m_damage >= 100) && (this.inState(CState.FLYING))))
                    {
                        this.m_crowdAwe = true;
                    };
                    if (((_local_11 > 35) && (!(this.inState(CState.CAUGHT)))))
                    {
                        CAM.lightFlash(false);
                    };
                    CAM.shake(12);
                };
                if (_arg_1.CamShake > 0)
                {
                    CAM.shake(_arg_1.CamShake);
                };
                if (((SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.DRAMATIC)) && (_local_11 > (this.HEAVY_KNOCKBACK_THRESHOLD / 4))))
                {
                    _arg_1.SelfHitStun = (_arg_1.SelfHitStun + (2 * _arg_1.HitStun));
                    _arg_1.HitStun = (_arg_1.HitStun + (2 * _arg_1.HitStun));
                    if ((_arg_1.Owner is Character))
                    {
                        STAGEDATA.CamRef.addZoomFocus(_arg_1.Owner.MC, _arg_1.SelfHitStun);
                    };
                    STAGEDATA.CamRef.forceTarget();
                    startActionShot(_arg_1.HitStun);
                };
                _local_6 = true;
                _local_7 = _arg_1.IsForward;
                if (_arg_1.Direction == -1)
                {
                    _local_23 = Math.round((Utils.random() * 360));
                }
                else
                {
                    if (_arg_1.Direction == -2)
                    {
                        _local_23 = (Math.round((Utils.random() * (150 - 60))) + 60);
                    }
                    else
                    {
                        if (_arg_1.Direction == -3)
                        {
                            _local_23 = ((_arg_1.XLoc < m_sprite.x) ? 75 : 115);
                            _local_7 = (_arg_1.XLoc < m_sprite.x);
                            _local_6 = false;
                        }
                        else
                        {
                            if (_arg_1.Direction == -4)
                            {
                                _local_23 = ((_arg_1.XLoc < m_sprite.x) ? 20 : 160);
                                _local_7 = (_arg_1.XLoc < m_sprite.x);
                                _local_6 = false;
                            }
                            else
                            {
                                if (_arg_1.Direction == -5)
                                {
                                    _local_23 = ((_arg_1.XLoc < m_sprite.x) ? 160 : 20);
                                    _local_7 = (_arg_1.XLoc < m_sprite.x);
                                    _local_6 = false;
                                }
                                else
                                {
                                    if (_arg_1.Direction == -6)
                                    {
                                        _local_23 = ((_arg_1.YLoc < m_sprite.y) ? 115 : 75);
                                        _local_7 = (_arg_1.XLoc < m_sprite.x);
                                        _local_6 = false;
                                    }
                                    else
                                    {
                                        if (_arg_1.Direction == -7)
                                        {
                                            _local_23 = ((_arg_1.YLoc < m_sprite.y) ? 90 : 270);
                                        }
                                        else
                                        {
                                            if (_arg_1.Direction == -8)
                                            {
                                                _local_23 = Utils.getAngleBetween(new Point(m_sprite.x, m_sprite.y), new Point((m_sprite.x + this.netXSpeed()), (m_sprite.y + this.netYSpeed())));
                                                _local_6 = false;
                                            }
                                            else
                                            {
                                                if (((_arg_1.Direction == -9) && (_arg_1.PlayerID > 0)))
                                                {
                                                    if ((_arg_1.Owner as Projectile))
                                                    {
                                                        if (((!(Projectile(_arg_1.Owner).XSpeed == 0)) || (!(Projectile(_arg_1.Owner).YSpeed == 0))))
                                                        {
                                                            _local_23 = Utils.getAngleBetween(new Point(m_sprite.x, m_sprite.y), new Point((m_sprite.x + Projectile(_arg_1.Owner).XSpeed), (m_sprite.y + Projectile(_arg_1.Owner).YSpeed)));
                                                        };
                                                    }
                                                    else
                                                    {
                                                        if ((_arg_1.Owner as Item))
                                                        {
                                                            if (((!(Item(_arg_1.Owner).XSpeed == 0)) || (!(Item(_arg_1.Owner).YSpeed == 0))))
                                                            {
                                                                _local_23 = Utils.getAngleBetween(new Point(m_sprite.x, m_sprite.y), new Point((m_sprite.x + Item(_arg_1.Owner).XSpeed), (m_sprite.y + Item(_arg_1.Owner).YSpeed)));
                                                            };
                                                        }
                                                        else
                                                        {
                                                            if (((!(_arg_1.Owner as Projectile)) && (!(_arg_1.Owner as Item))))
                                                            {
                                                                if (((!(STAGEDATA.getPlayer(_arg_1.PlayerID).netXSpeed() == 0)) || (!(STAGEDATA.getPlayer(_arg_1.PlayerID).netYSpeed() == 0))))
                                                                {
                                                                    _local_23 = Utils.getAngleBetween(new Point(m_sprite.x, m_sprite.y), new Point((m_sprite.x + this.netXSpeed()), (m_sprite.y + this.netYSpeed())));
                                                                }
                                                                else
                                                                {
                                                                    _local_23 = Utils.getAngleBetween(new Point(m_sprite.x, m_sprite.y), new Point((m_sprite.x + STAGEDATA.getPlayer(_arg_1.PlayerID).netXSpeed()), (m_sprite.y + STAGEDATA.getPlayer(_arg_1.PlayerID).netYSpeed())));
                                                                };
                                                            };
                                                        };
                                                    };
                                                    _local_6 = false;
                                                }
                                                else
                                                {
                                                    _local_23 = _arg_1.Direction;
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                if (m_collision.ground)
                {
                    if (((_local_23 > 180) && (_local_23 < 360)))
                    {
                        if ((!((_arg_1.ForceTumbleFall) && (!(_arg_1.MeteorBounce)))))
                        {
                            _local_23 = (360 - _local_23);
                        };
                        this.attachGroundBounceEffect();
                    };
                };
                if (((!(_local_7)) && (_local_6)))
                {
                    _local_23 = (180 - _local_23);
                };
                _local_23 = Utils.forceBase360(_local_23);
                if ((((this.inState(CState.FLYING)) || (this.inState(CState.INJURED))) && (_arg_1.HitStun == 0)))
                {
                    _local_23 = this.calculateDI(_local_11, _local_23);
                };
                this.m_canDI = _arg_1.CanDI;
                if ((((((((_local_26) && (this.inState(CState.INJURED))) && (_local_9 < 7)) && (_arg_1.Pitfall <= 0)) && (_arg_1.Sleep <= 0)) && (_arg_1.Stun <= 0)) && (_arg_1.Dizzy <= 0)))
                {
                    this.m_forcedCrash = true;
                    this.m_tapJumpLetGo = false;
                    this.m_jumpLetGo = false;
                    this.m_jumpFullyReleased = false;
                    this.setState(CState.CRASH_GETUP);
                    this.setStanceVar("ready", true);
                    this.stancePlayFrame("getup");
                    _local_27 = Utils.calculateXSpeed(_local_11, _local_23);
                    _local_28 = -(Utils.calculateYSpeed(_local_11, _local_23));
                    _local_27 = (_local_27 / 2);
                    _local_28 = 0;
                    _local_23 = Utils.getAngleBetween(new Point(0, 0), new Point(_local_27, _local_28));
                    _local_11 = Utils.calculateSpeed(_local_27, _local_28);
                };
                if (((_arg_1.Direction >= 240) && (_arg_1.Direction <= 300)))
                {
                    if (m_collision.ground)
                    {
                        this.m_hitLagCanCancel = false;
                        _local_11 = (_local_11 * 0.8);
                    }
                    else
                    {
                        this.m_hitLagCanCancel = true;
                        this.m_hitLagJumpCancelTimer.reset();
                        this.m_hitLagLetGo = (((!(this.m_jump)) && (!(this.m_jump2))) && (!(this.m_up)));
                    };
                }
                else
                {
                    this.m_hitLagCanCancel = false;
                };
                this.killAllSpeeds();
                m_xKnockback = Utils.calculateXSpeed(_local_11, _local_23);
                m_yKnockback = -(Utils.calculateYSpeed(_local_11, _local_23));
                if (((MenuController.debugConsole) && (MenuController.debugConsole.AttackStateCapture)))
                {
                    MenuController.debugConsole.writeTextData((((((((((((((((((((((((((((((_arg_1.AttackBoxName + ": { weight1: ") + m_weight1) + ", weight2: ") + m_weight2) + ", angle: ") + _local_23) + ", attackDamage: ") + _arg_1.Damage) + ", receiverDamage: ") + _local_10) + ", calculatedDamage: ") + _local_9) + ", kbc: ") + _arg_1.KBConstant) + ", power: ") + _arg_1.Power) + ", weightKB: ") + _arg_1.WeightKB) + ", knockback: ") + _local_12) + ", velocity: ") + _local_11) + ", hitlag: ") + this.m_hitLag) + ", chargetime: ") + _arg_1.ChargeTime) + ", chargetime_max: ") + _arg_1.ChargeTimeMax) + " }"));
                };
                if (((!(this.inState(CState.CAUGHT))) && (!(_local_26))))
                {
                    if (((m_xKnockback > 0) && (m_facingForward)))
                    {
                        m_facingForward = false;
                        this.m_faceLeft();
                    }
                    else
                    {
                        if (((m_xKnockback < 0) && (!(m_facingForward))))
                        {
                            m_facingForward = true;
                            this.m_faceRight();
                        };
                    };
                };
                if (((_arg_1.ReversableAngle) && (_arg_1.Direction >= 0)))
                {
                    _local_8 = ((_arg_1.Direction > 90) && (_arg_1.Direction < 270));
                    if (((m_sprite.x < _arg_1.XLoc) || (m_sprite.x > _arg_1.XLoc)))
                    {
                        m_xKnockback = ((m_sprite.x > _arg_1.XLoc) ? Utils.fastAbs(m_xKnockback) : -(Utils.fastAbs(m_xKnockback)));
                        if (_local_8)
                        {
                            m_xKnockback = (m_xKnockback * -1);
                        };
                        if (((!(this.inState(CState.CAUGHT))) && (!(_local_26))))
                        {
                            if (m_xKnockback > 0)
                            {
                                this.m_faceLeft();
                            }
                            else
                            {
                                this.m_faceRight();
                            };
                        };
                    };
                    _local_23 = Utils.getAngleBetween(new Point(), new Point(m_xKnockback, m_yKnockback));
                };
                if ((((!(_local_26)) && ((m_collision.ground) && (m_yKnockback >= 0))) && (!((_arg_1.ForceTumbleFall) && (!(_arg_1.MeteorBounce))))))
                {
                    if ((((m_actionShot) && (!(m_paralysis))) && (this.inState(CState.FLYING))))
                    {
                        this.m_forcedCrash = false;
                        this.setState(CState.CRASH_LAND);
                        this.stancePlayFrame("dead");
                        this.m_canWallTech = false;
                    };
                };
                if (((((((((_arg_1.Pitfall > 0) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.DIZZY)))) && (!(_local_25))) && (!(this.inState(CState.SLEEP)))) && (!(this.inState(CState.EGG)))) && (m_collision.ground)))
                {
                    this.m_pitfallTimer = (_arg_1.Pitfall + (0.6 * this.m_damage));
                    this.resetRotation();
                    Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                    this.killAllSpeeds();
                    if (((this.inState(CState.CAUGHT)) && (this.m_grabberID > 0)))
                    {
                        STAGEDATA.getPlayer(this.m_grabberID).setState(CState.IDLE);
                    };
                    this.setState(CState.PITFALL);
                    this.stopActionShot();
                    this.toggleEffect(this.m_pitfallEffect, true);
                };
                if ((((((!(_local_26)) && (m_yKnockback < 0)) && (m_collision.ground)) && (!(this.inState(CState.PITFALL)))) && (!(this.inState(CState.CAUGHT)))))
                {
                    unnattachFromGround();
                };
                this.m_canBounce = ((_arg_1.MeteorBounce) && ((_local_23 >= 200) && (_local_23 <= 340)));
                this.m_hasBounced = false;
                if (_arg_1.EffectSound != null)
                {
                    this.playGlobalSound(_arg_1.EffectSound);
                };
                if ((((((((_arg_1.Stun > 0) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.PITFALL)))) && (!(this.inState(CState.SLEEP)))) && (!(this.inState(CState.EGG)))))
                {
                    this.setState(CState.STUNNED);
                    this.m_stunCancelTimer.reset();
                    this.m_stunTimer = _arg_1.Stun;
                    this.resetRotation();
                    Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                    this.killAllSpeeds(false, true);
                };
                if (((((((((_arg_1.Dizzy > 0) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.PITFALL)))) && (!(this.inState(CState.SLEEP)))) && (!(this.inState(CState.EGG)))) && (!((_local_24) && (!(m_collision.ground))))))
                {
                    this.setState(CState.DIZZY);
                    this.m_stunCancelTimer.reset();
                    this.m_dizzyTimer = (_arg_1.Dizzy + (0.6 * this.m_damage));
                    this.resetRotation();
                    Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                    this.killAllSpeeds(false, true);
                    this.m_dizzyShield = false;
                };
                if ((((((((_arg_1.Freeze > 0) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.PITFALL)))) && (!(this.inState(CState.SLEEP)))) && (!(this.inState(CState.EGG)))))
                {
                    this.freeze(true, _arg_1.Freeze);
                };
                if ((((((((_arg_1.Sleep > 0) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.PITFALL)))) && (!(this.inState(CState.SLEEP)))) && (!(this.inState(CState.EGG)))))
                {
                    this.setState(CState.SLEEP);
                    this.m_stunCancelTimer.reset();
                    this.m_sleepingTimer = (_arg_1.Sleep + (2 * this.m_damage));
                    this.resetRotation();
                    Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                    this.killAllSpeeds(false, true);
                };
                if ((((((((_arg_1.Egg > 0) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.PITFALL)))) && (!(this.inState(CState.SLEEP)))) && (!(this.inState(CState.EGG)))))
                {
                    this.egg(true);
                };
                if (_arg_1.Poison > 0)
                {
                    this.m_poisonIncrease = _arg_1.Poison;
                    this.m_poisonIncreaseInterval.MaxTime = _arg_1.PoisonInterval;
                    this.m_poisonIncreaseTime.MaxTime = _arg_1.PoisonLength;
                    this.m_poisonTintTimer.reset();
                    Utils.advanceFrame(this.m_poisonEffect);
                    this.toggleEffect(this.m_poisonEffect, true);
                    this.m_poisonEffect.x = m_sprite.x;
                    this.m_poisonEffect.y = m_sprite.y;
                };
                if (this.inState(CState.FROZEN))
                {
                    if (Utils.fastAbs(m_xKnockback) > 5)
                    {
                        m_xKnockback = ((m_xKnockback > 0) ? 5 : -5);
                    };
                    if (m_yKnockback > 10)
                    {
                        m_yKnockback = 10;
                    };
                };
                if (((!(_arg_1.EffectID == null)) && (!(_arg_1.EffectID == null))))
                {
                    _local_29 = attachHurtEffect(_arg_1.EffectID, _arg_2, {
                        "scaleX":((0.25 + (0.75 * Math.min((_arg_1.Damage / 16), 1))) * _local_20),
                        "scaleY":((0.25 + (0.75 * Math.min((_arg_1.Damage / 16), 1))) * _local_20)
                    });
                    if (_local_29)
                    {
                        _local_29.rotation = ((_arg_1.IsForward) ? (180 - _local_23) : -(_local_23));
                    };
                };
                if ((((this.HasSmashBall) && (!(this.m_item2 == null))) && (Utils.random() < 0.2)))
                {
                    this.m_item2.resetSmashBall();
                    this.m_hasFinalSmash = false;
                    this.m_item2 = null;
                    this.toggleEffect(this.m_fsGlowHolderMC, false);
                };
                if ((((this.m_characterStats.LinkageID == "kirby") && (!(this.m_currentPower == null))) && (this.m_kirbyDamageCounter <= 0)))
                {
                    this.playGlobalSound("kirby_losepower");
                    this.resetChargedAttacks();
                    m_attackData.resetCharges();
                    this.removeChargeGlow();
                    this.m_currentPower = null;
                    _local_30 = STAGEDATA.attachEffectOverlay("kirby_powerstar");
                    if (HasHatBox)
                    {
                        m_sprite.stance.hatBox.visible = false;
                    };
                    _local_30.width = (_local_30.width * m_sizeRatio);
                    _local_30.height = (_local_30.height * m_sizeRatio);
                    if ((!(m_facingForward)))
                    {
                        _local_30.scaleX = (_local_30.scaleX * -1);
                    };
                    _local_30.x = OverlayX;
                    _local_30.y = (OverlayY - (10 * m_sizeRatio));
                };
                if ((((!(this.m_item == null)) && (this.m_itemDamageCounter <= 0)) && (this.m_item.Ability == "attack")))
                {
                    this.m_item.Drop();
                    this.m_itemLetGo = false;
                    this.m_itemTimer = 5;
                    this.m_item = null;
                }
                else
                {
                    if (((this.m_item) && (this.m_item is EnergyTank)))
                    {
                        this.m_item.destroy();
                        this.m_item = null;
                    };
                };
                if (((this.inState(CState.INJURED)) || ((isHitStunOrParalysis()) && (!(_local_26)))))
                {
                    if (_arg_1.Shock)
                    {
                        this.resetRotation();
                        Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                        if (((HasStance) && (Utils.hasLabel(m_sprite.stance, "shock"))))
                        {
                            this.stancePlayFrame("shock");
                        }
                        else
                        {
                            this.stancePlayFrame(("hurt" + (Math.round((Utils.random() * (this.m_characterStats.HurtFrames - 1))) + 1)));
                        };
                        this.m_shockEffectTimer.reset();
                    }
                    else
                    {
                        if (_arg_1.Burn)
                        {
                            this.resetRotation();
                            Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                            if (((HasStance) && (Utils.hasLabel(m_sprite.stance, "burn"))))
                            {
                                this.stancePlayFrame("burn");
                            }
                            else
                            {
                                this.stancePlayFrame(("hurt" + (Math.round((Utils.random() * (this.m_characterStats.HurtFrames - 1))) + 1)));
                            };
                            this.m_burnSmokeTimer.reset();
                            if (this.m_burnSmoke.parent == null)
                            {
                                STAGE.addChild(this.m_burnSmoke);
                                STAGE.addChild(this.m_burnSmoke);
                                this.m_burnSmoke.x = m_sprite.x;
                                this.m_burnSmoke.y = m_sprite.y;
                            };
                        }
                        else
                        {
                            this.resetRotation();
                            Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                            if (((!(this.inState(CState.CRASH_LAND))) && (!(this.inState(CState.CRASH_GETUP)))))
                            {
                                this.stancePlayFrame(("hurt" + (Math.round((Utils.random() * (this.m_characterStats.HurtFrames - 1))) + 1)));
                            };
                        };
                    };
                    this.updateItemHolding();
                };
                if (_local_15)
                {
                    _arg_1.HasEffect = _local_18;
                    _arg_1.Power = _local_16;
                    _arg_1.KBConstant = _local_17;
                };
                if (m_yKnockback < 0)
                {
                    this.m_hasArced = false;
                }
                else
                {
                    this.m_hasArced = true;
                };
                if (((m_lastHitID > 0) && (Utils.fastAbs(_local_11) > STAGEDATA.getPlayer(m_lastHitID).getMatchResults().FastestPitch)))
                {
                    STAGEDATA.getPlayer(m_lastHitID).getMatchResults().FastestPitch = Utils.fastAbs(_local_11);
                };
                if (((Utils.fastAbs(_local_11) > this.m_matchResults.TopSpeed) && (!(STAGEDATA.GameEnded))))
                {
                    this.m_matchResults.TopSpeed = Utils.fastAbs(_local_11);
                };
                this.m_dustTimer.reset();
                this.m_dustTimer.MaxTime = this.calculateHitLag(_local_12, -0.9);
                this.m_injureFlashTimer.reset();
                setTint(0.8, 0.8, 0.8, 1, 51, 51, 51, 0);
                _local_5 = false;
                if ((((!((_local_13 == 0) && (_local_14 == 0))) && (_arg_1.StackKnockback)) && ((m_knockbackStackingTimer.IsComplete) || (m_knockbackStacked))))
                {
                    _local_5 = true;
                    stackKnockback(_local_11, _local_23, _local_13, _local_14);
                    m_knockbackStacked = true;
                };
                resetKnockbackDecay();
                m_knockbackStackingTimer.reset();
                this.m_ricochetX.finish();
                this.m_ricochetY.finish();
                if (((MenuController.debugConsole) && (MenuController.debugConsole.KnockbackCapture)))
                {
                    MenuController.debugConsole.writeTextData((((((((((_arg_1.AttackBoxName + ": { xKnockbackVelocity: ") + m_xKnockback) + ", yKnockbackVelocity: ") + m_yKnockback) + ", angle: ") + Utils.getAngleBetween(new Point(), new Point(m_xKnockback, m_yKnockback))) + ", stacked: ") + _local_5) + " }"));
                };
                if (((m_lastHitID > 0) && (!(_arg_1.Owner is Enemy))))
                {
                    if (((((STAGEDATA.getPlayer(m_lastHitID).getDamage() >= 100) && (this.inState(CState.FLYING))) && (Utils.random() > 0.5)) && (netSpeed() > 35)))
                    {
                        STAGEDATA.startCrowdChant(m_lastHitID);
                    };
                };
                if (SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.INVISIBLE))
                {
                    this.m_invisiblePulseCount = 8;
                    this.m_invisiblePulseToggle = true;
                    this.m_invisiblePulseTimer.reset();
                    this.m_invisiblePulseTimer.MaxTime = Utils.randomInteger(1, 8);
                };
                return (true);
            };
            if (((((((((((((((!(this.m_standby)) && (!(_arg_1 == null))) && (!(_arg_1.HasEffect))) && (this.validateBypass(_arg_1))) && (validateOnlyAffects(_arg_1))) && (!((isIntangible()) && (_arg_1.Damage > 0)))) && (!(this.inState(CState.LEDGE_HANG)))) && (!(this.inState(CState.LEDGE_CLIMB)))) && (!(this.inState(CState.LEDGE_ROLL)))) && (!((this.inState(CState.ATTACKING)) && (m_attack.Frame == "ledge_attack")))) && (!(attackIDArrayContains(_arg_1.AttackID)))) && (!((!(_arg_1.HurtSelf)) && (_arg_1.PlayerID == m_player_id)))) && (!(this.inState(CState.REVIVAL)))) && (!(((((!(_arg_1.HurtSelf)) && (!(_arg_1.AttackID == -1))) && (m_team_id == _arg_1.TeamID)) && (m_team_id > 0)) && (!(this.m_teamDamage))))))
            {
                m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_HURT, {
                    "caller":this,
                    "opponent":_arg_1.Owner,
                    "attackBoxData":_arg_1.exportAttackDamageData()
                }));
                startActionShot(-1, _arg_1.Paralysis);
                this.m_windBoxHit = true;
                _local_9 = ((((_arg_1.Damage <= 0) || (this.isInvincible())) || (isIntangible())) ? 0 : Utils.calculateChargeDamage(_arg_1));
                _local_9 = (_local_9 * _arg_1.StaleMultiplier);
                if (((_arg_1.Damage > 0) && (_local_9 <= 0)))
                {
                };
                if ((!(STAGEDATA.GameEnded)))
                {
                    this.m_matchResults.DamageTaken = (this.m_matchResults.DamageTaken + _local_9);
                };
                if (this.m_recoveryAmount > 0)
                {
                    this.m_recoveryAmount = (this.m_recoveryAmount - _local_9);
                    if (this.m_recoveryAmount <= 0)
                    {
                        _local_9 = -(this.m_recoveryAmount);
                        this.m_recoveryAmount = 0;
                    }
                    else
                    {
                        _local_9 = 0;
                    };
                };
                this.setDamage((this.m_damage + _local_9));
                if ((!(m_attack.DisableLastHitUpdate)))
                {
                    m_lastHitID = _arg_1.PlayerID;
                };
                if (m_lastHitID > 0)
                {
                    STAGEDATA.getPlayer(m_lastHitID).getMatchResults().DamageGiven = (STAGEDATA.getPlayer(m_lastHitID).getMatchResults().DamageGiven + _local_9);
                    STAGEDATA.getPlayer(m_lastHitID).resetDroughtTimer();
                    if (SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.VAMPIRE))
                    {
                        STAGEDATA.getPlayer(m_lastHitID).recover((_local_9 / 2));
                    }
                    else
                    {
                        if (SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.VENGEANCE))
                        {
                            STAGEDATA.getPlayer(m_lastHitID).dealDamage((_local_9 / 2));
                            STAGEDATA.getPlayer(m_lastHitID).throbDamageCounter();
                        };
                    };
                };
                if (_arg_1.AttackID != -1)
                {
                    stackAttackID(_arg_1.AttackID);
                };
                if (_arg_1.EffectSound != null)
                {
                    this.playGlobalSound(_arg_1.EffectSound);
                };
                _local_31 = false;
                if ((((((((!(this.inState(CState.LEDGE_HANG))) && (!(this.inState(CState.LEDGE_ROLL)))) && (!(this.inState(CState.LEDGE_HANG)))) && (!(_arg_1.Power == 0))) && (!(this.inState(CState.PITFALL)))) && (!((this.inState(CState.ATTACKING)) && (m_attack.IsThrow)))) && (!(this.inState(CState.CAUGHT)))))
                {
                    _local_31 = true;
                    _local_6 = true;
                    _local_7 = _arg_1.IsForward;
                    if (_arg_1.Direction == -1)
                    {
                        _local_23 = Math.round((Utils.random() * 360));
                    }
                    else
                    {
                        if (_arg_1.Direction == -2)
                        {
                            _local_23 = (Math.round((Utils.random() * (150 - 60))) + 60);
                        }
                        else
                        {
                            if (_arg_1.Direction == -3)
                            {
                                _local_23 = ((Utils.random() > 0.5) ? 30 : 150);
                            }
                            else
                            {
                                if (_arg_1.Direction == -4)
                                {
                                    _local_23 = ((_arg_1.XLoc < m_sprite.x) ? 20 : 160);
                                    _local_7 = (_arg_1.XLoc < m_sprite.x);
                                    _local_6 = false;
                                }
                                else
                                {
                                    if (_arg_1.Direction == -5)
                                    {
                                        _local_23 = ((_arg_1.XLoc < m_sprite.x) ? 160 : 20);
                                        _local_7 = (_arg_1.XLoc < m_sprite.x);
                                        _local_6 = false;
                                    }
                                    else
                                    {
                                        if (_arg_1.Direction == -6)
                                        {
                                            _local_23 = ((_arg_1.YLoc < m_sprite.y) ? 115 : 75);
                                            _local_7 = (_arg_1.XLoc < m_sprite.x);
                                            _local_6 = false;
                                        }
                                        else
                                        {
                                            if (_arg_1.Direction == -7)
                                            {
                                                _local_23 = ((_arg_1.YLoc < m_sprite.y) ? 90 : 270);
                                            }
                                            else
                                            {
                                                if (_arg_1.Direction == -8)
                                                {
                                                    _local_23 = Utils.getAngleBetween(new Point(m_sprite.x, m_sprite.y), new Point((m_sprite.x + this.netXSpeed()), (m_sprite.y + this.netYSpeed())));
                                                    _local_6 = false;
                                                }
                                                else
                                                {
                                                    if (((_arg_1.Direction == -9) && (_arg_1.PlayerID > 0)))
                                                    {
                                                        if (Projectile(_arg_1.Owner))
                                                        {
                                                            if (((!(Projectile(_arg_1.Owner).XSpeed == 0)) || (!(Projectile(_arg_1.Owner).YSpeed == 0))))
                                                            {
                                                                _local_23 = Utils.getAngleBetween(new Point(m_sprite.x, m_sprite.y), new Point((m_sprite.x + Projectile(_arg_1.Owner).XSpeed), (m_sprite.y + Projectile(_arg_1.Owner).YSpeed)));
                                                            };
                                                        }
                                                        else
                                                        {
                                                            if (Item(_arg_1.Owner))
                                                            {
                                                                if (((!(Item(_arg_1.Owner).XSpeed == 0)) || (!(Item(_arg_1.Owner).YSpeed == 0))))
                                                                {
                                                                    _local_23 = Utils.getAngleBetween(new Point(m_sprite.x, m_sprite.y), new Point((m_sprite.x + Item(_arg_1.Owner).XSpeed), (m_sprite.y + Item(_arg_1.Owner).YSpeed)));
                                                                };
                                                            }
                                                            else
                                                            {
                                                                if (((!(Projectile(_arg_1.Owner))) && (!(Item(_arg_1.Owner)))))
                                                                {
                                                                    if (((!(STAGEDATA.getPlayer(_arg_1.PlayerID).XVelocity == 0)) || (!(STAGEDATA.getPlayer(_arg_1.PlayerID).YVelocity == 0))))
                                                                    {
                                                                        _local_23 = Utils.getAngleBetween(new Point(m_sprite.x, m_sprite.y), new Point((m_sprite.x + STAGEDATA.getPlayer(_arg_1.PlayerID).netXSpeed()), (m_sprite.y + STAGEDATA.getPlayer(_arg_1.PlayerID).netYSpeed())));
                                                                    }
                                                                    else
                                                                    {
                                                                        _local_23 = Utils.getAngleBetween(new Point(m_sprite.x, m_sprite.y), new Point((m_sprite.x + STAGEDATA.getPlayer(_arg_1.PlayerID).netXSpeed()), (m_sprite.y + STAGEDATA.getPlayer(_arg_1.PlayerID).netYSpeed())));
                                                                    };
                                                                };
                                                            };
                                                        };
                                                        _local_6 = false;
                                                    }
                                                    else
                                                    {
                                                        _local_23 = _arg_1.Direction;
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    if (m_collision.ground)
                    {
                        if (((_local_23 > 180) && (_local_23 < 360)))
                        {
                            _local_23 = (360 - _local_23);
                        };
                    };
                    if (((!(_local_7)) && (_local_6)))
                    {
                        _local_23 = (180 - _local_23);
                    };
                    _local_23 = Utils.forceBase360(_local_23);
                    _local_12 = Utils.calculateKnockback(_arg_1.KBConstant, _arg_1.Power, 0, 0, 0, m_weight1, false, 1);
                    _local_11 = Utils.calculateVelocity(_local_12);
                    m_xKnockback = Utils.calculateXSpeed(_local_11, _local_23);
                    m_yKnockback = -(Utils.calculateYSpeed(_local_11, _local_23));
                    if (((MenuController.debugConsole) && (MenuController.debugConsole.AttackStateCapture)))
                    {
                        MenuController.debugConsole.writeTextData((((((((((((((((((((((((((((((_arg_1.AttackBoxName + " (wind): { weight1: ") + m_weight1) + ", weight2: ") + m_weight2) + ", angle: ") + _local_23) + ", attackDamage: ") + _arg_1.Damage) + ", receiverDamage: ") + _local_10) + ", calculatedDamage: ") + _local_9) + ", kbc: ") + _arg_1.KBConstant) + ", power: ") + _arg_1.Power) + ", weightKB: ") + _arg_1.WeightKB) + ", knockback: ") + _local_12) + ", velocity: ") + _local_11) + ", hitlag: ") + this.m_hitLag) + ", chargetime: ") + _arg_1.ChargeTime) + ", chargetime_max: ") + _arg_1.ChargeTimeMax) + " }"));
                    };
                    if (((m_collision.ground) && (m_yKnockback < -(Utils.calculateVelocity(20)))))
                    {
                        unnattachFromGround();
                    };
                    if (((_arg_1.ReversableAngle) && (_arg_1.Direction >= 0)))
                    {
                        _local_8 = ((_arg_1.Direction > 90) && (_arg_1.Direction < 270));
                        if (((m_sprite.x < _arg_1.XLoc) || (m_sprite.x > _arg_1.XLoc)))
                        {
                            m_xKnockback = ((m_sprite.x > _arg_1.XLoc) ? Utils.fastAbs(m_xKnockback) : -(Utils.fastAbs(m_xKnockback)));
                            if (_local_8)
                            {
                                m_xKnockback = (m_xKnockback * -1);
                            };
                        };
                        _local_23 = Utils.getAngleBetween(new Point(), new Point(m_xKnockback, m_yKnockback));
                    };
                    if (this.m_transformedSpecial)
                    {
                        _local_11 = (_local_11 / 2);
                    };
                    if (this.m_sizeStatus != 0)
                    {
                        _local_11 = (_local_11 * ((this.m_sizeStatus == 1) ? 0.75 : 1.5));
                    };
                    this.m_forceTumbleFall = _arg_1.ForceTumbleFall;
                };
                if ((((((((((!(this.isInvincible())) && (!(isIntangible()))) && (_arg_1.Stun > 0)) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.PITFALL)))) && (!(this.inState(CState.SLEEP)))) && (!(this.inState(CState.EGG)))))
                {
                    this.setState(CState.STUNNED);
                    this.m_stunCancelTimer.reset();
                    this.m_stunTimer = _arg_1.Stun;
                    this.resetRotation();
                    this.killAllSpeeds(false, true);
                    Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                };
                if ((((((((((!(this.isInvincible())) && (!(isIntangible()))) && (_arg_1.Dizzy > 0)) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.PITFALL)))) && (!(this.inState(CState.SLEEP)))) && (!(this.inState(CState.EGG)))))
                {
                    this.setState(CState.DIZZY);
                    this.m_stunCancelTimer.reset();
                    this.m_dizzyTimer = (_arg_1.Dizzy + (0.6 * this.m_damage));
                    this.resetRotation();
                    Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                    this.killAllSpeeds(false, true);
                    this.m_dizzyShield = false;
                };
                if ((((((((((!(this.isInvincible())) && (!(isIntangible()))) && (_arg_1.Freeze > 0)) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.PITFALL)))) && (!(this.inState(CState.SLEEP)))) && (!(this.inState(CState.EGG)))))
                {
                    this.freeze(true, _arg_1.Freeze);
                };
                if ((((((((_arg_1.Sleep > 0) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.PITFALL)))) && (!(this.inState(CState.SLEEP)))) && (!(this.inState(CState.EGG)))))
                {
                    this.setState(CState.SLEEP);
                    this.m_stunCancelTimer.reset();
                    this.m_sleepingTimer = (_arg_1.Sleep + (2 * this.m_damage));
                    this.resetRotation();
                    this.killAllSpeeds(false, true);
                    Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                };
                if ((((((((((!(this.isInvincible())) && (!(isIntangible()))) && (_arg_1.Egg > 0)) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.PITFALL)))) && (!(this.inState(CState.SLEEP)))) && (!(this.inState(CState.EGG)))))
                {
                    this.egg(true);
                };
                if (((((((((((!(this.isInvincible())) && (!(isIntangible()))) && (_arg_1.Pitfall > 0)) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.PITFALL)))) && (!(this.inState(CState.SLEEP)))) && (!(this.inState(CState.EGG)))) && (m_collision.ground)))
                {
                    if (((this.inState(CState.CAUGHT)) && (this.m_grabberID > 0)))
                    {
                        STAGEDATA.getPlayer(this.m_grabberID).setState(CState.IDLE);
                    };
                    this.setState(CState.PITFALL);
                    this.m_pitfallTimer = (_arg_1.Pitfall + (0.6 * this.m_damage));
                    this.resetRotation();
                    Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                    this.killAllSpeeds();
                    this.stopActionShot();
                    this.toggleEffect(this.m_pitfallEffect, true);
                };
                if ((((!(this.isInvincible())) && (!(isIntangible()))) && (_arg_1.Poison > 0)))
                {
                    this.m_poisonIncrease = _arg_1.Poison;
                    this.m_poisonIncreaseInterval.MaxTime = _arg_1.PoisonInterval;
                    this.m_poisonIncreaseTime.MaxTime = _arg_1.PoisonLength;
                    this.m_poisonTintTimer.reset();
                    this.toggleEffect(this.m_poisonEffect, true);
                    this.m_poisonEffect.x = m_sprite.x;
                    this.m_poisonEffect.y = m_sprite.y;
                };
                if (((!(_arg_1.EffectID == null)) && (!(_arg_1.EffectID == null))))
                {
                    _local_32 = attachHurtEffect(((this.isInvincible()) ? "effect_cancel" : _arg_1.EffectID), _arg_2, {
                        "scaleX":((0.25 + (0.75 * Math.min((_arg_1.Damage / 16), 1))) * _local_20),
                        "scaleY":((0.25 + (0.75 * Math.min((_arg_1.Damage / 16), 1))) * _local_20)
                    });
                    if (_local_32)
                    {
                        _local_32.rotation = ((_arg_1.IsForward) ? (180 - _local_23) : -(_local_23));
                    };
                };
                if (_local_15)
                {
                    _arg_1.HasEffect = _local_18;
                    _arg_1.Power = _local_16;
                    _arg_1.KBConstant = _local_17;
                };
                if ((((this.inState(CState.CAUGHT)) && (HasStance)) && (this.m_grabberID == _arg_1.PlayerID)))
                {
                    m_sprite.stance.gotoAndStop(1);
                    this.stancePlayFrame(("hurt" + (Math.round((Utils.random() * (this.m_characterStats.HurtFrames - 1))) + 1)));
                };
                _local_5 = false;
                if ((((!((_local_13 == 0) && (_local_14 == 0))) && (_arg_1.StackKnockback)) && (_local_31)))
                {
                    _local_5 = true;
                    stackKnockback(_local_11, _local_23, _local_13, _local_14);
                };
                resetKnockbackDecay();
                if (((MenuController.debugConsole) && (MenuController.debugConsole.KnockbackCapture)))
                {
                    MenuController.debugConsole.writeTextData((((((((((_arg_1.AttackBoxName + ": { xKnockbackVelocity: ") + m_xKnockback) + ", yKnockbackVelocity: ") + m_yKnockback) + ", angle: ") + Utils.getAngleBetween(new Point(), new Point(m_xKnockback, m_yKnockback))) + ", stacked: ") + _local_5) + " }"));
                };
                return (true);
            };
            if (_local_15)
            {
                _arg_1.HasEffect = _local_18;
                _arg_1.Power = _local_16;
                _arg_1.KBConstant = _local_17;
            };
            return (false);
        }

        public function takeShieldDamage(_arg_1:AttackDamage, _arg_2:HitBoxSprite=null):Boolean
        {
            var _local_3:Number;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Boolean;
            var _local_9:Number;
            var _local_10:Number;
            if (m_intangible)
            {
                return (false);
            };
            _local_3 = ((_arg_1.Damage <= 0) ? 0 : Utils.calculateChargeDamage(_arg_1));
            var _local_4:Number = Utils.calculateVelocity(Utils.calculateKnockback(_arg_1.KBConstant, _arg_1.Power, _arg_1.WeightKB, _local_3, this.m_damage, m_weight1, false, this.m_damageRatio));
            _local_5 = 0;
            _local_6 = 0;
            if (((((((((((!(this.m_standby)) && (!(_arg_1 == null))) && (!(this.Dodging))) && (this.validateBypass(_arg_1))) && (validateOnlyAffects(_arg_1))) && (this.inState(CState.SHIELDING))) && (this.m_shieldTimer >= this.m_shieldStartFrame)) && (!(attackIDArrayContains(_arg_1.AttackID)))) && (!((!(_arg_1.HurtSelfShield)) && (_arg_1.PlayerID == m_player_id)))) && (!(((((!(_arg_1.HurtSelfShield)) && (!(_arg_1.AttackID == -1))) && (m_team_id == _arg_1.TeamID)) && (m_team_id > 0)) && (!(this.m_teamDamage))))))
            {
                this.m_hitsReceivedCounter++;
                if ((!(m_attack.DisableLastHitUpdate)))
                {
                    m_lastHitID = _arg_1.PlayerID;
                };
                if (_arg_1.AttackID != -1)
                {
                    stackAttackID(_arg_1.AttackID);
                };
                _local_5 = Utils.calculateChargeDamage(_arg_1, _arg_1.ShieldDamage);
                _local_5 = (_local_5 * _arg_1.StaleMultiplier);
                if (this.m_transformedSpecial)
                {
                    _local_5 = (_local_5 / 2);
                };
                if (((_local_5 <= 0) && (_arg_1.Damage > 0)))
                {
                    _local_5 = 1;
                };
                this.m_shieldPower = (this.m_shieldPower - ((_local_5 * 0.7) * 2));
                if (((_arg_1.HasEffect) || ((!(_arg_1.HasEffect)) && (_arg_1.Owner as Projectile))))
                {
                    if (this.m_shieldStartTimer < 1)
                    {
                        this.playGlobalSound("shieldhit_strong");
                        CAM.lightFlash(false);
                    }
                    else
                    {
                        this.playGlobalSound(_arg_1.ShieldSound);
                    };
                };
                if ((!(this.PerfectShield)))
                {
                    _local_6 = Utils.calculateAttackDirection(_arg_1, this, _arg_1.Owner);
                    _local_7 = Math.min(20, Utils.calculateVelocity(Utils.calculateKnockback(_arg_1.KBConstant, _arg_1.Power, _arg_1.WeightKB, _local_3, this.m_damage, m_weight1, false, this.m_damageRatio)));
                    m_xKnockback = Utils.calculateXSpeed((_local_7 * 0.35), _local_6);
                    m_yKnockback = 0;
                    if (((_arg_1.ReversableAngle) && (_arg_1.Direction >= 0)))
                    {
                        _local_8 = ((_arg_1.Direction > 90) && (_arg_1.Direction < 270));
                        if (((m_sprite.x < _arg_1.XLoc) || (m_sprite.x > _arg_1.XLoc)))
                        {
                            m_xKnockback = ((m_sprite.x > _arg_1.XLoc) ? Utils.fastAbs(m_xKnockback) : -(Utils.fastAbs(m_xKnockback)));
                            if (_local_8)
                            {
                                m_xKnockback = (m_xKnockback * -1);
                            };
                        };
                        _local_6 = Utils.getAngleBetween(new Point(), new Point(m_xKnockback, m_yKnockback));
                    };
                    resetKnockbackDecay();
                };
                if (_arg_1.HasEffect)
                {
                    attachEffect(((this.m_characterStats.CustomShield) ? "effect_cancel" : (this.m_shieldType + "_hit")), {
                        "x":m_sprite.x,
                        "y":(m_sprite.y - (((m_height / 3) * m_sizeRatio) * this.m_characterStats.ShieldScale)),
                        "absolute":true,
                        "scaleX":((this.PerfectShield) ? 1 : (0.5 * this.m_characterStats.ShieldScale)),
                        "scaleY":((this.PerfectShield) ? 1 : (0.5 * this.m_characterStats.ShieldScale))
                    });
                };
                if ((_arg_1.Owner as Item))
                {
                    Item(_arg_1.Owner).activate(null, Character);
                    if (((!(Item(_arg_1.Owner) == null)) && (!(Item(_arg_1.Owner).Dead))))
                    {
                        if (((this.PerfectShield) && (Item(_arg_1.Owner).CanBeReversed)))
                        {
                            Item(_arg_1.Owner).reverse(m_player_id, m_team_id, (!(Item(_arg_1.Owner).FacingForward)));
                        };
                        Item(_arg_1.Owner).checkBreak();
                        if (Item(_arg_1.Owner).Thrown)
                        {
                            Item(_arg_1.Owner).HasHitPlayer = true;
                        };
                    };
                };
                if ((_arg_1.Owner as Projectile))
                {
                    if ((!(Projectile(_arg_1.Owner).Dead)))
                    {
                        if (this.PerfectShield)
                        {
                            Projectile(_arg_1.Owner).reverse(m_player_id, m_team_id, (!(Projectile(_arg_1.Owner).FacingForward)));
                        };
                    };
                };
                this.m_smashDISelf = false;
                if (_arg_1.HasEffect)
                {
                    _local_9 = Utils.calculateHitStun(_arg_1.HitStun, _local_5, _arg_1.Shock, false);
                    _local_10 = Utils.calculateSelfHitStun(_arg_1.SelfHitStun, _local_5);
                    if ((!(this.PerfectShield)))
                    {
                        this.m_shieldDelayTimer.reset();
                        this.m_shieldDelayTimer.MaxTime = Math.floor(((Math.round(((Utils.calculateChargeDamage(_arg_1) + 4.45) / 2.235)) * _arg_1.ShieldStunMultiplier) / 2));
                        startActionShot(_local_9);
                    };
                    if ((((_arg_1.PlayerID > 0) && (!(_arg_1.Owner as Projectile))) && (!(_arg_1.Owner as Item))))
                    {
                        STAGEDATA.getPlayer(_arg_1.PlayerID).SmashDISelf = true;
                        STAGEDATA.getPlayer(_arg_1.PlayerID).startActionShot(_local_10);
                    };
                };
                m_eventManager.dispatchEvent(new SSF2Event(((this.PerfectShield) ? SSF2Event.CHAR_POWER_SHIELD_HIT : SSF2Event.CHAR_SHIELD_HIT), {
                    "caller":this,
                    "opponent":_arg_1.Owner,
                    "attackBoxData":_arg_1.exportAttackDamageData()
                }));
                return (true);
            };
            return (false);
        }

        private function performGroundTech():void
        {
            this.killAllSpeeds(true, false);
            m_xKnockback = (m_xKnockback * 0.5);
            m_yKnockback = 0;
            resetKnockbackDecay();
            this.m_canTech = false;
            this.m_techReady = false;
            this.m_techTimer.reset();
            this.m_techDelay.reset();
            this.m_hitLag = -1;
            this.resetRotation();
            if (this.m_right != this.m_left)
            {
                this.initTechRoll(this.m_right);
                this.setState(CState.TECH_ROLL);
            }
            else
            {
                this.setState(CState.TECH_GROUND);
            };
            this.m_dodgeTimer = 0;
            this.m_smashDISelf = true;
            startActionShot(3);
            this.m_smashDISelf = true;
        }

        private function performWallTech(_arg_1:Boolean):void
        {
            this.setState(CState.IDLE);
            if (_arg_1)
            {
                this.m_flyingUp = (!(this.m_flyingUp));
            }
            else
            {
                this.m_flyingRight = (!(this.m_flyingRight));
            };
            this.killAllSpeeds();
            this.m_canTech = false;
            this.m_techReady = false;
            this.m_techTimer.reset();
            this.m_techDelay.reset();
            this.resetRotation();
            this.m_dodgeLetGo = false;
            this.m_shieldLetGo = false;
            if (_arg_1)
            {
                this.techEffect(0, -(m_height));
            }
            else
            {
                this.techEffect(((m_facingForward) ? (-(m_width) / 2) : (m_width / 2)), (m_height / 2));
            };
            startActionShot(3);
        }

        private function techEffect(_arg_1:Number=0, _arg_2:Number=0):void
        {
            var _local_3:MovieClip;
            _local_3 = STAGEDATA.attachEffectOverlay("tech_effect");
            _local_3.scaleX = 0.5;
            _local_3.scaleY = 0.5;
            _local_3.x = (OverlayX + (_arg_1 * m_sizeRatio));
            _local_3.y = (OverlayY + (_arg_2 * m_sizeRatio));
        }

        override protected function m_groundCollisionTest():void
        {
            var _local_1:Boolean;
            var _local_2:Boolean;
            var _local_3:Boolean;
            _local_1 = false;
            _local_2 = m_collision.ground;
            if (((((((((!(isHitStunOrParalysis())) && (!(this.inState(CState.LEDGE_HANG)))) && (!(this.inState(CState.CAUGHT)))) && (!(this.inState(CState.BARREL)))) && (!(this.inState(CState.REVIVAL)))) && (!(this.inState(CState.STAR_KO)))) && (!(this.inState(CState.SCREEN_KO)))) && (!((this.m_usingSpecialAttack) && ((this.m_characterStats.SpecialType == 4) || (this.m_characterStats.SpecialType == 5))))))
            {
                if (((((this.inState(CState.FLYING)) && (m_collision.ground)) && (this.netYSpeed() >= 0)) && (!(isHitStunOrParalysis()))))
                {
                    this.groundBounceCheck();
                }
                else
                {
                    if ((((((this.inState(CState.INJURED)) && (m_collision.ground)) && (this.netYSpeed() >= 0)) && (this.m_hitLagStunTimer.IsComplete)) && (!(isHitStunOrParalysis()))))
                    {
                        this.setState(CState.IDLE);
                        m_yKnockback = 0;
                        this.resetRotation();
                    };
                };
                if (((m_collision.ground) && (!(this.netYSpeed() < 0))))
                {
                    attachToGround();
                }
                else
                {
                    if ((!(m_collision.ground)))
                    {
                        pushOutOfGround();
                    };
                };
                _local_3 = (!((m_currentPlatform = this.testGroundWithCoord(m_sprite.x, (m_sprite.y + 1))) == null));
                if (_local_3)
                {
                    attachToGround();
                };
                if (((((!(m_collision.ground)) && (_local_3)) && (this.netYSpeed() < 0)) || (this.inState(CState.LEDGE_HANG))))
                {
                    _local_3 = false;
                    m_currentPlatform = null;
                    m_collision.ground = false;
                };
                if ((((!(m_collision.ground)) && (_local_3)) && (!(this.inState(CState.KIRBY_STAR)))))
                {
                    if (this.inState(CState.ATTACKING))
                    {
                        m_attack.HasLanded = true;
                    };
                    _local_1 = true;
                    attachToGround();
                    if ((((!(this.inState(CState.LEDGE_ROLL))) && (!(this.inState(CState.LEDGE_CLIMB)))) && (!((this.inState(CState.ATTACKING)) && (m_attack.Frame == "ledge_attack")))))
                    {
                        this.attachLandEffect();
                    };
                    this.updateItemHolding();
                    if ((((((((((((((((((!(this.m_left)) && (!(this.m_right))) && (!(this.inState(CState.ATTACKING)))) && (!(this.inState(CState.INJURED)))) && (!(this.inState(CState.FLYING)))) && (!(this.inState(CState.CAUGHT)))) && (!(this.inState(CState.BARREL)))) && (!(this.inState(CState.FROZEN)))) && (!(this.inState(CState.STUNNED)))) && (!(this.inState(CState.DIZZY)))) && (!(this.inState(CState.CRASH_GETUP)))) && (!(this.inState(CState.CRASH_LAND)))) && (!(this.inState(CState.TUMBLE_FALL)))) && (!(this.inState(CState.EGG)))) && (!(this.inState(CState.KIRBY_STAR)))) && (!(this.inState(CState.LEDGE_ROLL)))) && (!((STAGEDATA.MeleeAirDodge) && (this.inState(CState.AIR_DODGE))))))
                    {
                        m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.GROUND_LAND, {"caller":this}));
                    };
                    if (this.jumpIsPressed())
                    {
                        this.m_tapJumpLetGo = false;
                        this.m_jumpLetGo = false;
                        this.m_jumpFullyReleased = false;
                    };
                    this.groundBounceCheck();
                    if ((!(this.inState(CState.FLYING))))
                    {
                        m_ySpeed = 0;
                    };
                    m_yKnockback = 0;
                };
                if (((m_collision.ground) && (!(_local_3))))
                {
                    if ((!(this.inState(CState.ATTACKING))))
                    {
                        if (m_xSpeed > this.m_characterStats.MaxJumpSpeed)
                        {
                            m_xSpeed = this.m_characterStats.MaxJumpSpeed;
                        }
                        else
                        {
                            if (m_xSpeed < -(this.m_characterStats.MaxJumpSpeed))
                            {
                                m_xSpeed = -(this.m_characterStats.MaxJumpSpeed);
                            };
                        };
                    };
                    if (this.inState(CState.PITFALL))
                    {
                        this.pitFallRelease();
                    };
                };
                m_collision.ground = _local_3;
                if (m_collision.ground)
                {
                    this.m_glideReady = true;
                };
                this.testJumpCount();
                if (m_collision.ground)
                {
                    if ((!(this.testGroundWithCoord(m_sprite.x, (m_sprite.y + 1)))))
                    {
                        attachToGround();
                    };
                };
                if ((!(this.m_human)))
                {
                    this.updateWarningCollision();
                };
                if (m_collision.ground)
                {
                    if (this.inState(CState.DISABLED))
                    {
                        setBrightness(0);
                        this.setState(CState.LAND);
                    };
                };
                if (((m_collision.ground) && (this.inState(CState.AIR_DODGE))))
                {
                    this.turnOffInvincibility();
                };
                if (((((_local_2) && (!(m_collision.ground))) && (((this.inState(CState.IDLE)) || (this.inState(CState.CRASH_GETUP))) || (this.inState(CState.CRASH_LAND)))) && (this.inKnockback())))
                {
                    if (this.inState(CState.IDLE))
                    {
                        this.setState(CState.JUMP_FALLING);
                    }
                    else
                    {
                        this.setState(CState.TUMBLE_FALL);
                    };
                };
                if ((((_local_2) && (!(m_collision.ground))) && (this.inState(CState.LAND))))
                {
                    this.setState(CState.JUMP_FALLING);
                };
                if (((!(m_collision.ground)) && (this.inState(CState.SHIELDING))))
                {
                    this.m_deactivateShield();
                    this.setState(CState.TUMBLE_FALL);
                };
                if (((((((((((((this.inState(CState.IDLE)) || (this.inState(CState.LAND))) || (this.inState(CState.WALK))) || (this.inState(CState.JUMP_RISING))) || (this.inState(CState.JUMP_MIDAIR_RISING))) || (this.inState(CState.JUMP_FALLING))) || (this.inState(CState.RUN))) || (this.inState(CState.DASH))) || (this.inState(CState.TURN))) || (this.inState(CState.SKID))) || (this.inState(CState.HOVER))) || (this.inState(CState.CROUCH))))
                {
                    this.checkGroundStateChange();
                };
            };
            if (((((!(m_collision.ground)) && (this.inState(CState.GRABBING))) && (!(this.inState(CState.ATTACKING)))) && (!(this.currentStanceFrameIs("tether")))))
            {
                this.grabReleaseOpponent();
                this.setState(CState.JUMP_FALLING);
            };
            if (((_local_2) && (!(m_collision.ground))))
            {
                m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.GROUND_LEAVE, {"caller":this}));
            };
            if (_local_1)
            {
                m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.GROUND_TOUCH, {"caller":this}));
            };
        }

        public function touchingLowerWarningBounds(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:int;
            _local_3 = 0;
            _local_3 = 0;
            while (_local_3 < this.m_warningBounds_lower[0].length)
            {
                if (this.m_warningBounds_lower[0][_local_3].hitTestPoint(_arg_1, _arg_2, true))
                {
                    return (true);
                };
                _local_3++;
            };
            _local_3 = 0;
            while (_local_3 < this.m_warningBounds_lower[1].length)
            {
                if (this.m_warningBounds_lower[1][_local_3].hitTestPoint(_arg_1, _arg_2, true))
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        public function touchingUpperWarningBounds(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:int;
            _local_3 = 0;
            _local_3 = 0;
            while (_local_3 < this.m_warningBounds_upper[0].length)
            {
                if (this.m_warningBounds_upper[0][_local_3].hitTestPoint(_arg_1, _arg_2, true))
                {
                    return (true);
                };
                _local_3++;
            };
            _local_3 = 0;
            while (_local_3 < this.m_warningBounds_upper[1].length)
            {
                if (this.m_warningBounds_upper[1][_local_3].hitTestPoint(_arg_1, _arg_2, true))
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        public function updateWarningCollision():void
        {
            var _local_1:Boolean;
            var _local_2:Boolean;
            var _local_3:int;
            _local_1 = false;
            _local_2 = false;
            _local_3 = 0;
            _local_3 = 0;
            while (((_local_3 < this.m_warningBounds_lower[0].length) && (!(_local_1))))
            {
                if (this.m_warningBounds_lower[0][_local_3].hitTestPoint(GlobalX, GlobalY, true))
                {
                    _local_1 = true;
                };
                _local_3++;
            };
            _local_3 = 0;
            while (((_local_3 < this.m_warningBounds_lower[1].length) && (!(_local_2))))
            {
                if (this.m_warningBounds_lower[1][_local_3].hitTestPoint(GlobalX, GlobalY, true))
                {
                    _local_2 = true;
                };
                _local_3++;
            };
            m_collision.lbound_lower = _local_1;
            m_collision.rbound_lower = _local_2;
            _local_1 = false;
            _local_2 = false;
            _local_3 = 0;
            while (((_local_3 < this.m_warningBounds_upper[0].length) && (!(_local_1))))
            {
                if (this.m_warningBounds_upper[0][_local_3].hitTestPoint(GlobalX, GlobalY, true))
                {
                    _local_1 = true;
                };
                _local_3++;
            };
            _local_3 = 0;
            while (((_local_3 < this.m_warningBounds_upper[1].length) && (!(_local_2))))
            {
                if (this.m_warningBounds_upper[1][_local_3].hitTestPoint(GlobalX, GlobalY, true))
                {
                    _local_2 = true;
                };
                _local_3++;
            };
            m_collision.lbound_upper = _local_1;
            m_collision.rbound_upper = _local_2;
        }

        public function calculateAICollision(_arg_1:Number, _arg_2:Number):void
        {
            m_collision.leftSide = ((((((_arg_1 < 0) && (!(this.inState(CState.LEDGE_HANG)))) && (m_collision.ground)) && (!(this.inState(CState.FLYING)))) && (!(this.inState(CState.INJURED)))) && (testTerrainWithCoord((((m_sprite.x + _arg_1) - 9) - (m_width / 2)), ((m_sprite.y + _arg_2) - 35))));
            m_collision.rightSide = ((((((_arg_1 > 0) && (!(this.inState(CState.LEDGE_HANG)))) && (m_collision.ground)) && (!(this.inState(CState.FLYING)))) && (!(this.inState(CState.INJURED)))) && (testTerrainWithCoord((((m_sprite.x + _arg_1) + 9) + (m_height / 2)), ((m_sprite.y + _arg_2) - 35))));
        }

        override public function m_attemptToMove(_arg_1:Number, _arg_2:Number):void
        {
            var _local_3:int;
            var _local_4:Point;
            var _local_5:Platform;
            var _local_6:Boolean;
            var _local_7:Object;
            var _local_8:Boolean;
            var _local_9:AttackDamage;
            var _local_10:Boolean;
            var _local_11:Boolean;
            var _local_12:Boolean;
            var _local_13:int;
            var _local_14:Boolean;
            if (((this.inState(CState.STAR_KO)) || (this.inState(CState.SCREEN_KO))))
            {
                return;
            };
            if (this.inState(CState.PITFALL))
            {
                _arg_1 = 0;
            };
            if ((!((_arg_1 == 0) && (_arg_2 == 0))))
            {
                _local_3 = 0;
                m_collision.leftSide = ((((((_arg_1 < 0) && (!(this.inState(CState.LEDGE_HANG)))) && (m_collision.ground)) && (!(this.inState(CState.FLYING)))) && (!(this.inState(CState.INJURED)))) && (testTerrainWithCoord(((m_sprite.x + _arg_1) - 11), ((m_sprite.y + _arg_2) - 35))));
                m_collision.rightSide = ((((((_arg_1 > 0) && (!(this.inState(CState.LEDGE_HANG)))) && (m_collision.ground)) && (!(this.inState(CState.FLYING)))) && (!(this.inState(CState.INJURED)))) && (testTerrainWithCoord(((m_sprite.x + _arg_1) + 11), ((m_sprite.y + _arg_2) - 35))));
                if (((((!(isHitStunOrParalysis())) && (!(this.inState(CState.LEDGE_ROLL)))) && (!(this.inState(CState.LEDGE_HANG)))) && (!(((m_collision.ground) && (!(this.inState(CState.FLYING)))) && (!(this.inState(CState.INJURED)))))))
                {
                    _local_4 = Location.clone();
                    _local_5 = moveSprite(_arg_1, _arg_2);
                    _local_6 = (!(_local_5 == null));
                    _local_7 = getCollisionQuadrants(Utils.getAngleBetween(new Point(_local_4.x, _local_4.y), new Point(m_sprite.x, m_sprite.y)));
                    if ((((_local_6) && (!(_local_7.bottom))) && (!((m_sprite.x == _local_4.x) && (m_sprite.y == _local_4.y)))))
                    {
                        m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HIT_WALL, {
                            "caller":this,
                            "left":_local_7.left,
                            "right":_local_7.right,
                            "top":_local_7.top
                        }));
                    };
                    if ((((_local_5) && (this.inState(CState.FLYING))) && (_local_5.SpriteOwner is Enemy)))
                    {
                        _local_9 = new AttackDamage(m_player_id, this);
                        _local_9.Damage = Utils.getDistance(new Point(), new Point(m_xKnockback, m_yKnockback));
                        Enemy(_local_5.SpriteOwner).takeDamage(_local_9);
                        if (_local_5.fallthrough)
                        {
                            _local_5 = null;
                            _local_6 = false;
                        };
                    };
                    if ((((m_collision.rightSide) && (_arg_1 > 0)) || ((m_collision.leftSide) && (_arg_1 < 0))))
                    {
                        m_sprite.x = _local_4.x;
                    };
                    this.forceInBounds();
                    _local_8 = (this.netYSpeed() < 0);
                    if (((_local_6) && (_arg_2 >= 0)))
                    {
                        this.m_groundCollisionTest();
                    };
                    _local_8 = (!(_local_8 == (this.netYSpeed() < 0)));
                    if ((((((_local_6) && (!(m_collision.ground))) && (_arg_2 > 0)) && (this.inState(CState.FLYING))) && (this.netYSpeed() >= 0)))
                    {
                        _local_10 = (!((m_currentPlatform = this.testGroundWithCoord(m_sprite.x, (m_sprite.y + 1))) == null));
                        this.groundBounceCheck();
                    };
                    this.repositionGrabbedCharacter();
                    if ((((((((_local_6) && ((this.inState(CState.FLYING)) || (this.isRocketing()))) && (Utils.fastAbs(_arg_1) > 3)) && (STAGEDATA.Terrains.indexOf(_local_5) >= 0)) && (this.m_ricochetX.IsComplete)) && (this.m_ricochetY.IsComplete)) && (!(this.m_ricochetCount.IsComplete))))
                    {
                        if (((((this.m_techReady) && (!(isHitStunOrParalysis()))) && (this.m_canWallTech)) && (!(this.isRocketing()))))
                        {
                            this.performWallTech(false);
                        }
                        else
                        {
                            if (this.m_ricochetTimer.IsComplete)
                            {
                                this.m_ricochetX.reset();
                                this.m_ricochetCount.tick();
                                _local_11 = false;
                                if (((testTerrainWithCoord(m_sprite.x, (m_sprite.y - m_height))) && (((m_xKnockback < 0) && (testTerrainWithCoord((m_sprite.x - (m_width / 2)), (m_sprite.y - m_height)))) || ((m_xKnockback > 0) && (testTerrainWithCoord((m_sprite.x + (m_width / 2)), (m_sprite.y - m_height)))))))
                                {
                                    this.m_ricochetY.reset();
                                    _local_11 = true;
                                };
                                this.attachWallBounceEffect((m_xKnockback > 0), _local_11);
                                startActionShot(2);
                                this.m_hitLag = this.calculateHitLag(Utils.calculateKnockbackFromVelocity(Utils.getDistance(new Point(), new Point(m_xKnockback, m_yKnockback))), -0.9);
                            };
                        };
                    };
                    if ((((((((((((_local_6) && ((this.inState(CState.FLYING)) || (this.isRocketing()))) && (Utils.fastAbs(_arg_2) > 2)) && (STAGEDATA.Terrains.indexOf(_local_5) >= 0)) && (!(m_collision.ground))) && (_arg_2 < 0)) && (this.netYSpeed() < 0)) && (!(_local_8))) && (this.m_ricochetX.IsComplete)) && (this.m_ricochetY.IsComplete)) && (!(this.m_ricochetCount.IsComplete))))
                    {
                        if (((((this.m_techReady) && (!(isHitStunOrParalysis()))) && (this.m_canWallTech)) && (!(this.isRocketing()))))
                        {
                            this.performWallTech(true);
                        }
                        else
                        {
                            if (this.m_ricochetTimer.IsComplete)
                            {
                                this.m_hasArced = false;
                                this.m_ricochetY.reset();
                                this.m_ricochetCount.tick();
                                _local_12 = false;
                                if (((testTerrainWithCoord(m_sprite.x, (m_sprite.y - m_height))) && (((m_xKnockback > 0) && (testTerrainWithCoord((m_sprite.x + (m_width / 2)), (m_sprite.y - m_height)))) || ((m_xKnockback < 0) && (testTerrainWithCoord((m_sprite.x - (m_width / 2)), (m_sprite.y - m_height)))))))
                                {
                                    this.m_ricochetX.reset();
                                    _local_12 = true;
                                };
                                this.attachCeilingBounceEffect((m_xKnockback > 0), _local_12);
                                startActionShot(2);
                                this.m_hitLag = this.calculateHitLag(Utils.calculateKnockbackFromVelocity(Utils.getDistance(new Point(), new Point(m_xKnockback, m_yKnockback))), -0.9);
                            };
                        };
                    };
                }
                else
                {
                    if ((!(isHitStunOrParalysis())))
                    {
                        _local_13 = (((Utils.fastAbs(_arg_1) >= 10) || (Utils.fastAbs(_arg_2) >= 10)) ? 10 : 5);
                        _local_14 = false;
                        _arg_1 = (_arg_1 / _local_13);
                        _arg_2 = (_arg_2 / _local_13);
                        _local_3 = 0;
                        while (_local_3 < _local_13)
                        {
                            m_collision.leftSide = ((((((_arg_1 < 0) && (!(this.inState(CState.LEDGE_HANG)))) && (m_collision.ground)) && (!(this.inState(CState.FLYING)))) && (!(this.inState(CState.INJURED)))) && (testTerrainWithCoord(((m_sprite.x + _arg_1) - 11), ((m_sprite.y + _arg_2) - 25))));
                            m_collision.rightSide = ((((((_arg_1 > 0) && (!(this.inState(CState.LEDGE_HANG)))) && (m_collision.ground)) && (!(this.inState(CState.FLYING)))) && (!(this.inState(CState.INJURED)))) && (testTerrainWithCoord(((m_sprite.x + _arg_1) + 11), ((m_sprite.y + _arg_2) - 25))));
                            if ((((!(_local_14)) && (!(_arg_1 == 0))) && ((m_collision.rightSide) || (m_collision.leftSide))))
                            {
                                _local_14 = true;
                                m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.HIT_WALL, {
                                    "caller":this,
                                    "left":m_collision.leftSide,
                                    "right":m_collision.rightSide,
                                    "top":false
                                }));
                            };
                            if (((_arg_2 < 0) && (!(testTerrainWithCoord(m_sprite.x, (m_sprite.y + _arg_2))))))
                            {
                                m_sprite.y = (m_sprite.y + _arg_2);
                            };
                            m_sprite.x = (m_sprite.x + ((!(((m_collision.rightSide) && (_arg_1 > 0)) || ((m_collision.leftSide) && (_arg_1 < 0)))) ? _arg_1 : 0));
                            if (((_arg_2 > 0) && (!(testTerrainWithCoord(m_sprite.x, (m_sprite.y + _arg_2))))))
                            {
                                m_sprite.y = (m_sprite.y + _arg_2);
                            };
                            this.forceInBounds();
                            if (((!(m_collision.leftSide)) && (!(m_collision.rightSide))))
                            {
                                attachToGround();
                            };
                            this.repositionGrabbedCharacter();
                            if ((((Utils.fastAbs(_arg_1) > 10) || (Utils.fastAbs(_arg_2) > 10)) && (checkExtraHitTests(0, 0))))
                            {
                                return;
                            };
                            _local_3++;
                        };
                    };
                };
                this.repositionEffects();
            };
        }

        private function repositionEffects():void
        {
            if (((!(this.m_chargeGlowHolderMC == null)) && (!(this.inState(CState.LEDGE_HANG)))))
            {
                this.m_chargeGlowHolderMC.x = m_sprite.x;
                this.m_chargeGlowHolderMC.y = m_sprite.y;
                if ((((m_sprite.parent) && (this.m_chargeGlowHolderMC.parent)) && (this.m_chargeGlowHolderMC.parent.getChildIndex(this.m_chargeGlowHolderMC) < m_sprite.parent.getChildIndex(m_sprite))))
                {
                    Utils.swapDepths(m_sprite, this.m_chargeGlowHolderMC);
                };
            };
            if (((this.m_item2) && (!(this.inState(CState.LEDGE_HANG)))))
            {
                this.m_fsGlowHolderMC.x = m_sprite.x;
                this.m_fsGlowHolderMC.y = m_sprite.y;
                if ((((m_sprite.parent) && (this.m_fsGlowHolderMC.parent)) && (this.m_fsGlowHolderMC.parent.getChildIndex(this.m_fsGlowHolderMC) < m_sprite.parent.getChildIndex(m_sprite))))
                {
                    Utils.swapDepths(m_sprite, this.m_fsGlowHolderMC);
                };
            };
        }

        private function forceInBounds():void
        {
        }

        override public function testGroundWithCoord(_arg_1:Number, _arg_2:Number):Platform
        {
            var _local_3:int;
            var _local_4:Platform;
            _local_3 = 0;
            _local_3 = 0;
            while (((_local_3 < m_terrains.length) && (((!(m_terrains[_local_3].hitTestPoint(_arg_1, _arg_2, true))) || (m_terrains[_local_3].fallthrough == true)) || (m_selfPlatform == m_terrains[_local_3]))))
            {
                _local_3++;
            };
            if (((_local_3 < m_terrains.length) && (m_terrains[_local_3].hitTestPoint(_arg_1, _arg_2, true))))
            {
                _local_4 = this.testPlatformWithCoord(_arg_1, _arg_2);
                if (_local_4)
                {
                    return (_local_4);
                };
                return (m_terrains[_local_3]);
            };
            {
                _local_3 = 0;
                while (((_local_3 < m_platforms.length) && (((!(m_platforms[_local_3].hitTestPoint(_arg_1, _arg_2, true))) || (m_platforms[_local_3].fallthrough == true)) || (m_selfPlatform == m_platforms[_local_3]))))
                {
                    _local_3++;
                };
                if (((((((((_local_3 < m_platforms.length) && (m_platforms[_local_3].hitTestPoint(_arg_1, _arg_2, true))) && (this.m_fallthroughTimer.IsComplete)) && (!(this.m_fallthrough))) && (this.netYSpeed() >= 0)) && (!((this.inState(CState.ATTACKING)) && (m_attack.ForceFallThrough)))) && ((!(this.m_down)) || (!(((((this.m_down) && (!((STAGEDATA.MeleeAirDodge) && (this.inState(CState.AIR_DODGE))))) && (!(m_collision.ground))) && (!(this.inState(CState.ATTACKING)))) && (!(m_platforms[_local_3].noDropThrough == true)))))) && (!((((this.inState(CState.ATTACKING)) && (m_attack.Rocket)) && (this.m_rocketAngle > 0)) && (this.m_rocketAngle < 180)))))
                {
                    return (m_platforms[_local_3]);
                };
                return (null);
            };
            return (null);
        }

        override public function testPlatformWithCoord(_arg_1:Number, _arg_2:Number):Platform
        {
            var _local_3:int;
            _local_3 = 0;
            {
                _local_3 = 0;
                while (((_local_3 < m_platforms.length) && (((!(m_platforms[_local_3].hitTestPoint(_arg_1, _arg_2, true))) || (m_platforms[_local_3].fallthrough == true)) || (m_selfPlatform == m_platforms[_local_3]))))
                {
                    _local_3++;
                };
                if (((((((((_local_3 < m_platforms.length) && (m_platforms[_local_3].hitTestPoint(_arg_1, _arg_2, true))) && (this.m_fallthroughTimer.IsComplete)) && (!(this.m_fallthrough))) && (this.netYSpeed() >= 0)) && (!((this.inState(CState.ATTACKING)) && (m_attack.ForceFallThrough)))) && ((!(this.m_down)) || (!(((((this.m_down) && (!((STAGEDATA.MeleeAirDodge) && (this.inState(CState.AIR_DODGE))))) && (!(m_collision.ground))) && (!(this.inState(CState.ATTACKING)))) && (!(m_platforms[_local_3].noDropThrough == true)))))) && (!((((this.inState(CState.ATTACKING)) && (m_attack.Rocket)) && (this.m_rocketAngle > 0)) && (this.m_rocketAngle < 180)))))
                {
                    return (m_platforms[_local_3]);
                };
                return (null);
            };
            return (null);
        }

        override protected function testCoordCollision(_arg_1:Number, _arg_2:Number):Boolean
        {
            if (((((!(m_currentPlatform == null)) && (m_currentPlatform.hitTestPoint(_arg_1, _arg_2, true))) && (!(m_currentPlatform.fallthrough == true))) && (!((OnPlatform) && (this.netYSpeed() < 0)))))
            {
                return (true);
            };
            return (false);
        }

        private function testJumpCount():void
        {
            if (((m_collision.ground) && (!(this.inState(CState.TUMBLE_FALL)))))
            {
                if (((((this.m_crowdAwe) && (!(this.inState(CState.CRASH_LAND)))) && (!(this.inState(CState.CRASH_GETUP)))) && (this.m_jumpCount >= this.m_characterStats.MaxJump)))
                {
                    if (STAGEDATA.CrowdChantID < 0)
                    {
                        STAGEDATA.playSpecificVoice("brawl_almostdied");
                    };
                };
                this.resetJumps();
                m_paralysisHitCount = 0;
                this.m_midAirJumpConstantTime.CurrentTime = this.m_midAirJumpConstantTime.MaxTime;
                this.m_canHover = true;
                this.m_lastLedge = null;
                this.m_wallJumpCount = 0;
                this.m_wallStickTime.MaxTime = this.m_characterStats.WallStick;
                this.m_crowdAwe = false;
                this.m_tetherCount = 0;
            };
        }

        private function triggerTaunts():void
        {
            if (((((!(m_lastHitID == m_player_id)) && (m_lastHitID > 0)) && (STAGEDATA.getPlayer(m_lastHitID))) && (!((m_team_id > 0) && (STAGEDATA.getPlayer(m_lastHitID).Team == m_team_id)))))
            {
                if (STAGEDATA.getPlayer(m_lastHitID).isCPU())
                {
                    STAGEDATA.getPlayer(m_lastHitID).CPU.triggerTaunt();
                };
            };
        }

        private function m_checkDeath():void
        {
            var _local_1:String;
            var _local_2:MovieClip;
            var _local_3:Number;
            var _local_4:Character;
            if (((((((((!(this.inState(CState.DEAD))) && (!(this.inState(CState.CAUGHT)))) && (!(this.inState(CState.STAR_KO)))) && (!(this.inState(CState.SCREEN_KO)))) && (!(this.inState(CState.BARREL)))) && (this.m_starKOTimer.IsComplete)) && (!(this.inState(CState.REVIVAL)))) && ((((m_sprite.x < STAGEDATA.DeathBounds.x) || (m_sprite.x > (STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width))) || ((((m_sprite.y < STAGEDATA.DeathBounds.y) && (!(STAGEDATA.DisableCeilingDeath))) && (!(this.inState(CState.GRABBING)))) && ((((((((this.inState(CState.FLYING)) || (this.inState(CState.INJURED))) || (m_collision.ground)) || (this.m_windBoxHit)) || (this.inState(CState.TUMBLE_FALL))) || (this.inState(CState.DIZZY))) || (this.inState(CState.STUNNED))) || (this.inState(CState.EGG))))) || ((m_sprite.y > (STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height)) && (!(STAGEDATA.DisableFallDeath))))))
            {
                if (((m_sprite.y < STAGEDATA.DeathBounds.y) && (!(this.m_usingSpecialAttack))))
                {
                    this.triggerTaunts();
                    this.killCharacterStarKO();
                }
                else
                {
                    _local_1 = "";
                    if (((m_team_id > 0) && (!(ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)))))
                    {
                        if (m_team_id == 1)
                        {
                            _local_1 = (_local_1 + "_p1");
                        };
                        if (m_team_id == 2)
                        {
                            _local_1 = (_local_1 + "_p4");
                        };
                        if (m_team_id == 3)
                        {
                            _local_1 = (_local_1 + "_p2");
                        };
                    }
                    else
                    {
                        if (this.m_human)
                        {
                            _local_1 = (_local_1 + ("_p" + m_player_id));
                        };
                    };
                    _local_2 = STAGEDATA.attachEffectOverlay(("deathMC" + _local_1));
                    _local_3 = 80;
                    if (m_sprite.x < (STAGEDATA.CamBounds.x / 2))
                    {
                        _local_2.rotation = 90;
                        _local_2.x = ((STAGEDATA.CamBounds.x + STAGE.x) - _local_3);
                        _local_2.y = (m_sprite.y + STAGE.y);
                    }
                    else
                    {
                        if (m_sprite.x > (STAGEDATA.CamBounds.x + (STAGEDATA.CamBounds.width / 2)))
                        {
                            _local_2.rotation = 270;
                            _local_2.x = (((STAGEDATA.CamBounds.x + STAGEDATA.CamBounds.width) + STAGE.x) + _local_3);
                            _local_2.y = (m_sprite.y + STAGE.y);
                        }
                        else
                        {
                            _local_2.x = (m_sprite.x + STAGE.x);
                            _local_2.y = ((STAGEDATA.CamBounds.y + STAGEDATA.CamBounds.height) + STAGE.y);
                        };
                    };
                    _local_2.scaleX = 1.2;
                    _local_2.scaleY = 1.2;
                    STAGEDATA.CamRef.addTimedTargetPoint(new Point(m_sprite.x, m_sprite.y), this.m_respawnDelay.MaxTime);
                    if ((((m_sprite.y < (STAGEDATA.CamBounds.y + 100)) || (m_sprite.y > ((STAGEDATA.CamBounds.y + STAGEDATA.CamBounds.height) - 160))) && ((m_sprite.x < (STAGEDATA.CamBounds.x + 100)) || (m_sprite.x > ((STAGEDATA.CamBounds.x + STAGEDATA.CamBounds.width) - 100)))))
                    {
                        _local_2.rotation = Utils.forceBase360((90 - Utils.getAngleBetween(new Point(m_sprite.x, m_sprite.y), new Point((STAGEDATA.CamBounds.x + (STAGEDATA.CamBounds.width / 2)), (STAGEDATA.CamBounds.y + (STAGEDATA.CamBounds.height / 2))))));
                    };
                    this.playGlobalSound("deathExplosion");
                    this.triggerTaunts();
                    if (((this.m_charIsFull) && (this.m_grabbed.length > 0)))
                    {
                        _local_4 = this.m_grabbed[0];
                        this.releaseOpponent();
                        _local_4.killCharacter();
                    };
                    this.killCharacter();
                };
            };
            this.m_windBoxHit = false;
        }

        public function scorePoint(_arg_1:Boolean):void
        {
            var _local_2:MovieClip;
            _local_2 = MovieClip(this.HealthBox.addChild(Main.getLibraryMC("scoreAnim_mc")));
            Utils.tryToGotoAndStop(_local_2.score, (((_arg_1) ? "p" : "m") + Utils.convertTeamToColor(m_player_id, m_team_id)));
            _local_2.x = 19;
            _local_2.y = 4;
        }

        private function updateMatchStatistics():void
        {
            if (((!(STAGEDATA.GameEnded)) && (ModeFeatures.hasFeature(ModeFeatures.ALLOW_STATISTICS, STAGEDATA.GameRef.GameMode))))
            {
                if (m_lastHitID <= 0)
                {
                    this.m_matchResults.SelfDestructs++;
                    this.m_matchResults.KillerList.push(0);
                    this.m_matchResults.Score--;
                    if (STAGEDATA.GameRef.UsingTime)
                    {
                        this.scorePoint(false);
                    };
                    m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_SELF_DESTRUCT, {"caller":this}));
                }
                else
                {
                    if (m_lastHitID > 0)
                    {
                        this.m_matchResults.Falls++;
                        this.m_matchResults.KillerList.push(m_lastHitID);
                        this.m_matchResults.Score--;
                        if (STAGEDATA.GameRef.UsingTime)
                        {
                            this.scorePoint(false);
                        };
                        if ((!((m_team_id > 0) && (STAGEDATA.getPlayer(m_lastHitID).Team == m_team_id))))
                        {
                            STAGEDATA.getPlayer(m_lastHitID).getMatchResults().KOs++;
                            STAGEDATA.getPlayer(m_lastHitID).getMatchResults().KOList.push(m_player_id);
                            STAGEDATA.getPlayer(m_lastHitID).getMatchResults().Score++;
                            STAGEDATA.getPlayer(m_lastHitID).EventManagerObj.dispatchEvent(new SSF2Event(SSF2Event.CHAR_KO_POINT, {
                                "caller":STAGEDATA.getPlayer(m_lastHitID),
                                "victim":this
                            }));
                            if (((STAGEDATA.getPlayer(m_lastHitID).getDamage() >= 100) && (Utils.random() > 0.25)))
                            {
                                STAGEDATA.startCrowdChant(STAGEDATA.getPlayer(m_lastHitID).ID);
                            };
                            if (STAGEDATA.GameRef.UsingTime)
                            {
                                STAGEDATA.getPlayer(m_lastHitID).scorePoint(true);
                            };
                        };
                    };
                };
            };
        }

        private function loseLife():void
        {
            var _local_1:Array;
            var _local_2:Boolean;
            var _local_3:int;
            var _local_4:Number;
            var _local_5:*;
            var _local_6:*;
            var _local_7:Boolean;
            var _local_8:Number;
            var _local_9:*;
            if (this.m_usingLives)
            {
                this.m_lives--;
                if ((!(STAGEDATA.GameEnded)))
                {
                    this.m_matchResults.StockRemaining = this.m_lives;
                };
                this.updateLivesDisplay();
                if (this.m_lives <= 0)
                {
                    this.setState(CState.DEAD);
                    this.HealthBox.visible = false;
                    this.setVisibility(false);
                    _local_1 = new Array();
                    _local_2 = false;
                    _local_3 = 0;
                    while (_local_3 < this.m_opponents.length)
                    {
                        if (((!(STAGEDATA.getPlayer(this.m_opponents[_local_3]).Dead)) && (!((STAGEDATA.getPlayer(this.m_opponents[_local_3]).Team == m_team_id) && (m_team_id > 0)))))
                        {
                            if ((((STAGEDATA.getPlayer(this.m_opponents[_local_3]).Team > 0) && (_local_1[("t" + STAGEDATA.getPlayer(this.m_opponents[_local_3]).Team)] == null)) || ((STAGEDATA.getPlayer(this.m_opponents[_local_3]).Team == -1) && (_local_1["t0"] == null))))
                            {
                                if (STAGEDATA.getPlayer(this.m_opponents[_local_3]).Team == -1)
                                {
                                    _local_1["t0"] = 1;
                                }
                                else
                                {
                                    _local_1[("t" + STAGEDATA.getPlayer(this.m_opponents[_local_3]).Team)] = 1;
                                };
                            }
                            else
                            {
                                if (STAGEDATA.getPlayer(this.m_opponents[_local_3]).Team == -1)
                                {
                                    _local_1["t0"]++;
                                }
                                else
                                {
                                    _local_1[("t" + STAGEDATA.getPlayer(this.m_opponents[_local_3]).Team)]++;
                                };
                            };
                        }
                        else
                        {
                            if ((((!(STAGEDATA.getPlayer(this.m_opponents[_local_3]).Dead)) && (STAGEDATA.getPlayer(this.m_opponents[_local_3]).Team == m_team_id)) && (m_team_id > 0)))
                            {
                                _local_2 = true;
                            };
                        };
                        _local_3++;
                    };
                    _local_4 = 0;
                    for (_local_5 in _local_1)
                    {
                        _local_4++;
                    };
                    if (_local_4 == 1)
                    {
                        _local_7 = false;
                        _local_8 = 0;
                        for (_local_9 in _local_1)
                        {
                            if (_local_9 == "t0")
                            {
                                _local_7 = true;
                                _local_8 = _local_1[_local_9];
                            };
                        };
                        if ((((_local_7) && (_local_8 <= 1)) && (!(STAGEDATA.GameEnded))))
                        {
                            if (ModeFeatures.hasFeature(ModeFeatures.ALLOW_NARRATOR_GAME, STAGEDATA.GameRef.GameMode))
                            {
                                STAGEDATA.playSpecificVoice("narrator_game");
                            };
                            STAGEDATA.prepareEndGameCharacter();
                        }
                        else
                        {
                            if ((((!(_local_7)) && (!(_local_2))) && (!(STAGEDATA.GameEnded))))
                            {
                                if (ModeFeatures.hasFeature(ModeFeatures.ALLOW_NARRATOR_GAME, STAGEDATA.GameRef.GameMode))
                                {
                                    STAGEDATA.playSpecificVoice("narrator_game");
                                };
                                STAGEDATA.prepareEndGameCharacter();
                            };
                        };
                    }
                    else
                    {
                        if (((_local_4 == 0) && (!(STAGEDATA.GameEnded))))
                        {
                            if (ModeFeatures.hasFeature(ModeFeatures.ALLOW_NARRATOR_GAME, STAGEDATA.GameRef.GameMode))
                            {
                                STAGEDATA.playSpecificVoice("narrator_game");
                            };
                            STAGEDATA.prepareEndGameCharacter();
                        };
                    };
                    for (_local_6 in this.m_opponents)
                    {
                        if ((!(STAGEDATA.getPlayer(this.m_opponents[_local_6]).Dead)))
                        {
                        };
                    };
                    if ((((!(STAGEDATA.GameEnded)) && (!(STAGEDATA.EndTrigger))) && (ModeFeatures.hasFeature(ModeFeatures.ALLOW_NARRATOR_CPU_DEFEATED, STAGEDATA.GameRef.GameMode))))
                    {
                        STAGEDATA.playNarratorSpeech([((this.m_human) ? ("narrator_player" + m_player_id) : "narrator_cpu"), "narrator_defeated"]);
                    };
                };
            };
        }

        public function killCharacter(_arg_1:Boolean=true):void
        {
            var _local_2:Vector.<MovieClip>;
            var _local_3:MovieClip;
            if ((!(this.inState(CState.DEAD))))
            {
                _local_2 = new Vector.<MovieClip>();
                _local_2.push(m_sprite);
                if (STAGEDATA.GameRef.GameMode != Mode.TARGET_TEST)
                {
                    CAM.deleteTargets(_local_2);
                };
                this.grabReleaseOpponent();
                this.setVisibility(false);
                if (_arg_1)
                {
                    CAM.shake(10);
                    this.playFrame("fall");
                    this.playCharacterSound("dead");
                    if (this.m_pidHolderMC.parent)
                    {
                        this.m_pidHolderMC.parent.removeChild(this.m_pidHolderMC);
                    };
                };
                this.updateMatchStatistics();
                this.loseLife();
                m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.CHAR_KO_DEATH, {"caller":this}));
                if (STAGEDATA.CrowdChantID == m_player_id)
                {
                    STAGEDATA.stopCrowdChant();
                    STAGEDATA.playSpecificVoice("crowdcheer_end");
                };
                if (((!(this.inState(CState.DEAD))) && (!(STAGEDATA.GameRef.GameMode == Mode.TARGET_TEST))))
                {
                    this.reset();
                    m_sprite.x = this.m_characterStats.XRespawn;
                    m_sprite.y = this.m_characterStats.YRespawn;
                    m_invincible = true;
                    this.setState(CState.REVIVAL);
                }
                else
                {
                    if (STAGEDATA.GameRef.GameMode == Mode.TARGET_TEST)
                    {
                        STAGEDATA.playSpecificSound("narrator_failure");
                        STAGEDATA.prepareEndGameCharacter(false);
                        _local_3 = STAGEDATA.attachUniqueMovieHUD("failure_mc");
                        this.setState(CState.DEAD);
                    };
                };
            };
        }

        public function killCharacterStarKO():void
        {
            var _local_1:Point;
            var _local_2:Boolean;
            var _local_3:*;
            var _local_4:Number;
            var _local_5:Vector.<MovieClip>;
            if ((!(this.inState(CState.DEAD))))
            {
                this.resetMovement();
                this.m_recoveryAmount = 0;
                this.toggleEffect(this.m_healEffect, false);
                if ((((((this.m_charIsFull) && (this.m_grabbed.length > 0)) && (!(this.m_grabbed[0].inState(CState.STAR_KO)))) && (!(this.m_grabbed[0].inState(CState.SCREEN_KO)))) && (!(this.m_grabbed[0].inState(CState.DEAD)))))
                {
                    this.m_grabbed[0].killCharacterStarKO();
                };
                if (this.m_item2 != null)
                {
                    this.m_item2.destroy();
                    this.m_item2 = null;
                };
                this.toggleEffect(this.m_fsGlowHolderMC, false);
                this.playFrame("falling");
                if (this.m_pidHolderMC.parent)
                {
                    this.m_pidHolderMC.parent.removeChild(this.m_pidHolderMC);
                };
                this.releaseOpponent();
                this.setVisibility(false);
                _local_1 = new Point();
                this.m_starKOTimer.reset();
                _local_2 = false;
                _local_3 = 0;
                while (_local_3 < this.m_opponents.length)
                {
                    if (((!(STAGEDATA.getPlayer(this.m_opponents[_local_3]) == null)) && (STAGEDATA.getPlayer(this.m_opponents[_local_3]).ScreenKO)))
                    {
                        _local_2 = true;
                    };
                    _local_3++;
                };
                if (((Utils.random() < 0.25) && (!(_local_2))))
                {
                    this.m_starKOTimer.MaxTime = 60;
                    _local_1 = new Point((CAM.MainTerrain.x + (CAM.MainTerrain.width / 2)), CAM.MainTerrain.y);
                    _local_1 = STAGE.localToGlobal(_local_1);
                    _local_1 = STAGEPARENT.globalToLocal(_local_1);
                    this.m_screenKOHolder.x = _local_1.x;
                    this.m_screenKOHolder.y = _local_1.y;
                    Utils.tryToGotoAndStop(this.m_starKOMC, "falling");
                    Utils.tryToGotoAndStop(this.m_starKOMC, "screenko");
                    this.m_screenKOHolder.gotoAndStop(1);
                    if (this.m_starKOMC.stance)
                    {
                        this.m_starKOMC.stance.gotoAndStop(1);
                    };
                    this.m_starKOMC.visible = true;
                    this.m_screenKOHolder.visible = true;
                    MovieClip(this.m_screenKOHolder.getChildByName("char")).addChild(this.m_starKOMC);
                    this.m_screenKO = true;
                    this.setState(CState.SCREEN_KO);
                    STAGEPARENT.addChild(this.m_screenKOHolder);
                }
                else
                {
                    this.playCharacterSound("starko");
                    this.m_starKOTimer.MaxTime = 90;
                    _local_4 = m_sprite.x;
                    if (m_sprite.x < CAM.MainTerrain.x)
                    {
                        m_sprite.x = (CAM.MainTerrain.x + 150);
                    }
                    else
                    {
                        if (m_sprite.x > (CAM.MainTerrain.x + CAM.MainTerrain.width))
                        {
                            m_sprite.x = ((CAM.MainTerrain.x + CAM.MainTerrain.width) - 150);
                        }
                        else
                        {
                            m_sprite.x = (m_sprite.x + Utils.randomInteger(-50, 50));
                        };
                    };
                    _local_1 = new Point(m_sprite.x, (CAM.MainTerrain.y - (m_height * 0.5)));
                    m_sprite.y = CAM.MainTerrain.y;
                    _local_1 = STAGE.localToGlobal(_local_1);
                    _local_1 = STAGEPARENT.globalToLocal(_local_1);
                    this.m_starKOHolder.x = _local_1.x;
                    this.m_starKOHolder.y = _local_1.y;
                    this.m_starKOHolder.y = (this.m_starKOHolder.y + (m_height * 0.5));
                    Utils.tryToGotoAndStop(this.m_starKOMC, "falling");
                    Utils.tryToGotoAndStop(this.m_starKOMC, "starko");
                    this.m_starKOHolder.gotoAndStop(1);
                    if (this.m_starKOMC.stance)
                    {
                        this.m_starKOMC.stance.gotoAndStop(1);
                    };
                    this.m_starKOMC.visible = true;
                    this.m_starKOHolder.visible = true;
                    MovieClip(this.m_starKOHolder.getChildByName("char")).addChild(this.m_starKOMC);
                    this.m_screenKO = false;
                    this.setState(CState.STAR_KO);
                    STAGEPARENT.addChildAt(this.m_starKOHolder, STAGE.parent.getChildIndex(STAGE));
                };
                if (((this.m_starKOTimer.MaxTime == 90) && (CAM.Mode == Vcam.NORMAL_MODE)))
                {
                    _local_5 = new Vector.<MovieClip>();
                    _local_5.push(m_sprite);
                    STAGEDATA.CamRef.addTargets(_local_5);
                };
                this.m_respawnDelay.reset();
                m_invincible = true;
            };
        }

        private function m_flipDirection():void
        {
            if ((((((((this.inFreeState(false, false, true)) && (!(this.inState(CState.CROUCH)))) && (!(this.inState(CState.DASH)))) && (!(this.inState(CState.DASH_INIT)))) && (!(this.inState(CState.TURN)))) && ((m_collision.ground) || (this.m_characterStats.HoldJump))) && (!(this.isLandingOrSkiddingOrChambering()))))
            {
                if ((((this.m_right) && (!(m_facingForward))) && (!(this.m_left))))
                {
                    this.m_faceRight();
                    m_facingForward = true;
                }
                else
                {
                    if ((((this.m_left) && (m_facingForward)) && (!(this.m_right))))
                    {
                        this.m_faceLeft();
                        m_facingForward = false;
                    };
                };
            };
        }

        private function adjustTags(_arg_1:Point):void
        {
            var _local_2:Point;
            _local_2 = STAGE.localToGlobal(new Point(_arg_1.x, _arg_1.y));
            this.m_pidHolderMC.x = _local_2.x;
            this.m_pidHolderMC.y = _local_2.y;
        }

        private function m_checkBounds():void
        {
            var _local_1:Point;
            var _local_2:Point;
            var _local_3:Boolean;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            _local_1 = null;
            _local_2 = null;
            _local_3 = this.m_outsideMainTerrain;
            _local_4 = (m_width / 2);
            _local_5 = (-(m_width) / 2);
            _local_6 = -(m_height);
            _local_7 = 0;
            _local_4 = (_local_4 * m_sizeRatio);
            _local_6 = (_local_6 * m_sizeRatio);
            _local_4 = (_local_4 * m_sizeRatio);
            _local_7 = (_local_7 * m_sizeRatio);
            this.m_outsideMainTerrain = (((((m_sprite.x + _local_4) < STAGEDATA.CamBounds.x) || ((m_sprite.x + _local_5) > (STAGEDATA.CamBounds.x + STAGEDATA.CamBounds.width))) || ((m_sprite.y + _local_6) < STAGEDATA.CamBounds.y)) || ((m_sprite.y + _local_7) > (STAGEDATA.CamBounds.y + STAGEDATA.CamBounds.height)));
            this.m_outsideCameraBounds = (((((OverlayX + _local_4) < STAGEDATA.CamRef.CornerX) || ((OverlayX + _local_5) > (STAGEDATA.CamRef.CornerX + STAGEDATA.CamRef.Width))) || ((OverlayY + _local_7) < STAGEDATA.CamRef.CornerY)) || ((OverlayY + _local_6) > (STAGEDATA.CamRef.CornerY + STAGEDATA.CamRef.Height)));
            if ((((((((!(this.m_pidHolderMC.parent)) && (!(this.inState(CState.REVIVAL)))) && (!(this.inState(CState.DEAD)))) && (!(this.inState(CState.STAR_KO)))) && (!(this.inState(CState.SCREEN_KO)))) && (!(STAGEDATA.StageEvent))) && (!(STAGEDATA.FreezeKeys))))
            {
                if (((this.m_outsideCameraBounds) || ((((this.m_showPlayerID) || (this.m_playerName)) && (!(this.inState(CState.DEAD)))) && (!(this.inState(CState.REVIVAL))))))
                {
                    this.m_pidHolderMC.pid.text = (((this.m_showPlayerID) && (!(this.m_playerName))) ? ("P" + m_player_id) : "");
                    this.m_pidHolderMC.offScreenBubble.visible = false;
                    this.m_pidHolderMC.x = m_sprite.x;
                    this.m_pidHolderMC.y = ((m_sprite.y - m_height) - 20);
                    this.m_pidHolderMC.scaleX = 1;
                    this.m_pidHolderMC.scaleY = 1;
                    this.m_pidHolderMC.width = (this.m_pidHolderMC.width * m_sizeRatio);
                    this.m_pidHolderMC.height = (this.m_pidHolderMC.height * m_sizeRatio);
                    _local_1 = STAGE.localToGlobal(new Point(this.m_pidHolderMC.x, this.m_pidHolderMC.y));
                    _local_2 = STAGE.localToGlobal(new Point(m_sprite.x, (m_sprite.y - m_height)));
                    this.m_pidHolderMC.arrow.rotation = (270 - Utils.getAngleBetween(_local_1, _local_2));
                    STAGEDATA.TagsRef.addChild(this.m_pidHolderMC);
                    this.adjustTags(new Point(this.m_pidHolderMC.x, this.m_pidHolderMC.y));
                };
            };
            if (this.m_pidHolderMC.parent)
            {
                if (((!(this.m_outsideCameraBounds)) && ((STAGEDATA.StageEvent) || ((!(this.m_showPlayerID)) && (!(this.m_playerName))))))
                {
                    this.m_pidHolderMC.parent.removeChild(this.m_pidHolderMC);
                }
                else
                {
                    if ((((((OverlayX > STAGEDATA.CamRef.CornerX) && (OverlayX < (STAGEDATA.CamRef.CornerX + STAGEDATA.CamRef.Width))) && (OverlayY > STAGEDATA.CamRef.CornerY)) && (OverlayY < (STAGEDATA.CamRef.CornerY + STAGEDATA.CamRef.Height))) && (this.m_showPlayerID)))
                    {
                        this.m_pidHolderMC.x = m_sprite.x;
                        this.m_pidHolderMC.y = ((m_sprite.y - m_height) - 20);
                        _local_1 = STAGE.localToGlobal(new Point(this.m_pidHolderMC.x, this.m_pidHolderMC.y));
                        _local_2 = STAGE.localToGlobal(new Point(m_sprite.x, (m_sprite.y - m_height)));
                        this.m_pidHolderMC.arrow.rotation = (270 - Utils.getAngleBetween(_local_1, _local_2));
                        this.adjustTags(new Point(this.m_pidHolderMC.x, this.m_pidHolderMC.y));
                    }
                    else
                    {
                        this.m_pidHolderMC.x = m_sprite.x;
                        this.m_pidHolderMC.y = (m_sprite.y - (m_sizeRatio * 70));
                        if (OverlayX < ((STAGEDATA.CamRef.X - (STAGEDATA.CamRef.Width / 2)) + 25))
                        {
                            this.m_pidHolderMC.x = (((STAGEDATA.CamRef.X - (STAGEDATA.CamRef.Width / 2)) + 50) - STAGE.x);
                        }
                        else
                        {
                            if (OverlayX > ((STAGEDATA.CamRef.X + (STAGEDATA.CamRef.Width / 2)) - 25))
                            {
                                this.m_pidHolderMC.x = (((STAGEDATA.CamRef.X + (STAGEDATA.CamRef.Width / 2)) - 50) - STAGE.x);
                            };
                        };
                        if ((OverlayY - ((m_sizeRatio * m_height) / 2)) < ((STAGEDATA.CamRef.Y - (STAGEDATA.CamRef.Height / 2)) + 25))
                        {
                            this.m_pidHolderMC.y = (((STAGEDATA.CamRef.Y - (STAGEDATA.CamRef.Height / 2)) + 100) - STAGE.y);
                        }
                        else
                        {
                            if ((OverlayY - (m_sizeRatio * m_height)) > ((STAGEDATA.CamRef.Y + (STAGEDATA.CamRef.Height / 2)) - 25))
                            {
                                this.m_pidHolderMC.y = (((STAGEDATA.CamRef.Y + (STAGEDATA.CamRef.Height / 2)) - 25) - STAGE.y);
                            };
                        };
                        _local_1 = STAGE.localToGlobal(new Point(this.m_pidHolderMC.x, this.m_pidHolderMC.y));
                        _local_2 = STAGE.localToGlobal(new Point(m_sprite.x, (m_sprite.y - m_height)));
                        this.m_pidHolderMC.arrow.rotation = (270 - Utils.getAngleBetween(_local_1, _local_2));
                        this.adjustTags(new Point(this.m_pidHolderMC.x, this.m_pidHolderMC.y));
                    };
                };
            };
            if (this.m_outsideMainTerrain)
            {
                if ((((((!(_local_3)) || (this.m_standby)) || (this.inState(CState.STAR_KO))) || (this.inState(CState.SCREEN_KO))) || (this.inState(CState.DEAD))))
                {
                    this.m_offscreenDamageTimer.reset();
                };
                this.m_offscreenDamageTimer.tick();
                if (this.m_offscreenDamageTimer.IsComplete)
                {
                    this.damageSelf(1);
                    this.throbDamageCounter();
                    this.m_offscreenDamageTimer.reset();
                };
            };
        }

        private function setVar(_arg_1:String, _arg_2:*):void
        {
            m_sprite[_arg_1] = _arg_2;
        }

        private function setStanceVar(_arg_1:String, _arg_2:*):void
        {
            if (HasStance)
            {
                m_sprite.stance[_arg_1] = _arg_2;
            }
            else
            {
                trace(((("Stance var missing? " + _arg_1) + "-") + _arg_2));
            };
        }

        override public function playFrame(_arg_1:String):void
        {
            var _local_2:Boolean;
            var _local_3:Boolean;
            if (HasStance)
            {
                m_sprite.stance.stop();
            };
            _local_2 = (!(currentFrameIs(_arg_1)));
            _local_3 = ((!(m_sprite.xframe == null)) && (_arg_1 == m_sprite.xframe));
            if ((!(currentFrameIs(_arg_1))))
            {
                Utils.tryToGotoAndStop(m_sprite, _arg_1);
            };
            if (_local_3)
            {
            };
            if (_local_2)
            {
                this.updateItemHolding();
            };
        }

        override public function stancePlayFrame(_arg_1:*):void
        {
            if (((HasStance) && ((_arg_1 is Number) || ((_arg_1 is String) && (Utils.hasLabel(m_sprite.stance, String(_arg_1)))))))
            {
                if (m_sprite.stance.xframe != null)
                {
                    m_sprite.stance.xframe = _arg_1;
                };
                Utils.tryToGotoAndStop(m_sprite.stance, _arg_1);
            };
        }

        private function currentStanceFrameIs(_arg_1:String):Boolean
        {
            var _local_2:Boolean;
            return ((((HasStance) && (!(m_sprite.stance.xframe == null))) && (m_sprite.stance.xframe == _arg_1)) ? true : false);
        }

        private function restartStance():void
        {
            if (HasStance)
            {
                Utils.tryToGotoAndPlay(m_sprite.stance, 1);
            };
        }

        private function m_checkFinalForm():void
        {
            var _local_1:String;
            var _local_2:Boolean;
            if (this.m_transformedSpecial)
            {
                if ((!(this.m_unlimitedFinal)))
                {
                    if (this.m_transformTime >= this.m_transformLimit)
                    {
                        this.HealthBox.fsmeter.visible = false;
                        _local_1 = this.m_characterStats.Power;
                        _local_2 = m_sprite.visible;
                        this.replaceCharacter(this.m_characterStats.NormalStatsID, "stand", null);
                        this.setVisibility(_local_2);
                        if (STAGEPARENT.getChildByName(("energy" + m_player_id)) != null)
                        {
                            STAGEPARENT.removeChild(STAGEPARENT.getChildByName(("energy" + m_player_id)));
                        };
                        this.setState(CState.IDLE);
                        this.m_transformedSpecial = false;
                    }
                    else
                    {
                        if ((!(currentFrameIs("special"))))
                        {
                            this.m_transformTime++;
                        };
                        this.HealthBox.fsmeter.bar.scaleX = ((this.m_transformLimit - this.m_transformTime) / this.m_transformLimit);
                    };
                };
            };
        }

        private function resetChargedAttacks():void
        {
            var _local_1:*;
            for (_local_1 in m_attack.ChargedAttacks)
            {
                m_attack.ChargedAttacks[_local_1] = null;
            };
        }

        private function attackIsCharged(_arg_1:String):Boolean
        {
            if (m_attack.ChargedAttacks[_arg_1])
            {
                return (true);
            };
            if (((m_attack.LinkedChargeAttacks[_arg_1]) && (m_attack.ChargedAttacks[m_attack.LinkedChargeAttacks[_arg_1]])))
            {
                return (true);
            };
            return (false);
        }

        private function setCharge(_arg_1:String, _arg_2:String=null):void
        {
            m_attack.ChargedAttacks[_arg_1] = true;
            if (_arg_2)
            {
                m_attack.ChargedAttacks[_arg_2] = true;
                m_attack.LinkedChargeAttacks[_arg_1] = _arg_2;
                m_attack.LinkedChargeAttacks[_arg_2] = _arg_1;
            }
            else
            {
                m_attack.LinkedChargeAttacks[_arg_1] = null;
            };
        }

        private function incrementCharge(_arg_1:String, _arg_2:String=null):void
        {
            m_attackData.getAttack(_arg_1).ChargeTime++;
            m_attack.ChargeTime = m_attackData.getAttack(_arg_1).ChargeTime;
            if (_arg_2)
            {
                m_attackData.getAttack(_arg_2).ChargeTime++;
            };
        }

        private function unsetCharge(_arg_1:String):void
        {
            if (m_attack.LinkedChargeAttacks[_arg_1])
            {
                m_attack.ChargedAttacks[m_attack.LinkedChargeAttacks[_arg_1]] = false;
                m_attackData.getAttack(m_attack.LinkedChargeAttacks[_arg_1]).ChargeTime = 0;
            };
            m_attack.ChargedAttacks[_arg_1] = false;
            m_attackData.getAttack(_arg_1).ChargeTime = 0;
        }

        private function releaseKirbyPower(_arg_1:Boolean=false):void
        {
            var _local_2:MovieClip;
            if (this.m_currentPower != null)
            {
                m_attack.ChargedAttacks = new Object();
                m_attackData.resetCharges();
                this.removeChargeGlow();
                this.m_currentPower = null;
                if (HasHatBox)
                {
                    m_sprite.stance.hatBox.visible = false;
                };
                if (_arg_1)
                {
                    _local_2 = STAGEDATA.attachEffectOverlay("kirby_powerstar");
                    _local_2.width = (_local_2.width * m_sizeRatio);
                    _local_2.height = (_local_2.height * m_sizeRatio);
                    if ((!(m_facingForward)))
                    {
                        _local_2.scaleX = (_local_2.scaleX * -1);
                    };
                    _local_2.x = OverlayX;
                    _local_2.y = (OverlayY - (10 * m_sizeRatio));
                    this.playGlobalSound("kirby_losepower");
                };
            };
        }

        private function initTaunt():void
        {
            if (this.inState(CState.ATTACKING))
            {
                this.forceEndAttack();
            };
            this.setState(CState.TAUNT);
            if (((((!(this.m_up)) && (!(this.m_down))) && (!(this.m_left))) && (!(this.m_right))))
            {
                this.stancePlayFrame("taunt_neutral");
            }
            else
            {
                if (((this.m_up) || (this.m_down)))
                {
                    this.stancePlayFrame("taunt_updown");
                }
                else
                {
                    if (((this.m_left) || (this.m_right)))
                    {
                        this.stancePlayFrame("taunt_side");
                    };
                };
            };
            this.m_crouchFrame = -1;
            if (this.m_characterStats.LinkageID == "kirby")
            {
                this.releaseKirbyPower(true);
            };
        }

        public function forceTaunt():void
        {
            if (((((!(this.inState(CState.DEAD))) && (!(STAGEDATA.Paused))) && (!(STAGEDATA.StageEvent))) && (!(this.m_standby))))
            {
                if ((((((this.inFreeState(true)) && (!((this.inState(CState.ATTACKING)) && (!(m_attack.AllowFullInterrupt))))) && (m_collision.ground)) && (!(this.isLandingOrSkiddingOrChambering()))) && (this.m_characterStats.CanTaunt)))
                {
                    this.initTaunt();
                };
            };
        }

        private function m_checkTaunt():void
        {
            if (((!(m_collision.ground)) && (this.inState(CState.TAUNT))))
            {
                this.setState(CState.IDLE);
            };
            if (((((((this.m_taunt) && (this.inFreeState(true))) && (!((this.inState(CState.ATTACKING)) && (!(m_attack.AllowFullInterrupt))))) && (m_collision.ground)) && (!(this.isLandingOrSkiddingOrChambering()))) && (this.m_characterStats.CanTaunt)))
            {
                this.initTaunt();
            };
        }

        private function getLastYPosition():void
        {
            this.m_lastYPosition = (m_sprite.y - this.netYSpeed());
        }

        private function checkStats():void
        {
            if (((!(this.inState(CState.DEAD))) && (!(STAGEDATA.GameEnded))))
            {
                this.m_matchResults.SurvivalTime++;
                this.m_droughtTimer++;
                this.m_matchResults.DamageRemaining = this.m_damage;
            };
        }

        private function checkHitLag():void
        {
            if (((!(isHitStunOrParalysis())) && (this.m_hitLag > 0)))
            {
                this.m_hitLag--;
                this.m_hitLagStunTimer.tick();
                if (((((m_collision.ground) && (this.inState(CState.INJURED))) && (this.netYSpeed() >= 0)) && (!(this.m_hitLagLandDelay.IsComplete))))
                {
                    this.m_hitLag = 0;
                };
            }
            else
            {
                if (((!(isHitStunOrParalysis())) && (this.m_hitLag <= 0)))
                {
                    this.m_hitLagLandDelay.finish();
                };
            };
            if ((!(isHitStunOrParalysis())))
            {
                if (((((this.m_hitLagCanCancel) && (this.m_hitLag > 0)) && (!(this.m_hitLagJumpCancelTimer.IsComplete))) && (!(m_collision.ground))))
                {
                    if ((((!(this.m_jump)) && (!(this.m_jump2))) && (!(this.m_up))))
                    {
                        this.m_hitLagLetGo = true;
                    };
                    if (((((this.m_jump) || (this.m_jump2)) || (this.m_up)) && (this.m_hitLagLetGo)))
                    {
                        this.m_hitLagCanCancel = false;
                    };
                    this.m_hitLagJumpCancelTimer.tick();
                };
                if ((((((this.m_hitLagCanCancel) && (this.m_hitLag > 0)) && (this.m_hitLagJumpCancelTimer.IsComplete)) && ((this.inState(CState.INJURED)) || (this.inState(CState.FLYING)))) && (!(m_collision.ground))))
                {
                    if ((((this.m_up) && (this.m_b)) && (!((this.HoldingItem) && (!(this.m_item.CanAttackWith))))))
                    {
                        this.setState(CState.IDLE);
                        this.Attack("b_up_air", 2);
                        this.m_hitLagCanCancel = false;
                    }
                    else
                    {
                        if (((((((this.jumpIsPressed()) && (this.m_jumpFullyReleased)) && (!(m_collision.ground))) && (!((this.HoldingItem) && (!(this.m_item.CanJumpWith))))) && (this.m_jumpCount < this.m_characterStats.MaxJump)) && ((this.m_jumpSpeedMidairDelay.IsComplete) || (this.m_characterStats.HoldJump))))
                        {
                            this.initMidairJump();
                            this.m_hitLagCanCancel = false;
                        };
                    };
                };
            };
        }

        private function positionEffects():void
        {
            var _local_1:Number;
            var _local_2:Number;
            _local_1 = ((this.inState(CState.LEDGE_HANG)) ? m_sprite.x : m_sprite.x);
            _local_2 = ((this.inState(CState.LEDGE_HANG)) ? (m_sprite.y + m_height) : m_sprite.y);
            if (this.m_poisonIncrease > 0)
            {
                this.m_poisonEffect.x = (_local_1 - ((m_width / 3) * m_sizeRatio));
                this.m_poisonEffect.y = (_local_2 - (m_height * m_sizeRatio));
                if ((((m_sprite.parent) && (this.m_poisonEffect.parent)) && (this.m_poisonEffect.parent.getChildIndex(this.m_poisonEffect) < m_sprite.parent.getChildIndex(m_sprite))))
                {
                    Utils.swapDepths(m_sprite, this.m_poisonEffect);
                };
            };
            if ((!(this.m_burnSmokeTimer.IsComplete)))
            {
                this.m_burnSmoke.x = _local_1;
                this.m_burnSmoke.y = (_local_2 - ((m_height * m_sizeRatio) / 2));
                if ((((m_sprite.parent) && (this.m_burnSmoke.parent)) && (this.m_burnSmoke.parent.getChildIndex(this.m_burnSmoke) < m_sprite.parent.getChildIndex(m_sprite))))
                {
                    Utils.swapDepths(m_sprite, this.m_burnSmoke);
                };
            };
            if (((this.m_warioWareIcon) && (!(this.m_warioWareIconTimer.IsComplete))))
            {
                this.m_warioWareIcon.x = _local_1;
                this.m_warioWareIcon.y = (_local_2 - (m_height / 2));
                if ((((m_sprite.parent) && (this.m_warioWareIcon.parent)) && (this.m_warioWareIcon.parent.getChildIndex(this.m_warioWareIcon) < m_sprite.parent.getChildIndex(m_sprite))))
                {
                    Utils.swapDepths(m_sprite, this.m_warioWareIcon);
                };
            };
            if ((!(this.m_starmanInvincibilityTimer.IsComplete)))
            {
                this.m_starmanInvincibility.x = _local_1;
                this.m_starmanInvincibility.y = (_local_2 - ((m_height * m_sizeRatio) / 2));
                if ((((m_sprite.parent) && (this.m_starmanInvincibility.parent)) && (this.m_starmanInvincibility.parent.getChildIndex(this.m_starmanInvincibility) < m_sprite.parent.getChildIndex(m_sprite))))
                {
                    Utils.swapDepths(m_sprite, this.m_starmanInvincibility);
                };
            };
            if (this.inState(CState.KIRBY_STAR))
            {
                this.m_kirbyStarMC.x = m_sprite.x;
                this.m_kirbyStarMC.y = m_sprite.y;
            };
            if (this.inState(CState.EGG))
            {
                this.m_yoshiEggMC.x = m_sprite.x;
                this.m_yoshiEggMC.y = m_sprite.y;
            };
            if (this.inState(CState.FROZEN))
            {
                this.m_freezeMC.x = m_sprite.x;
                this.m_freezeMC.y = m_sprite.y;
                this.m_freezeMC.rotation = m_sprite.rotation;
            };
            this.repositionEffects();
        }

        private function checkFrameControl():void
        {
            if (((this.inState(CState.JUMP_RISING)) || (this.inState(CState.JUMP_MIDAIR_RISING))))
            {
                if ((((m_ySpeed >= -5) && (getStanceVar("done", true))) && (!((this.m_midAirJumpConstantTime.MaxTime > 0) && (!(this.m_midAirJumpConstantTime.IsComplete))))))
                {
                    this.resetRotation();
                    this.m_fallTiltTimer.reset();
                    Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                    this.setState(CState.JUMP_FALLING);
                };
            };
            if (this.inState(CState.DIZZY))
            {
                if ((!(m_collision.ground)))
                {
                    this.playFrame("falling");
                }
                else
                {
                    if (currentFrameIs("falling"))
                    {
                        this.m_forcedCrash = true;
                        this.playFrame("crash");
                        this.setStanceVar("ready", true);
                        this.stancePlayFrame("getup");
                    }
                    else
                    {
                        if ((!(currentFrameIs("crash"))))
                        {
                            this.playFrame("dizzy");
                        };
                    };
                };
            };
            if (((((((this.inState(CState.CRASH_LAND)) || (this.inState(CState.CRASH_GETUP))) || (this.inState(CState.ROLL))) || (this.inState(CState.TECH_ROLL))) || (this.inState(CState.TECH_GROUND))) && (!(m_collision.ground))))
            {
                this.setState(CState.IDLE);
            };
            if (this.inState(CState.AIR_DODGE))
            {
                if (m_collision.ground)
                {
                    if ((!((!(m_currentPlatform == null)) && (!(m_currentPlatform.accel_friction == 1)))))
                    {
                        this.killAllSpeeds(false, true);
                    };
                    this.playFrame("land");
                    this.setState(CState.LAND);
                    Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                };
            };
            if (this.inState(CState.TUMBLE_FALL))
            {
                if (m_collision.ground)
                {
                    this.initiateCrash();
                };
            };
        }

        override protected function checkTimers():void
        {
            var _local_1:Boolean;
            var _local_2:int;
            var _local_3:int;
            var _local_4:Number;
            var _local_5:Boolean;
            var _local_6:Boolean;
            var _local_7:Number;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            super.checkTimers();
            if (this.inState(CState.CAUGHT))
            {
                m_knockbackStackingTimer.reset();
            };
            if ((!(this.m_invisibleTimer.IsComplete)))
            {
                this.m_invisibleTimer.tick();
                if (this.m_invisibleTimer.IsComplete)
                {
                    this.setVisibility(true);
                };
            };
            this.m_starKOTimer.tick();
            if ((!(this.m_injureFlashTimer.IsComplete)))
            {
                this.m_injureFlashTimer.tick();
                if (this.m_injureFlashTimer.IsComplete)
                {
                    setTint(1, 1, 1, 1, 0, 0, 0, 0);
                };
            };
            if (this.inState(CState.FLYING))
            {
                if (((this.m_ricochetX.IsComplete) && (this.m_ricochetY.IsComplete)))
                {
                    this.m_ricochetTimer.tick();
                };
                _local_5 = (!(this.m_ricochetX.IsComplete));
                _local_6 = (!(this.m_ricochetY.IsComplete));
                this.m_ricochetX.tick();
                this.m_ricochetY.tick();
                if (((_local_5) && (this.m_ricochetX.IsComplete)))
                {
                    m_xKnockback = (m_xKnockback * -0.85);
                    if ((!((_local_6) && (this.m_ricochetY.IsComplete))))
                    {
                        m_yKnockback = (m_yKnockback * 0.85);
                    };
                    if (m_xKnockback > 0)
                    {
                        faceRight();
                    }
                    else
                    {
                        if (m_xKnockback < 0)
                        {
                            faceLeft();
                        };
                    };
                    if (m_ySpeed > 0)
                    {
                        m_ySpeed = 0;
                    };
                    resetKnockbackDecay();
                };
                if (((_local_6) && (this.m_ricochetY.IsComplete)))
                {
                    if ((!((_local_5) && (this.m_ricochetX.IsComplete))))
                    {
                        m_xKnockback = (m_xKnockback * 0.85);
                    };
                    m_yKnockback = (m_yKnockback * -0.85);
                    m_ySpeed = 0;
                    resetKnockbackDecay();
                    if (this.isRocketing())
                    {
                        this.m_rocketAngle = Utils.forceBase360(-(this.m_rocketAngle));
                        this.fixRocketRotation();
                    };
                };
            };
            if (((this.inState(CState.TUMBLE_FALL)) || (this.inState(CState.JUMP_FALLING))))
            {
                if (this.m_right != this.m_left)
                {
                    if (((this.m_right) && (!(this.m_fallTiltRight))))
                    {
                        m_sprite.rotation = (m_sprite.rotation * 0.5);
                        if (Utils.fastAbs(m_sprite.rotation) <= 1)
                        {
                            this.resetRotation();
                            this.m_fallTiltTimer.reset();
                            this.m_fallTiltRight = true;
                        };
                    }
                    else
                    {
                        if (((this.m_left) && (this.m_fallTiltRight)))
                        {
                            m_sprite.rotation = (m_sprite.rotation * 0.5);
                            if (Utils.fastAbs(m_sprite.rotation) <= 1)
                            {
                                this.resetRotation();
                                this.m_fallTiltTimer.reset();
                                this.m_fallTiltRight = false;
                            };
                        }
                        else
                        {
                            this.m_fallTiltTimer.tick();
                            _local_7 = ((this.inState(CState.TUMBLE_FALL)) ? 30 : 6);
                            if (this.inState(CState.JUMP_FALLING))
                            {
                                this.m_fallTiltTimer.tick();
                                this.m_fallTiltTimer.tick();
                            };
                            m_sprite.rotation = (_local_7 * (this.m_fallTiltTimer.CurrentTime / this.m_fallTiltTimer.MaxTime));
                            if ((!(this.m_fallTiltRight)))
                            {
                                m_sprite.rotation = (m_sprite.rotation * -1);
                            };
                        };
                    };
                }
                else
                {
                    if (Utils.fastAbs(m_sprite.rotation) > 1)
                    {
                        m_sprite.rotation = (m_sprite.rotation * 0.5);
                        if (Utils.fastAbs(m_sprite.rotation) <= 1)
                        {
                            m_sprite.rotation = 0;
                        };
                    };
                };
            };
            if ((((((this.inState(CState.JUMP_FALLING)) || (this.inState(CState.JUMP_RISING))) && (this.m_doingBackFlip)) && (HasStance)) && (((m_xSpeed >= 0) && (m_facingForward)) || ((m_xSpeed <= 0) && (!(m_facingForward))))))
            {
                this.m_doingBackFlip = false;
                if (Utils.hasLabel(m_sprite.stance, "jump"))
                {
                    Utils.tryToGotoAndStop(m_sprite.stance, "jump");
                }
                else
                {
                    Utils.tryToGotoAndStop(m_sprite.stance, 1);
                };
            };
            if (((((m_player_id == 1) && (Main.DEBUG)) && (MenuController.debugConsole)) && (MenuController.debugConsole.ControlsCapture)))
            {
                _local_8 = this.m_key.getControlObjectBits(this.m_key.getControlStatus());
                if (((this.m_attackControlsArr.length == 0) || ((this.m_attackControlsArr.length > 1) && (!(_local_8 == this.m_attackControlsArr[(this.m_attackControlsArr.length - 2)])))))
                {
                    this.m_attackControlsArr.push(_local_8);
                    this.m_attackControlsArr.push(0);
                };
                this.m_attackControlsArr[(this.m_attackControlsArr.length - 1)]++;
            };
            this.m_fallthroughTimer.tick();
            if (((this.m_fallthroughTimer.IsComplete) || ((this.m_fallthroughPlatform) && (!(this.m_fallthroughPlatform.hitTestPoint(m_sprite.x, (m_sprite.y + 1)))))))
            {
                this.m_fallthroughTimer.finish();
                this.m_fallthroughPlatform = null;
                this.m_fallthrough = false;
            };
            if ((!(this.m_starmanInvincibilityTimer.IsComplete)))
            {
                this.m_starmanInvincibilityTimer.tick();
                Utils.advanceFrame(this.m_starmanInvincibility);
                if (this.m_starmanInvincibilityTimer.IsComplete)
                {
                    this.toggleEffect(this.m_starmanInvincibility, false);
                    setBrightness(0);
                };
            };
            _local_1 = Boolean(this.m_revivalInvincibility.IsComplete);
            this.m_revivalInvincibility.tick();
            if ((((this.m_revivalInvincibility.IsComplete) && (!(_local_1))) && (this.m_starmanInvincibilityTimer.IsComplete)))
            {
                setBrightness(0);
            };
            _local_2 = 0;
            _local_3 = 0;
            if (this.m_shieldTimer >= this.m_shieldStartFrame)
            {
                this.m_shieldStartTimer++;
            };
            if (((((this.inState(CState.CRASH_LAND)) && (m_collision.ground)) && (getStanceVar("ready", true))) && (!(testTerrainWithCoord(m_sprite.x, (m_sprite.y - 1))))))
            {
                this.m_getUpTimer--;
                if ((((((this.m_attackLetGoA) && (this.m_a)) || ((this.m_attackLetGoB) && (this.m_b))) || ((((this.m_c_up) || (this.m_c_down)) || (this.m_c_left)) || (this.m_c_right))) && (this.m_getUpTimer < 100)))
                {
                    this.Attack("getup_attack", 1);
                };
            };
            if (this.inState(CState.CRASH_LAND))
            {
                if (((this.m_getUpTimer <= 0) || (((this.m_up) && (!(m_sprite.stance.currentLabel == "getup"))) && (this.m_getUpTimer < 100))))
                {
                    this.stancePlayFrame("getup");
                    this.m_tapJumpLetGo = false;
                    this.m_jumpLetGo = false;
                    this.m_jumpFullyReleased = false;
                    this.setState(CState.CRASH_GETUP);
                };
            };
            if ((!(isHitStunOrParalysis())))
            {
                this.m_shieldTimer++;
                this.m_shieldDelayTimer.tick();
            };
            this.m_turnTimer.tick();
            this.m_specialTurnTimer.tick();
            m_attackData.incrementAttackTimers(this);
            if (this.m_characterStats.DamageIncrease > 0)
            {
                this.m_damageIncreaseInterval.tick();
                if (this.m_damageIncreaseInterval.IsComplete)
                {
                    this.dealDamage(this.m_characterStats.DamageIncrease);
                    this.m_damageIncreaseInterval.reset();
                };
            };
            if ((!(this.m_poisonTintTimer.IsComplete)))
            {
                setTint(0.31, 1, 0.65, 1, 0, 25, 0, 0);
                this.m_poisonTintTimer.tick();
                if (this.m_poisonTintTimer.IsComplete)
                {
                    setTint(1, 1, 1, 1, 0, 0, 0, 0);
                };
            };
            if (this.m_poisonIncrease > 0)
            {
                this.m_poisonIncreaseInterval.tick();
                if (this.m_poisonIncreaseInterval.IsComplete)
                {
                    this.dealDamage(this.m_poisonIncrease);
                    this.throbDamageCounter();
                    this.m_poisonIncreaseInterval.reset();
                };
                this.m_poisonIncreaseTime.tick();
                if (this.m_poisonIncreaseTime.IsComplete)
                {
                    this.m_poisonIncreaseTime.reset();
                    this.m_poisonIncrease = 0;
                    this.toggleEffect(this.m_poisonEffect, false);
                };
            };
            if (((this.m_warioWareIcon) && (!(this.m_warioWareIconTimer.IsComplete))))
            {
                this.m_warioWareIconTimer.tick();
                Utils.advanceFrame(this.m_warioWareIcon);
                if (this.m_warioWareIconTimer.IsComplete)
                {
                    this.toggleEffect(this.m_warioWareIcon, false);
                };
            };
            if ((!(this.m_shockEffectTimer.IsComplete)))
            {
                setTint(0.82, 0.82, 0.82, 1, 9, 0, 46, 0);
                this.m_shockEffectTimer.tick();
                if (this.m_shockEffectTimer.IsComplete)
                {
                    setTint(1, 1, 1, 1, 0, 0, 0, 0);
                };
            };
            if ((!(this.m_burnSmokeTimer.IsComplete)))
            {
                Utils.advanceFrame(this.m_burnSmoke);
                this.m_burnSmokeTimer.tick();
                if (this.m_burnSmokeTimer.CurrentTime < 60)
                {
                    setTint(0.79, 0.63, 0.63, 1, 57, 0, 0, 0);
                }
                else
                {
                    if (this.m_burnSmokeTimer.CurrentTime == 60)
                    {
                        setTint(1, 1, 1, 1, 0, 0, 0, 0);
                    };
                };
                if (this.m_burnSmokeTimer.IsComplete)
                {
                    if (this.m_burnSmoke.parent != null)
                    {
                        this.m_burnSmoke.parent.removeChild(this.m_burnSmoke);
                    };
                };
            };
            if (this.inState(CState.KIRBY_STAR))
            {
                this.m_starTimer--;
                if (this.m_starTimer < 0)
                {
                    this.setIntangibility(false);
                    this.endAttack();
                    unnattachFromGround();
                    this.killAllSpeeds(false, false);
                    m_ySpeed = -12;
                    this.toggleEffect(this.m_kirbyStarMC, false);
                    this.setVisibility(true);
                    this.resetRotation();
                    this.m_fallTiltTimer.reset();
                    this.setState(CState.JUMP_FALLING);
                }
                else
                {
                    m_xSpeed = ((m_facingForward) ? -15 : 15);
                };
            };
            this.m_holdTimer--;
            if (((this.m_charIsFull) && (this.m_grabbed.length > 0)))
            {
                _local_2 = 0;
                while (_local_2 < this.m_grabbed.length)
                {
                    _local_9 = this.m_grabbed[_local_2].Struggle();
                    this.m_holdTimer = (this.m_holdTimer - ((_local_9 > 0) ? _local_9 : 0));
                    _local_2++;
                };
                if (this.m_holdTimer < 0)
                {
                    this.m_holdTimer = 0;
                };
            };
            if (((this.m_holdTimer <= 0) && (this.m_charIsFull)))
            {
                if (this.m_grabbed.length > 0)
                {
                    _local_3 = 0;
                    while (_local_3 < this.m_grabbed.length)
                    {
                        this.m_grabbed[_local_3].setVisibility(true);
                        this.m_grabbed[_local_3].Uncapture();
                        this.m_grabbed[_local_3].unnattachFromGround();
                        this.m_grabbed[_local_3].setYSpeed(-8);
                        _local_3++;
                    };
                    this.m_grabbed = new Vector.<Character>();
                    m_xSpeed = ((m_facingForward) ? -9 : 9);
                    if (HasStance)
                    {
                        Utils.tryToGotoAndStop(m_sprite.stance, 1);
                    };
                };
                this.m_charIsFull = false;
            };
            if (this.m_attackDelay > 0)
            {
                this.m_attackDelay--;
            };
            if (((!(this.m_sizeStatus == 0)) && (!(this.m_sizeStatusPermanent))))
            {
                this.m_sizeStatusTimer.tick();
                if (this.m_sizeStatusTimer.IsComplete)
                {
                    this.setSizeStatus(0);
                };
            };
            if (((((((this.m_forceTransformTime.MaxTime > 0) && (!(this.inState(CState.SCREEN_KO)))) && (!(this.inState(CState.STAR_KO)))) && (!(this.inState(CState.DEAD)))) && (!(this.inState(CState.REVIVAL)))) && (!(this.m_standby))))
            {
                this.m_forceTransformTime.tick();
                if (this.m_forceTransformTime.IsComplete)
                {
                    if (this.inState(CState.ATTACKING))
                    {
                        this.forceEndAttack();
                    };
                    this.replaceCharacter(this.m_characterStats.ForceTransformID);
                };
            };
            if (this.inState(CState.LEDGE_HANG))
            {
                this.m_ledgeHangTimer.tick();
                if (this.m_ledgeHangTimer.CurrentTime >= 14)
                {
                    this.turnOffInvincibility();
                };
                if (this.m_ledgeHangTimer.IsComplete)
                {
                    m_ySpeed = 0;
                    this.unnattachFromLedge();
                    this.setState(CState.IDLE);
                };
                if ((((this.inState(CState.LEDGE_HANG)) && (this.m_ledgeHangTimer.CurrentTime > 15)) && (((this.m_a) || (this.m_b)) || ((((this.m_c_up) || (this.m_c_down)) || (this.m_c_left)) || (this.m_c_right)))))
                {
                    this.m_ledgeHangTimer.reset();
                    m_sprite.x = (m_sprite.x + ((m_facingForward) ? 1 : -1));
                    _local_10 = 0;
                    while (((!(this.testGroundWithCoord(m_sprite.x, m_sprite.y))) && (_local_10 > 15)))
                    {
                        m_sprite.x = (m_sprite.x + ((m_facingForward) ? 1 : -1));
                        _local_10 = (_local_10 + 1);
                    };
                    if (_local_10 >= 15)
                    {
                        m_sprite.x = (m_sprite.x - ((m_facingForward) ? _local_10 : -(_local_10)));
                    };
                    this.m_groundCollisionTest();
                    this.Attack("ledge_attack", 1);
                };
            };
            if ((!((this.inState(CState.SHIELDING)) && (this.m_shieldTimer >= this.m_shieldStartFrame))))
            {
                if ((((((this.m_shieldPower < 100) && (!(this.inState(CState.DODGE_ROLL)))) && (!(this.inState(CState.AIR_DODGE)))) && (!(this.inState(CState.SIDESTEP_DODGE)))) && (!(this.inState(CState.GRABBING)))))
                {
                    this.m_shieldPower = (this.m_shieldPower + (0.14 * 2));
                };
            };
            if (((this.inState(CState.SHIELDING)) && (this.m_shieldTimer >= this.m_shieldStartFrame)))
            {
                this.m_dodgeTimer = (this.m_dodgeTimer + 1);
                if ((((this.m_shieldDelay > 5) && (!(isHitStunOrParalysis()))) && (this.m_shieldDelayTimer.IsComplete)))
                {
                    this.m_shieldPower = (this.m_shieldPower - (0.56 * 2));
                };
                this.m_resizeShield();
                if (this.m_shieldPower <= 0)
                {
                    this.m_breakShield();
                };
            };
            if (((((((((!(this.m_up)) && (!(this.m_down))) && (!(this.m_left))) && (!(this.m_right))) && (!(this.m_a))) && (!(this.m_b))) && (!(this.isLanding()))) && (!(this.isSkidding()))))
            {
                this.m_smashTimer = 0;
            }
            else
            {
                this.m_smashTimer++;
            };
            if ((((((!(this.m_up)) && (!(this.m_a))) && (!(this.m_b))) && (!(this.isLanding()))) && (!(this.isSkidding()))))
            {
                this.m_smashTimerUp = 0;
            }
            else
            {
                this.m_smashTimerUp++;
            };
            if ((((((!(this.m_down)) && (!(this.m_a))) && (!(this.m_b))) && (!(this.isLanding()))) && (!(this.isSkidding()))))
            {
                this.m_smashTimerDown = 0;
            }
            else
            {
                this.m_smashTimerDown++;
            };
            if (((((((!(this.m_right)) && (!(this.m_left))) && (!(this.m_a))) && (!(this.m_b))) && (!(this.isLanding()))) && (!(this.isSkidding()))))
            {
                this.m_smashTimerSide = 0;
            }
            else
            {
                this.m_smashTimerSide++;
            };
            if (((((!(this.m_up)) && (!(this.m_b))) && (!(this.isLanding()))) && (!(this.isSkidding()))))
            {
                this.m_upSpecialTimer = 0;
            }
            else
            {
                this.m_smashTimerSide++;
            };
            if (this.isLanding())
            {
                this.killSmashTimers();
            };
            if (((this.inState(CState.HOVER)) || (this.m_attackHovering)))
            {
                this.m_midAirHoverTime.tick();
                if (((this.m_midAirHoverTime.IsComplete) || (((!(this.m_up)) && (!(this.m_jump))) && (!(this.m_jump2)))))
                {
                    if ((!(this.m_attackHovering)))
                    {
                        this.setState(CState.IDLE);
                    };
                    this.m_attackHovering = false;
                };
            };
            this.m_midAirJumpConstantDelay.tick();
            if (this.m_midAirJumpConstantDelay.IsComplete)
            {
                this.m_midAirJumpConstantTime.tick();
            };
            _local_4 = -(this.m_characterStats.JumpSpeedMidAir);
            if (this.m_jumpSpeedList)
            {
                if (this.m_jumpCount < this.m_jumpSpeedList.length)
                {
                    _local_4 = -(this.m_jumpSpeedList[this.m_jumpCount]);
                }
                else
                {
                    _local_4 = -(this.m_jumpSpeedList[(this.m_jumpSpeedList.length - 1)]);
                };
            };
            if ((((!(this.m_midAirJumpConstantTime.IsComplete)) && (this.m_midAirJumpConstantDelay.IsComplete)) && (!(isHitStunOrParalysis()))))
            {
                if (this.m_characterStats.MidAirJumpConstantAccel != 0)
                {
                    m_ySpeed = (m_ySpeed - this.m_characterStats.MidAirJumpConstantAccel);
                    if (m_ySpeed < _local_4)
                    {
                        m_ySpeed = _local_4;
                    };
                }
                else
                {
                    m_ySpeed = _local_4;
                };
            };
            if ((!(this.m_jumpEffectTimer.IsComplete)))
            {
                this.m_jumpEffectTimer.tick();
                if ((this.m_jumpEffectTimer.CurrentTime % 2) == 0)
                {
                    this.attachJumpEffect();
                };
            };
            if (this.inState(CState.ATTACKING))
            {
                if (this.inState(CState.ATTACKING))
                {
                    if ((!(isHitStunOrParalysis())))
                    {
                        m_attack.ExecTime++;
                        m_attack.RefreshRateTimer++;
                    };
                    if (((((!(this.m_attackIDIncremented)) && (m_attack.RefreshRate > 0)) && (m_attack.RefreshRateReady)) && ((m_attack.RefreshRateTimer % m_attack.RefreshRate) == 0)))
                    {
                        m_attack.AttackID = Utils.getUID();
                        this.checkLinkedProjectiles();
                        this.m_attackIDIncremented = true;
                    }
                    else
                    {
                        if ((!(isHitStunOrParalysis())))
                        {
                            this.m_attackIDIncremented = false;
                        };
                    };
                };
            };
            this.performAttackChecks();
            if (SpecialMode.modeEnabled(STAGEDATA.GameRef.LevelData.specialModes, SpecialMode.INVISIBLE))
            {
                if ((!(this.m_invisiblePulseToggle)))
                {
                    this.setAlpha(0);
                };
                this.m_invisiblePulseTimer.tick();
                if (this.m_invisiblePulseTimer.IsComplete)
                {
                    if ((!(this.m_invisiblePulseToggle)))
                    {
                        this.m_invisiblePulseToggle = true;
                        this.m_invisiblePulseTimer.reset();
                        this.m_invisiblePulseTimer.MaxTime = Utils.randomInteger(1, 8);
                        this.setAlpha((Utils.random() * 0.65));
                        this.m_invisiblePulseCount = Utils.randomInteger(1, 8);
                    }
                    else
                    {
                        this.m_invisiblePulseCount--;
                        if (this.m_invisiblePulseCount <= 0)
                        {
                            this.m_invisiblePulseCount = 0;
                            this.m_invisiblePulseToggle = false;
                            this.m_invisiblePulseTimer.reset();
                            this.m_invisiblePulseTimer.MaxTime = Utils.randomInteger(20, 90);
                        }
                        else
                        {
                            this.m_invisiblePulseTimer.reset();
                            this.m_invisiblePulseTimer.MaxTime = Utils.randomInteger(1, 8);
                            this.setAlpha((Utils.random() * 0.65));
                        };
                    };
                };
            };
        }

        public function groundBounceCheck():void
        {
            if (((((((this.inState(CState.FLYING)) || (this.inState(CState.TUMBLE_FALL))) && (this.m_canTech)) && (!(this.m_hasBounced))) && (this.m_techReady)) && (!(isHitStunOrParalysis()))))
            {
                this.performGroundTech();
                this.techEffect();
            }
            else
            {
                if ((((this.inState(CState.FLYING)) && (this.m_canBounce)) && (this.netYSpeed() >= (m_max_ySpeed - 1))))
                {
                    this.toBounce();
                }
                else
                {
                    if (((this.inState(CState.FLYING)) || (this.inState(CState.TUMBLE_FALL))))
                    {
                        this.initiateCrash();
                    };
                };
            };
        }

        public function initiateCrash():void
        {
            this.m_forcedCrash = false;
            if (((!(this.inState(CState.CRASH_LAND))) && (!(this.inState(CState.CRASH_GETUP)))))
            {
                this.m_getUpTimer = 110;
            };
            if ((!(m_collision.ground)))
            {
                m_currentPlatform = getPlatformBetweenPoints(Location, new Point(Location.x, (Location.y + 20)));
                if (m_currentPlatform != null)
                {
                    attachToGround();
                };
            };
            this.m_hitLagCanCancel = false;
            if (this.inState(CState.FLYING))
            {
                this.setState(CState.CRASH_LAND);
                this.stancePlayFrame("bounce");
            }
            else
            {
                this.setState(CState.CRASH_LAND);
            };
            this.m_crowdAwe = false;
            this.updateItemHolding();
            this.resetRotation();
        }

        private function checkEdgeLean():void
        {
            var _local_1:Boolean;
            if (this.inState(CState.IDLE))
            {
                _local_1 = ((((m_collision.ground) && (OnTerrain)) && (m_xSpeed == 0)) && (checkLinearPathBetweenPoints(new Point(((m_facingForward) ? (m_sprite.x + 5) : (m_sprite.x - 5)), (m_sprite.y + 2)), new Point(((m_facingForward) ? (m_sprite.x + 5) : (m_sprite.x - 5)), (m_sprite.y + 20)), true, m_currentPlatform)));
                if (((_local_1) && (Utils.hasLabel(m_sprite, "edgelean"))))
                {
                    this.playFrame("edgelean");
                }
                else
                {
                    this.playFrame("stand");
                };
            };
        }

        private function checkFatKirby():void
        {
            if (this.m_charIsFull)
            {
                if (this.inState(CState.IDLE))
                {
                    this.playFrame("stand");
                    if (getStanceVar("fatstand", false))
                    {
                        this.stancePlayFrame("fatstand");
                    };
                }
                else
                {
                    if (this.inState(CState.WALK))
                    {
                        this.playFrame("walk");
                        if (((this.m_charIsFull) && (getStanceVar("normalwalk", true))))
                        {
                            this.stancePlayFrame("startwalk2");
                        };
                    }
                    else
                    {
                        if (this.inState(CState.JUMP_RISING))
                        {
                            this.playFrame("jump");
                            if (getStanceVar("fatjump", false))
                            {
                                this.stancePlayFrame("fatjump");
                            };
                        }
                        else
                        {
                            if (this.inState(CState.JUMP_FALLING))
                            {
                                this.playFrame("fall");
                                if (getStanceVar("fatfall", false))
                                {
                                    this.stancePlayFrame("fatfall");
                                };
                            }
                            else
                            {
                                if (this.inState(CState.LAND))
                                {
                                    this.playFrame("land");
                                    if (getStanceVar("fatland", false))
                                    {
                                        this.stancePlayFrame("fatland");
                                        this.attachLandEffect();
                                        if ((!((!(m_currentPlatform == null)) && (!(m_currentPlatform.accel_friction == 1)))))
                                        {
                                            m_xSpeed = 0;
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        private function checkGroundStateChange():void
        {
            if ((!(m_collision.ground)))
            {
                if (((((((((((this.inState(CState.IDLE)) || (this.inState(CState.RUN))) || (this.inState(CState.WALK))) || (this.inState(CState.SKID))) || (this.inState(CState.JUMP_CHAMBER))) || (this.inState(CState.LAND))) || (this.inState(CState.SKID))) || (this.inState(CState.CROUCH))) || (this.inState(CState.TURN))) || (this.inState(CState.DASH))))
                {
                    if ((!(this.inState(CState.ATTACKING))))
                    {
                        if (m_xSpeed > this.m_characterStats.MaxJumpSpeed)
                        {
                            m_xSpeed = this.m_characterStats.MaxJumpSpeed;
                        }
                        else
                        {
                            if (m_xSpeed < -(this.m_characterStats.MaxJumpSpeed))
                            {
                                m_xSpeed = -(this.m_characterStats.MaxJumpSpeed);
                            };
                        };
                    };
                    if (this.inState(CState.TURN))
                    {
                        flip();
                    };
                    this.setState(CState.JUMP_FALLING);
                    this.resetRotation();
                    this.m_fallTiltTimer.reset();
                };
            }
            else
            {
                if ((((((this.inState(CState.JUMP_RISING)) || (this.inState(CState.JUMP_MIDAIR_RISING))) || (this.inState(CState.JUMP_FALLING))) || (this.inState(CState.HOVER))) || (this.m_attackHovering)))
                {
                    this.resetRotation();
                    this.setState(CState.LAND);
                };
            };
        }

        override protected function m_controlFrames():void
        {
            var _local_1:Boolean;
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Boolean;
            if (this.m_charIsFull)
            {
                this.checkFatKirby();
            }
            else
            {
                if (this.inState(CState.ENTRANCE))
                {
                    this.playFrame("entrance");
                }
                else
                {
                    if (this.inState(CState.DISABLED))
                    {
                        this.playFrame("fall");
                    }
                    else
                    {
                        if (this.inState(CState.IDLE))
                        {
                            this.playFrame("stand");
                            this.resetRotation();
                            Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                        }
                        else
                        {
                            if (this.inState(CState.DASH_INIT))
                            {
                                this.playFrame("stand");
                            }
                            else
                            {
                                if ((((this.inState(CState.RUN)) || (this.inState(CState.DASH))) || (this.inState(CState.TURN))))
                                {
                                    _local_1 = currentFrameIs("run");
                                    this.playFrame("run");
                                    if (((((this.inState(CState.RUN)) && (!(_local_1))) && (HasStance)) && (Utils.hasLabel(m_sprite.stance, "run"))))
                                    {
                                        this.stancePlayFrame("run");
                                    };
                                }
                                else
                                {
                                    if (this.inState(CState.WALK))
                                    {
                                        this.playFrame("walk");
                                    }
                                    else
                                    {
                                        if (this.inState(CState.SKID))
                                        {
                                            this.playFrame("skid");
                                        }
                                        else
                                        {
                                            if (this.inState(CState.LAND))
                                            {
                                                this.playFrame("land");
                                            }
                                            else
                                            {
                                                if (this.inState(CState.HOVER))
                                                {
                                                    this.playFrame("jump_midair");
                                                    if (((HasStance) && (!((!(m_sprite.stance.currentLabel)) == "hover"))))
                                                    {
                                                        this.stancePlayFrame("hover");
                                                    };
                                                }
                                                else
                                                {
                                                    if ((((this.inState(CState.JUMP_RISING)) || (this.inState(CState.JUMP_MIDAIR_RISING))) || (this.inState(CState.JUMP_CHAMBER))))
                                                    {
                                                        if (((this.inState(CState.JUMP_RISING)) || (this.inState(CState.JUMP_CHAMBER))))
                                                        {
                                                            this.playFrame("jump");
                                                        }
                                                        else
                                                        {
                                                            if (this.inState(CState.JUMP_MIDAIR_RISING))
                                                            {
                                                                this.playFrame("jump_midair");
                                                            };
                                                        };
                                                    }
                                                    else
                                                    {
                                                        if (this.inState(CState.JUMP_FALLING))
                                                        {
                                                            this.playFrame("fall");
                                                        }
                                                        else
                                                        {
                                                            if (this.inState(CState.KIRBY_STAR))
                                                            {
                                                                this.playFrame("hurt");
                                                            }
                                                            else
                                                            {
                                                                if (this.inState(CState.ATTACKING))
                                                                {
                                                                    if (((!(currentFrameIs(m_attack.Frame))) && (!(m_attack.Frame == null))))
                                                                    {
                                                                        this.playFrame(m_attack.Frame);
                                                                    };
                                                                }
                                                                else
                                                                {
                                                                    if (this.inState(CState.REVIVAL))
                                                                    {
                                                                        this.playFrame("revival");
                                                                    }
                                                                    else
                                                                    {
                                                                        if (this.inState(CState.CRASH_LAND))
                                                                        {
                                                                            this.playFrame("crash");
                                                                        }
                                                                        else
                                                                        {
                                                                            if (this.inState(CState.CRASH_GETUP))
                                                                            {
                                                                                this.playFrame("crash");
                                                                            }
                                                                            else
                                                                            {
                                                                                if (this.inState(CState.ROLL))
                                                                                {
                                                                                    this.playFrame("roll");
                                                                                }
                                                                                else
                                                                                {
                                                                                    if (this.inState(CState.TECH_ROLL))
                                                                                    {
                                                                                        this.playFrame("tech_roll");
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                        if (this.inState(CState.TECH_GROUND))
                                                                                        {
                                                                                            this.playFrame("tech_ground");
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            if ((((this.inState(CState.INJURED)) || (this.inState(CState.CAUGHT))) || (this.inState(CState.FLYING))))
                                                                                            {
                                                                                                if (this.inState(CState.FLYING))
                                                                                                {
                                                                                                    if (isHitStunOrParalysis())
                                                                                                    {
                                                                                                        this.resetRotation();
                                                                                                        Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                                                                                                        this.playFrame("hurt");
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                        this.playFrame("flying");
                                                                                                        _local_2 = Utils.getAngleBetween(new Point(0, 0), new Point(this.netXSpeed(), this.netYSpeed()));
                                                                                                        _local_3 = Utils.forceBase360(((!(m_facingForward)) ? -(_local_2) : (-(_local_2) + 180)));
                                                                                                        m_sprite.rotation = _local_3;
                                                                                                    };
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                    if ((!(currentFrameIs("hurt"))))
                                                                                                    {
                                                                                                        this.resetRotation();
                                                                                                        Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                                                                                                        this.playFrame("hurt");
                                                                                                    };
                                                                                                };
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                                if (this.inState(CState.STUNNED))
                                                                                                {
                                                                                                    if ((!(m_collision.ground)))
                                                                                                    {
                                                                                                        this.playFrame("falling");
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                        this.playFrame("stunned");
                                                                                                    };
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                    if (this.inState(CState.DIZZY))
                                                                                                    {
                                                                                                        if ((!(m_collision.ground)))
                                                                                                        {
                                                                                                            this.playFrame("falling");
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                            this.playFrame("dizzy");
                                                                                                        };
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                        if (this.inState(CState.LEDGE_ROLL))
                                                                                                        {
                                                                                                            this.playFrame("rollup");
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                            if (this.inState(CState.LEDGE_CLIMB))
                                                                                                            {
                                                                                                                this.playFrame("climbup");
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                                if (this.inState(CState.LEDGE_HANG))
                                                                                                                {
                                                                                                                    this.playFrame("hang");
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                    if (this.inState(CState.DODGE_ROLL))
                                                                                                                    {
                                                                                                                        this.playFrame("dodgeroll");
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                        if (this.inState(CState.SIDESTEP_DODGE))
                                                                                                                        {
                                                                                                                            this.playFrame("sidestep");
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                            if (this.inState(CState.AIR_DODGE))
                                                                                                                            {
                                                                                                                                this.playFrame("airdodge");
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                                if (this.inState(CState.ITEM_TOSS))
                                                                                                                                {
                                                                                                                                    this.playFrame("toss");
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                    if (this.inState(CState.GRABBING))
                                                                                                                                    {
                                                                                                                                        this.playFrame("grab");
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                        if (this.inState(CState.CROUCH))
                                                                                                                                        {
                                                                                                                                            _local_4 = currentFrameIs("crouch");
                                                                                                                                            this.playFrame("crouch");
                                                                                                                                            if (((!(_local_4)) && (this.m_crouchFrame > 0)))
                                                                                                                                            {
                                                                                                                                                Utils.tryToGotoAndStop(m_sprite.stance, this.m_crouchFrame);
                                                                                                                                            };
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                            if (this.inState(CState.SHIELDING))
                                                                                                                                            {
                                                                                                                                                this.playFrame("defend");
                                                                                                                                                this.m_resizeShield();
                                                                                                                                            }
                                                                                                                                            else
                                                                                                                                            {
                                                                                                                                                if (this.inState(CState.SHIELD_DROP))
                                                                                                                                                {
                                                                                                                                                    this.playFrame("defend");
                                                                                                                                                }
                                                                                                                                                else
                                                                                                                                                {
                                                                                                                                                    if (this.inState(CState.TAUNT))
                                                                                                                                                    {
                                                                                                                                                        this.playFrame("taunt");
                                                                                                                                                    }
                                                                                                                                                    else
                                                                                                                                                    {
                                                                                                                                                        if (((this.inState(CState.TUMBLE_FALL)) && (!(isHitStunOrParalysis()))))
                                                                                                                                                        {
                                                                                                                                                            Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                                                                                                                                                            if (m_collision.ground)
                                                                                                                                                            {
                                                                                                                                                                this.initiateCrash();
                                                                                                                                                            }
                                                                                                                                                            else
                                                                                                                                                            {
                                                                                                                                                                Utils.rotateAroundCenter(m_sprite.stance, m_facingForward, 0);
                                                                                                                                                                this.playFrame("falling");
                                                                                                                                                            };
                                                                                                                                                        }
                                                                                                                                                        else
                                                                                                                                                        {
                                                                                                                                                            if (this.inState(CState.FROZEN))
                                                                                                                                                            {
                                                                                                                                                                this.playFrame("hurt");
                                                                                                                                                            }
                                                                                                                                                            else
                                                                                                                                                            {
                                                                                                                                                                if (this.inState(CState.SLEEP))
                                                                                                                                                                {
                                                                                                                                                                    if ((!(m_collision.ground)))
                                                                                                                                                                    {
                                                                                                                                                                        this.playFrame("falling");
                                                                                                                                                                    }
                                                                                                                                                                    else
                                                                                                                                                                    {
                                                                                                                                                                        this.playFrame("sleep");
                                                                                                                                                                    };
                                                                                                                                                                }
                                                                                                                                                                else
                                                                                                                                                                {
                                                                                                                                                                    if (this.inState(CState.PITFALL))
                                                                                                                                                                    {
                                                                                                                                                                        this.playFrame("pitfall");
                                                                                                                                                                    }
                                                                                                                                                                    else
                                                                                                                                                                    {
                                                                                                                                                                        if (this.inState(CState.EGG))
                                                                                                                                                                        {
                                                                                                                                                                            this.playFrame("hurt");
                                                                                                                                                                        }
                                                                                                                                                                        else
                                                                                                                                                                        {
                                                                                                                                                                            if (this.inState(CState.WALL_CLING))
                                                                                                                                                                            {
                                                                                                                                                                                this.playFrame("wallstick");
                                                                                                                                                                            };
                                                                                                                                                                        };
                                                                                                                                                                    };
                                                                                                                                                                };
                                                                                                                                                            };
                                                                                                                                                        };
                                                                                                                                                    };
                                                                                                                                                };
                                                                                                                                            };
                                                                                                                                        };
                                                                                                                                    };
                                                                                                                                };
                                                                                                                            };
                                                                                                                        };
                                                                                                                    };
                                                                                                                };
                                                                                                            };
                                                                                                        };
                                                                                                    };
                                                                                                };
                                                                                            };
                                                                                        };
                                                                                    };
                                                                                };
                                                                            };
                                                                        };
                                                                    };
                                                                };
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        private function m_calcGroundAngle():void
        {
            var _local_1:Number;
            var _local_2:int;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
        }

        private function stopSoundID(_arg_1:int):void
        {
            var _local_2:SoundObject;
            if (_arg_1 >= 0)
            {
                _local_2 = STAGEDATA.SoundQueueRef.getSoundObject(_arg_1);
                if (((_local_2.IsPlaying) && (_local_2.IsPlaying)))
                {
                    _local_2.stop();
                };
            };
        }

        public function playAttackSound(_arg_1:Number):int
        {
            if ((((!(m_attack.Frame == null)) && (!(m_attackData.getAttack(m_attack.Frame).AttackSounds[(_arg_1 - 1)] == null))) && (!(m_attackData.getAttack(m_attack.Frame).AttackSounds[(_arg_1 - 1)] == undefined))))
            {
                return (this.m_lastSFX = STAGEDATA.playSpecificSound(m_attackData.getAttack(m_attack.Frame).AttackSounds[(_arg_1 - 1)], this.m_characterStats.VolumeSFX));
            };
            return (-1);
        }

        public function playVoiceSound(_arg_1:Number):int
        {
            if ((((!(m_attack.Frame == null)) && (!(m_attackData.getAttack(m_attack.Frame).AttackVoices[(_arg_1 - 1)] == null))) && (!(m_attackData.getAttack(m_attack.Frame).AttackVoices[(_arg_1 - 1)] == undefined))))
            {
                return (this.m_lastVFX = STAGEDATA.playSpecificVoice(m_attackData.getAttack(m_attack.Frame).AttackVoices[(_arg_1 - 1)], this.m_characterStats.VolumeVFX));
            };
            return (-1);
        }

        public function playCharacterSound(_arg_1:String):int
        {
            if (((!(this.m_characterStats.Sounds[_arg_1] == null)) && (!(this.m_characterStats.Sounds[_arg_1] == undefined))))
            {
                return (STAGEDATA.playSpecificVoice(((this.m_characterStats.Sounds[(_arg_1 + "2")] != null) ? ((Utils.random() > 0.5) ? this.m_characterStats.Sounds[(_arg_1 + "2")] : this.m_characterStats.Sounds[_arg_1]) : this.m_characterStats.Sounds[_arg_1]), this.m_characterStats.VolumeVFX));
            };
            return (-1);
        }

        public function toHelpless(_arg_1:*=null):void
        {
            this.setState(CState.DISABLED);
        }

        public function toLand(_arg_1:*=null):void
        {
            this.setState(CState.LAND);
            m_ySpeed = 0;
        }

        public function toIdle(_arg_1:*=null):void
        {
            this.setState(CState.IDLE);
        }

        public function toBounce(_arg_1:*=null):void
        {
            var _local_2:Number;
            this.setState(CState.FLYING);
            resetKnockbackDecay();
            m_ySpeed = -12;
            unnattachFromGround();
            this.attachGroundBounceEffect();
            this.m_canBounce = false;
            this.m_hasBounced = true;
            this.m_hitLagCanCancel = false;
            this.m_hitLagJumpCancelTimer.reset();
            this.m_hitLag = 0;
            _local_2 = -12;
            while (((_local_2 < 12) && (m_gravity > 0)))
            {
                this.m_hitLag++;
                _local_2 = (_local_2 + m_gravity);
            };
        }

        public function toCrashLand(_arg_1:*=null):void
        {
            this.initiateCrash();
        }

        public function playGlobalSound(_arg_1:String):int
        {
            return (STAGEDATA.playSpecificSound(_arg_1, this.m_characterStats.VolumeSFX));
        }

        private function m_checkRevival():void
        {
            var _local_1:Vector.<MovieClip>;
            var _local_2:Boolean;
            var _local_3:Vector.<MovieClip>;
            var _local_4:MovieClip;
            var _local_5:Vector.<MovieClip>;
            if (((this.inState(CState.STAR_KO)) || (this.inState(CState.SCREEN_KO))))
            {
                if (((this.inState(CState.SCREEN_KO)) && (this.m_starKOTimer.CurrentTime == 30)))
                {
                    this.playCharacterSound("screenko");
                };
                if (this.m_starKOTimer.IsComplete)
                {
                    if (this.inState(CState.SCREEN_KO))
                    {
                        this.m_screenKO = false;
                        this.playGlobalSound("deathExplosion");
                    }
                    else
                    {
                        if (this.inState(CState.STAR_KO))
                        {
                            this.playGlobalSound("starkosound");
                            _local_1 = new Vector.<MovieClip>();
                            _local_1.push(m_sprite);
                            STAGEDATA.CamRef.deleteTargets(_local_1);
                        };
                    };
                    this.killCharacter(false);
                }
                else
                {
                    this.m_starKOHolder.visible = true;
                    this.m_starKOMC.visible = true;
                    this.m_screenKOHolder.visible = true;
                };
            }
            else
            {
                if (this.inState(CState.REVIVAL))
                {
                    if (this.m_characterStats.StatsName === "sandbag")
                    {
                        this.setVisibility(true);
                        this.HealthBox.damageMC_holder.visible = true;
                        this.HealthBox.percent_mc.damage.visible = true;
                        this.setState(CState.IDLE);
                        _local_3 = new Vector.<MovieClip>();
                        _local_3.push(m_sprite);
                        if ((!((CAM.Mode == Vcam.ZOOM_MODE) && (m_player_id > 1))))
                        {
                            STAGEDATA.CamRef.addTargets(_local_3);
                        };
                        return;
                    };
                    _local_2 = Boolean(this.m_respawnDelay.IsComplete);
                    this.m_respawnDelay.tick();
                    if ((((this.m_respawnDelay.IsComplete) && (!(_local_2))) && (HasStance)))
                    {
                        Utils.tryToGotoAndPlay(m_sprite.stance, 1);
                    };
                    if (this.m_respawnDelay.IsComplete)
                    {
                        if ((!(m_sprite.visible)))
                        {
                            _local_5 = new Vector.<MovieClip>();
                            _local_5.push(m_sprite);
                            if ((!((CAM.Mode == Vcam.ZOOM_MODE) && (m_player_id > 1))))
                            {
                                STAGEDATA.CamRef.addTargets(_local_5);
                            };
                            if (HasStance)
                            {
                                Utils.tryToGotoAndStop(m_sprite.stance, 1);
                            };
                        };
                        this.setVisibility(true);
                        this.HealthBox.damageMC_holder.visible = true;
                        this.HealthBox.percent_mc.damage.visible = true;
                        _local_4 = null;
                        if (this.m_revivalTimer < 0)
                        {
                            if (this.m_characterStats.RevivalEffect != null)
                            {
                                _local_4 = STAGEDATA.attachEffectOverlay(this.m_characterStats.RevivalEffect);
                                if ((!(m_facingForward)))
                                {
                                    _local_4.scaleX = (_local_4.scaleX * -1);
                                };
                                _local_4.width = (_local_4.width * m_sizeRatio);
                                _local_4.height = (_local_4.height * m_sizeRatio);
                                _local_4.x = OverlayX;
                                _local_4.y = OverlayY;
                            };
                            this.setState(CState.IDLE);
                        }
                        else
                        {
                            this.m_revivalInvincibility.reset();
                            if ((!(currentFrameIs("revival"))))
                            {
                                this.setState(CState.IDLE);
                            }
                            else
                            {
                                if (this.m_revivalTimer >= 120)
                                {
                                    if (this.m_revivalTimer == 150)
                                    {
                                        m_sprite.y = (m_sprite.y - (30 * m_sizeRatio));
                                        this.setAlpha(0);
                                    };
                                    this.m_attemptToMove(0, m_sizeRatio);
                                    this.setAlpha((m_sprite.alpha + 4));
                                }
                                else
                                {
                                    if ((((((((this.m_left) || (this.m_right)) || (this.m_a)) || (this.m_b)) || (this.m_up)) || (this.m_down)) || (this.m_grab)))
                                    {
                                        if (this.m_characterStats.RevivalEffect != null)
                                        {
                                            _local_4 = STAGEDATA.attachEffectOverlay(this.m_characterStats.RevivalEffect);
                                            if ((!(m_facingForward)))
                                            {
                                                _local_4.scaleX = (_local_4.scaleX * -1);
                                            };
                                            _local_4.width = (_local_4.width * m_sizeRatio);
                                            _local_4.height = (_local_4.height * m_sizeRatio);
                                            _local_4.x = OverlayX;
                                            _local_4.y = OverlayY;
                                        };
                                        this.setState(CState.IDLE);
                                    };
                                };
                            };
                            this.m_revivalTimer--;
                        };
                    }
                    else
                    {
                        this.setVisibility(false);
                    };
                };
            };
        }

        public function suddenDeathRespawn():void
        {
            var _local_1:Vector.<MovieClip>;
            this.setVisibility(false);
            _local_1 = new Vector.<MovieClip>();
            _local_1.push(m_sprite);
            STAGEDATA.CamRef.addTargets(_local_1);
            Utils.tryToGotoAndStop(m_sprite, "stand");
            m_sprite.x = this.m_characterStats.XStart;
            m_sprite.y = this.m_characterStats.YStart;
            this.forceOnGround();
            this.setVisibility(true);
            this.HealthBox.damageMC_holder.visible = true;
            this.HealthBox.percent_mc.damage.visible = true;
            this.m_lives = 1;
            this.updateLivesDisplay();
            this.m_usingLives = true;
        }

        private function checkDI():void
        {
            var _local_1:Number;
            var _local_2:Boolean;
            _local_1 = 0;
            _local_2 = ((this.inState(CState.TECH_GROUND)) || (this.inState(CState.TECH_ROLL)));
            if (((((((((((!(_local_2)) && (!(m_paralysis))) && (!(this.m_smashDISelf))) && (this.m_smashDILetGo)) && ((isHitStunOrParalysis()) || ((this.inState(CState.SHIELDING)) && (!(this.m_shieldDelayTimer.IsComplete))))) && (!(this.inState(CState.CAUGHT)))) && (!(this.inState(CState.BARREL)))) && (!(this.inState(CState.CRASH_GETUP)))) && (!(this.inState(CState.CRASH_LAND)))) && (!(this.inState(CState.DEAD)))))
            {
                _local_1 = Utils.getAngleBetween(new Point(), new Point(m_xKnockback, m_yKnockback));
                if (((((this.m_up) && (!(this.m_down))) && (!(this.inState(CState.SHIELDING)))) && (!((_local_1 <= 20) || (_local_1 >= 160)))))
                {
                    _local_2 = (((this.m_techReady) && (this.m_canWallTech)) && (testTerrainWithCoord(m_sprite.x, ((m_sprite.y - (m_height / 2)) - this.m_smashDIAmount))));
                    if (m_collision.ground)
                    {
                        unnattachFromGround();
                    };
                    super.m_attemptToMove(0, -(this.m_smashDIAmount));
                    this.m_smashDILetGo = false;
                    if (_local_2)
                    {
                        this.performWallTech(true);
                    };
                }
                else
                {
                    if ((((this.m_down) && (!(this.m_up))) && (!(this.inState(CState.SHIELDING)))))
                    {
                        super.m_attemptToMove(0, this.m_smashDIAmount);
                        this.m_smashDILetGo = false;
                    };
                };
                if (((this.m_left) && (!(this.m_right))))
                {
                    _local_2 = (((this.m_techReady) && (this.m_canWallTech)) && (testTerrainWithCoord((m_sprite.x - this.m_smashDIAmount), (m_sprite.y - (m_height / 2)))));
                    super.m_attemptToMove(-(this.m_smashDIAmount), 0);
                    this.m_groundCollisionTest();
                    this.m_smashDILetGo = false;
                    if ((!(m_collision.ground)))
                    {
                        if (_local_2)
                        {
                            this.performWallTech(false);
                        };
                    };
                }
                else
                {
                    if (((this.m_right) && (!(this.m_left))))
                    {
                        _local_2 = (((this.m_techReady) && (this.m_canWallTech)) && (testTerrainWithCoord((m_sprite.x + this.m_smashDIAmount), (m_sprite.y - (m_height / 2)))));
                        super.m_attemptToMove(this.m_smashDIAmount, 0);
                        this.m_groundCollisionTest();
                        this.m_smashDILetGo = false;
                        if ((!(m_collision.ground)))
                        {
                            if (_local_2)
                            {
                                this.performWallTech(false);
                            };
                        };
                    };
                };
            };
            if (((((((((((!(_local_2)) && (!(m_paralysis))) && (!(this.m_smashDISelf))) && (this.m_smashDILetGoCStick)) && ((isHitStunOrParalysis()) || ((this.inState(CState.SHIELDING)) && (!(this.m_shieldDelayTimer.IsComplete))))) && (!(this.inState(CState.CAUGHT)))) && (!(this.inState(CState.BARREL)))) && (!(this.inState(CState.CRASH_GETUP)))) && (!(this.inState(CState.CRASH_LAND)))) && (!(this.inState(CState.DEAD)))))
            {
                _local_1 = Utils.getAngleBetween(new Point(), new Point(m_xKnockback, m_yKnockback));
                if (((((this.m_c_up) && (!(this.m_c_down))) && (!(this.inState(CState.SHIELDING)))) && (!((_local_1 <= 20) || (_local_1 >= 160)))))
                {
                    _local_2 = (((this.m_techReady) && (this.m_canWallTech)) && (testTerrainWithCoord(m_sprite.x, (m_sprite.y - this.m_smashDIAmount))));
                    if (m_collision.ground)
                    {
                        unnattachFromGround();
                    };
                    super.m_attemptToMove(0, -(this.m_smashDIAmount));
                    this.m_smashDILetGoCStick = false;
                    if (_local_2)
                    {
                        this.performWallTech(true);
                    };
                }
                else
                {
                    if ((((this.m_c_down) && (!(this.m_c_up))) && (!(this.inState(CState.SHIELDING)))))
                    {
                        super.m_attemptToMove(0, this.m_smashDIAmount);
                        this.m_smashDILetGoCStick = false;
                    };
                };
                if (((this.m_c_left) && (!(this.m_c_right))))
                {
                    _local_2 = (((this.m_techReady) && (this.m_canWallTech)) && (testTerrainWithCoord((m_sprite.x - this.m_smashDIAmount), m_sprite.y)));
                    super.m_attemptToMove(-(this.m_smashDIAmount), 0);
                    this.m_smashDILetGoCStick = false;
                    if (m_collision.ground)
                    {
                        attachToGround();
                    };
                    if (_local_2)
                    {
                        this.performWallTech(false);
                    };
                }
                else
                {
                    if (((this.m_c_right) && (!(this.m_c_left))))
                    {
                        _local_2 = (((this.m_techReady) && (this.m_canWallTech)) && (testTerrainWithCoord((m_sprite.x + this.m_smashDIAmount), m_sprite.y)));
                        super.m_attemptToMove(this.m_smashDIAmount, 0);
                        this.m_smashDILetGoCStick = false;
                        if (m_collision.ground)
                        {
                            attachToGround();
                        };
                        if (_local_2)
                        {
                            this.performWallTech(false);
                        };
                    };
                };
            };
        }

        override protected function checkHitStun():void
        {
            if (isHitStunOrParalysis())
            {
                if (m_actionShot)
                {
                    m_actionTimer--;
                    m_hitStunTimer--;
                    if (m_actionTimer < 0)
                    {
                        if (m_paralysis)
                        {
                            m_actionShot = false;
                        }
                        else
                        {
                            if ((((!(this.m_smashDISelf)) && (!(this.inState(CState.CAUGHT)))) && (!(this.inState(CState.BARREL)))))
                            {
                                this.checkDI();
                            };
                            this.stopActionShot();
                        };
                    }
                    else
                    {
                        if (m_hitStunTimer <= 0)
                        {
                            m_hitStunTimer = 2;
                            m_hitStunToggle = (!(m_hitStunToggle));
                            if (HasStance)
                            {
                                m_sprite.stance.x = (m_sprite.stance.x + ((m_hitStunToggle) ? 2 : -2));
                            };
                        };
                    };
                }
                else
                {
                    if (m_paralysis)
                    {
                        m_paralysisTimer--;
                        m_hitStunTimer--;
                        if (m_paralysisTimer < 0)
                        {
                            if ((((!(this.m_smashDISelf)) && (!(this.inState(CState.CAUGHT)))) && (!(this.inState(CState.BARREL)))))
                            {
                                this.checkDI();
                            };
                            this.stopActionShot();
                        }
                        else
                        {
                            if (m_hitStunTimer <= 0)
                            {
                                m_hitStunTimer = 2;
                                m_hitStunToggle = (!(m_hitStunToggle));
                                if (HasStance)
                                {
                                    m_sprite.stance.x = (m_sprite.stance.x + ((m_hitStunToggle) ? 2 : -2));
                                };
                            };
                        };
                    };
                };
            };
            if (((((isHitStunOrParalysis()) && (m_hitStunTimer <= 0)) && (this.m_hitLag > 0)) && (currentFrameIs("hurt"))))
            {
                if (m_hitStunTimer <= 0)
                {
                    m_hitStunTimer = 2;
                    m_hitStunToggle = (!(m_hitStunToggle));
                    if (HasStance)
                    {
                        m_sprite.stance.x = (m_sprite.stance.x + ((m_hitStunToggle) ? 2 : -2));
                    };
                };
            };
        }

        public function FaceForward(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                this.m_faceRight();
                m_facingForward = true;
            }
            else
            {
                this.m_faceLeft();
                m_facingForward = false;
            };
            m_facingForward = _arg_1;
        }

        private function setAlpha(_arg_1:Number):void
        {
            if (_arg_1 > 1)
            {
                _arg_1 = 1;
            }
            else
            {
                if (_arg_1 < 0)
                {
                    _arg_1 = 0;
                };
            };
            m_sprite.alpha = _arg_1;
        }

        private function updateTint():void
        {
            if ((((m_team_id > 0) && (!(ModeFeatures.hasFeature(ModeFeatures.IGNORE_TEAM_COSTUME, STAGEDATA.GameRef.GameMode)))) && (m_sprite.filters == null)))
            {
                switch (m_team_id)
                {
                    case 1:
                        setTint(1, 1, 1, 1, 90, 0, 0, 0);
                        return;
                    case 2:
                        setTint(1, 1, 1, 1, 0, 90, 0, 0);
                        return;
                    case 3:
                        setTint(1, 1, 1, 1, 0, 0, 90, 0);
                        return;
                };
            };
        }

        public function advanceAllEffects():void
        {
            this.m_yoshiEggMC.stance.nextFrame();
        }

        public function pauseAllEffects():void
        {
            if ((((((!(this.m_starKOMC == null)) && (!(this.m_starKOMC.parent == null))) && (!(this.m_starKOMC.parent.parent == null))) && (!(this.m_starKOMC.root == null))) && (this.m_starKOMC.stance)))
            {
                MovieClip(this.m_starKOMC.parent.parent).stop();
                this.m_starKOMC.stance.stop();
            };
            this.m_pidHolderMC.visible = false;
            if ((((this.HoldingItem) && (HasItemBox)) && (!(this.m_itemMC == null))))
            {
                this.m_itemMC.stop();
            };
            if (this.m_chargeGlowHolderMC != null)
            {
                Utils.recursiveMovieClipPlay(this.m_chargeGlowHolderMC, false, true);
                this.m_chargeGlowHolderMC.stop();
            };
            Utils.recursiveMovieClipPlay(this.m_shieldHolderMC, false, true);
            this.m_shieldHolderMC.stop();
            if (this.m_item2)
            {
                this.m_fsGlowHolderMC.stop();
            };
            if (this.m_warioWareIcon)
            {
                this.m_warioWareIcon.stop();
            };
            this.m_poisonEffect.stop();
            this.m_pitfallEffect.stop();
            this.m_burnSmoke.stop();
            this.m_starmanInvincibility.stop();
            this.m_healEffect.stop();
            if (this.m_offScreenBubble)
            {
                this.m_offScreenBubble.visible = false;
            };
        }

        public function playAllEffects():void
        {
            if ((((this.HoldingItem) && (HasItemBox)) && (!(this.m_itemMC == null))))
            {
                this.m_itemMC.play();
            };
            if (this.m_chargeGlowHolderMC != null)
            {
                Utils.recursiveMovieClipPlay(this.m_chargeGlowHolderMC, true, true);
                this.m_chargeGlowHolderMC.play();
            };
            if (this.m_item2)
            {
                this.m_fsGlowHolderMC.play();
            };
            if ((((((!(this.m_starKOMC == null)) && (!(this.m_starKOMC.parent == null))) && (!(this.m_starKOMC.parent.parent == null))) && (!(this.m_starKOMC.root == null))) && (this.m_starKOMC.stance)))
            {
                MovieClip(this.m_starKOMC.parent.parent).nextFrame();
                Utils.recursiveMovieClipPlay(this.m_starKOMC.stance, true);
            };
            Utils.recursiveMovieClipPlay(this.m_shieldHolderMC, true, true);
            this.m_shieldHolderMC.play();
            this.m_pidHolderMC.visible = true;
            if (this.m_warioWareIcon)
            {
                this.m_warioWareIcon.play();
            };
            this.m_poisonEffect.play();
            this.m_pitfallEffect.play();
            this.m_burnSmoke.play();
            this.m_starmanInvincibility.play();
            this.m_healEffect.play();
            if (this.m_offScreenBubble)
            {
                this.m_offScreenBubble.visible = true;
            };
        }

        private function checkPause():void
        {
            var _local_1:int;
            var _local_2:Character;
            _local_1 = 0;
            if (((((((((this.m_human) && (ModeFeatures.hasFeature(ModeFeatures.ALLOW_STOCK_STEAL, STAGEDATA.GameRef.GameMode))) && (!(STAGEDATA.Paused))) && (m_team_id > 0)) && (STAGEDATA.GameRef.UsingLives)) && (this.m_lives <= 0)) && (this.m_pause)) && (this.m_pauseLetGo)))
            {
                _local_1 = 1;
                while (_local_1 <= Main.MAXPLAYERS)
                {
                    _local_2 = STAGEDATA.getPlayer(_local_1);
                    if ((((((_local_2) && (!(_local_2.ID == m_player_id))) && (_local_2.Team == m_team_id)) && (!(_local_2.Dead))) && (_local_2.getLives() > 1)))
                    {
                        _local_2.stealStock();
                        this.m_lives++;
                        m_sprite.x = this.m_characterStats.XRespawn;
                        m_sprite.y = this.m_characterStats.YRespawn;
                        this.reset();
                        m_invincible = true;
                        this.setState(CState.REVIVAL);
                        this.m_pauseLetGo = false;
                        this.HealthBox.visible = true;
                        this.updateLivesDisplay();
                        return;
                    };
                    _local_1++;
                };
            };
            if ((!(this.m_key.IsDown(this.m_key._START))))
            {
                this.m_pauseLetGo = true;
            };
        }

        private function updateComboValues():void
        {
            var _local_1:Character;
            _local_1 = ((this.m_comboID > 0) ? STAGEDATA.getPlayer(this.m_comboID) : null);
            if (_local_1 != null)
            {
                if ((!(((((((((((_local_1.ActionShot) || (_local_1.HitLag > 0)) || (_local_1.inState(CState.CRASH_GETUP))) || (_local_1.inState(CState.CRASH_LAND))) || (_local_1.inState(CState.TECH_GROUND))) || (_local_1.inState(CState.TECH_ROLL))) || (_local_1.inState(CState.ROLL))) || (_local_1.inState(CState.CRASH_GETUP))) || (_local_1.inState(CState.CAUGHT))) || (_local_1.inState(CState.INJURED))) || (_local_1.inState(CState.FLYING)))))
                {
                    if (this.m_comboTimer.IsComplete)
                    {
                        this.m_comboCount = 0;
                        this.m_comboID = 0;
                        this.m_comboDamage = 0;
                        this.m_comboDamageTotal = 0;
                    }
                    else
                    {
                        this.m_comboTimer.tick();
                    };
                };
            };
        }

        private function m_checkHardCoding():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:int;
            var _local_4:Point;
            var _local_5:int;
            var _local_6:Item;
            if (((((this.inState(CState.ATTACKING)) && (this.m_usingSpecialAttack)) && (this.m_characterStats.LinkageID == "black_mage")) && (m_attack.ExecTime == 147)))
            {
                _local_1 = ((30 * (CAM.Width * CAM.Height)) / 1699152);
                _local_2 = (12 + _local_1);
                _local_2 = Math.min(30, _local_2);
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _local_4 = STAGEDATA.ItemsRef.getRandomLocation();
                    _local_5 = Utils.randomInteger(1, 3);
                    switch (_local_5)
                    {
                        case 1:
                            STAGEDATA.spawnEnemy(BM_Goblin, _local_4.x, _local_4.y, m_player_id);
                            break;
                        case 2:
                            STAGEDATA.spawnEnemy(BM_Bomb, _local_4.x, _local_4.y, m_player_id);
                            break;
                        case 3:
                            STAGEDATA.spawnEnemy(BM_Wolf, _local_4.x, _local_4.y, m_player_id);
                            break;
                    };
                    _local_3++;
                };
            }
            else
            {
                if ((((this.inFreeState()) && (m_collision.ground)) && (this.m_up)))
                {
                    _local_6 = this.getBike();
                    if ((((((!(_local_6 == null)) && (_local_6.HasHitBox)) && (!(_local_6.PickedUp))) && (HasHitBox)) && (_local_6.MC.hitBox.hitTestObject(m_sprite.stance.hitBox))))
                    {
                        this.Attack("b", 2);
                        this.playFrame("b");
                        if (this.m_currentPower != null)
                        {
                            this.stancePlayFrame((this.m_currentPower + "_getback"));
                        }
                        else
                        {
                            this.stancePlayFrame("getback");
                        };
                        STAGEDATA.ItemsRef.killItem(_local_6.Slot);
                    };
                };
            };
        }

        private function checkStarKOClips():void
        {
            if ((((this.m_starKOHolder) && (this.m_starKOHolder.visible)) && (this.m_starKOHolder.currentFrame >= this.m_starKOHolder.totalFrames)))
            {
                this.m_starKOMC.visible = false;
                this.m_starKOMC.stance.gotoAndStop(1);
                this.m_starKOHolder.visible = false;
                this.m_starKOHolder.gotoAndStop(1);
            };
            if ((((this.m_screenKOHolder) && (this.m_screenKOHolder.visible)) && (this.m_screenKOHolder.currentFrame >= this.m_screenKOHolder.totalFrames)))
            {
                this.m_starKOMC.visible = false;
                this.m_starKOMC.stance.gotoAndStop(1);
                this.m_screenKOHolder.visible = false;
                this.m_screenKOHolder.gotoAndStop(1);
            };
        }

        override public function PERFORMALL():void
        {
            var _local_1:int;
            var _local_2:Boolean;
            var _local_3:Boolean;
            var _local_4:Boolean;
            var _local_5:Boolean;
            var _local_6:Boolean;
            var _local_7:Boolean;
            var _local_8:Boolean;
            var _local_9:Boolean;
            var _local_10:Boolean;
            if ((((!(this.inState(CState.DEAD))) && ((!(STAGEDATA.Paused)) || (((STAGEDATA.FSCutscene) && (this.m_usingSpecialAttack)) && (!(STAGEDATA.ActuallyPaused))))) && (!(this.m_standby))))
            {
                this.m_getKey();
                this.checkRecovery();
                this.checkHitStun();
                this.checkStats();
                this.checkFrameControl();
                this.advanceAllEffects();
                this.checkTimers();
                this.checkHitLag();
                this.m_checkRevival();
                this.m_checkBounds();
                this.m_checkDeath();
                this.m_checkInvincible();
                this.m_checkStun();
                this.m_checkDizzy();
                this.m_checkPitfall();
                this.m_checkFrozen();
                this.m_checkSleeping();
                this.m_checkEgg();
                this.m_checkHardCoding();
                this.m_checkTeching();
                this.m_forces();
                this.m_groundCollisionTest();
                this.m_checkItem();
                this.m_charShield();
                this.m_charGrab();
                this.m_charJump();
                this.m_charAttack();
                this.m_charRoll();
                this.m_charHang();
                this.m_charCrouch();
                this.m_charRun();
                this.m_charWallCling();
                this.m_charFall();
                this.m_charGlide();
                this.m_checkTaunt();
                this.m_pushAwayItems();
                this.m_pushAwayOpponents();
                this.pushAwayFromWalls();
                this.m_checkFinalForm();
                this.m_flipDirection();
                this.checkRocket();
                this.checkDI();
                this.getLastYPosition();
                this.checkFrameControl();
                this.updateTint();
                this.checkOffScreenBubble();
                this.checkShadow();
                this.updateComboValues();
                this.checkPause();
                this.m_pauseFreeze = false;
                checkShowHitBoxes();
                this.positionEffects();
                this.checkStarKOClips();
                this.checkSyncedProjectiles();
                this.checkDeadProjectiles();
                this.updateItemHolding();
            }
            else
            {
                if (((STAGEDATA.ActuallyPaused) && (!(STAGEDATA.GameEnded))))
                {
                    if ((!(this.m_pauseFreeze)))
                    {
                        this.m_pauseFreeze = true;
                        if (HasStance)
                        {
                            MC.stance.stop();
                        };
                        this.pauseAllEffects();
                        this.m_pauseLetGo = false;
                        Utils.recursiveMovieClipPlay(m_sprite.stance, false);
                    };
                    this.m_getKey();
                    _local_1 = 0;
                    if (((this.m_human) && (m_player_id == STAGEDATA.PausedID)))
                    {
                        if (((this.m_a) && (!(this.m_b))))
                        {
                            CAM.zoomIn();
                            if (CAM.Height < this.m_pauseCamHeight)
                            {
                                if (((this.m_screenKO) && (!(this.m_starKOMC == null))))
                                {
                                    this.m_starKOMC.visible = false;
                                };
                                _local_1 = 0;
                                while (_local_1 < this.m_opponents.length)
                                {
                                    if (((STAGEDATA.getPlayer(this.m_opponents[_local_1]).ScreenKO) && (!(STAGEDATA.getPlayer(this.m_opponents[_local_1]).StarKOMC == null))))
                                    {
                                        STAGEDATA.getPlayer(this.m_opponents[_local_1]).StarKOMC.visible = false;
                                    };
                                    _local_1++;
                                };
                            };
                        }
                        else
                        {
                            if (((this.m_b) && (!(this.m_a))))
                            {
                                CAM.zoomOut();
                                if (CAM.Height >= this.m_pauseCamHeight)
                                {
                                    if (((this.m_screenKO) && (!(this.m_starKOMC == null))))
                                    {
                                        this.m_starKOMC.visible = true;
                                    };
                                    _local_1 = 0;
                                    while (_local_1 < this.m_opponents.length)
                                    {
                                        if (((STAGEDATA.getPlayer(this.m_opponents[_local_1]).ScreenKO) && (!(STAGEDATA.getPlayer(this.m_opponents[_local_1]).StarKOMC == null))))
                                        {
                                            STAGEDATA.getPlayer(this.m_opponents[_local_1]).StarKOMC.visible = true;
                                        };
                                        _local_1++;
                                    };
                                };
                            };
                        };
                        if (this.m_left)
                        {
                            CAM.panLeft();
                        };
                        if (this.m_right)
                        {
                            CAM.panRight();
                        };
                        if (this.m_down)
                        {
                            CAM.panDown();
                        };
                        if (this.m_up)
                        {
                            CAM.panUp();
                        };
                    }
                    else
                    {
                        if (((!(STAGEDATA.GameEnded)) && (m_player_id == STAGEDATA.PausedID)))
                        {
                            _local_2 = (((this.m_key.IsDown(this.m_key._LEFT)) || ((STAGEDATA.getPlayer(1) == null) && (STAGEDATA.getControllerNum(1).IsDown(STAGEDATA.getControllerNum(1)._LEFT)))) ? true : false);
                            _local_3 = (((this.m_key.IsDown(this.m_key._RIGHT)) || ((STAGEDATA.getPlayer(1) == null) && (STAGEDATA.getControllerNum(1).IsDown(STAGEDATA.getControllerNum(1)._RIGHT)))) ? true : false);
                            _local_4 = (((this.m_key.IsDown(this.m_key._UP)) || ((STAGEDATA.getPlayer(1) == null) && (STAGEDATA.getControllerNum(1).IsDown(STAGEDATA.getControllerNum(1)._UP)))) ? true : false);
                            _local_5 = (((this.m_key.IsDown(this.m_key._DOWN)) || ((STAGEDATA.getPlayer(1) == null) && (STAGEDATA.getControllerNum(1).IsDown(STAGEDATA.getControllerNum(1)._DOWN)))) ? true : false);
                            _local_6 = ((this.m_key.IsDown(this.m_key._BUTTON1)) || ((STAGEDATA.getPlayer(1) == null) && (STAGEDATA.getControllerNum(1).IsDown(STAGEDATA.getControllerNum(1)._BUTTON1))));
                            _local_7 = ((this.m_key.IsDown(this.m_key._BUTTON2)) || ((STAGEDATA.getPlayer(1) == null) && (STAGEDATA.getControllerNum(1).IsDown(STAGEDATA.getControllerNum(1)._BUTTON2))));
                            _local_8 = ((this.m_key.IsDown(this.m_key._SHIELD)) ? true : false);
                            _local_9 = ((this.m_key.IsDown(this.m_key._GRAB)) ? true : false);
                            _local_10 = ((STAGEDATA.PausedID == m_player_id) ? ((this.m_key.IsDown(this.m_key._START)) || ((STAGEDATA.getPlayer(1) == null) && (STAGEDATA.getControllerNum(1).IsDown(STAGEDATA.getControllerNum(1)._START)))) : this.m_pause);
                            if (((_local_7) && (!(_local_6))))
                            {
                                CAM.zoomIn();
                                if (CAM.Height < this.m_pauseCamHeight)
                                {
                                    if (((this.m_screenKO) && (!(this.m_starKOMC == null))))
                                    {
                                        this.m_starKOMC.visible = false;
                                    };
                                    _local_1 = 0;
                                    while (_local_1 < this.m_opponents.length)
                                    {
                                        if (((STAGEDATA.getPlayer(this.m_opponents[_local_1]).ScreenKO) && (!(STAGEDATA.getPlayer(this.m_opponents[_local_1]).StarKOMC == null))))
                                        {
                                            STAGEDATA.getPlayer(this.m_opponents[_local_1]).StarKOMC.visible = false;
                                        };
                                        _local_1++;
                                    };
                                };
                            }
                            else
                            {
                                if (((_local_6) && (!(_local_7))))
                                {
                                    CAM.zoomOut();
                                    if (CAM.Height >= this.m_pauseCamHeight)
                                    {
                                        if (((this.m_screenKO) && (!(this.m_starKOMC == null))))
                                        {
                                            this.m_starKOMC.visible = true;
                                        };
                                        _local_1 = 0;
                                        while (_local_1 < this.m_opponents.length)
                                        {
                                            if (((STAGEDATA.getPlayer(this.m_opponents[_local_1]).ScreenKO) && (!(STAGEDATA.getPlayer(this.m_opponents[_local_1]).StarKOMC == null))))
                                            {
                                                STAGEDATA.getPlayer(this.m_opponents[_local_1]).StarKOMC.visible = true;
                                            };
                                            _local_1++;
                                        };
                                    };
                                };
                            };
                            if (_local_2)
                            {
                                CAM.panLeft();
                            };
                            if (_local_3)
                            {
                                CAM.panRight();
                            };
                            if (_local_5)
                            {
                                CAM.panDown();
                            };
                            if (_local_4)
                            {
                                CAM.panUp();
                            };
                        };
                    };
                    this.checkPause();
                }
                else
                {
                    if ((((this.inState(CState.DEAD)) || ((!(this.inState(CState.DEAD))) && (this.m_standby))) && (!(STAGEDATA.ActuallyPaused))))
                    {
                        if ((!(this.m_standby)))
                        {
                            this.m_getKey();
                            this.checkPause();
                            this.m_pauseFreeze = false;
                        };
                        this.checkStarKOClips();
                    };
                };
            };
        }

        override public function PREPERFORM():void
        {
            if (STAGEDATA.OnlineMode)
            {
                this.m_preFrameInfo = this.getFrameData();
            };
            if ((((((((m_started) && (HasStance)) && (!(this.inState(CState.DEAD)))) && (!(this.m_standby))) && (!(this.m_freezePlayback))) && ((!(STAGEDATA.Paused)) || (((STAGEDATA.FSCutscene) && (this.m_usingSpecialAttack)) && (!(STAGEDATA.ActuallyPaused))))) && (!(isHitStunOrParalysis()))))
            {
                Utils.advanceFrame(m_sprite.stance);
                Utils.recursiveMovieClipPlay(m_sprite.stance, true);
            };
            if (((((((((((!(STAGEDATA.Paused)) || (((STAGEDATA.FSCutscene) && (this.m_usingSpecialAttack)) && (!(STAGEDATA.ActuallyPaused)))) && (m_started)) && (!(this.m_starKOMC == null))) && (!(this.m_starKOMC.parent == null))) && (!(this.m_starKOMC.parent.parent == null))) && (!(this.m_starKOMC.root == null))) && (this.m_starKOMC.stance)) && (!(this.m_freezePlayback))) && (this.m_starKOMC.visible)))
            {
                MovieClip(this.m_starKOMC.parent.parent).nextFrame();
                Utils.recursiveMovieClipPlay(this.m_starKOMC.stance, true);
                Utils.advanceFrame(this.m_starKOMC.stance);
            };
        }

        override public function POSTPERFORM():void
        {
            if (HasStance)
            {
                m_sprite.stance.stop();
                Utils.recursiveMovieClipPlay(m_sprite.stance, false);
            };
            if ((((((!(this.m_starKOMC == null)) && (!(this.m_starKOMC.parent == null))) && (!(this.m_starKOMC.parent.parent == null))) && (!(this.m_starKOMC.root == null))) && (this.m_starKOMC.stance)))
            {
                MovieClip(this.m_starKOMC.parent.parent).stop();
                Utils.recursiveMovieClipPlay(this.m_starKOMC.stance, false);
                this.m_starKOMC.stance.stop();
            };
            m_started = true;
        }


    }
}//package com.mcleodgaming.ssf2.engine