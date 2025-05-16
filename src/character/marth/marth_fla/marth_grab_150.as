// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_grab_150

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

    public dynamic class marth_grab_150 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox2:MovieClip;
        public var touchBox:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var grabBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function marth_grab_150()
        {
            addFrameScript(0, this.frame1, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 28, this.frame29);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "grab";
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("sideBCheck", 0);
            };
        }

        internal function frame16():*
        {
            this.self.endAttack();
        }

        internal function frame17():*
        {
            this.xframe = "grab";
            stop();
        }

        internal function frame18():*
        {
            gotoAndStop("grabbed");
        }

        internal function frame19():*
        {
            this.xframe = "attack";
        }

        internal function frame29():*
        {
            gotoAndStop("grabbed");
        }


    }
}//package marth_fla

