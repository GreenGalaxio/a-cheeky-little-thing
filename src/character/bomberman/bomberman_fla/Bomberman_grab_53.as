// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_grab_53

package bomberman_fla
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

    public dynamic class Bomberman_grab_53 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var xframe:String;
        public var self:*;

        public function Bomberman_grab_53()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 19, this.frame20);
        }

        internal function frame1():*
        {
            this.xframe = "grab";
            this.self = SSF2API.getCharacter(this);
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

        internal function frame20():*
        {
            this.gotoAndStop("grabbed");
        }


    }
}//package bomberman_fla

