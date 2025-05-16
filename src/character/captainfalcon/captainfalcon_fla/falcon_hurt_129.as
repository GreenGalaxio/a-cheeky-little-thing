// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_hurt_129

package captainfalcon_fla
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

    public dynamic class falcon_hurt_129 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var xframe:String;
        public var self:*;

        public function falcon_hurt_129()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15);
        }

        internal function frame1():*
        {
            this.xframe = "hurt1";
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                this.self.setGlobalVariable("jab", false);
                this.self.setGlobalVariable("jab2", false);
            };
        }

        internal function frame2():*
        {
            this.xframe = "done1";
            stop();
        }

        internal function frame3():*
        {
            gotoAndStop("done1");
        }

        internal function frame4():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame5():*
        {
            this.xframe = "done2";
            stop();
        }

        internal function frame6():*
        {
            gotoAndStop("done2");
        }

        internal function frame7():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame8():*
        {
            this.xframe = "done3";
            stop();
        }

        internal function frame9():*
        {
            gotoAndStop("done3");
        }

        internal function frame10():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame11():*
        {
            this.xframe = "done4";
            stop();
        }

        internal function frame12():*
        {
            gotoAndStop("done4");
        }

        internal function frame13():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame14():*
        {
            this.xframe = "done5";
            stop();
        }

        internal function frame15():*
        {
            gotoAndStop("done4");
        }


    }
}//package captainfalcon_fla

