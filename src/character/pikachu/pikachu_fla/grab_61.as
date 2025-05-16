// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.grab_61

package pikachu_fla
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

    public dynamic class grab_61 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hitBox:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function grab_61()
        {
            addFrameScript(0, this.frame1, 15, this.frame16, 16, this.frame17, 57, this.frame58, 58, this.frame59, 71, this.frame72);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "grab";
        }

        internal function frame16():*
        {
            this.self.endAttack();
        }

        internal function frame17():*
        {
            this.xframe = "grab";
        }

        internal function frame58():*
        {
            gotoAndPlay("grabbed");
        }

        internal function frame59():*
        {
            this.xframe = "attack";
            this.self.updateAttackStats({"refreshRate":210});
        }

        internal function frame72():*
        {
            gotoAndPlay("grabbed");
        }


    }
}//package pikachu_fla

