// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_smash_down_31

package zamus_fla
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

    public dynamic class zamus_smash_down_31 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var xframe:String;

        public function zamus_smash_down_31()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 9, this.frame10, 10, this.frame11, 12, this.frame13, 24, this.frame25, 30, this.frame31);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setGlobalVariable("tether", false);
                this.self.playVoiceSound(1);
            };
        }

        internal function frame5():*
        {
            this.xframe = "charging";
        }

        internal function frame10():*
        {
            gotoAndPlay("charging");
        }

        internal function frame11():*
        {
            this.xframe = "attack";
        }

        internal function frame13():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame25():*
        {
            this.self.updateAttackStats({"allowFullInterrupt":true});
        }

        internal function frame31():*
        {
            this.self.endAttack();
        }


    }
}//package zamus_fla

