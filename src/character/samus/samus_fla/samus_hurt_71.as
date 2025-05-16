// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_hurt_71

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

    public dynamic class samus_hurt_71 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:String;

        public function samus_hurt_71()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 7, this.frame8, 8, this.frame9, 11, this.frame12, 12, this.frame13, 13, this.frame14, 19, this.frame20, 20, this.frame21, 21, this.frame22, 24, this.frame25, 25, this.frame26);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.xframe = "hurt1";
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setGlobalVariable("tether", false);
            };
        }

        internal function frame7():*
        {
            this.xframe = "done1";
            stop();
        }

        internal function frame8():*
        {
            gotoAndStop("done1");
        }

        internal function frame9():*
        {
            this.xframe = "hurt2";
            this.self.setGlobalVariable("tether", false);
        }

        internal function frame12():*
        {
            this.xframe = "done2";
            stop();
        }

        internal function frame13():*
        {
            gotoAndStop("done2");
        }

        internal function frame14():*
        {
            this.xframe = "hurt3";
            this.self.setGlobalVariable("tether", false);
        }

        internal function frame20():*
        {
            this.xframe = "done3";
            stop();
        }

        internal function frame21():*
        {
            gotoAndStop("done3");
        }

        internal function frame22():*
        {
            this.xframe = "hurt4";
            this.self.setGlobalVariable("tether", false);
        }

        internal function frame25():*
        {
            this.xframe = "done4";
            stop();
        }

        internal function frame26():*
        {
            gotoAndStop("done4");
        }


    }
}//package samus_fla

