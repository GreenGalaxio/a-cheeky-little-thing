// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_NSpecAir_34

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

    public dynamic class Bomberman_NSpecAir_34 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var pLockBox:MovieClip;
        public var xframe:String;
        public var action:String;
        public var controls:*;
        public var bombArray:Array;
        public var bomb:*;
        public var bombLimit:int;
        public var self:*;
        public var dir:*;
        public var projectile:Object;

        public function Bomberman_NSpecAir_34()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 23, this.frame24, 32, this.frame33, 33, this.frame34, 38, this.frame39, 39, this.frame40, 40, this.frame41, 44, this.frame45, 52, this.frame53, 53, this.frame54, 59, this.frame60, 63, this.frame64, 64, this.frame65, 72, this.frame73, 76, this.frame77);
        }

        public function drop():void
        {
            this.controls = this.self.getControls();
            if (((!(this.controls.BUTTON1)) && (this.controls.DOWN)))
            {
                SSF2API.print("dropping");
                gotoAndPlay("drop");
            }
            else
            {
                if (((!(this.controls.BUTTON1)) && (this.controls.UP)))
                {
                    SSF2API.print("throwing up");
                    gotoAndPlay("up");
                };
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
            this.xframe = "charging";
            this.action = "rising";
            this.bombArray = new Array();
            this.bombLimit = 5;
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                if (this.self.getGlobalVariable("bombCharge") == null)
                {
                    this.self.fireProjectile("heldbomb");
                    this.dir = this.self.isFacingRight();
                    this.projectile = this.self.getCurrentProjectile();
                    this.self.setGlobalVariable("bombCharge", this.projectile);
                };
            };
        }

        internal function frame2():*
        {
            SSF2API.createTimer(this.self, 1, -1, this.drop);
            gotoAndPlay("rising");
        }

        internal function frame24():*
        {
            this.self.updateAttackStats({
                "allowControl":true,
                "allowTurn":true
            });
            this.xframe = "charging";
            this.action = "rising";
        }

        internal function frame33():*
        {
            gotoAndPlay("rising");
        }

        internal function frame34():*
        {
            this.xframe = "charging";
            this.action = "falling";
            this.self.updateAttackStats({
                "allowControl":true,
                "allowTurn":true
            });
        }

        internal function frame39():*
        {
            gotoAndPlay("fallingloop");
        }

        internal function frame40():*
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
        }

        internal function frame41():*
        {
            SSF2API.destroyTimer(this.self, this.drop);
        }

        internal function frame45():*
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
                this.self.fireProjectile("bomb1dropped");
                this.projectile.destroy();
                this.self.setGlobalVariable("bombCharge", null);
                this.bombArray.push(this.self.getCurrentProjectile());
                this.self.setGlobalVariable("bombArray", this.bombArray);
            }
            else
            {
                if (this.projectile.getStanceMC().currentLabel == "2")
                {
                    this.self.fireProjectile("bomb2dropped");
                    this.projectile.destroy();
                    this.self.setGlobalVariable("bombCharge", null);
                    this.bombArray.push(this.self.getCurrentProjectile());
                    this.self.setGlobalVariable("bombArray", this.bombArray);
                }
                else
                {
                    this.self.fireProjectile("bomb3dropped");
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

        internal function frame53():*
        {
            this.self.endAttack();
        }

        internal function frame54():*
        {
            SSF2API.destroyTimer(this.self, this.drop);
            this.xframe = "attack";
            this.self.updateAttackStats({
                "allowJump":false,
                "allowFastFall":false,
                "allowControl":false,
                "allowTurn":false,
                "allowRun":false,
                "linkFrames":false
            });
            this.self.setGlobalVariable("charge", this.self.getAttackStat("chargetime"));
            SSF2API.destroyTimer(this.self, this.drop);
        }

        internal function frame60():*
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

        internal function frame64():*
        {
            this.self.endAttack();
        }

        internal function frame65():*
        {
            SSF2API.destroyTimer(this.self, this.drop);
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

        internal function frame73():*
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

        internal function frame77():*
        {
            this.self.endAttack();
        }


    }
}//package bomberman_fla

