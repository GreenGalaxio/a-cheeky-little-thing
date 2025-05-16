﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_throwU_79

package fox_fla
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

    public dynamic class fox_throwU_79 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var projectile:*;
        public var target:*;
        public var grab:*;

        public function fox_throwU_79()
        {
            addFrameScript(0, this.frame1, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 19, this.frame20, 20, this.frame21);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.projectile = null;
            };
        }

        internal function frame14():*
        {
            this.self.attachEffect("fox_blasterEffectUp");
        }

        internal function frame15():*
        {
            this.self.fireProjectile("uthrowLaser");
            this.self.playAttackSound(1);
        }

        internal function frame16():*
        {
            if (this.self.getCurrentProjectile() != null)
            {
                this.projectile = this.self.getCurrentProjectile();
                this.projectile.setXSpeed(-1);
            };
            this.self.fireProjectile("uthrowLaser");
            this.self.playAttackSound(1);
            this.self.attachEffect("fox_blasterEffectUp");
        }

        internal function frame17():*
        {
            if (this.self.getCurrentProjectile() != null)
            {
                this.projectile = this.self.getCurrentProjectile();
                this.projectile.setXSpeed(1);
            };
            this.self.fireProjectile("uthrowLaser");
            this.self.playAttackSound(1);
            SSF2API.shakeCamera(9);
        }

        internal function frame18():*
        {
            this.self.attachEffect("fox_blasterEffectUp");
        }

        internal function frame20():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame21():*
        {
            this.target = null;
            this.grab = 0;
            if (this.self.isCPU())
            {
                this.target = this.self.getGrabbedOpponent();
                this.grab = SSF2API.random();
                if (((!(this.target == null)) && (this.target.getDamage() >= 70)))
                {
                    if (this.grab <= 0.8)
                    {
                        this.self.importCPUControls([128, 7, 2208, 1]);
                    };
                }
                else
                {
                    if (this.target != null)
                    {
                        if (((this.grab <= 0.4) && (this.target.getDamage() <= 50)))
                        {
                            this.self.importCPUControls([6305, 1]);
                        }
                        else
                        {
                            if (this.grab <= 0.5)
                            {
                                this.self.importCPUControls([128, 7, 4129, 1]);
                            }
                            else
                            {
                                if (this.grab <= 0.75)
                                {
                                    this.self.importCPUControls([128, 7, 4385, 1]);
                                }
                                else
                                {
                                    this.self.importCPUControls([128, 7, 4641, 1]);
                                };
                            };
                        };
                    };
                };
            };
            this.self.endAttack();
        }


    }
}//package fox_fla

