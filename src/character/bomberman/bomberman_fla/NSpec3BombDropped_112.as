// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.NSpec3BombDropped_112

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

    public dynamic class NSpec3BombDropped_112 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var getTarget:*;
        public var timer:*;
        public var timeMax:*;
        public var ignore:Boolean;
        public var autoDetonate:*;
        public var self:*;
        public var character:*;
        public var xSpeed:Number;
        public var origXSpeed:Number;
        public var decay:Number;
        public var player:*;
        public var projectile:*;
        public var hasLanded:*;
        public var airKick:*;
        public var groundStart:Boolean;

        public function NSpec3BombDropped_112()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 33, this.frame34, 34, this.frame35, 40, this.frame41, 41, this.frame42, 42, this.frame43, 43, this.frame44, 45, this.frame46, 53, this.frame54, 54, this.frame55, 55, this.frame56, 56, this.frame57, 65, this.frame66);
        }

        public function detonateCheck():void
        {
            this.getTarget = this.player.getCPUTarget();
            if ((((((!(this.getTarget == null)) && (!(this.player.inUpperLeftWarningBounds()))) && (!(this.player.inLowerLeftWarningBounds()))) && (!(this.player.inUpperRightWarningBounds()))) && (!(this.player.inLowerRightWarningBounds()))))
            {
                if (((this.player.getCPUForcedAction() == -1) || (this.player.getCPUForcedAction() == 5)))
                {
                    if (((((this.getTarget.getX() < (this.self.getX() + 50)) && (this.getTarget.getX() > (this.self.getX() - 50))) && (this.getTarget.getY() < (this.self.getY() + 40))) && (this.getTarget.getY() > (this.self.getY() - 40))))
                    {
                        this.player.importCPUControls([1088, 1]);
                    }
                    else
                    {
                        if ((((((this.getTarget.getX() > this.self.getX()) && (this.self.getX() < (this.getTarget.getX() + 25))) && (this.self.getX() > (this.getTarget.getX() - 25))) && (this.self.getY() < (this.getTarget.getY() + 10))) && (this.self.getY() > (this.getTarget.getY() - 10))))
                        {
                            this.player.importCPUControls([320, 1]);
                        }
                        else
                        {
                            if ((((((this.getTarget.getX() < this.self.getX()) && (this.self.getX() < (this.getTarget.getX() + 25))) && (this.self.getX() > (this.getTarget.getX() - 25))) && (this.self.getY() < (this.getTarget.getY() + 10))) && (this.self.getY() > (this.getTarget.getY() - 10))))
                            {
                                this.player.importCPUControls([576, 1]);
                            };
                        };
                    };
                };
            };
        }

        public function landCheck():void
        {
            this.hasLanded = this.self.isOnGround();
            if (!this.hasLanded)
            {
                this.ignore = false;
            };
            if (((this.hasLanded) && (!(this.ignore))))
            {
                this.self.setXSpeed(0);
                this.self.setYSpeed(0);
                SSF2API.print("landed.");
                this.ignore = true;
            };
        }

        public function bombKick():void
        {
            if (this.projectile.isOnGround())
            {
                this.projectile.setXSpeed((this.projectile.getXSpeed() / 1.25));
            };
        }

        public function timeCheck():void
        {
            this.timer++;
            if (((this.timer > this.timeMax) && (this.autoDetonate == true)))
            {
                gotoAndPlay("continue");
            };
        }

        internal function frame1():*
        {
            this.timer = 0;
            this.timeMax = (30 * 10);
            this.ignore = false;
            this.autoDetonate = false;
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
            };
            this.xSpeed = 26;
            this.origXSpeed = 15;
            this.decay = 3.5;
            this.player = null;
            this.projectile = null;
            this.hasLanded = false;
            this.airKick = false;
            if (((SSF2API.isReady()) && (this.self)))
            {
                if (SSF2API != null)
                {
                    this.projectile = this.self;
                    this.player = this.character;
                    this.projectile.faceRight();
                    this.groundStart = this.projectile.isOnGround();
                };
            };
        }

        internal function frame2():*
        {
            SSF2API.createTimer(this.self, 1, -1, this.detonateCheck);
            this.self.createTimer(1, -1, this.landCheck);
            this.self.createTimer(1, -1, this.landCheck);
        }

        internal function frame34():*
        {
            gotoAndPlay("start");
        }

        internal function frame35():*
        {
            SSF2API.destroyTimer(this.self, this.detonateCheck);
            SSF2API.destroyTimer(this.self, this.landCheck);
            SSF2API.destroyTimer(this.self, this.timeCheck);
            SSF2API.playSound("bomberman_explode");
            this.projectile.setXSpeed(0);
            this.projectile.setYSpeed(0);
            this.projectile.attachEffect("explosionNewBig");
            SSF2API.shakeCamera(10);
        }

        internal function frame41():*
        {
            this.projectile.destroy();
        }

        internal function frame42():*
        {
            gotoAndPlay("end");
        }

        internal function frame43():*
        {
            this.projectile.setXSpeed(this.xSpeed, false);
            if (this.airKick)
            {
                this.projectile.setYSpeed(-(this.xSpeed / 2));
                this.projectile.setXSpeed((this.xSpeed / 2), false);
            };
        }

        internal function frame44():*
        {
            SSF2API.createTimer(this.self, 1, 11, this.bombKick);
        }

        internal function frame46():*
        {
            if (this.self.getX() == this.character.getStanceMC().bombx)
            {
                SSF2API.print("...but it didn't. oh.");
            }
            else
            {
                SSF2API.print("you fixed it! great job :)");
            };
        }

        internal function frame54():*
        {
            this.xSpeed = this.origXSpeed;
            if (this.projectile.isOnGround())
            {
                this.projectile.setXSpeed(0);
            };
            gotoAndPlay("start");
        }

        internal function frame55():*
        {
            this.projectile.setXSpeed(-(this.xSpeed), false);
            if (this.airKick)
            {
                this.projectile.setYSpeed(-(this.xSpeed / 2));
                this.projectile.setXSpeed((-0.5 * this.xSpeed), false);
            };
        }

        internal function frame56():*
        {
            SSF2API.createTimer(this.self, 1, 11, this.bombKick);
        }

        internal function frame57():*
        {
            if (this.self.getX() == this.character.getStanceMC().bombx)
            {
                SSF2API.print("...but it didn't. oh.");
            }
            else
            {
                SSF2API.print("you fixed it! great job :)");
            };
        }

        internal function frame66():*
        {
            this.xSpeed = this.origXSpeed;
            if (this.projectile.isOnGround())
            {
                this.projectile.setXSpeed(0);
            };
            gotoAndPlay("start");
        }


    }
}//package bomberman_fla

