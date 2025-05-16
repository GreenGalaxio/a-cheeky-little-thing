// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_upspecial_37

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

    public dynamic class Yoshi_upspecial_37 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var xspeed:*;
        public var angle:*;
        public var controls:*;
        public var dir:Boolean;
        public var speed:*;
        public var thisCharacter:*;
        public var projectile:*;

        public function Yoshi_upspecial_37()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 6, this.frame7, 8, this.frame9, 9, this.frame10, 10, this.frame11, 13, this.frame14);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame4():*
        {
            this.xspeed = 8;
            this.controls = this.self.getControls();
            this.dir = this.self.isFacingRight();
            if (this.dir)
            {
                this.angle = 75;
            }
            else
            {
                this.angle = 105;
            };
        }

        internal function frame5():*
        {
            this.speed = 0;
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.speed++;
            };
            if (((this.controls.RIGHT) && (this.dir)))
            {
                this.angle = (this.angle - 5);
            };
            if (((this.controls.LEFT) && (this.dir)))
            {
                this.angle = (this.angle + 7);
            };
            if (((this.controls.LEFT) && (!(this.dir))))
            {
                this.angle = (this.angle + 5);
            };
            if (((this.controls.RIGHT) && (!(this.dir))))
            {
                this.angle = (this.angle - 7);
            };
        }

        internal function frame7():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.speed++;
            };
            if (((this.controls.RIGHT) && (this.dir)))
            {
                this.angle = (this.angle - 5);
            };
            if (((this.controls.LEFT) && (this.dir)))
            {
                this.angle = (this.angle + 7);
            };
            if (((this.controls.LEFT) && (!(this.dir))))
            {
                this.angle = (this.angle + 5);
            };
            if (((this.controls.RIGHT) && (!(this.dir))))
            {
                this.angle = (this.angle - 7);
            };
        }

        internal function frame9():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.speed++;
            };
            if (((this.controls.RIGHT) && (this.dir)))
            {
                this.angle = (this.angle - 5);
            };
            if (((this.controls.LEFT) && (this.dir)))
            {
                this.angle = (this.angle + 7);
            };
            if (((this.controls.LEFT) && (!(this.dir))))
            {
                this.angle = (this.angle + 5);
            };
            if (((this.controls.RIGHT) && (!(this.dir))))
            {
                this.angle = (this.angle - 7);
            };
        }

        internal function frame10():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.speed++;
            };
            if (((this.controls.RIGHT) && (this.dir)))
            {
                this.angle = (this.angle - 10);
            };
            if (((this.controls.LEFT) && (this.dir)))
            {
                this.angle = (this.angle + 10);
            };
            if (((this.controls.LEFT) && (!(this.dir))))
            {
                this.angle = (this.angle + 10);
            };
            if (((this.controls.RIGHT) && (!(this.dir))))
            {
                this.angle = (this.angle - 10);
            };
            this.thisCharacter = this.self;
            this.thisCharacter.playAttackSound(1);
        }

        internal function frame11():*
        {
            this.self.fireProjectile("eggBomb", 10, -60);
            this.projectile = this.thisCharacter.getCurrentProjectile();
            this.projectile.angleControl((10 + this.speed), this.angle);
        }

        internal function frame14():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                this.self.setAttackEnabled(false, "b_up_air");
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                this.self.setAttackEnabled(false, "b_up");
            };
            this.self.endAttack();
        }


    }
}//package yoshi_fla

