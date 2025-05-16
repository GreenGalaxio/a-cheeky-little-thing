// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_doublejump_19

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.system.*;
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
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class ness_doublejump_19 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function ness_doublejump_19()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 4, this.frame5, 6, this.frame7, 13, this.frame14, 14, this.frame15, 16, this.frame17, 18, this.frame19, 20, this.frame21, 33, this.frame34);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = "midair";
                this.done = false;
                this.self.attachEffect("ness_spark3_jump");
                SSF2API.playSound("ness_jumpSound2");
            };
        }

        internal function frame3():*
        {
            this.self.attachEffect("ness_spark3 jump");
        }

        internal function frame5():*
        {
            this.self.attachEffect("ness_spark3 jump");
        }

        internal function frame7():*
        {
            this.self.attachEffect("ness_spark3 jump");
        }

        internal function frame14():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }

        internal function frame15():*
        {
            this.self.attachEffect("ness_spark3 jump");
        }

        internal function frame17():*
        {
            this.self.attachEffect("ness_spark3 jump");
        }

        internal function frame19():*
        {
            this.self.attachEffect("ness_spark3 jump");
        }

        internal function frame21():*
        {
            this.self.attachEffect("ness_spark3 jump");
        }

        internal function frame34():*
        {
            this.done = true;
            gotoAndPlay("redo2");
        }


    }
}//package ness_fla

