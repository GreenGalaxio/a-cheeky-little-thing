// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_fsmash_29

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

    public dynamic class falcon_fsmash_29 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:String;

        public function falcon_fsmash_29()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 34, this.frame35);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame7():*
        {
            this.xframe = "charging";
        }

        internal function frame12():*
        {
            gotoAndPlay("charging");
        }

        internal function frame13():*
        {
            this.xframe = "attack";
        }

        internal function frame14():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            this.self.setXSpeed(9, false);
            this.self.playVoiceSound(1);
        }

        internal function frame35():*
        {
            this.self.endAttack();
        }


    }
}//package captainfalcon_fla

