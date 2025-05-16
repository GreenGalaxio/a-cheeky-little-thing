// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.Sonic_upsmash_new_141

package sonic_fla
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

    public dynamic class Sonic_upsmash_new_141 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;
        public var xframe:String;

        public function Sonic_upsmash_new_141()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 7, this.frame8, 8, this.frame9, 12, this.frame13, 18, this.frame19, 26, this.frame27);
        }

        public function refreshAttack():*
        {
            this.self.refreshAttackID();
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame3():*
        {
            this.xframe = "charging";
        }

        internal function frame8():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame9():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            this.self.setIntangibility(true);
        }

        internal function frame13():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":80,
                "power":25,
                "damage":1
            });
            this.self.setIntangibility(false);
            SSF2API.createTimer(this.self, 3, -1, this.refreshAttack, {"hitStunPause":false});
        }

        internal function frame19():*
        {
            this.self.updateAttackBoxStats(1, {
                "sdiDistance":1,
                "direction":90,
                "power":65,
                "kbConstant":135,
                "damage":5,
                "effectSound":"brawl_kick_l"
            });
            this.self.refreshAttackID();
            SSF2API.destroyTimer(this.self, this.refreshAttack);
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }


    }
}//package sonic_fla

