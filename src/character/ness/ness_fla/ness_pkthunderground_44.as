// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_pkthunderground_44

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class ness_pkthunderground_44 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var controls:Object;
        public var projectile:*;

        public function ness_pkthunderground_44()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 26, this.frame27, 27, this.frame28, 28, this.frame29, 30, this.frame31, 35, this.frame36, 39, this.frame40);
        }

        public function attachDust():void
        {
            this.self.attachEffect("dustTrail");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
                if (((this.self.isCPU()) && (!(this.self.isOnGround()))))
                {
                    if (this.self.inLowerLeftWarningBounds())
                    {
                        this.self.importCPUControls([6209, 4, 6657, 3, 4609, 1, 5633, 6, 5121, 4, 5377, 3, 5121, 2, 5377, 2, 4353, 2, 6401, 9, 4353, 1, 4097, 17]);
                    }
                    else
                    {
                        if (this.self.inLowerRightWarningBounds())
                        {
                            this.self.importCPUControls([6145, 1, 6401, 1, 4353, 3, 5377, 9, 5121, 6, 5633, 8, 4609, 1, 6657, 7, 4097, 21]);
                        };
                    };
                };
            };
        }

        internal function frame2():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
            this.self.fireProjectile("ness_pkthunder");
        }

        internal function frame10():*
        {
            this.self.updateAttackStats({"linkFrames":true});
            this.projectile = this.self.getCurrentProjectile();
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame11():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame12():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame13():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame14():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame15():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame16():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame17():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame18():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame19():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame20():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
        }

        internal function frame21():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.SHIELD) || (this.projectile.isDead())))
            {
                gotoAndPlay("end");
            };
            gotoAndPlay("loop");
        }

        internal function frame22():*
        {
            if (((this.projectile) && (!(this.projectile.isDead()))))
            {
                this.projectile.endControl();
                this.projectile.removeFromCamera();
            };
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }

        internal function frame28():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            this.self.updateAttackStats({
                "cancelWhenAirborne":false,
                "freezeOnGround":true,
                "air_ease":-1,
                "linkFrames":false,
                "stickyGround":false,
                "shock":true
            });
            SSF2API.playSound("Ness_005");
            this.self.playVoiceSound(2);
            this.self.attachEffect("effect_firehit1", {
                "scaleX":2,
                "scaleY":2
            });
            SSF2API.shakeCamera(20);
        }

        internal function frame29():*
        {
            this.self.updateAttackStats({"air_ease":-1});
            SSF2API.createTimer(this.self, 3, -1, this.attachDust);
        }

        internal function frame31():*
        {
            this.self.updateAttackBoxStats(1, {"power":59});
        }

        internal function frame36():*
        {
            this.self.updateAttackStats({"air_ease":2});
        }

        internal function frame40():*
        {
            gotoAndPlay("again");
        }


    }
}//package ness_fla

