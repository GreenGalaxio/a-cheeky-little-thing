// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_finalsmash_100

package samus_fla
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

    public dynamic class samus_finalsmash_100 extends MovieClip 
    {

        public var self:*;
        public var countDown:int;
        public var projectile:*;
        public var controls:Object;
        public var samusFSCharge:Number;

        public function samus_finalsmash_100()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 28, this.frame29, 29, this.frame30, 30, this.frame31, 31, this.frame32, 32, this.frame33, 33, this.frame34, 34, this.frame35, 35, this.frame36, 39, this.frame40, 49, this.frame50);
        }

        public function checkRotation():*
        {
            if (((this.projectile) && (!(this.projectile.isDead()))))
            {
                this.controls = this.self.getControls();
                if (((this.controls) && (this.controls.UP)))
                {
                    this.projectile.MC.rotation = (this.projectile.MC.rotation - 0.15);
                }
                else
                {
                    if (((this.controls) && (this.controls.DOWN)))
                    {
                        this.projectile.MC.rotation = (this.projectile.MC.rotation + 0.15);
                    };
                };
            };
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.countDown = 210;
            this.projectile = null;
            this.controls = null;
            this.samusFSCharge = 0;
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.playAttackSound(4);
            };
        }

        internal function frame5():*
        {
            this.samusFSCharge = this.self.playAttackSound(2);
        }

        internal function frame23():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame24():*
        {
            this.self.fireProjectile("zerolaser");
            this.projectile = this.self.getCurrentProjectile();
        }

        internal function frame25():*
        {
            this.checkRotation();
        }

        internal function frame26():*
        {
            this.checkRotation();
        }

        internal function frame27():*
        {
            this.checkRotation();
        }

        internal function frame28():*
        {
            this.checkRotation();
        }

        internal function frame29():*
        {
            this.checkRotation();
        }

        internal function frame30():*
        {
            this.checkRotation();
        }

        internal function frame31():*
        {
            this.checkRotation();
        }

        internal function frame32():*
        {
            this.checkRotation();
        }

        internal function frame33():*
        {
            this.checkRotation();
        }

        internal function frame34():*
        {
            this.checkRotation();
        }

        internal function frame35():*
        {
            this.checkRotation();
        }

        internal function frame36():*
        {
            this.countDown = (this.countDown - 12);
            if (this.countDown > 0)
            {
                gotoAndPlay("loop");
            };
            this.checkRotation();
        }

        internal function frame40():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame50():*
        {
            this.self.endAttack();
        }


    }
}//package samus_fla

