// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_NSpec_33

package bomberman_fla
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

    public dynamic class Bomberman_NSpec_33 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var pLockBox:MovieClip;
        public var self:*;
        public var skipped:*;
        public var xframe:String;
        public var action:String;
        public var duration:*;
        public var controls:*;
        public var bombArray:Array;
        public var bomb:*;
        public var bombLimit:int;
        public var dir:*;
        public var projectile:Object;

        public function Bomberman_NSpec_33()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 16, this.frame17, 37, this.frame38, 38, this.frame39, 53, this.frame54, 54, this.frame55, 58, this.frame59, 59, this.frame60, 60, this.frame61, 61, this.frame62, 63, this.frame64, 72, this.frame73, 73, this.frame74, 77, this.frame78, 79, this.frame80, 80, this.frame81, 88, this.frame89, 92, this.frame93);
        }

        public function drop():void
        {
            this.controls = this.self.getControls();
            if (((!(this.controls.BUTTON1)) && (this.controls.DOWN)))
            {
                SSF2API.print("dropping");
                SSF2API.destroyTimer(this.self, this.drop);
                gotoAndPlay("drop");
            }
            else
            {
                if ((((this.controls.JUMP) || (this.controls.JUMP2)) || ((this.controls.TAP_JUMP) && (this.controls.UP))))
                {
                    SSF2API.print("jumping");
                    SSF2API.destroyTimer(this.self, this.drop);
                    gotoAndPlay("jumpStart");
                };
            };
        }

        public function throwUp():void
        {
            this.duration++;
            this.controls = this.self.getControls();
            if (((!(this.controls.BUTTON1)) && (this.controls.UP)))
            {
                SSF2API.print("Up!");
                this.skipped = false;
                SSF2API.destroyTimer(this.self, this.throwUp);
                gotoAndPlay("up");
            };
        }

        public function garbageCollect():void
        {
            var _local_1:int;
            if (this.bombArray != null)
            {
                _local_1 = 0;
                while (_local_1 < this.bombArray.length)
                {
                    this.bomb = this.bombArray[_local_1];
                    if (this.bomb.isDead())
                    {
                        this.bombArray.splice(_local_1--, 1);
                        this.self.setGlobalVariable("bombArray", this.bombArray);
                    };
                    _local_1++;
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.skipped = false;
            this.duration = 0;
            this.bombArray = new Array();
            this.bombLimit = 5;
            this.xframe = "charging";
            this.action = "standing";
            if (((this.self) && (SSF2API.isReady())))
            {
                this.dir = this.self.isFacingRight();
                if (this.self.getGlobalVariable("bombCharge") == null)
                {
                    this.self.fireProjectile("heldbomb");
                    this.projectile = this.self.getCurrentProjectile();
                    this.self.setGlobalVariable("bombCharge", this.projectile);
                }
                else
                {
                    gotoAndPlay("standing");
                };
            };
        }

        internal function frame2():*
        {
            SSF2API.createTimer(this.self, 1, -1, this.drop);
            SSF2API.createTimer(this.self, 1, -1, this.throwUp);
        }

        internal function frame17():*
        {
            SSF2API.destroyTimer(this.self, this.throwUp);
            SSF2API.createTimer(this.self, 1, -1, this.throwUp);
            SSF2API.destroyTimer(this.self, this.drop);
            SSF2API.createTimer(this.self, 1, -1, this.drop);
            this.xframe = "charging";
            this.action = "standing";
            this.self.updateAttackStats({
                "allowControl":false,
                "allowRun":true
            });
        }

        internal function frame38():*
        {
            gotoAndPlay("standing");
        }

        internal function frame39():*
        {
            SSF2API.destroyTimer(this.self, this.throwUp);
            SSF2API.createTimer(this.self, 1, -1, this.throwUp);
            SSF2API.destroyTimer(this.self, this.drop);
            SSF2API.createTimer(this.self, 1, -1, this.drop);
            this.xframe = "charging";
            this.action = "moving";
        }

        internal function frame54():*
        {
            gotoAndPlay("moving");
        }

        internal function frame55():*
        {
            this.xframe = "charging";
            this.action = "rising";
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateAttackStats({
                "allowJump":false,
                "allowControl":false,
                "allowTurn":false,
                "allowRun":false,
                "linkFrames":false
            });
            this.controls = this.self.getControls();
            SSF2API.createTimer(this.self, -1, 1, this.throwUp);
            SSF2API.destroyTimer(this.self, this.drop);
        }

        internal function frame59():*
        {
            this.self.updateAttackStats({"linkFrames":true});
            SSF2API.destroyTimer(this.self, this.throwUp);
            this.controls = this.self.getControls();
            this.self.unnattachFromGround();
            if ((((this.controls.BUTTON1) && (!(this.controls.JUMP))) && (!(this.controls.JUMP2))))
            {
                if (this.controls.TAP_JUMP)
                {
                    if (!this.controls.UP)
                    {
                        this.skipped = true;
                        SSF2API.print("shorthop");
                    };
                }
                else
                {
                    this.skipped = true;
                    SSF2API.print("shorthop");
                };
            };
            if (this.skipped)
            {
                this.self.setYSpeed(-10);
            };
            if (!this.skipped)
            {
                this.self.setYSpeed(-18);
            };
        }

        internal function frame60():*
        {
            this.xframe = "attack";
            this.self.updateAttackStats({
                "allowJump":false,
                "allowControl":false,
                "allowTurn":false,
                "allowRun":false,
                "linkFrames":false
            });
            this.self.setGlobalVariable("charge", this.self.getAttackStat("chargetime"));
            this.throwUp();
            this.drop();
            SSF2API.destroyTimer(this.self, this.drop);
            SSF2API.destroyTimer(this.self, this.throwUp);
        }

        internal function frame61():*
        {
            this.throwUp();
        }

        internal function frame62():*
        {
            this.throwUp();
        }

        internal function frame64():*
        {
            this.controls = this.self.getControls();
            this.dir = this.self.isFacingRight();
            if (this.self.getGlobalVariable("bombArray") != null)
            {
                this.bombArray = this.self.getGlobalVariable("bombArray");
            };
            this.garbageCollect();
            if ((this.bombArray.length - 1) >= (this.bombLimit - 1))
            {
                this.bombArray[0].destroy();
                this.bombArray.shift();
                this.self.setGlobalVariable("bombArray", this.bombArray);
            };
            this.projectile = this.self.getGlobalVariable("bombCharge");
            if (this.projectile.getStanceMC().currentLabel == "1")
            {
                this.self.fireProjectile("bomb1dropped", this.projectile.getX(), this.projectile.getY(), true);
                this.projectile.destroy();
                this.self.setGlobalVariable("bombCharge", null);
                this.bombArray.push(this.self.getCurrentProjectile());
                this.self.setGlobalVariable("bombArray", this.bombArray);
            }
            else
            {
                if (this.projectile.getStanceMC().currentLabel == "2")
                {
                    this.self.fireProjectile("bomb2dropped", this.projectile.getX(), this.projectile.getY(), true);
                    this.projectile.destroy();
                    this.self.setGlobalVariable("bombCharge", null);
                    this.bombArray.push(this.self.getCurrentProjectile());
                    this.self.setGlobalVariable("bombArray", this.bombArray);
                }
                else
                {
                    this.self.fireProjectile("bomb3dropped", this.projectile.getX(), this.projectile.getY(), true);
                    this.projectile.destroy();
                    this.self.setGlobalVariable("bombCharge", null);
                    this.bombArray.push(this.self.getCurrentProjectile());
                    this.self.setGlobalVariable("bombArray", this.bombArray);
                };
            };
            this.projectile = this.self.getCurrentProjectile();
            if (this.dir)
            {
                this.projectile.setXSpeed(8);
            }
            else
            {
                this.projectile.setXSpeed(-8);
            };
            this.projectile.setYSpeed(-12);
        }

        internal function frame73():*
        {
            this.self.endAttack();
        }

        internal function frame74():*
        {
            this.xframe = "attack";
            this.self.updateAttackStats({
                "allowJump":false,
                "allowControl":false,
                "allowTurn":false,
                "allowRun":false,
                "linkFrames":false
            });
            this.self.setGlobalVariable("charge", this.self.getAttackStat("chargetime"));
            SSF2API.destroyTimer(this.self, this.drop);
            SSF2API.destroyTimer(this.self, this.throwUp);
        }

        internal function frame78():*
        {
            this.self.playAttackSound(1);
            this.controls = this.self.getControls();
            this.dir = this.self.isFacingRight();
            if (this.self.getGlobalVariable("bombArray") != null)
            {
                this.bombArray = this.self.getGlobalVariable("bombArray");
            };
            this.garbageCollect();
            if ((this.bombArray.length - 1) >= (this.bombLimit - 1))
            {
                this.bombArray[0].destroy();
                this.bombArray.shift();
                this.self.setGlobalVariable("bombArray", this.bombArray);
            };
            this.projectile = this.self.getGlobalVariable("bombCharge");
            if (this.projectile.getStanceMC().currentLabel == "1")
            {
                this.self.fireProjectile("bomb1dropped", this.projectile.getX(), this.projectile.getY(), true);
                this.projectile.destroy();
                this.bomb = this.self.getCurrentProjectile();
                this.bomb.setYSpeed((this.self.getYSpeed() + 2));
                this.self.setGlobalVariable("bombCharge", null);
                this.bombArray.push(this.self.getCurrentProjectile());
                this.self.setGlobalVariable("bombArray", this.bombArray);
            }
            else
            {
                if (this.projectile.getStanceMC().currentLabel == "2")
                {
                    this.self.fireProjectile("bomb2dropped", this.projectile.getX(), this.projectile.getY(), true);
                    this.projectile.destroy();
                    this.bomb = this.self.getCurrentProjectile();
                    this.bomb.setYSpeed((this.self.getYSpeed() + 2));
                    this.self.setGlobalVariable("bombCharge", null);
                    this.bombArray.push(this.self.getCurrentProjectile());
                    this.self.setGlobalVariable("bombArray", this.bombArray);
                }
                else
                {
                    this.self.fireProjectile("bomb3dropped", this.projectile.getX(), this.projectile.getY(), true);
                    this.projectile.destroy();
                    this.bomb = this.self.getCurrentProjectile();
                    this.bomb.setYSpeed((this.self.getYSpeed() + 2));
                    this.self.setGlobalVariable("bombCharge", null);
                    this.bombArray.push(this.self.getCurrentProjectile());
                    this.self.setGlobalVariable("bombArray", this.bombArray);
                };
            };
            this.projectile.destroy();
        }

        internal function frame80():*
        {
            this.self.endAttack();
        }

        internal function frame81():*
        {
            this.xframe = "attack";
            this.self.updateAttackStats({
                "allowJump":false,
                "allowControl":false,
                "allowTurn":false,
                "allowRun":false,
                "linkFrames":false
            });
            this.self.setGlobalVariable("charge", this.self.getAttackStat("chargetime"));
            SSF2API.destroyTimer(this.self, this.drop);
        }

        internal function frame89():*
        {
            this.self.playAttackSound(1);
            this.controls = this.self.getControls();
            this.dir = this.self.isFacingRight();
            if (this.self.getGlobalVariable("bombArray") != null)
            {
                this.bombArray = this.self.getGlobalVariable("bombArray");
            };
            this.garbageCollect();
            if ((this.bombArray.length - 1) >= (this.bombLimit - 1))
            {
                this.bombArray[0].destroy();
                this.bombArray.shift();
                this.self.setGlobalVariable("bombArray", this.bombArray);
            };
            this.projectile = this.self.getGlobalVariable("bombCharge");
            if (this.projectile.getStanceMC().currentLabel == "1")
            {
                this.self.fireProjectile("bomb1dropped", this.projectile.getX(), this.projectile.getY(), true);
                this.projectile.destroy();
                this.self.setGlobalVariable("bombCharge", null);
                this.bombArray.push(this.self.getCurrentProjectile());
                this.self.setGlobalVariable("bombArray", this.bombArray);
            }
            else
            {
                if (this.projectile.getStanceMC().currentLabel == "2")
                {
                    this.self.fireProjectile("bomb2dropped", this.projectile.getX(), this.projectile.getY(), true);
                    this.projectile.destroy();
                    this.self.setGlobalVariable("bombCharge", null);
                    this.bombArray.push(this.self.getCurrentProjectile());
                    this.self.setGlobalVariable("bombArray", this.bombArray);
                }
                else
                {
                    this.self.fireProjectile("bomb3dropped", this.projectile.getX(), this.projectile.getY(), true);
                    this.projectile.destroy();
                    this.self.setGlobalVariable("bombCharge", null);
                    this.bombArray.push(this.self.getCurrentProjectile());
                    this.self.setGlobalVariable("bombArray", this.bombArray);
                };
            };
            this.projectile.destroy();
            this.projectile = this.self.getCurrentProjectile();
            this.projectile.setXSpeed(0);
            this.projectile.setYSpeed(-20);
        }

        internal function frame93():*
        {
            this.self.endAttack();
        }


    }
}//package bomberman_fla

