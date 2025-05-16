// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_sidespecial_39

package yoshi_fla
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

    public dynamic class Yoshi_sidespecial_39 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var controls:Object;
        public var dir:Boolean;
        public var ground:Boolean;
        public var hasTurned:Boolean;
        public var hasHit:Boolean;
        public var rollCancel:Boolean;
        public var damage:int;
        public var xconstant:int;
        public var xConstantTurn:int;
        public var xConstantAir:int;
        public var attackDirectionAir:*;
        public var pressed:Boolean;
        public var time:int;
        public var maxTime:int;

        public function Yoshi_sidespecial_39()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 38, this.frame39, 47, this.frame48, 48, this.frame49, 49, this.frame50, 50, this.frame51, 51, this.frame52, 52, this.frame53, 53, this.frame54, 54, this.frame55, 55, this.frame56, 56, this.frame57, 57, this.frame58, 58, this.frame59, 59, this.frame60, 60, this.frame61, 61, this.frame62, 62, this.frame63, 63, this.frame64, 64, this.frame65, 65, this.frame66, 66, this.frame67, 67, this.frame68, 68, this.frame69, 72, this.frame73);
        }

        public function groundCheck():void
        {
            this.ground = this.self.isOnGround();
            if (this.ground)
            {
                this.self.updateAttackStats({"cancelWhenAirborne":this.rollCancel});
            };
        }

        public function momentum():void
        {
            if (this.ground)
            {
                this.self.setXSpeed(this.xconstant, false);
            };
            if (!this.ground)
            {
                this.self.setXSpeed(this.xConstantAir, false);
            };
        }

        public function turnCheck():void
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
            };
            this.controls = this.self.getControls();
            this.ground = this.self.isOnGround();
            this.dir = this.self.isFacingRight();
            if (((((this.ground) && (this.dir)) && (this.controls.LEFT)) || (((this.ground) && (!(this.dir))) && (this.controls.RIGHT))))
            {
                this.self.refreshAttackID();
                gotoAndPlay("turning1");
            };
        }

        public function finishCheck():void
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
                this.dir = this.self.isFacingRight();
                this.ground = this.self.isOnGround();
                this.hasTurned = false;
                this.hasHit = false;
                this.rollCancel = true;
                this.damage = 6;
                this.xconstant = 10;
                this.xConstantTurn = 10;
                this.xConstantAir = 3;
                this.attackDirectionAir = 30;
                this.pressed = false;
                this.time = 0;
                this.maxTime = 80;
                this.self.setYSpeed(-15);
            };
        }

        internal function frame9():*
        {
            this.ground = this.self.isOnGround();
            this.self.playAttackSound(1);
            if (this.ground)
            {
                this.self.setXSpeed(this.xconstant, false);
            };
            if (!this.ground)
            {
                this.self.setXSpeed(this.xConstantAir, false);
            };
        }

        internal function frame11():*
        {
            this.xConstantTurn = this.xconstant;
            this.hasTurned = false;
            this.self.updateAttackStats({"canFallOff":true});
            this.self.updateAttackBoxStats(1, {"damage":this.damage});
            this.momentum();
        }

        internal function frame12():*
        {
            this.momentum();
        }

        internal function frame13():*
        {
            this.momentum();
        }

        internal function frame14():*
        {
            this.momentum();
        }

        internal function frame15():*
        {
            this.turnCheck();
            this.finishCheck();
            this.momentum();
            this.groundCheck();
        }

        internal function frame16():*
        {
            this.turnCheck();
            this.finishCheck();
            this.momentum();
            this.groundCheck();
        }

        internal function frame17():*
        {
            this.turnCheck();
            this.finishCheck();
            this.momentum();
            this.groundCheck();
        }

        internal function frame18():*
        {
            this.turnCheck();
            this.finishCheck();
            this.momentum();
            this.groundCheck();
        }

        internal function frame19():*
        {
            this.turnCheck();
            this.finishCheck();
            this.momentum();
            this.groundCheck();
        }

        internal function frame20():*
        {
            this.turnCheck();
            this.finishCheck();
            this.momentum();
            this.groundCheck();
        }

        internal function frame21():*
        {
            this.turnCheck();
            this.finishCheck();
            this.momentum();
            this.groundCheck();
        }

        internal function frame22():*
        {
            this.turnCheck();
            this.finishCheck();
            this.momentum();
            this.groundCheck();
        }

        internal function frame23():*
        {
            this.turnCheck();
            this.finishCheck();
            this.momentum();
            this.groundCheck();
        }

        internal function frame24():*
        {
            this.turnCheck();
            this.finishCheck();
            this.momentum();
            this.groundCheck();
        }

        internal function frame25():*
        {
            this.turnCheck();
            this.finishCheck();
            this.momentum();
            this.groundCheck();
        }

        internal function frame26():*
        {
            this.turnCheck();
            this.finishCheck();
            this.momentum();
            this.groundCheck();
        }

        internal function frame27():*
        {
            this.gotoAndPlay("dashloop");
        }

        internal function frame28():*
        {
            this.hasHit = true;
            if (this.ground)
            {
                this.self.setXSpeed((this.xconstant / 4), false);
            };
            if (!this.ground)
            {
                this.self.setXSpeed((this.xConstantAir / 4), false);
            };
            this.self.updateAttackStats({"cancelWhenAirborne":false});
        }

        internal function frame39():*
        {
            this.self.playAttackSound(3);
            this.self.setYSpeed(-12);
            this.self.updateAttackStats({"cancelWhenAirborne":false});
        }

        internal function frame48():*
        {
            this.self.endAttack();
        }

        internal function frame49():*
        {
            this.self.updateAttackStats({"canFallOff":false});
            this.self.updateAttackBoxStats(1, {"damage":3});
            if (this.ground)
            {
                this.self.setXSpeed((this.xconstant / 4), false);
            };
            if (!this.ground)
            {
                this.self.setXSpeed((this.xConstantAir / 4), false);
            };
            this.finishCheck();
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

        internal function frame50():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
            };
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
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame51():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
            };
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
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame52():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
            };
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
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame53():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
            };
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
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame54():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
            };
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
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame55():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
            };
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
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame56():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
            };
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
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame57():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
            };
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
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
            gotoAndPlay("turning1");
        }

        internal function frame58():*
        {
            this.self.updateAttackStats({"canFallOff":false});
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
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
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
                gotoAndPlay("dash");
            };
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame59():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
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
                gotoAndPlay("dash");
            };
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame60():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
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
                gotoAndPlay("dash");
            };
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame61():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
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
                gotoAndPlay("dash");
            };
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame62():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
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
                gotoAndPlay("dash");
            };
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame63():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
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
                gotoAndPlay("dash");
            };
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame64():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
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
                gotoAndPlay("dash");
            };
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame65():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
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
                gotoAndPlay("dash");
            };
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame66():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
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
                gotoAndPlay("dash");
            };
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
        }

        internal function frame67():*
        {
            this.time++;
            if (this.time >= this.maxTime)
            {
                gotoAndPlay("finish");
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
                gotoAndPlay("dash");
            };
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                gotoAndPlay("finish");
            };
            gotoAndPlay("turning2");
        }

        internal function frame68():*
        {
            this.hasHit = true;
            this.self.setXSpeed(0);
            this.self.updateAttackStats({"cancelWhenAirborne":false});
            this.self.resetJumps();
        }

        internal function frame69():*
        {
            this.self.playAttackSound(3);
            this.self.setYSpeed(-17);
            this.self.setXSpeed(-7, false);
        }

        internal function frame73():*
        {
            this.self.endAttack();
        }


    }
}//package yoshi_fla

