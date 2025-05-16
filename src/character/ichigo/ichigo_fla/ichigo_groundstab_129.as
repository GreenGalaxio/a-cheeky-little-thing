// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_groundstab_129

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.geom.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class ichigo_groundstab_129 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:String;

        public function ichigo_groundstab_129()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 13, this.frame14, 14, this.frame15, 18, this.frame19, 20, this.frame21, 23, this.frame24, 24, this.frame25, 36, this.frame37, 49, this.frame50);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame9():*
        {
            this.xframe = "charging";
        }

        internal function frame14():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame15():*
        {
            this.xframe = "attack";
            this.self.playAttackSound(3);
            this.self.setYSpeed(-20);
        }

        internal function frame19():*
        {
            this.self.setYSpeed(0);
        }

        internal function frame21():*
        {
            this.self.setYSpeed(25);
            this.self.playAttackSound(3);
        }

        internal function frame24():*
        {
            this.self.playAttackSound(1);
            this.self.playVoiceSound(1);
        }

        internal function frame25():*
        {
            this.self.playAttackSound(2);
            SSF2API.shakeCamera(5);
            this.self.updateAttackStats({"refreshRate":3});
            this.self.updateAttackBoxStats(1, {
                "damage":1,
                "hitStun":4,
                "selfHitStun":1,
                "power":40,
                "kbConstant":40,
                "direction":-7,
                "effectSound":"brawl_magic_s"
            });
            this.self.refreshAttackID();
        }

        internal function frame37():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":30,
                "kbConstant":190,
                "selfHitStun":1,
                "hitStun":3,
                "damage":3,
                "direction":42,
                "effectSound":"brawl_magic_m"
            });
            this.self.refreshAttackID();
        }

        internal function frame50():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

