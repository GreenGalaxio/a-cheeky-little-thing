// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_grab_128

package captainfalcon_fla
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

    public dynamic class falcon_grab_128 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var grabBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var xframe:String;
        public var self:*;

        public function falcon_grab_128()
        {
            addFrameScript(0, this.frame1, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 21, this.frame22, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.xframe = "grab";
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame15():*
        {
            this.self.endAttack();
        }

        internal function frame16():*
        {
            this.xframe = "grab";
            stop();
        }

        internal function frame17():*
        {
            gotoAndStop("grabbed");
        }

        internal function frame18():*
        {
            this.xframe = "attack";
        }

        internal function frame22():*
        {
            this.self.updateAttackBoxStats(1, {"effect_id":"effect_lightHit"});
        }

        internal function frame28():*
        {
            this.gotoAndStop("grabbed");
        }


    }
}//package captainfalcon_fla

