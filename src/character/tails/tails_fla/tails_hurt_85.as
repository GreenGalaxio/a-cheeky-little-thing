// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tails_hurt_85

package tails_fla
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

    public dynamic class tails_hurt_85 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function tails_hurt_85()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 6, this.frame7, 10, this.frame11, 11, this.frame12, 12, this.frame13, 16, this.frame17, 17, this.frame18, 18, this.frame19, 23, this.frame24, 24, this.frame25, 25, this.frame26, 29, this.frame30, 30, this.frame31);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "hurt1";
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("jab", false);
                this.self.setGlobalVariable("jab2", false);
            };
        }

        internal function frame5():*
        {
            this.xframe = "done1";
            stop();
        }

        internal function frame6():*
        {
            gotoAndStop("done1");
        }

        internal function frame7():*
        {
            this.xframe = "hurt2";
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame11():*
        {
            this.xframe = "done2";
            stop();
        }

        internal function frame12():*
        {
            gotoAndStop("done2");
        }

        internal function frame13():*
        {
            this.xframe = "hurt3";
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame17():*
        {
            this.xframe = "done3";
            stop();
        }

        internal function frame18():*
        {
            gotoAndStop("done3");
        }

        internal function frame19():*
        {
            this.xframe = "hurt4";
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame24():*
        {
            this.xframe = "done4";
            stop();
        }

        internal function frame25():*
        {
            gotoAndStop("done4");
        }

        internal function frame26():*
        {
            this.xframe = "hurt4";
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame30():*
        {
            this.xframe = "done5";
            stop();
        }

        internal function frame31():*
        {
            gotoAndStop("done5");
        }


    }
}//package tails_fla

