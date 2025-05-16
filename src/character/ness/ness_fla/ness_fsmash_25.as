// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_fsmash_25

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.system.*;
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
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class ness_fsmash_25 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var reverseBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var smaaaash:Number;

        public function ness_fsmash_25()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 14, this.frame15, 24, this.frame25, 25, this.frame26, 28, this.frame29, 30, this.frame31, 40, this.frame41, 41, this.frame42, 44, this.frame45, 46, this.frame47, 56, this.frame57);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.smaaaash = SSF2API.random();
            };
        }

        internal function frame5():*
        {
            this.xframe = "charging";
        }

        internal function frame10():*
        {
            this.gotoAndPlay("charging");
            this.self.updateAttackBoxStats(1, {"hitStun":1});
        }

        internal function frame11():*
        {
            if (this.smaaaash > 0.875)
            {
                this.gotoAndPlay("smaash");
            };
        }

        internal function frame12():*
        {
            this.self.updateAttackBoxStats(1, {"selfHitStun":1});
        }

        internal function frame13():*
        {
            this.self.updateAttackBoxStats(1, {
                "hitStun":3,
                "selfHitStun":3
            });
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            this.self.updateAttackBoxStats(1, {
                "hitStun":1,
                "selfHitStun":1
            });
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }

        internal function frame26():*
        {
            this.self.attachEffectOverlay("SmashGFX", {"flip":false});
            this.self.updateAttackBoxStats(1, {
                "ignoreChargeDamage":true,
                "selfHitStun":5,
                "hitStun":5,
                "power":40,
                "direction":30,
                "damage":20,
                "effectSound":"smaash_hit",
                "effect_id":"smaasheffect"
            });
            SSF2API.playSound("ness_grunt4");
        }

        internal function frame29():*
        {
            this.self.updateAttackBoxStats(1, {
                "hitStun":3,
                "selfHitStun":3
            });
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame31():*
        {
            this.self.updateAttackBoxStats(1, {
                "hitStun":1,
                "selfHitStun":1
            });
        }

        internal function frame41():*
        {
            this.self.endAttack();
        }

        internal function frame42():*
        {
            this.self.attachEffectOverlay("SmashGFX", {"flip":false});
            this.self.updateAttackBoxStats(1, {
                "ignoreChargeDamage":true,
                "selfHitStun":5,
                "hitStun":5,
                "power":40,
                "direction":30,
                "damage":20,
                "effectSound":"smaash_hit",
                "effect_id":"smaasheffect"
            });
            SSF2API.playSound("ness_grunt4");
        }

        internal function frame45():*
        {
            this.self.updateAttackBoxStats(1, {
                "hitStun":3,
                "selfHitStun":3
            });
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            this.self.playAttackSound(2);
        }

        internal function frame47():*
        {
            this.self.updateAttackBoxStats(1, {
                "hitStun":1,
                "selfHitStun":1
            });
        }

        internal function frame57():*
        {
            this.self.endAttack();
        }


    }
}//package ness_fla

