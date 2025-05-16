// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_jump_16

package zamus_fla
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

    public dynamic class zamus_jump_16 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var done:Boolean;
        public var self:*;

        public function zamus_jump_16()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 15, this.frame16, 16, this.frame17);
        }

        internal function frame1():*
        {
            this.done = false;
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("tether", false);
                this.self.setGlobalVariable("nStoredLabel", null);
            };
        }

        internal function frame2():*
        {
            this.done = false;
        }

        internal function frame16():*
        {
            this.done = true;
            stop();
        }

        internal function frame17():*
        {
            this.gotoAndStop("done");
        }


    }
}//package zamus_fla

