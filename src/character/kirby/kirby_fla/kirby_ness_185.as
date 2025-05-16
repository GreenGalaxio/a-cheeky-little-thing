// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_ness_185

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class kirby_ness_185 extends MovieClip 
    {

        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var projectile:*;

        public function kirby_ness_185()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 15, this.frame16, 21, this.frame22, 33, this.frame34, 34, this.frame35, 43, this.frame44, 61, this.frame62);
        }

        public function finishAttack():void
        {
            gotoAndPlay("attack");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
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
            this.xframe = "charging";
            if (this.projectile.getMC().currentLabel == "continue")
            {
                gotoAndPlay("attack");
            };
            SSF2API.createTimer(this.self, 78, 1, this.finishAttack);
        }

        internal function frame34():*
        {
            gotoAndPlay("charging");
        }

        internal function frame35():*
        {
            this.xframe = "attack";
            SSF2API.destroyTimer(this.self, this.finishAttack);
            if (((!(this.projectile == null)) && (!(this.projectile.isDead()))))
            {
                this.projectile.getStanceMC().gotoAndPlay("boom");
                this.projectile.setXSpeed(0);
                this.projectile.setYSpeed(0);
                this.projectile.updateProjectileStats({"maxgravity":0});
                this.projectile.endControl();
            };
        }

        internal function frame44():*
        {
            SSF2API.playSound("pkflash2");
        }

        internal function frame62():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

