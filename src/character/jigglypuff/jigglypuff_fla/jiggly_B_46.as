// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_B_46

package jigglypuff_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class jiggly_B_46 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:*;
        public var hasHit:*;
        public var charge:*;
        public var controls:Object;
        public var chargeTime:*;
        public var endTimer:*;
        public var dir:*;
        public var ground:*;
        public var xConstantTurn:*;
        public var hasTurned:*;
        public var xconstant:*;
        public var bounce:*;
        public var jiggs_skid:*;
        public var controlCheckCount:*;
        public var finish:*;

        public function jiggly_B_46()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 16, this.frame17, 32, this.frame33, 42, this.frame43, 45, this.frame46, 48, this.frame49, 50, this.frame51, 51, this.frame52, 52, this.frame53, 53, this.frame54, 54, this.frame55, 55, this.frame56, 56, this.frame57, 57, this.frame58, 58, this.frame59, 59, this.frame60, 60, this.frame61, 61, this.frame62, 62, this.frame63, 63, this.frame64, 64, this.frame65, 65, this.frame66, 66, this.frame67, 67, this.frame68, 68, this.frame69, 69, this.frame70, 70, this.frame71, 71, this.frame72, 72, this.frame73, 73, this.frame74, 74, this.frame75, 75, this.frame76, 76, this.frame77, 77, this.frame78, 78, this.frame79, 79, this.frame80, 80, this.frame81, 81, this.frame82, 82, this.frame83, 83, this.frame84, 84, this.frame85, 85, this.frame86, 86, this.frame87, 87, this.frame88, 88, this.frame89, 89, this.frame90, 90, this.frame91, 91, this.frame92, 92, this.frame93, 93, this.frame94, 94, this.frame95, 95, this.frame96, 96, this.frame97, 97, this.frame98, 98, this.frame99, 99, this.frame100, 100, this.frame101, 101, this.frame102, 102, this.frame103, 103, this.frame104, 104, this.frame105, 105, this.frame106, 106, this.frame107, 107, this.frame108, 108, this.frame109, 109, this.frame110, 110, this.frame111, 111, this.frame112, 112, this.frame113, 119, this.frame120, 120, this.frame121, 139, this.frame140, 140, this.frame141, 141, this.frame142, 142, this.frame143, 143, this.frame144, 144, this.frame145, 145, this.frame146, 146, this.frame147, 147, this.frame148, 148, this.frame149, 149, this.frame150);
        }

        public function turnCheck():void
        {
            SSF2API.destroyTimer(this.self, this.moveSlow);
            SSF2API.destroyTimer(this.self, this.moveMid);
            SSF2API.destroyTimer(this.self, this.moveMidHi);
            SSF2API.destroyTimer(this.self, this.moveHi);
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
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.jumpToAfterHit);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToAfterHit);
            gotoAndPlay("afterHit");
        }

        public function moveSlow():void
        {
            this.self.setXSpeed(this.xconstant, false);
        }

        public function moveMid():void
        {
            this.self.setXSpeed(this.xconstant, false);
        }

        public function moveMidHi():void
        {
            this.self.setXSpeed(this.xconstant, false);
        }

        public function moveHi():void
        {
            this.self.setXSpeed(this.xconstant, false);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound(1);
                this.self.playAttackSound(1);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = "charging";
                this.hasHit = false;
                this.charge = "slow";
                this.controls = this.self.getControls();
                this.chargeTime = 0;
                this.endTimer = 75;
                this.dir = this.self.isFacingRight();
                this.ground = this.self.isOnGround();
                this.xConstantTurn = 0;
                this.hasTurned = false;
                this.xconstant = 0;
                this.bounce = 5;
                this.jiggs_skid = false;
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controlCheckCount = 0;
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
            this.self.playAttackSound(3);
            this.charge = "full";
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
            SSF2API.createTimer(this.self, 1, -1, this.moveSlow);
            if (this.finish <= 0)
            {
                this.jumpToEnd();
            };
            this.airCheck();
        }

        internal function frame54():*
        {
            this.airCheck();
        }

        internal function frame55():*
        {
            this.airCheck();
        }

        internal function frame56():*
        {
            this.airCheck();
        }

        internal function frame57():*
        {
            this.airCheck();
        }

        internal function frame58():*
        {
            this.airCheck();
        }

        internal function frame59():*
        {
            this.airCheck();
        }

        internal function frame60():*
        {
            this.airCheck();
        }

        internal function frame61():*
        {
            this.airCheck();
        }

        internal function frame62():*
        {
            this.airCheck();
        }

        internal function frame63():*
        {
            this.airCheck();
        }

        internal function frame64():*
        {
            this.airCheck();
        }

        internal function frame65():*
        {
            this.airCheck();
        }

        internal function frame66():*
        {
            this.airCheck();
        }

        internal function frame67():*
        {
            this.airCheck();
        }

        internal function frame68():*
        {
            this.airCheck();
        }

        internal function frame69():*
        {
            this.self.endAttack("land");
            this.airCheck();
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
            SSF2API.createTimer(this.self, 1, -1, this.moveMid);
            if (this.finish <= 0)
            {
                this.jumpToEnd();
            };
            SSF2API.createTimer(this.self, 1, -1, this.turnCheck);
            this.airCheck();
        }

        internal function frame71():*
        {
            this.airCheck();
        }

        internal function frame72():*
        {
            this.airCheck();
        }

        internal function frame73():*
        {
            this.airCheck();
        }

        internal function frame74():*
        {
            this.airCheck();
        }

        internal function frame75():*
        {
            this.airCheck();
        }

        internal function frame76():*
        {
            this.airCheck();
        }

        internal function frame77():*
        {
            this.airCheck();
        }

        internal function frame78():*
        {
            this.airCheck();
        }

        internal function frame79():*
        {
            this.airCheck();
        }

        internal function frame80():*
        {
            this.airCheck();
        }

        internal function frame81():*
        {
            this.airCheck();
        }

        internal function frame82():*
        {
            this.airCheck();
        }

        internal function frame83():*
        {
            this.airCheck();
        }

        internal function frame84():*
        {
            this.airCheck();
        }

        internal function frame85():*
        {
            this.airCheck();
        }

        internal function frame86():*
        {
            this.gotoAndPlay("midGo");
            this.airCheck();
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
            SSF2API.createTimer(this.self, 1, -1, this.moveMidHi);
            if (this.finish <= 0)
            {
                this.jumpToEnd();
            };
            SSF2API.createTimer(this.self, 1, -1, this.turnCheck);
            this.airCheck();
        }

        internal function frame88():*
        {
            this.airCheck();
        }

        internal function frame89():*
        {
            this.airCheck();
        }

        internal function frame90():*
        {
            this.airCheck();
        }

        internal function frame91():*
        {
            this.airCheck();
        }

        internal function frame92():*
        {
            this.airCheck();
        }

        internal function frame93():*
        {
            this.airCheck();
        }

        internal function frame94():*
        {
            this.airCheck();
        }

        internal function frame95():*
        {
            this.airCheck();
        }

        internal function frame96():*
        {
            this.airCheck();
        }

        internal function frame97():*
        {
            this.airCheck();
        }

        internal function frame98():*
        {
            this.airCheck();
        }

        internal function frame99():*
        {
            this.airCheck();
        }

        internal function frame100():*
        {
            this.airCheck();
        }

        internal function frame101():*
        {
            this.airCheck();
        }

        internal function frame102():*
        {
            this.airCheck();
        }

        internal function frame103():*
        {
            this.gotoAndPlay("midHighGo");
            this.airCheck();
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
            SSF2API.createTimer(this.self, 1, -1, this.moveHi);
            if (this.finish <= 0)
            {
                this.jumpToEnd();
            };
            SSF2API.createTimer(this.self, 1, -1, this.turnCheck);
            this.airCheck();
        }

        internal function frame105():*
        {
            this.airCheck();
        }

        internal function frame106():*
        {
            this.airCheck();
        }

        internal function frame107():*
        {
            this.airCheck();
        }

        internal function frame108():*
        {
            this.airCheck();
        }

        internal function frame109():*
        {
            this.airCheck();
        }

        internal function frame110():*
        {
            this.airCheck();
        }

        internal function frame111():*
        {
            this.airCheck();
        }

        internal function frame112():*
        {
            this.gotoAndPlay("fullGo");
            this.airCheck();
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
            gotoAndPlay("turning1");
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
}//package jigglypuff_fla

