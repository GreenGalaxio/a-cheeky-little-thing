// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_dodgeroll_460

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

    public dynamic class goku_dodgeroll_460 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox10:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var hitBox8:MovieClip;
        public var hitBox9:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function goku_dodgeroll_460()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 9, this.frame10, 14, this.frame15);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame3():*
        {
            this.self.setIntangibility(true);
        }

        internal function frame10():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame15():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

