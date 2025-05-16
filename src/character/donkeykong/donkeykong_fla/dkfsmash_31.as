// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkfsmash_31

package donkeykong_fla
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

    public dynamic class dkfsmash_31 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:String;

        public function dkfsmash_31()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 26, this.frame27);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                this.xframe = null;
            };
        }

        internal function frame7():*
        {
            this.xframe = "charging";
        }

        internal function frame12():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame13():*
        {
            this.xframe = "attack";
        }

        internal function frame14():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame16():*
        {
            SSF2API.shakeCamera(9);
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }


    }
}//package donkeykong_fla

