// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_crashbomb_12

package megaman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class megaman_crashbomb_12 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var projectile:*;
        public var projRight:Boolean;
        public var testedFacing:Boolean;
        public var opponent:Object;
        public var wallX:*;
        public var wallY:*;
        public var count:int;
        public var count2:int;
        public var character:*;

        public function megaman_crashbomb_12()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 14, this.frame15, 34, this.frame35, 35, this.frame36, 39, this.frame40, 40, this.frame41, 42, this.frame43, 52, this.frame53);
        }

        public function go(_arg_1:*):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.go);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.go);
            if (_arg_1.data.receiver)
            {
                this.opponent = _arg_1.data.receiver;
            }
            else
            {
                this.wallX = this.self.getX();
                this.wallY = this.self.getY();
            };
            this.gotoAndPlay("continue");
        }

        public function goOn(_arg_1:*=null):void
        {
            this.opponent = _arg_1.data.receiver;
            SSF2API.removeEventListener(this.self, SSF2Event.PROJ_LATCHED, this.goOn);
            this.gotoAndPlay("continue");
        }

        public function destroyBomb(_arg_1:*=null):void
        {
            SSF2API.print("kaboom");
            this.character.setGlobalVariable("crashBomb", 0);
            if (this.opponent != null)
            {
                this.opponent.removeEventListener(SSF2Event.CHAR_KO_DEATH, this.destroyBomb);
            };
            this.self.removeEventListener(SSF2Event.PROJ_DESTROYED, this.destroyBomb);
            this.self.destroy();
        }

        public function latch():void
        {
            if (!this.testedFacing)
            {
                if (!this.self.isFacingRight())
                {
                    this.projRight = false;
                    this.testedFacing = true;
                }
                else
                {
                    this.projRight = true;
                    this.testedFacing = true;
                };
            };
            if (!this.opponent)
            {
                this.self.setY(this.wallY);
                this.self.setX(this.wallX);
            }
            else
            {
                if (this.opponent.isFacingRight())
                {
                    if (this.projRight)
                    {
                        this.self.setX((this.opponent.getX() - 10));
                    }
                    else
                    {
                        this.self.setX((this.opponent.getX() + 22));
                    };
                    this.self.faceLeft();
                }
                else
                {
                    if (this.projRight)
                    {
                        this.self.setX((this.opponent.getX() - 20));
                    }
                    else
                    {
                        this.self.setX((this.opponent.getX() + 12));
                    };
                    this.self.faceRight();
                };
                this.self.setY((this.opponent.getY() - 25));
            };
            if (this.opponent)
            {
                SSF2API.print(((("OppX:" + this.opponent.getX()) + ", ProjX:") + this.self.getX()));
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            this.projectile = null;
            this.projRight = true;
            this.testedFacing = false;
            this.opponent = null;
            this.wallX = null;
            this.wallY = null;
            this.count = 0;
            this.count2 = 0;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
            };
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.projectile = this.self;
                this.character.setGlobalVariable("crashBomb", 1);
                this.self.addEventListener(SSF2Event.PROJ_DESTROYED, this.destroyBomb);
                SSF2API.addEventListener(this.self, SSF2Event.PROJ_LATCHED, this.goOn);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.go);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.go);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.self.destroy);
            };
        }

        internal function frame4():*
        {
            gotoAndPlay("loop");
        }

        internal function frame5():*
        {
            this.character.setGlobalVariable("crashBomb", 2);
            SSF2API.createTimer(this.self, 1, -1, this.latch);
            this.self.updateProjectileStats({"time_max":99999});
            if (this.opponent)
            {
                this.opponent.addEventListener(SSF2Event.CHAR_KO_DEATH, this.destroyBomb, {"persistent":true});
            };
        }

        internal function frame15():*
        {
            this.count2++;
            if (this.count2 >= 10)
            {
                gotoAndPlay("loop2");
            };
        }

        internal function frame35():*
        {
            gotoAndPlay("loopLatch");
        }

        internal function frame36():*
        {
            this.count++;
            if (this.count >= 8)
            {
                gotoAndPlay("boom");
            };
        }

        internal function frame40():*
        {
            this.gotoAndPlay("loop2");
        }

        internal function frame41():*
        {
            this.character.setGlobalVariable("crashBomb", 0);
            SSF2API.playSound("megaman_explosion");
            this.self.updateAttackBoxStats(1, {
                "hasEffect":true,
                "damage":10,
                "power":50,
                "kbConstant":95
            });
            this.self.refreshAttackID();
        }

        internal function frame43():*
        {
            this.projectile.attachEffect("effect_firehit1", {
                "scaleX":2,
                "scaleY":2
            });
        }

        internal function frame53():*
        {
            this.self.destroy();
        }


    }
}//package megaman_fla

