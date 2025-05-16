// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_run_14

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

    public dynamic class falcon_run_14 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function falcon_run_14()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 6, this.frame7, 13, this.frame14, 14, this.frame15, 19, this.frame20, 21, this.frame22, 25, this.frame26);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                this.self.setGlobalVariable("jab", false);
                this.self.setGlobalVariable("jab2", false);
            };
        }

        internal function frame2():*
        {
            SSF2API.playSound("falcon_footstep");
        }

        internal function frame7():*
        {
            SSF2API.playSound("falcon_footstep");
        }

        internal function frame14():*
        {
            gotoAndPlay("run");
        }

        internal function frame15():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
            SSF2API.playSound("Run_start");
        }

        internal function frame20():*
        {
            gotoAndPlay("run");
        }

        internal function frame22():*
        {
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame26():*
        {
            gotoAndPlay("run");
        }


    }
}//package captainfalcon_fla

