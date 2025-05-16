// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_rock_52

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class kirby_rock_52 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var rocktype:String;
        public var kirbyPower:*;
        public var weightDirection:Boolean;
        public var directionMemory:Boolean;
        public var kirbyrock:Number;
        public var tempVar:*;
        public var waiting:*;

        public function kirby_rock_52()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 14, this.frame15, 15, this.frame16, 17, this.frame18, 18, this.frame19, 22, this.frame23, 23, this.frame24, 25, this.frame26, 32, this.frame33, 36, this.frame37, 48, this.frame49, 49, this.frame50, 50, this.frame51, 52, this.frame53, 53, this.frame54, 57, this.frame58, 60, this.frame61, 67, this.frame68, 71, this.frame72, 72, this.frame73, 74, this.frame75, 75, this.frame76, 79, this.frame80, 82, this.frame83, 91, this.frame92, 92, this.frame93, 94, this.frame95, 95, this.frame96, 99, this.frame100, 102, this.frame103, 109, this.frame110, 113, this.frame114, 115, this.frame116, 125, this.frame126, 126, this.frame127, 128, this.frame129, 129, this.frame130, 133, this.frame134, 136, this.frame137, 143, this.frame144, 147, this.frame148, 149, this.frame150, 159, this.frame160, 160, this.frame161, 162, this.frame163, 163, this.frame164, 167, this.frame168, 170, this.frame171, 177, this.frame178, 181, this.frame182, 193, this.frame194, 194, this.frame195, 196, this.frame197, 200, this.frame201, 201, this.frame202, 203, this.frame204, 210, this.frame211, 214, this.frame215, 224, this.frame225, 226, this.frame227, 227, this.frame228, 229, this.frame230, 234, this.frame235, 237, this.frame238, 244, this.frame245, 248, this.frame249);
        }

        public function rockDrop():void
        {
            this.self.setYSpeed(19);
        }

        public function rockTimer():void
        {
            this.waiting = true;
        }

        public function rockSound():void
        {
            this.self.playAttackSound(1);
            SSF2API.destroyTimer(this.self, this.rockSound);
        }

        public function rockEnd():void
        {
            SSF2API.destroyTimer(this.self, this.rockTimer);
            SSF2API.destroyTimer(this.self, this.rockEnd);
            gotoAndPlay("finish");
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.rocktype = "normal";
                this.kirbyPower = this.self.getCurrentKirbyPower();
                this.weightDirection = this.self.isFacingRight();
                this.directionMemory = false;
                this.kirbyrock = SSF2API.random();
                this.self.setYSpeed(-8);
                this.self.updateAttackStats({"air_ease":0});
                SSF2API.createTimer(this.self, 24, 0, this.rockTimer);
                SSF2API.createTimer(this.self, 91, 0, this.rockEnd);
                SSF2API.createTimer(this.self, 4, 0, this.rockSound);
            };
        }

        internal function frame2():*
        {
            this.waiting = false;
            this.self.updateAttackStats({"invincible":false});
        }

        internal function frame3():*
        {
            this.self.setYSpeed(0);
            if (((this.kirbyrock >= 0.2125) && (this.kirbyrock < 0.425)))
            {
                this.rocktype = "weight";
            }
            else
            {
                if (((this.kirbyrock >= 0.425) && (this.kirbyrock < 0.6375)))
                {
                    this.rocktype = "panel";
                }
                else
                {
                    if (((this.kirbyrock >= 0.6375) && (this.kirbyrock < 0.85)))
                    {
                        this.rocktype = "spikes";
                    }
                    else
                    {
                        if (((this.kirbyrock >= 0.85) && (this.kirbyrock < 0.98)))
                        {
                            this.rocktype = "thwomp";
                        }
                        else
                        {
                            if (((this.kirbyrock >= 0.98) && (this.kirbyrock < 0.99)))
                            {
                                this.rocktype = "moon";
                            }
                            else
                            {
                                if (((this.kirbyrock >= 0.99) && (this.kirbyrock <= 1)))
                                {
                                    this.rocktype = "landmaster";
                                }
                                else
                                {
                                    this.rocktype = "normal";
                                };
                            };
                        };
                    };
                };
            };
            if (this.rocktype != null)
            {
                this.gotoAndPlay(this.rocktype);
            };
        }

        internal function frame15():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.rockDrop);
        }

        internal function frame16():*
        {
            this.self.updateAttackStats({
                "air_ease":-1,
                "invincible":true
            });
            if (this.self.isOnGround())
            {
                this.self.updateAttackStats({"allowControl":false});
                this.gotoAndPlay("continue");
            };
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            stop();
        }

        internal function frame18():*
        {
            gotoAndStop("freeze");
        }

        internal function frame19():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.playAttackSound(3);
            SSF2API.destroyTimer(this.self, this.rockDrop);
            this.tempVar = ("continue_" + this.rocktype);
            if (this.rocktype != "normal")
            {
                if (this.rocktype == "weight")
                {
                    if (!this.weightDirection)
                    {
                        this.tempVar = "continue_weight_left";
                    }
                    else
                    {
                        this.tempVar = "continue_weight_right";
                    };
                };
                gotoAndPlay(this.tempVar);
            }
            else
            {
                this.self.updateAttackBoxStats(1, {
                    "power":40,
                    "kbConstant":0,
                    "direction":10
                });
                play();
            };
        }

        internal function frame23():*
        {
            gotoAndPlay("repeat_rock");
        }

        internal function frame24():*
        {
            this.self.playVoiceSound(1);
            SSF2API.destroyTimer(this.self, this.rockTimer);
            SSF2API.destroyTimer(this.self, this.rockEnd);
            this.self.updateAttackStats({"air_ease":0});
            this.waiting = false;
            this.tempVar = ("finish_" + this.rocktype);
            if (this.rocktype != "normal")
            {
                gotoAndPlay(this.tempVar);
            };
        }

        internal function frame26():*
        {
            this.self.updateAttackStats({"invincible":false});
        }

        internal function frame33():*
        {
            this.self.unnattachFromGround();
            this.self.setYSpeed(-5);
        }

        internal function frame37():*
        {
            this.self.endAttack();
        }

        internal function frame49():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.rockDrop);
        }

        internal function frame50():*
        {
            if (this.weightDirection)
            {
                gotoAndPlay("weight_right");
            }
            else
            {
                gotoAndPlay("weight_left");
            };
        }

        internal function frame51():*
        {
            this.self.updateAttackStats({
                "air_ease":-1,
                "invincible":true
            });
            if (this.self.isOnGround())
            {
                this.self.updateAttackStats({"allowControl":false});
                this.gotoAndPlay("continue");
            };
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            stop();
        }

        internal function frame53():*
        {
            gotoAndStop("freeze_weight_right");
        }

        internal function frame54():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":40,
                "kbConstant":0,
                "direction":10
            });
        }

        internal function frame58():*
        {
            gotoAndPlay("repeat_weight_right");
        }

        internal function frame61():*
        {
            this.self.updateAttackStats({"invincible":false});
        }

        internal function frame68():*
        {
            this.self.unnattachFromGround();
            this.self.setYSpeed(-5);
        }

        internal function frame72():*
        {
            this.self.endAttack();
        }

        internal function frame73():*
        {
            this.self.updateAttackStats({
                "air_ease":-1,
                "invincible":true
            });
            if (this.self.isOnGround())
            {
                this.self.updateAttackStats({"allowControl":false});
                this.gotoAndPlay("continue");
            };
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            stop();
        }

        internal function frame75():*
        {
            gotoAndStop("freeze_weight_left");
        }

        internal function frame76():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":40,
                "kbConstant":0,
                "direction":10
            });
        }

        internal function frame80():*
        {
            gotoAndPlay("repeat_weight_left");
        }

        internal function frame83():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":75,
                "hitStun":4,
                "selfHitStun":2
            });
            this.self.refreshAttackID();
        }

        internal function frame92():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.rockDrop);
        }

        internal function frame93():*
        {
            this.self.updateAttackStats({
                "air_ease":-1,
                "invincible":true
            });
            if (this.self.isOnGround())
            {
                this.self.updateAttackStats({"allowControl":false});
                this.gotoAndPlay("continue");
            };
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            stop();
        }

        internal function frame95():*
        {
            gotoAndStop("freeze_thwomp");
        }

        internal function frame96():*
        {
            this.self.playVoiceSound(4);
            this.self.updateAttackBoxStats(1, {
                "power":40,
                "kbConstant":0,
                "direction":10
            });
        }

        internal function frame100():*
        {
            gotoAndPlay("repeat_thwomp");
        }

        internal function frame103():*
        {
            this.self.updateAttackStats({"invincible":false});
        }

        internal function frame110():*
        {
            this.self.unnattachFromGround();
            this.self.setYSpeed(-5);
        }

        internal function frame114():*
        {
            this.self.endAttack();
        }

        internal function frame116():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":75,
                "hitStun":3,
                "selfHitStun":3
            });
        }

        internal function frame126():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.rockDrop);
        }

        internal function frame127():*
        {
            this.self.updateAttackStats({
                "air_ease":-1,
                "invincible":true
            });
            if (this.self.isOnGround())
            {
                this.self.updateAttackStats({"allowControl":false});
                this.gotoAndPlay("continue");
            };
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            stop();
        }

        internal function frame129():*
        {
            gotoAndStop("freeze_panel");
        }

        internal function frame130():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":40,
                "kbConstant":0,
                "direction":10
            });
        }

        internal function frame134():*
        {
            gotoAndPlay("repeat_panel");
        }

        internal function frame137():*
        {
            this.self.updateAttackStats({"invincible":false});
        }

        internal function frame144():*
        {
            this.self.unnattachFromGround();
            this.self.setYSpeed(-5);
        }

        internal function frame148():*
        {
            this.self.endAttack();
        }

        internal function frame150():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":70,
                "hitStun":2,
                "selfHitStun":2
            });
        }

        internal function frame160():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.rockDrop);
        }

        internal function frame161():*
        {
            this.self.updateAttackStats({
                "air_ease":-1,
                "invincible":true
            });
            if (this.self.isOnGround())
            {
                this.self.updateAttackStats({"allowControl":false});
                this.gotoAndPlay("continue");
            };
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            stop();
        }

        internal function frame163():*
        {
            gotoAndStop("freeze_spikes");
        }

        internal function frame164():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":40,
                "kbConstant":0,
                "direction":10
            });
        }

        internal function frame168():*
        {
            gotoAndPlay("repeat_spikes");
        }

        internal function frame171():*
        {
            this.self.updateAttackStats({"invincible":false});
        }

        internal function frame178():*
        {
            this.self.unnattachFromGround();
            this.self.setYSpeed(-5);
        }

        internal function frame182():*
        {
            this.self.endAttack();
        }

        internal function frame194():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":3,
                "power":25,
                "direction":75,
                "hitStun":2,
                "selfHitStun":1
            });
            this.self.updateAttackStats({
                "refreshRate":15,
                "air_ease":-1,
                "allowControl":true,
                "allowRun":true,
                "allowTurn":true,
                "invincible":true
            });
            SSF2API.createTimer(this.self, 1, 0, this.rockDrop);
            stop();
        }

        internal function frame195():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
        }

        internal function frame197():*
        {
            gotoAndPlay("freeze_landmaster");
        }

        internal function frame201():*
        {
            gotoAndPlay("repeat_landmaster");
        }

        internal function frame202():*
        {
            this.self.updateAttackStats({
                "refreshRate":15,
                "allowControl":false,
                "allowRun":false,
                "allowTurn":false
            });
        }

        internal function frame204():*
        {
            this.self.updateAttackStats({"invincible":false});
        }

        internal function frame211():*
        {
            this.self.unnattachFromGround();
            this.self.setYSpeed(-5);
        }

        internal function frame215():*
        {
            this.self.endAttack();
        }

        internal function frame225():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":90,
                "hitStun":5,
                "selfHitStun":5
            });
            this.self.playVoiceSound(2);
        }

        internal function frame227():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.rockDrop);
        }

        internal function frame228():*
        {
            this.self.updateAttackStats({
                "air_ease":-1,
                "invincible":true
            });
            if (this.self.isOnGround())
            {
                this.self.updateAttackStats({"allowControl":false});
                this.gotoAndPlay("continue");
            };
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            stop();
        }

        internal function frame230():*
        {
            gotoAndStop("freeze_moon");
        }

        internal function frame235():*
        {
            gotoAndPlay("repeat_moon");
        }

        internal function frame238():*
        {
            this.self.updateAttackStats({"invincible":false});
        }

        internal function frame245():*
        {
            this.self.unnattachFromGround();
            this.self.setYSpeed(-5);
        }

        internal function frame249():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

