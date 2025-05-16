// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_hang_81

package link_fla
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

    public dynamic class link_new_hang_81 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var tether:Boolean;

        public function link_new_hang_81()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 14, this.frame15, 15, this.frame16, 25, this.frame26);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("nStoredLabel", null);
                this.self.setGlobalVariable("sStoredLabel", null);
                this.tether = this.self.getGlobalVariable("tether");
                if (this.tether)
                {
                    gotoAndPlay("tetherGrab");
                };
            };
        }

        internal function frame2():*
        {
            this.self.setGlobalVariable("tether", false);
        }

        internal function frame15():*
        {
            gotoAndPlay("loop");
        }

        internal function frame16():*
        {
            this.self.setGlobalVariable("tether", false);
        }

        internal function frame26():*
        {
            gotoAndPlay(1);
        }


    }
}//package link_fla

