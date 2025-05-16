// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_usmash_31

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.events.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class chibi_usmash_31 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:*;

        public function chibi_usmash_31()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 11, this.frame12, 12, this.frame13, 15, this.frame16, 18, this.frame19, 31, this.frame32);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            if (((SSF2API.isReady()) && (this.self)))
            {
            };
        }

        internal function frame5():*
        {
            this.xframe = "charging";
        }

        internal function frame12():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame13():*
        {
            this.xframe = "attack";
            this.self.playAttackSound(2);
        }

        internal function frame16():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame19():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "direction":80,
                "damage":10,
                "power":60,
                "kbConstant":100
            });
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }


    }
}//package chibirobo_fla

