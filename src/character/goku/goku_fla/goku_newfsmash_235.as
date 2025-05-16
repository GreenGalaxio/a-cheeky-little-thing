// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_newfsmash_235

package goku_fla
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

    public dynamic class goku_newfsmash_235 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var self:*;
        public var xframe:String;

        public function goku_newfsmash_235()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 9, this.frame10, 10, this.frame11, 11, this.frame12, 24, this.frame25);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame5():*
        {
            this.xframe = "charging";
        }

        internal function frame10():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame11():*
        {
            this.xframe = "attack";
        }

        internal function frame12():*
        {
            this.self.playAttackSound(1);
            this.self.playVoiceSound(1);
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

