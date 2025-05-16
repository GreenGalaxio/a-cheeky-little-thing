// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkusmash_34

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

    public dynamic class dkusmash_34 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:String;

        public function dkusmash_34()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 25, this.frame26);
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

        internal function frame6():*
        {
            this.xframe = "charging";
        }

        internal function frame11():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame12():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame14():*
        {
            this.self.updateAttackBoxStats(1, {"selfHitStun":3});
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }


    }
}//package donkeykong_fla

