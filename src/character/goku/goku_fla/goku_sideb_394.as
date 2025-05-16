// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_sideb_394

package goku_fla
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

    public dynamic class goku_sideb_394 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;
        public var projectile:*;

        public function goku_sideb_394()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 13, this.frame14, 19, this.frame20);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound(2);
                this.self.playAttackSound(2);
                this.projectile = null;
            };
        }

        internal function frame7():*
        {
            this.self.fireProjectile("goku_kiblast", 12, -33);
            this.self.playAttackSound(1);
        }

        internal function frame14():*
        {
            this.self.fireProjectile("goku_kiblast", 12, -28);
            this.self.playAttackSound(2);
            this.self.setAttackEnabled(false, "b_forward");
        }

        internal function frame20():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

