// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_pkflash_39

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

    public dynamic class ness_pkflash_39 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var xframe:String;
        public var projectile:*;

        public function ness_pkflash_39()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 15, this.frame16, 21, this.frame22, 22, this.frame23, 23, this.frame24, 32, this.frame33, 50, this.frame51);
        }

        public function finishAttack():void
        {
            gotoAndPlay("attack");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.self.setYSpeed(0);
                this.self.setXSpeed((this.self.getXSpeed() * 0.65));
                this.self.playVoiceSound(1);
            };
        }

        internal function frame3():*
        {
            this.self.fireProjectile("ness_pkflash");
        }

        internal function frame4():*
        {
            this.projectile = this.self.getCurrentProjectile();
        }

        internal function frame16():*
        {
            if (((!(this.projectile == null)) && (!(this.projectile.isDead()))))
            {
                this.projectile.updateProjectileStats({"maxgravity":0.2});
            };
        }

        internal function frame22():*
        {
            if (this.projectile.getMC().currentLabel == "continue")
            {
                gotoAndPlay("attack");
            };
            this.xframe = "charging";
            SSF2API.createTimer(this.self, 78, 1, this.finishAttack);
        }

        internal function frame23():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame24():*
        {
            this.xframe = "attack";
            SSF2API.destroyTimer(this.self, this.finishAttack);
            if (((!(this.projectile == null)) && (!(this.projectile.isDead()))))
            {
                this.projectile.getStanceMC().gotoAndPlay("boom");
            };
            this.projectile.setXSpeed(0);
            this.projectile.setYSpeed(0);
            this.projectile.updateProjectileStats({"maxgravity":0});
            this.projectile.endControl();
        }

        internal function frame33():*
        {
            SSF2API.playSound("pkflash2");
        }

        internal function frame51():*
        {
            this.self.endAttack();
        }


    }
}//package ness_fla

