// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_dsmash_38

package jigglypuff_fla
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

    public dynamic class jiggly_dsmash_38 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var xframe:String;

        public function jiggly_dsmash_38()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 9, this.frame10, 10, this.frame11, 12, this.frame13, 34, this.frame35);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
            };
        }

        internal function frame3():*
        {
            this.xframe = "charging";
            if (this.self.getCurrentKirbyPower() != null)
            {
                gotoAndPlay("powercharging");
            };
        }

        internal function frame10():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame11():*
        {
            this.xframe = "attack";
        }

        internal function frame13():*
        {
            this.self.playAttackSound(1);
            this.self.playVoiceSound(1);
        }

        internal function frame35():*
        {
            this.self.endAttack();
        }


    }
}//package jigglypuff_fla

