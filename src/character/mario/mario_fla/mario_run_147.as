// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_run_147

package mario_fla
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

    public dynamic class mario_run_147 extends MovieClip 
    {

        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function mario_run_147()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 12, this.frame13, 15, this.frame16, 16, this.frame17, 21, this.frame22, 22, this.frame23, 26, this.frame27);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (SSF2API.isReady())
            {
                this.self.setGlobalVariable("canStartRise", true);
                this.self.setGlobalVariable("jab", false);
                this.self.setGlobalVariable("jab2", false);
            };
        }

        internal function frame5():*
        {
            SSF2API.playSound("mario_footstep");
        }

        internal function frame13():*
        {
            SSF2API.playSound("mario_footstep");
        }

        internal function frame16():*
        {
            gotoAndPlay("run");
        }

        internal function frame17():*
        {
            this.self.setGlobalVariable("canStartRise", true);
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
            SSF2API.playSound("Run_start");
        }

        internal function frame22():*
        {
            gotoAndPlay("run");
        }

        internal function frame23():*
        {
            this.self.setGlobalVariable("canStartRise", true);
            this.self.setGlobalVariable("jab", false);
            this.self.setGlobalVariable("jab2", false);
        }

        internal function frame27():*
        {
            gotoAndPlay("run");
        }


    }
}//package mario_fla

