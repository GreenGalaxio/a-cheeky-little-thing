// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_smashU_44

package fox_fla
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

    public dynamic class fox_smashU_44 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var xframe:String;
        public var chargeTime:*;
        public var damageCharged:Number;

        public function fox_smashU_44()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 6, this.frame7, 7, this.frame8, 10, this.frame11, 11, this.frame12, 20, this.frame21);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            this.xframe = "charging";
        }

        internal function frame7():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame8():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            this.chargeTime = (this.self.getExecTime() - 1);
            this.damageCharged = (((7 * this.chargeTime) / 40) + 16);
            this.self.updateAttackBoxStats(1, {"damage":this.damageCharged});
            this.self.updateAttackBoxStats(2, {"damage":(this.damageCharged - 1)});
        }

        internal function frame11():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":12,
                "effect_id":"effect_lightHit"
            });
            this.self.updateAttackBoxStats(2, {
                "damage":11,
                "effect_id":"effect_lightHit"
            });
        }

        internal function frame12():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":6,
                "camShake":-1,
                "power":50,
                "direction":50,
                "kbConstant":70,
                "effectSound":"brawl_kick_m",
                "effect_id":"effect_lightHit"
            });
            this.self.updateAttackBoxStats(2, {
                "damage":6,
                "camShake":-1,
                "power":50,
                "direction":50,
                "kbConstant":70,
                "effectSound":"brawl_kick_m",
                "effect_id":"effect_lightHit"
            });
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }


    }
}//package fox_fla

