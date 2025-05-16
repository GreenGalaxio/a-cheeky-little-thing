// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_smash_forward_24

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

    public dynamic class zamus_smash_forward_24 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var xframe:String;

        public function zamus_smash_forward_24()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 7, this.frame8, 8, this.frame9, 13, this.frame14, 14, this.frame15, 15, this.frame16, 30, this.frame31);
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

        internal function frame3():*
        {
            this.xframe = "charging";
        }

        internal function frame8():*
        {
            gotoAndPlay("charging");
        }

        internal function frame9():*
        {
            this.xframe = "attack";
        }

        internal function frame14():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            this.self.updateAttackBoxStats(2, {
                "damage":6,
                "direction":80,
                "power":40,
                "kbConstant":100,
                "effectSound":"brawl_zap_m"
            });
        }

        internal function frame16():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":6,
                "direction":80,
                "power":40,
                "kbConstant":100,
                "effectSound":"brawl_zap_m"
            });
        }

        internal function frame31():*
        {
            this.self.endAttack();
        }


    }
}//package zamus_fla

