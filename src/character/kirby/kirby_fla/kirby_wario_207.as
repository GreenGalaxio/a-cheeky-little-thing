// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_wario_207

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.xml.*;

    public dynamic class kirby_wario_207 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var touchBox:MovieClip;
        public var theOpponent:*;
        public var controls2:Object;
        public var formerControl:Object;
        public var controls:Object;
        public var wasPressingAlready:*;
        public var facing:Boolean;
        public var flip:Boolean;
        public var playedOnce:*;
        public var happenedAlready:*;
        public var waitTimer:*;
        public var endTimer:int;
        public var damageDivide:*;
        public var mashInfluence:*;
        public var chewCount:*;
        public var throwStats:*;
        public var backThrowStats:*;
        public var mouthCloseStats:*;
        public var self:*;

        public function kirby_wario_207()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 7, this.frame8, 8, this.frame9, 13, this.frame14, 14, this.frame15, 19, this.frame20, 20, this.frame21, 22, this.frame23, 25, this.frame26, 26, this.frame27, 31, this.frame32, 32, this.frame33, 34, this.frame35, 37, this.frame38, 38, this.frame39, 43, this.frame44, 44, this.frame45, 46, this.frame47, 48, this.frame49);
        }

        public function clearTimers():void
        {
            SSF2API.destroyTimer(this.self, this.openMouth);
            SSF2API.destroyTimer(this.self, this.heldControls);
            SSF2API.destroyTimer(this.self, this.getFree);
        }

        public function openMouth():void
        {
            this.controls = this.self.getControls();
            this.waitTimer--;
            if (this.self.getGrabbedOpponent())
            {
                gotoAndPlay("grabbed");
                SSF2API.destroyTimer(this.self, this.openMouth);
            }
            else
            {
                if (((this.waitTimer < 0) || (!(this.controls.BUTTON1))))
                {
                    gotoAndPlay("fail");
                };
            };
        }

        public function heldControls():void
        {
            this.controls = this.self.getControls();
            if (!this.wasPressingAlready)
            {
                if (((this.controls.BUTTON2) || (this.controls.BUTTON1)))
                {
                    this.gotoAndPlay("chew");
                };
            };
            if ((((this.chewCount < 0) || ((this.facing) && (this.controls.RIGHT))) || ((!(this.facing)) && (this.controls.LEFT))))
            {
                this.gotoAndPlay("throw");
            };
            if ((((this.facing) && (this.controls.LEFT)) || ((!(this.facing)) && (this.controls.RIGHT))))
            {
                this.gotoAndPlay("throwback");
            };
            if (((!(this.controls.BUTTON1)) && (!(this.controls.BUTTON2))))
            {
                this.wasPressingAlready = false;
            };
        }

        public function getFree():void
        {
            this.endTimer--;
            if (this.endTimer < 0)
            {
                gotoAndPlay("throw");
                SSF2API.destroyTimer(this.self, this.getFree);
                return;
            };
            this.controls2 = this.theOpponent.getControls();
            if (((this.controls2.UP) && (!(this.formerControl == "up"))))
            {
                this.formerControl = "up";
                this.endTimer = (this.endTimer - this.mashInfluence);
            }
            else
            {
                if (((this.controls2.DOWN) && (!(this.formerControl == "down"))))
                {
                    this.formerControl = "down";
                    this.endTimer = (this.endTimer - this.mashInfluence);
                }
                else
                {
                    if (((this.controls2.LEFT) && (!(this.formerControl == "left"))))
                    {
                        this.formerControl = "left";
                        this.endTimer = (this.endTimer - this.mashInfluence);
                    }
                    else
                    {
                        if (((this.controls2.RIGHT) && (!(this.formerControl == "right"))))
                        {
                            this.formerControl = "right";
                            this.endTimer = (this.endTimer - this.mashInfluence);
                        }
                        else
                        {
                            if (((this.controls2.BUTTON1) && (!(this.formerControl == "button1"))))
                            {
                                this.formerControl = "button1";
                                this.endTimer = (this.endTimer - this.mashInfluence);
                            }
                            else
                            {
                                if (((this.controls2.BUTTON2) && (!(this.formerControl == "button2"))))
                                {
                                    this.formerControl = "button2";
                                    this.endTimer = (this.endTimer - this.mashInfluence);
                                }
                                else
                                {
                                    if (((this.controls2.GRAB) && (!(this.formerControl == "grab"))))
                                    {
                                        this.formerControl = "grab";
                                        this.endTimer = (this.endTimer - this.mashInfluence);
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        internal function frame1():*
        {
            this.wasPressingAlready = true;
            this.facing = false;
            this.flip = false;
            this.playedOnce = false;
            this.happenedAlready = false;
            this.waitTimer = 90;
            this.endTimer = 90;
            this.damageDivide = 4;
            this.mashInfluence = 2;
            this.chewCount = 3;
            this.throwStats = {
                "hasEffect":true,
                "damage":6,
                "weightKB":24,
                "hitLag":-1,
                "hitStun":1,
                "selfHitStun":0,
                "effect_id":null,
                "effectSound":"brawl_punch_s",
                "direction":56
            };
            this.backThrowStats = {
                "hasEffect":true,
                "damage":6,
                "weightKB":24,
                "hitLag":-1,
                "hitStun":1,
                "selfHitStun":0,
                "effect_id":null,
                "effectSound":"brawl_punch_s",
                "direction":146
            };
            this.mouthCloseStats = {
                "hasEffect":true,
                "power":70,
                "kbConstant":50,
                "damage":10,
                "weightKB":0,
                "hitLag":-1,
                "hitStun":4,
                "selfHitStun":3,
                "effect_id":"effect_swordSlash",
                "direction":50
            };
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                this.controls = this.self.getControls();
                this.facing = this.self.isFacingRight();
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, function ():*
                {
                    self.resetMovement();
                });
                if (this.self.isOnGround())
                {
                    this.self.resetMovement();
                };
            };
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
            this.self.playVoiceSound(1);
        }

        internal function frame4():*
        {
            this.clearTimers();
            if (this.playedOnce)
            {
                SSF2API.createTimer(this.self, 1, 0, this.openMouth);
            };
        }

        internal function frame8():*
        {
            this.playedOnce = true;
            this.gotoAndPlay("openWait");
        }

        internal function frame9():*
        {
            this.clearTimers();
            SSF2API.createTimer(this.self, 1, 0, this.heldControls);
            SSF2API.createTimer(this.self, 1, 0, this.getFree);
            this.self.swapDepthsWithGrabbedOpponent(true);
            this.self.updateAttackBoxStats(1, {"bypassNonGrabbed":true});
            if (!this.happenedAlready)
            {
                this.happenedAlready = true;
                this.theOpponent = this.self.getGrabbedOpponent();
                this.controls2 = this.theOpponent.getControls();
                this.endTimer = (this.endTimer + (this.theOpponent.getDamage() / this.damageDivide));
            };
        }

        internal function frame14():*
        {
            gotoAndPlay("grabbed");
        }

        internal function frame15():*
        {
            this.clearTimers();
            SSF2API.createTimer(this.self, 1, 0, this.getFree);
            this.chewCount--;
            this.self.refreshAttackID();
        }

        internal function frame20():*
        {
            if (((this.chewCount < 0) || (this.endTimer < 0)))
            {
                gotoAndPlay("throw");
            }
            else
            {
                this.gotoAndPlay("grabbed");
            };
            this.controls = this.self.getControls();
            if (((this.controls.BUTTON1) || (this.controls.BUTTON2)))
            {
                this.wasPressingAlready = true;
            };
        }

        internal function frame21():*
        {
            this.clearTimers();
            this.self.updateAttackBoxStats(1, this.throwStats);
            this.self.refreshAttackID();
        }

        internal function frame23():*
        {
            this.self.swapDepthsWithGrabbedOpponent(false);
        }

        internal function frame26():*
        {
            this.self.playVoiceSound(2);
        }

        internal function frame27():*
        {
            this.self.releaseOpponent();
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }

        internal function frame33():*
        {
            this.clearTimers();
            this.self.updateAttackBoxStats(1, this.backThrowStats);
            this.self.refreshAttackID();
            this.flip = true;
        }

        internal function frame35():*
        {
            this.self.swapDepthsWithGrabbedOpponent(false);
        }

        internal function frame38():*
        {
            this.self.playVoiceSound(2);
        }

        internal function frame39():*
        {
            this.self.releaseOpponent();
        }

        internal function frame44():*
        {
            this.self.endAttack();
        }

        internal function frame45():*
        {
            this.clearTimers();
            if (this.self.getGrabbedOpponent())
            {
                gotoAndPlay("grabbed");
            };
            if (this.flip)
            {
                this.self.flip();
            };
            this.self.updateAttackBoxStats(1, this.mouthCloseStats);
        }

        internal function frame47():*
        {
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
        }

        internal function frame49():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

