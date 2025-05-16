// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_taunts_you_96

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

    public dynamic class ness_taunts_you_96 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;

        public function ness_taunts_you_96()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 9, this.frame10, 12, this.frame13, 14, this.frame15, 17, this.frame18, 25, this.frame26, 35, this.frame36, 50, this.frame51, 52, this.frame53, 67, this.frame68, 77, this.frame78, 101, this.frame102);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame5():*
        {
            SSF2API.playSound("ness_throw");
        }

        internal function frame10():*
        {
            SSF2API.playSound("ness_psi1");
        }

        internal function frame13():*
        {
            SSF2API.playSound("ness_psi2");
        }

        internal function frame15():*
        {
            SSF2API.playSound("ness_psi3");
        }

        internal function frame18():*
        {
            SSF2API.playSound("ness_psi3");
        }

        internal function frame26():*
        {
            SSF2API.playSound("ness_psi2");
        }

        internal function frame36():*
        {
            SSF2API.playSound("ness_psi1");
        }

        internal function frame51():*
        {
            this.self.endAttack();
        }

        internal function frame53():*
        {
            SSF2API.playSound("ness_okay");
        }

        internal function frame68():*
        {
            this.self.endAttack();
        }

        internal function frame78():*
        {
            SSF2API.playSound("ness_grunt4");
        }

        internal function frame102():*
        {
            this.self.endAttack();
        }


    }
}//package ness_fla

