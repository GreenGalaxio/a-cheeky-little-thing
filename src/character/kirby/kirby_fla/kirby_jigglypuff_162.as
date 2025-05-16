// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_jigglypuff_162

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

    public dynamic class kirby_jigglypuff_162 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var controls:Object;
        public var hasHit:*;
        public var charge:*;
        public var chargeTime:*;
        public var endTimer:*;
        public var controlCheckCount:*;
        public var xConstantTurn:*;
        public var bounce:*;
        public var hasTurned:*;
        public var finish:*;
        public var xconstant:*;
        public var jiggs_skid:*;
        public var dir:*;
        public var ground:*;

        public function kirby_jigglypuff_162()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 16, this.frame17, 32, this.frame33, 42, this.frame43, 45, this.frame46, 48, this.frame49, 50, this.frame51, 51, this.frame52, 52, this.frame53, 68, this.frame69, 69, this.frame70, 85, this.frame86, 86, this.frame87, 102, this.frame103, 103, this.frame104, 111, this.frame112, 112, this.frame113, 119, this.frame120, 120, this.frame121, 139, this.frame140, 140, this.frame141, 141, this.frame142, 142, this.frame143, 143, this.frame144, 144, this.frame145, 145, this.frame146, 146, this.frame147, 147, this.frame148, 148, this.frame149, 149, this.frame150);
        }

        public function controlCheck():void
        {
            this.controlCheckCount++;
            this.controls = this.self.getControls();
            if (((!(this.controls.BUTTON1)) && (this.controlCheckCount > 5)))
            {
                this.gotoAndPlay("go");
            };
        }

        public function airCheck():void
        {
            if (((SSF2API.isReady()) && (!(this.self.isOnGround()))))
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        public function turnCheck():void
        {
            SSF2API.destroyTimer(this.self, this.moveSpeed);
            SSF2API.destroyTimer(this.self, this.turnCheck);
            this.controls = this.self.getControls();
            this.dir = this.self.isFacingRight();
            this.ground = this.self.isOnGround();
            if (((((this.ground) && (this.dir)) && (this.controls.LEFT)) || (((this.ground) && (!(this.dir))) && (this.controls.RIGHT))))
            {
                this.self.refreshAttackID();
                gotoAndPlay("turning1");
            };
        }

        public function jumpToEnd():*
        {
            if (this.finish <= 0)
            {
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.jumpToAfterHit);
                SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToAfterHit);
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
                SSF2API.destroyTimer(this.self, this.jumpToEnd);
                this.gotoAndPlay("end");
            };
            this.finish--;
        }

        public function jumpToAfterHit(_arg_1:Event=null):*
        {
            SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.jumpToAfterHit);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToAfterHit);
            gotoAndPlay("afterHit");
        }

        public function moveSpeed():void
        {
            this.self.setXSpeed(this.xconstant, false);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "charging";
            this.controls = null;
            this.hasHit = false;
            this.charge = "slow";
            this.chargeTime = 0;
            this.endTimer = 75;
            this.controlCheckCount = 0;
            this.xConstantTurn = 0;
            this.bounce = 5;
            this.hasTurned = false;
            this.finish = null;
            this.xconstant = null;
            this.jiggs_skid = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.dir = this.self.isFacingRight();
                this.ground = this.self.isOnGround();
                this.controls = this.self.getControls();
                SSF2API.createTimer(this.self, 1, 0, this.controlCheck);
                this.self.playVoiceSound(1);
                this.self.playAttackSound(1);
            };
        }

        internal function frame2():*
        {
            SSF2API.createTimer(this.self, 1, -1, this.controlCheck);
        }

        internal function frame17():*
        {
            this.charge = "mid";
        }

        internal function frame33():*
        {
            this.charge = "midHigh";
        }

        internal function frame43():*
        {
            this.charge = "full";
            this.self.playAttackSound(3);
        }

        internal function frame46():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame49():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame51():*
        {
            this.gotoAndPlay("fullCharge");
        }

        internal function frame52():*
        {
            this.self.updateAttackStats({
                "xSpeedDecay":1,
                "allowControl":false
            });
            SSF2API.destroyTimer(this.self, this.controlCheck);
            this.finish = this.endTimer;
            SSF2API.createTimer(this.self, 1, -1, this.jumpToEnd);
            SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToAfterHit);
            SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.jumpToAfterHit);
            if (this.charge == "slow")
            {
                this.gotoAndPlay("slowGo");
            };
            if (this.charge == "mid")
            {
                this.gotoAndPlay("midGo");
            };
            if (this.charge == "midHigh")
            {
                this.gotoAndPlay("midHighGo");
            };
            if (this.charge == "full")
            {
                this.gotoAndPlay("fullGo");
            };
        }

        internal function frame53():*
        {
            this.xconstant = 3;
            this.xConstantTurn = this.xconstant;
            this.hasTurned = false;
            this.bounce = 5;
            this.jiggs_skid = false;
            this.self.updateAttackBoxStats(1, {
                "damage":6,
                "power":50,
                "kbConstant":50
            });
            SSF2API.createTimer(this.self, 1, -1, this.moveSpeed);
            if (this.finish <= 0)
            {
                this.jumpToEnd();
            };
            SSF2API.destroyTimer(this.self, this.controlCheck);
            SSF2API.createTimer(this.self, 1, -1, this.airCheck);
        }

        internal function frame69():*
        {
            this.self.endAttack("land");
        }

        internal function frame70():*
        {
            this.xconstant = 12;
            this.xConstantTurn = this.xconstant;
            this.hasTurned = false;
            this.bounce = 7;
            this.jiggs_skid = false;
            this.self.updateAttackBoxStats(1, {
                "damage":9,
                "power":70,
                "kbConstant":60
            });
            SSF2API.createTimer(this.self, 1, -1, this.moveSpeed);
            if (this.finish <= 0)
            {
                this.jumpToEnd();
            };
            SSF2API.destroyTimer(this.self, this.controlCheck);
            SSF2API.createTimer(this.self, 1, -1, this.airCheck);
            SSF2API.createTimer(this.self, 1, -1, this.turnCheck);
        }

        internal function frame86():*
        {
            this.gotoAndPlay("midGo");
        }

        internal function frame87():*
        {
            this.xconstant = 16;
            this.xConstantTurn = this.xconstant;
            this.hasTurned = false;
            this.bounce = 9;
            this.jiggs_skid = false;
            this.self.updateAttackBoxStats(1, {
                "damage":11,
                "power":80,
                "kbConstant":70
            });
            SSF2API.createTimer(this.self, 1, -1, this.moveSpeed);
            if (this.finish <= 0)
            {
                this.jumpToEnd();
            };
            SSF2API.destroyTimer(this.self, this.controlCheck);
            SSF2API.createTimer(this.self, 1, -1, this.airCheck);
            SSF2API.createTimer(this.self, 1, -1, this.turnCheck);
        }

        internal function frame103():*
        {
            this.gotoAndPlay("midHighGo");
        }

        internal function frame104():*
        {
            this.xconstant = 20;
            this.xConstantTurn = this.xconstant;
            this.hasTurned = false;
            this.bounce = 10;
            this.jiggs_skid = false;
            this.self.updateAttackBoxStats(1, {
                "damage":13,
                "power":100,
                "kbConstant":80
            });
            SSF2API.createTimer(this.self, 1, -1, this.moveSpeed);
            if (this.finish <= 0)
            {
                this.jumpToEnd();
            };
            SSF2API.destroyTimer(this.self, this.controlCheck);
            SSF2API.createTimer(this.self, 1, -1, this.airCheck);
            SSF2API.createTimer(this.self, 1, -1, this.turnCheck);
        }

        internal function frame112():*
        {
            this.gotoAndPlay("fullGo");
        }

        internal function frame113():*
        {
            this.hasHit = true;
            this.self.updateAttackStats({"xSpeedDecay":0});
            this.self.setXSpeed(0);
            this.self.unnattachFromGround();
            this.self.setXSpeed(-1, false);
            this.self.setYSpeed(-(this.bounce));
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            SSF2API.destroyTimer(this.self, this.airCheck);
            SSF2API.destroyTimer(this.self, this.moveSpeed);
        }

        internal function frame120():*
        {
            this.gotoAndPlay("loop");
        }

        internal function frame121():*
        {
            this.self.setXSpeed(3);
            this.self.updateAttackStats({"xSpeedDecay":-0.1});
        }

        internal function frame140():*
        {
            this.self.endAttack("land");
        }

        internal function frame141():*
        {
            this.self.updateAttackStats({
                "allowJump":false,
                "canFallOff":false
            });
            this.self.updateAttackBoxStats(1, {"damage":3});
            if (((this.ground) && (this.xConstantTurn > 0)))
            {
                this.xConstantTurn = (this.xConstantTurn - 3);
            };
            if (((!(this.ground)) && (this.xConstantTurn > 0)))
            {
                this.xConstantTurn = (this.xConstantTurn - 1);
            };
            if (this.xConstantTurn < 0)
            {
                this.xConstantTurn = 0;
            };
            this.self.setXSpeed(this.xConstantTurn, false);
            if (this.xConstantTurn <= 0)
            {
                gotoAndPlay("turning2");
            };
            gotoAndPlay("turning1");
        }

        internal function frame142():*
        {
            if (this.jiggs_skid == false)
            {
                SSF2API.playSound("jiggs_skid");
            };
            this.jiggs_skid = true;
            if (((this.ground) && (this.xConstantTurn > 0)))
            {
                this.xConstantTurn = (this.xConstantTurn - 3);
            };
            if (((!(this.ground)) && (this.xConstantTurn > 0)))
            {
                this.xConstantTurn = (this.xConstantTurn - 1);
            };
            if (this.xConstantTurn < 0)
            {
                this.xConstantTurn = 0;
            };
            this.self.setXSpeed(this.xConstantTurn, false);
            if (this.xConstantTurn <= 0)
            {
                gotoAndPlay("turning2");
            };
        }

        internal function frame143():*
        {
            if (((this.ground) && (this.xConstantTurn > 0)))
            {
                this.xConstantTurn = (this.xConstantTurn - 3);
            };
            if (((!(this.ground)) && (this.xConstantTurn > 0)))
            {
                this.xConstantTurn = (this.xConstantTurn - 1);
            };
            if (this.xConstantTurn < 0)
            {
                this.xConstantTurn = 0;
            };
            this.self.setXSpeed(this.xConstantTurn, false);
            if (this.xConstantTurn <= 0)
            {
                gotoAndPlay("turning2");
            };
        }

        internal function frame144():*
        {
            if (((this.ground) && (this.xConstantTurn > 0)))
            {
                this.xConstantTurn = (this.xConstantTurn - 3);
            };
            if (((!(this.ground)) && (this.xConstantTurn > 0)))
            {
                this.xConstantTurn = (this.xConstantTurn - 1);
            };
            if (this.xConstantTurn < 0)
            {
                this.xConstantTurn = 0;
            };
            this.self.setXSpeed(this.xConstantTurn, false);
            if (this.xConstantTurn <= 0)
            {
                gotoAndPlay("turning2");
            };
        }

        internal function frame145():*
        {
            if (((this.ground) && (this.xConstantTurn > 0)))
            {
                this.xConstantTurn = (this.xConstantTurn - 3);
            };
            if (((!(this.ground)) && (this.xConstantTurn > 0)))
            {
                this.xConstantTurn = (this.xConstantTurn - 1);
            };
            if (this.xConstantTurn < 0)
            {
                this.xConstantTurn = 0;
            };
            this.self.setXSpeed(this.xConstantTurn, false);
            if (this.xConstantTurn <= 0)
            {
                gotoAndPlay("turning2");
            };
        }

        internal function frame146():*
        {
            this.self.updateAttackStats({
                "allowJump":false,
                "canFallOff":false
            });
            this.self.updateAttackBoxStats(1, {"damage":3});
            if (!this.hasTurned)
            {
                if (this.dir)
                {
                    this.self.faceLeft();
                }
                else
                {
                    this.self.faceRight();
                };
                this.hasTurned = true;
            };
            if (((this.ground) && (this.xConstantTurn < this.xconstant)))
            {
                this.xConstantTurn = (this.xConstantTurn + 3);
            };
            if (((!(this.ground)) && (this.xConstantTurn < this.xconstant)))
            {
                this.xConstantTurn = (this.xConstantTurn + 1);
            };
            if (this.xConstantTurn > this.xconstant)
            {
                this.xConstantTurn = this.xconstant;
            };
            this.self.setXSpeed(this.xConstantTurn, false);
            if (this.xConstantTurn == this.xconstant)
            {
                this.self.updateAttackStats({"canFallOff":true});
                gotoAndPlay((this.charge + "Go"));
            };
        }

        internal function frame147():*
        {
            if (!this.hasTurned)
            {
                if (this.dir)
                {
                    this.self.faceLeft();
                }
                else
                {
                    this.self.faceRight();
                };
                this.hasTurned = true;
            };
            if (((this.ground) && (this.xConstantTurn < this.xconstant)))
            {
                this.xConstantTurn = (this.xConstantTurn + 3);
            };
            if (((!(this.ground)) && (this.xConstantTurn < this.xconstant)))
            {
                this.xConstantTurn = (this.xConstantTurn + 1);
            };
            if (this.xConstantTurn > this.xconstant)
            {
                this.xConstantTurn = this.xconstant;
            };
            this.self.setXSpeed(this.xConstantTurn, false);
            if (this.xConstantTurn == this.xconstant)
            {
                this.self.updateAttackStats({"canFallOff":true});
                gotoAndPlay((this.charge + "Go"));
            };
        }

        internal function frame148():*
        {
            if (!this.hasTurned)
            {
                if (this.dir)
                {
                    this.self.faceLeft();
                }
                else
                {
                    this.self.faceRight();
                };
                this.hasTurned = true;
            };
            if (((this.ground) && (this.xConstantTurn < this.xconstant)))
            {
                this.xConstantTurn = (this.xConstantTurn + 3);
            };
            if (((!(this.ground)) && (this.xConstantTurn < this.xconstant)))
            {
                this.xConstantTurn = (this.xConstantTurn + 1);
            };
            if (this.xConstantTurn > this.xconstant)
            {
                this.xConstantTurn = this.xconstant;
            };
            this.self.setXSpeed(this.xConstantTurn, false);
            if (this.xConstantTurn == this.xconstant)
            {
                this.self.updateAttackStats({"canFallOff":true});
                gotoAndPlay((this.charge + "Go"));
            };
        }

        internal function frame149():*
        {
            if (!this.hasTurned)
            {
                if (this.dir)
                {
                    this.self.faceLeft();
                }
                else
                {
                    this.self.faceRight();
                };
                this.hasTurned = true;
            };
            if (((this.ground) && (this.xConstantTurn < this.xconstant)))
            {
                this.xConstantTurn = (this.xConstantTurn + 3);
            };
            if (((!(this.ground)) && (this.xConstantTurn < this.xconstant)))
            {
                this.xConstantTurn = (this.xConstantTurn + 1);
            };
            if (this.xConstantTurn > this.xconstant)
            {
                this.xConstantTurn = this.xconstant;
            };
            this.self.setXSpeed(this.xConstantTurn, false);
            if (this.xConstantTurn == this.xconstant)
            {
                this.self.updateAttackStats({"canFallOff":true});
                gotoAndPlay((this.charge + "Go"));
            };
        }

        internal function frame150():*
        {
            if (!this.hasTurned)
            {
                if (this.dir)
                {
                    this.self.faceLeft();
                }
                else
                {
                    this.self.faceRight();
                };
                this.hasTurned = true;
            };
            if (((this.ground) && (this.xConstantTurn < this.xconstant)))
            {
                this.xConstantTurn = (this.xConstantTurn + 3);
            };
            if (((!(this.ground)) && (this.xConstantTurn < this.xconstant)))
            {
                this.xConstantTurn = (this.xConstantTurn + 1);
            };
            if (this.xConstantTurn > this.xconstant)
            {
                this.xConstantTurn = this.xconstant;
            };
            this.self.setXSpeed(this.xConstantTurn, false);
            if (this.xConstantTurn == this.xconstant)
            {
                this.self.updateAttackStats({"canFallOff":true});
                gotoAndPlay((this.charge + "Go"));
            };
            gotoAndPlay("turning2");
        }


    }
}//package kirby_fla

