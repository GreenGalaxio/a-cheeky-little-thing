// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.zelda_sspec_506

package zelda_fla
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

    public dynamic class zelda_sspec_506 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var xframe:String;
        public var projectile:*;

        public function zelda_sspec_506()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 14, this.frame15, 15, this.frame16, 16, this.frame17, 27, this.frame28);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (SSF2API.isReady())
            {
                this.xframe = null;
            };
        }

        internal function frame3():*
        {
            this.self.fireProjectile("dinsfire");
            this.self.playAttackSound(1);
        }

        internal function frame4():*
        {
            this.projectile = this.self.getCurrentProjectile();
        }

        internal function frame15():*
        {
            this.xframe = "charging";
        }

        internal function frame16():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame17():*
        {
            this.xframe = "attack";
            if (((!(this.projectile == null)) && (!(this.projectile.isDead()))))
            {
                this.self.playVoiceSound(1);
                this.projectile.getStanceMC().gotoAndPlay("continue");
                this.projectile.endControl();
            };
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }


    }
}//package zelda_fla

