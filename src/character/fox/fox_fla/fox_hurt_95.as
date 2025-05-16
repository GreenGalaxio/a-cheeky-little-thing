// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_hurt_95

package fox_fla
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

    public dynamic class fox_hurt_95 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function fox_hurt_95()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 7, this.frame8, 8, this.frame9, 14, this.frame15, 15, this.frame16, 16, this.frame17, 22, this.frame23, 23, this.frame24, 24, this.frame25, 30, this.frame31, 31, this.frame32, 32, this.frame33, 38, this.frame39, 39, this.frame40);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = "hurt1";
                this.self.setGlobalVariable("jab", false);
                this.self.setGlobalVariable("jab2", false);
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
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame15():*
        {
            this.xframe = "done2";
            stop();
        }

        internal function frame16():*
        {
            gotoAndStop("done2");
        }

        internal function frame17():*
        {
            this.xframe = "hurt3";
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame23():*
        {
            this.xframe = "done3";
            stop();
        }

        internal function frame24():*
        {
            gotoAndStop("done3");
        }

        internal function frame25():*
        {
            this.xframe = "hurt4";
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame31():*
        {
            this.xframe = "done4";
            stop();
        }

        internal function frame32():*
        {
            gotoAndStop("done4");
        }

        internal function frame33():*
        {
            this.xframe = "shock";
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame39():*
        {
            this.xframe = "done5";
            stop();
        }

        internal function frame40():*
        {
            gotoAndStop("done5");
        }


    }
}//package fox_fla

