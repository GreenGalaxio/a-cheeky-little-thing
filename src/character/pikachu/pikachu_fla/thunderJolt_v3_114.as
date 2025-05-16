// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.thunderJolt_v3_114

package pikachu_fla
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

    public dynamic class thunderJolt_v3_114 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var projectile:*;
        public var dir:Boolean;
        public var wall:Boolean;
        public var angle:Number;
        public var hasTouchedTerrain:Boolean;
        public var incr:Number;
        public var speed:Number;
        public var max:int;
        public var bouncedAngle:Number;
        public var self:*;
        public var character:*;

        public function thunderJolt_v3_114()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10);
        }

        internal function frame1():*
        {
            this.angle = 70;
            this.hasTouchedTerrain = false;
            this.incr = 25;
            this.speed = 10;
            this.max = 80;
            this.bouncedAngle = 70;
        }

        internal function frame2():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                this.projectile = this.self;
                this.dir = this.projectile.isFacingRight();
                this.projectile.unnattachFromGround();
                this.projectile.modifyContinueOnGround(true);
                this.projectile.modifyContinueOnCrash(true);
                if (this.hasTouchedTerrain)
                {
                    this.max = (this.max - 4);
                    if (this.max <= 0)
                    {
                        this.projectile.destroy();
                    };
                    if (this.dir)
                    {
                        if (this.angle < 0)
                        {
                            this.angle = (360 - this.angle);
                        };
                        this.projectile.angleControl(this.speed, this.angle);
                        this.angle = (this.angle - this.incr);
                        this.incr = (this.incr - 0.3);
                    }
                    else
                    {
                        if (this.angle > 360)
                        {
                            this.angle = (this.angle - 360);
                        };
                        this.projectile.angleControl(this.speed, this.angle);
                        this.angle = (this.angle + this.incr);
                        this.incr = (this.incr + 0.3);
                    };
                };
            };
        }

        internal function frame3():*
        {
            if (SSF2API != null)
            {
                this.projectile = this.self;
                this.dir = this.projectile.isFacingRight();
                this.projectile.modifyContinueOnGround(true);
                this.projectile.modifyContinueOnCrash(true);
                if (this.hasTouchedTerrain)
                {
                    if (this.dir)
                    {
                        if (this.angle < 0)
                        {
                            this.angle = (360 - this.angle);
                        };
                        this.projectile.angleControl(this.speed, this.angle);
                        this.angle = (this.angle - this.incr);
                        this.incr = (this.incr - 0.3);
                    }
                    else
                    {
                        if (this.angle > 360)
                        {
                            this.angle = (this.angle - 360);
                        };
                        this.projectile.angleControl(this.speed, this.angle);
                        this.angle = (this.angle + this.incr);
                        this.incr = (this.incr + 0.3);
                    };
                };
            };
        }

        internal function frame4():*
        {
            if (SSF2API != null)
            {
                this.projectile = this.self;
                this.dir = this.projectile.isFacingRight();
                this.projectile.modifyContinueOnGround(true);
                this.projectile.modifyContinueOnCrash(true);
                if (this.hasTouchedTerrain)
                {
                    if (this.dir)
                    {
                        if (this.angle < 0)
                        {
                            this.angle = (360 - this.angle);
                        };
                        this.projectile.angleControl(this.speed, this.angle);
                        this.angle = (this.angle - this.incr);
                        this.incr = (this.incr - 0.3);
                    }
                    else
                    {
                        if (this.angle > 360)
                        {
                            this.angle = (this.angle - 360);
                        };
                        this.projectile.angleControl(this.speed, this.angle);
                        this.angle = (this.angle + this.incr);
                        this.incr = (this.incr + 0.3);
                    };
                };
            };
        }

        internal function frame5():*
        {
            if (SSF2API != null)
            {
                this.projectile = this.self;
                this.dir = this.projectile.isFacingRight();
                this.projectile.modifyContinueOnGround(true);
                this.projectile.modifyContinueOnCrash(true);
                if (this.hasTouchedTerrain)
                {
                    if (this.dir)
                    {
                        if (this.angle < 0)
                        {
                            this.angle = (360 - this.angle);
                        };
                        this.projectile.angleControl(this.speed, this.angle);
                        this.angle = (this.angle - this.incr);
                        this.incr = (this.incr - 0.3);
                    }
                    else
                    {
                        if (this.angle > 360)
                        {
                            this.angle = (this.angle - 360);
                        };
                        this.projectile.angleControl(this.speed, this.angle);
                        this.angle = (this.angle + this.incr);
                        this.incr = (this.incr + 0.3);
                    };
                };
            };
        }

        internal function frame6():*
        {
            if (SSF2API != null)
            {
                this.projectile = this.self;
                this.dir = this.projectile.isFacingRight();
                this.projectile.modifyContinueOnGround(true);
                this.projectile.modifyContinueOnCrash(true);
                if (this.hasTouchedTerrain)
                {
                    if (this.dir)
                    {
                        if (this.angle < 0)
                        {
                            this.angle = (360 - this.angle);
                        };
                        this.projectile.angleControl(this.speed, this.angle);
                        this.angle = (this.angle - this.incr);
                        this.incr = (this.incr - 0.3);
                    }
                    else
                    {
                        if (this.angle > 360)
                        {
                            this.angle = (this.angle - 360);
                        };
                        this.projectile.angleControl(this.speed, this.angle);
                        this.angle = (this.angle + this.incr);
                        this.incr = (this.incr + 0.3);
                    };
                };
            };
        }

        internal function frame7():*
        {
            if (SSF2API != null)
            {
                this.projectile = this.self;
                this.dir = this.projectile.isFacingRight();
                this.projectile.modifyContinueOnGround(true);
                this.projectile.modifyContinueOnCrash(true);
                if (this.hasTouchedTerrain)
                {
                    if (this.dir)
                    {
                        if (this.angle < 0)
                        {
                            this.angle = (360 - this.angle);
                        };
                        this.projectile.angleControl(this.speed, this.angle);
                        this.angle = (this.angle - this.incr);
                        this.incr = (this.incr - 0.3);
                    }
                    else
                    {
                        if (this.angle > 360)
                        {
                            this.angle = (this.angle - 360);
                        };
                        this.projectile.angleControl(this.speed, this.angle);
                        this.angle = (this.angle + this.incr);
                        this.incr = (this.incr + 0.3);
                    };
                };
            };
        }

        internal function frame8():*
        {
            if (SSF2API != null)
            {
                this.projectile = this.self;
                this.dir = this.projectile.isFacingRight();
                this.projectile.modifyContinueOnGround(true);
                this.projectile.modifyContinueOnCrash(true);
                if (this.hasTouchedTerrain)
                {
                    if (this.dir)
                    {
                        if (this.angle < 0)
                        {
                            this.angle = (360 - this.angle);
                        };
                        this.projectile.angleControl(this.speed, this.angle);
                        this.angle = (this.angle - this.incr);
                        this.incr = (this.incr - 0.3);
                    }
                    else
                    {
                        if (this.angle > 360)
                        {
                            this.angle = (this.angle - 360);
                        };
                        this.projectile.angleControl(this.speed, this.angle);
                        this.angle = (this.angle + this.incr);
                        this.incr = (this.incr + 0.3);
                    };
                };
            };
        }

        internal function frame9():*
        {
            gotoAndPlay("loop");
        }

        internal function frame10():*
        {
            this.hasTouchedTerrain = true;
            SSF2API.playSound("brawl_zap_s");
            this.projectile.modifyGravity(0);
            this.dir = this.projectile.isFacingRight();
            if (this.dir)
            {
                if (((this.angle > 180) || (this.angle < 60)))
                {
                    this.angle = 55;
                }
                else
                {
                    if (((this.angle >= 60) || (this.angle < 120)))
                    {
                        this.angle = 110;
                    }
                    else
                    {
                        this.angle = 200;
                    };
                };
                this.incr = 18;
                this.bouncedAngle = this.angle;
            }
            else
            {
                this.angle = (this.angle - 140);
                this.incr = 18;
                this.bouncedAngle = this.angle;
            };
            gotoAndPlay("loop");
        }


    }
}//package pikachu_fla

