// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_run_14

package marth_fla
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

    public dynamic class marth_run_14 extends MovieClip 
    {

        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function marth_run_14()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 10, this.frame11, 16, this.frame17, 17, this.frame18, 25, this.frame26, 30, this.frame31);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                this.self.setGlobalVariable("sideBCheck", 0);
            };
        }

        internal function frame3():*
        {
            SSF2API.playSound("footstep");
        }

        internal function frame11():*
        {
            SSF2API.playSound("footstep");
        }

        internal function frame17():*
        {
            gotoAndStop("run");
        }

        internal function frame18():*
        {
            SSF2API.playSound("dash_start");
        }

        internal function frame26():*
        {
            gotoAndPlay("run");
        }

        internal function frame31():*
        {
            gotoAndPlay("run");
        }


    }
}//package marth_fla

