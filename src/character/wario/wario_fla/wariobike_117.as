// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.wariobike_117

package wario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
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
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class wariobike_117 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
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

        public function wariobike_117()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 7, this.frame8, 8, this.frame9, 12, this.frame13, 13, this.frame14, 14, this.frame15, 19, this.frame20, 20, this.frame21, 22, this.frame23, 26, this.frame27, 31, this.frame32, 32, this.frame33, 34, this.frame35, 38, this.frame39, 43, this.frame44, 44, this.frame45, 46, this.frame47, 48, this.frame49);
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
            };
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
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
            this.self.swapDepthsWithGrabbedOpponent(true);
            this.self.updateAttackBoxStats(1, {"bypassNonGrabbed":true});
            if (!this.happenedAlready)
            {
                this.happenedAlready = true;
                this.theOpponent = this.self.getGrabbedOpponent();
                this.controls2 = this.theOpponent.getControls();
                this.endTimer = (this.endTimer + (this.theOpponent.getDamage() / this.damageDivide));
            };
            this.clearTimers();
            SSF2API.createTimer(this.self, 1, 0, this.heldControls);
            SSF2API.createTimer(this.self, 1, 0, this.getFree);
        }

        internal function frame13():*
        {
        }

        internal function frame14():*
        {
            gotoAndPlay("grabbed");
        }

        internal function frame15():*
        {
            this.chewCount--;
            this.self.refreshAttackID();
            this.clearTimers();
            SSF2API.createTimer(this.self, 1, 0, this.getFree);
        }

        internal function frame20():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.BUTTON1) || (this.controls.BUTTON2)))
            {
                this.wasPressingAlready = true;
            };
            if (((this.chewCount < 0) || (this.endTimer < 0)))
            {
                gotoAndPlay("throw");
            }
            else
            {
                this.gotoAndPlay("grabbed");
            };
        }

        internal function frame21():*
        {
            this.self.updateAttackBoxStats(1, this.throwStats);
            this.self.refreshAttackID();
            this.clearTimers();
        }

        internal function frame23():*
        {
            this.self.swapDepthsWithGrabbedOpponent(false);
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
            this.self.updateAttackBoxStats(1, this.backThrowStats);
            this.self.refreshAttackID();
            this.flip = true;
            this.clearTimers();
        }

        internal function frame35():*
        {
            this.self.swapDepthsWithGrabbedOpponent(false);
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
            if (this.flip)
            {
                this.self.flip();
            };
            this.self.updateAttackBoxStats(1, this.mouthCloseStats);
            this.clearTimers();
            if (this.self.getGrabbedOpponent())
            {
                gotoAndPlay("grabbed");
            };
        }

        internal function frame47():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame49():*
        {
            this.self.endAttack();
        }


    }
}//package wario_fla

