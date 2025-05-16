// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_finalsmash_99

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.system.*;
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
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class ness_finalsmash_99 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;
        public var cam:Object;
        public var death:Object;
        public var randNum:Number;
        public var x_position:Number;
        public var y_position:Number;
        public var prevAngle:Number;
        public var angle:Number;
        public var projectile:Object;
        public var speed:Number;
        public var loopCount:*;

        public function ness_finalsmash_99()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 15, this.frame16, 44, this.frame45, 56, this.frame57, 68, this.frame69, 80, this.frame81, 97, this.frame98);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.cam = null;
                this.death = null;
                this.randNum = 0;
                this.x_position = 0;
                this.y_position = 0;
                this.prevAngle = 0;
                this.angle = 0;
                this.projectile = null;
                this.speed = 35;
            };
        }

        internal function frame4():*
        {
            SSF2API.playSound("ness_finalSmash");
        }

        internal function frame16():*
        {
            this.loopCount = 0;
        }

        internal function frame45():*
        {
            this.cam = SSF2API.getCamBounds();
            this.death = SSF2API.getDeathBounds();
            this.randNum = SSF2API.random();
            this.y_position = this.death.y;
            this.angle = (240 + (Math.random() * (300 - 240)));
            while (Math.abs((this.angle - this.prevAngle)) <= 10)
            {
                this.angle = (240 + (Math.random() * (300 - 240)));
            };
            this.x_position = (this.cam.x + (this.cam.width / 2));
            this.self.fireProjectile("ness_starstorm", this.x_position, this.y_position, true);
            this.projectile = this.self.getCurrentProjectile();
            if (!this.projectile.isFacingRight())
            {
                this.projectile.faceRight();
            };
            this.projectile.angleControl(this.speed, this.angle);
            SSF2API.playSound("starstorm_sound");
            this.prevAngle = this.angle;
        }

        internal function frame57():*
        {
            this.cam = SSF2API.getCamBounds();
            this.death = SSF2API.getDeathBounds();
            this.randNum = SSF2API.random();
            this.y_position = this.death.y;
            this.angle = (240 + (Math.random() * (300 - 240)));
            while (Math.abs((this.angle - this.prevAngle)) <= 10)
            {
                this.angle = (240 + (Math.random() * (300 - 240)));
            };
            this.x_position = (this.cam.x + (this.cam.width / 2));
            this.self.fireProjectile("ness_starstorm", this.x_position, this.y_position, true);
            this.projectile = this.self.getCurrentProjectile();
            if (!this.projectile.isFacingRight())
            {
                this.projectile.faceRight();
            };
            this.projectile.angleControl(this.speed, this.angle);
            SSF2API.playSound("starstorm_sound");
            this.prevAngle = this.angle;
        }

        internal function frame69():*
        {
            this.cam = SSF2API.getCamBounds();
            this.death = SSF2API.getDeathBounds();
            this.randNum = SSF2API.random();
            this.y_position = this.death.y;
            this.angle = (240 + (Math.random() * (300 - 240)));
            while (Math.abs((this.angle - this.prevAngle)) <= 10)
            {
                this.angle = (240 + (Math.random() * (300 - 240)));
            };
            this.x_position = (this.cam.x + (this.cam.width / 2));
            this.self.fireProjectile("ness_starstorm", this.x_position, this.y_position, true);
            this.projectile = this.self.getCurrentProjectile();
            if (!this.projectile.isFacingRight())
            {
                this.projectile.faceRight();
            };
            this.projectile.angleControl(this.speed, this.angle);
            SSF2API.playSound("starstorm_sound");
            this.prevAngle = this.angle;
        }

        internal function frame81():*
        {
            this.loopCount = (this.loopCount + 1);
            if (this.loopCount < 13)
            {
                gotoAndPlay("loop");
            };
        }

        internal function frame98():*
        {
            this.self.endAttack();
        }


    }
}//package ness_fla

