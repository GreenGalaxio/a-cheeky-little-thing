// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmhurt_116

package blackmage_fla
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

    public dynamic class bmhurt_116 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function bmhurt_116()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 6, this.frame7, 7, this.frame8, 8, this.frame9, 10, this.frame11, 11, this.frame12);
        }

        internal function frame1():*
        {
            if (((parent) && (SSF2API.isReady())))
            {
            };
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.xframe = "hurt1";
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setGlobalVariable("jab", false);
                this.self.setGlobalVariable("Boost", 0);
            };
        }

        internal function frame3():*
        {
            stop();
        }

        internal function frame4():*
        {
            gotoAndStop("done1");
        }

        internal function frame5():*
        {
            this.xframe = "hurt2";
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("Boost", 0);
        }

        internal function frame7():*
        {
            stop();
        }

        internal function frame8():*
        {
            gotoAndStop("done2");
        }

        internal function frame9():*
        {
            this.xframe = "hurt3";
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("Boost", 0);
        }

        internal function frame11():*
        {
            stop();
        }

        internal function frame12():*
        {
            gotoAndStop("done3");
        }


    }
}//package blackmage_fla

