// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailsdsmash_58

package tails_fla
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

    public dynamic class tailsdsmash_58 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:*;

        public function tailsdsmash_58()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 10, this.frame11, 11, this.frame12, 14, this.frame15, 15, this.frame16, 43, this.frame44);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
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

        internal function frame15():*
        {
            this.self.updateAttackBoxStats(1, {"direction":163});
            this.self.playAttackSound(2);
        }

        internal function frame16():*
        {
            this.self.updateAttackBoxStats(1, {"direction":17});
        }

        internal function frame44():*
        {
            this.self.endAttack();
        }


    }
}//package tails_fla

