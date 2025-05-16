// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_jump_15

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

    public dynamic class marth_jump_15 extends MovieClip 
    {

        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var xframe:*;
        public var self:*;
        public var done:*;

        public function marth_jump_15()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 22, this.frame23);
        }

        internal function frame1():*
        {
            this.xframe = "midair";
            this.self = SSF2API.getCharacter(this);
            this.done = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("sideBCheck", 0);
            };
        }

        internal function frame3():*
        {
        }

        internal function frame23():*
        {
            this.done = true;
        }


    }
}//package marth_fla

