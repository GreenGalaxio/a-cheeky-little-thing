// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_crouch_61

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.events.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class chibi_crouch_61 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function chibi_crouch_61()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 6, this.frame7, 7, this.frame8);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setGlobalVariable("tether", false);
            };
            this.xframe = null;
        }

        internal function frame3():*
        {
            SSF2API.playSound("chibi_Bend");
        }

        internal function frame7():*
        {
            this.xframe = "loop";
            stop();
        }

        internal function frame8():*
        {
            this.gotoAndPlay("loop");
        }


    }
}//package chibirobo_fla

