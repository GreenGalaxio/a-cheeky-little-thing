// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_grab_58

package yoshi_fla
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

    public dynamic class Yoshi_grab_58 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function Yoshi_grab_58()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 34, this.frame35, 38, this.frame39, 42, this.frame43, 43, this.frame44, 44, this.frame45, 51, this.frame52);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = "grab";
            };
        }

        internal function frame8():*
        {
            SSF2API.playSound("Yoshi_nspecial_sfx");
        }

        internal function frame35():*
        {
            this.self.endAttack();
        }

        internal function frame39():*
        {
            this.self.getGrabbedOpponent().getMC().visible = false;
        }

        internal function frame43():*
        {
            this.xframe = "grab";
            stop();
        }

        internal function frame44():*
        {
            gotoAndPlay("stop");
        }

        internal function frame45():*
        {
            this.xframe = "attack";
        }

        internal function frame52():*
        {
            this.gotoAndPlay("stop");
        }


    }
}//package yoshi_fla

