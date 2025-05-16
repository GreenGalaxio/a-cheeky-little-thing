// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_hurt_71

package lloyd_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class lloyd_hurt_71 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function lloyd_hurt_71()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 5, this.frame6, 8, this.frame9, 9, this.frame10, 10, this.frame11, 14, this.frame15, 15, this.frame16);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = "hurt1";
                this.self.setGlobalVariable("upSpecUsed", false);
                this.self.setGlobalVariable("nairUsed", false);
            };
        }

        internal function frame4():*
        {
            this.xframe = "done1";
            stop();
        }

        internal function frame5():*
        {
            gotoAndStop("done1");
        }

        internal function frame6():*
        {
            this.xframe = "hurt2";
            this.self.setGlobalVariable("upSpecUsed", false);
            this.self.setGlobalVariable("nairUsed", false);
        }

        internal function frame9():*
        {
            this.xframe = "done2";
            stop();
        }

        internal function frame10():*
        {
            gotoAndStop("done2");
        }

        internal function frame11():*
        {
            this.xframe = "shock";
            this.self.setGlobalVariable("upSpecUsed", false);
            this.self.setGlobalVariable("nairUsed", false);
        }

        internal function frame15():*
        {
            this.xframe = "shock";
            stop();
        }

        internal function frame16():*
        {
            gotoAndStop("shockdone");
        }


    }
}//package lloyd_fla

