// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_grab_special_103

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

    public dynamic class mario_grab_special_103 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var touchBox:MovieClip;
        public var hitBox:MovieClip;
        public var grabBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function mario_grab_special_103()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 20, this.frame21);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = "grab";
            };
        }

        internal function frame10():*
        {
            this.self.endAttack();
        }

        internal function frame11():*
        {
            this.xframe = "grab";
            stop();
        }

        internal function frame12():*
        {
            gotoAndStop("grabbed");
        }

        internal function frame13():*
        {
            this.xframe = "attack";
        }

        internal function frame21():*
        {
            this.gotoAndStop("grabbed");
        }


    }
}//package mario_fla

