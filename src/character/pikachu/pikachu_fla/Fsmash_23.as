// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.Fsmash_23

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

    public dynamic class Fsmash_23 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var xframe:String;

        public function Fsmash_23()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 10, this.frame11, 11, this.frame12, 14, this.frame15, 16, this.frame17, 31, this.frame32);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.self.playVoiceSound(1);
            };
        }

        internal function frame5():*
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
        }

        internal function frame15():*
        {
            this.self.playVoiceSound(2);
        }

        internal function frame17():*
        {
            this.self.playAttackSound(1);
            this.self.playAttackSound(2);
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }


    }
}//package pikachu_fla

