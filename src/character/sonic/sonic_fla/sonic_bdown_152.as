// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_bdown_152

package sonic_fla
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

    public dynamic class sonic_bdown_152 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hasTurned:Boolean;
        public var loopCount:int;
        public var damage:int;
        public var maxDamage:int;
        public var xconstant:int;
        public var xConstantTurn:int;
        public var xConstantAir:int;
        public var attackDirectionAir:*;
        public var pressed:Boolean;
        public var time:int;
        public var maxTime:int;
        public var dir:Boolean;
        public var ground:Boolean;
        public var jumping:Boolean;
        public var controls:Object;
        public var frameLabel:*;
        public var lastFrameLabel:*;
        public var effect:*;
        public var self:*;

        public function sonic_bdown_152()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 11, this.frame12, 12, this.frame13, 13, this.frame14, 16, this.frame17, 37, this.frame38, 48, this.frame49, 49, this.frame50, 53, this.frame54, 54, this.frame55, 55, this.frame56, 56, this.frame57, 57, this.frame58, 58, this.frame59);
        }

        public function debugFrames():void
        {
            this.lastFrameLabel = this.frameLabel;
            this.frameLabel = this.currentFrameLabel;
            if (((!(this.frameLabel == this.lastFrameLabel)) && (!(this.frameLabel == null))))
            {
                SSF2API.print(this.frameLabel);
            };
        }

        public function resetTimers():void
        {
            SSF2API.destroyTimer(this.self, this.jumpCheck);
            SSF2API.destroyTimer(this.self, this.jumpCheckPt2);
            SSF2API.destroyTimer(this.self, this.turnCheck);
            SSF2API.destroyTimer(this.self, this.turnStuff);
            SSF2API.destroyTimer(this.self, this.chargeCheck);
            SSF2API.destroyTimer(this.self, this.finishCheck);
        }

        public function jumpCheck():void
        {
            this.controls = this.self.getControls();
            this.dir = this.self.isFacingRight();
            this.ground = this.self.isOnGround();
        }

        public function jumpCheckPt2():void
        {
            this.controls = this.self.getControls();
            if (((this.ground) && (this.controls.JUMP)))
            {
                this.self.updateAttackBoxStats(1, {"damage":5});
                this.self.refreshAttackID();
                this.self.setXSpeed(this.xConstantAir, false);
            }
            else
            {
                if (((this.ground) && (!(this.controls.JUMP))))
                {
                    this.self.setXSpeed(this.xconstant, false);
                }
                else
                {
                    if (!this.ground)
                    {
                        this.self.setXSpeed(this.xConstantAir, false);
                    };
                };
            };
        }

        public function turnCheck():void
        {
            this.controls = this.self.getControls();
            this.time++;
            if (this.time >= this.maxTime)
            {
                SSF2API.destroyTimer(this.self, this.turnCheck);
                gotoAndPlay("finish");
            };
            if (((((this.ground) && (this.dir)) && (this.controls.LEFT)) || (((this.ground) && (!(this.dir))) && (this.controls.RIGHT))))
            {
                SSF2API.destroyTimer(this.self, this.turnCheck);
                this.self.refreshAttackID();
                gotoAndPlay("turning1");
            };
        }

        public function chargeCheck():void
        {
            this.controls = this.self.getControls();
            if (((!(this.controls.BUTTON1)) && (this.pressed)))
            {
                this.pressed = false;
            };
            if (((this.controls.BUTTON1) && (!(this.pressed))))
            {
                if (this.damage < this.maxDamage)
                {
                    this.damage++;
                    this.xconstant++;
                };
                this.pressed = true;
                gotoAndPlay("charging");
            };
            if (((!(this.controls.DOWN)) && (this.loopCount > 0)))
            {
                SSF2API.destroyTimer(this.self, this.chargeCheck);
                gotoAndPlay("dash");
            };
            this.self.updateAttackStats({"canFallOff":false});
        }

        public function finishCheck():void
        {
            this.controls = this.self.getControls();
            if (((this.controls.BUTTON1) && (this.controls.DOWN)))
            {
                SSF2API.destroyTimer(this.self, this.finishCheck);
                gotoAndPlay("finish");
            };
        }

        public function afterImage():void
        {
            this.effect = this.self.attachEffect("sonic_afterimage1");
            this.self.applyPalette(this.effect);
        }

        public function turnStuff():void
        {
            this.time++;
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
                SSF2API.destroyTimer(this.self, this.turnStuff);
                this.self.flip();
                gotoAndPlay("turning2");
            };
        }

        internal function frame1():*
        {
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.createTimer(this.self, 1, -1, this.jumpCheck);
                SSF2API.createTimer(this.self, 1, -1, this.debugFrames);
            };
            this.hasTurned = false;
            this.loopCount = 0;
            this.damage = 4;
            this.maxDamage = 9;
            this.xconstant = 20;
            this.xConstantTurn = 20;
            this.xConstantAir = 9;
            this.attackDirectionAir = 30;
            this.pressed = false;
            this.time = 0;
            this.maxTime = 80;
            this.dir = false;
            this.ground = false;
            this.jumping = false;
            this.controls = null;
            this.frameLabel = null;
            this.lastFrameLabel = null;
            this.effect = null;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.controls = this.self.getControls();
                this.dir = this.self.isFacingRight();
                this.ground = this.self.isOnGround();
            };
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playAttackSound(1);
            };
        }

        internal function frame2():*
        {
            SSF2API.createTimer(this.self, 1, -1, this.chargeCheck);
            this.self.playAttackSound(3);
        }

        internal function frame12():*
        {
            if (this.loopCount < 1)
            {
                this.loopCount = 1;
                gotoAndPlay("charging");
            };
            if (((!(this.controls.DOWN)) && (this.loopCount > 0)))
            {
                gotoAndPlay("dash");
            };
            if (((this.controls.DOWN) && (this.loopCount > 0)))
            {
                gotoAndPlay("finish");
            };
            if (((!(this.controls.BUTTON1)) && (this.pressed)))
            {
                this.pressed = false;
            };
            if (((this.controls.BUTTON1) && (!(this.pressed))))
            {
                if (this.damage < this.maxDamage)
                {
                    this.damage++;
                    this.xconstant++;
                };
                this.pressed = true;
                gotoAndPlay("charging");
            };
        }

        internal function frame13():*
        {
            this.resetTimers();
            SSF2API.createTimer(this.self, 1, -1, this.turnCheck);
            this.xConstantTurn = this.xconstant;
            this.hasTurned = false;
            this.dir = this.self.isFacingRight();
            SSF2API.createTimer(this.self, 1, -1, this.afterImage);
            this.self.updateAttackBoxStats(1, {"damage":5});
            this.self.setXSpeed(this.xconstant, false);
            this.self.refreshAttackID();
            this.self.updateAttackStats({"allowFullInterrupt":false});
            this.self.playAttackSound(2);
        }

        internal function frame14():*
        {
            this.resetTimers();
            SSF2API.createTimer(this.self, 1, -1, this.jumpCheckPt2);
            SSF2API.createTimer(this.self, 1, -1, this.jumpCheck);
            SSF2API.createTimer(this.self, 1, -1, this.turnCheck);
            this.self.updateAttackStats({"allowJump":true});
        }

        internal function frame17():*
        {
            SSF2API.createTimer(this.self, 1, -1, this.finishCheck);
            this.self.updateAttackStats({"canFallOff":true});
            this.self.updateAttackBoxStats(1, {"damage":this.damage});
        }

        internal function frame38():*
        {
            this.resetTimers();
            SSF2API.destroyTimer(this.self, this.afterImage);
            this.self.updateAttackStats({
                "airCancel":true,
                "allowJump":false
            });
            SSF2API.playSound("new_Sonic_skid");
            this.self.playAttackSound(2);
        }

        internal function frame49():*
        {
            this.self.endAttack();
        }

        internal function frame50():*
        {
            this.resetTimers();
            SSF2API.createTimer(this.self, 1, 4, this.turnStuff);
            SSF2API.destroyTimer(this.self, this.afterImage);
            this.self.updateAttackStats({
                "allowJump":false,
                "canFallOff":false
            });
            this.self.updateAttackBoxStats(1, {"damage":3});
        }

        internal function frame54():*
        {
            this.turnStuff();
            gotoAndPlay("turning1");
        }

        internal function frame55():*
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
            this.time++;
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
            SSF2API.destroyTimer(this.self, this.afterImage);
            this.self.updateAttackStats({
                "allowJump":false,
                "canFallOff":false
            });
            this.self.updateAttackBoxStats(1, {"damage":3});
        }

        internal function frame56():*
        {
            if (!this.hasTurned)
            {
                this.self.flip();
                this.hasTurned = true;
            };
            this.time++;
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
        }

        internal function frame57():*
        {
            this.time++;
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
        }

        internal function frame58():*
        {
            this.time++;
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
        }

        internal function frame59():*
        {
            this.time++;
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
            gotoAndPlay("turning2");
        }


    }
}//package sonic_fla

