// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_grab_55

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

    public dynamic class zamus_grab_55 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hitBox:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var grab:Number;
        public var pummeled:Boolean;

        public function zamus_grab_55()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 43, this.frame44, 44, this.frame45, 52, this.frame53, 53, this.frame54, 60, this.frame61);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setGlobalVariable("tether", false);
            };
            this.xframe = "grab";
            this.grab = 2;
            this.pummeled = false;
        }

        internal function frame6():*
        {
            SSF2API.playSound("zamus_grab");
        }

        internal function frame44():*
        {
            this.self.endAttack();
        }

        internal function frame45():*
        {
            this.xframe = "grab";
            if (this.pummeled)
            {
                gotoAndPlay("loop");
            };
        }

        internal function frame53():*
        {
            gotoAndPlay("loop");
        }

        internal function frame54():*
        {
            this.xframe = "attack";
            this.pummeled = true;
        }

        internal function frame61():*
        {
            gotoAndPlay("grabbed");
        }


    }
}//package zamus_fla

