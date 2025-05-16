// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.Peach_Getup_120

package peach_fla
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

    public dynamic class Peach_Getup_120 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;
        public var ready:*;

        public function Peach_Getup_120()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 15, this.frame16, 19, this.frame20);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.ready = false;
            };
        }

        internal function frame3():*
        {
            stop();
            this.ready = true;
        }

        internal function frame4():*
        {
            gotoAndStop("dead");
        }

        internal function frame5():*
        {
            if (!this.self.isForcedCrash())
            {
                this.self.setIntangibility(true);
            };
        }

        internal function frame16():*
        {
            if (!this.self.isForcedCrash())
            {
                this.self.setIntangibility(false);
            };
        }

        internal function frame20():*
        {
            this.self.endAttack();
        }


    }
}//package peach_fla

