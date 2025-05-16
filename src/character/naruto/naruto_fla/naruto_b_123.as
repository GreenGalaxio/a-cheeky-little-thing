// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_b_123

package naruto_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class naruto_b_123 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;
        public var oodama:Boolean;
        public var hasHit:Boolean;
        public var xframe:String;
        public var sfxStop:Number;
        public var sfxStop2:Number;
        public var naruto_language:*;

        public function naruto_b_123()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 3, this.frame4, 7, this.frame8, 13, this.frame14, 14, this.frame15, 22, this.frame23, 29, this.frame30, 30, this.frame31, 33, this.frame34, 39, this.frame40, 61, this.frame62, 62, this.frame63, 70, this.frame71, 85, this.frame86, 86, this.frame87, 88, this.frame89, 91, this.frame92, 102, this.frame103, 104, this.frame105);
        }

        public function afterHit(_arg_1:Event=null):void
        {
            this.gotoAndPlay("afterHit");
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.afterHit);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.oodama = false;
                this.hasHit = false;
                this.xframe = null;
                this.naruto_language = this.self.getGlobalVariable("language_Select");
                this.self.attachEffectOverlay("naruto_nSpec_Charge");
                this.self.attachEffect("naruto_summonClone");
                this.self.attachEffect("naruto_rasenChargeParticle");
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.afterHit);
            };
        }

        internal function frame2():*
        {
            this.sfxStop2 = this.self.playAttackSound(3);
            if (this.naruto_language == "ENG")
            {
                this.sfxStop = this.self.playVoiceSound(3);
            }
            else
            {
                this.sfxStop = this.self.playVoiceSound(1);
            };
        }

        internal function frame4():*
        {
            SSF2API.playSound("naruto_bunshin");
        }

        internal function frame8():*
        {
            this.self.attachEffect("naruto_rasenChargeParticle");
        }

        internal function frame14():*
        {
            this.self.updateAttackStats({"cancelSoundOnEnd":true});
        }

        internal function frame15():*
        {
            this.xframe = "charging";
            this.self.attachEffect("naruto_rasenChargeParticle");
        }

        internal function frame23():*
        {
            this.self.attachEffect("naruto_rasenChargeParticle");
        }

        internal function frame30():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame31():*
        {
            this.xframe = "attack";
            SSF2API.stopSound(this.sfxStop);
            SSF2API.stopSound(this.sfxStop2);
            this.self.updateAttackStats({
                "cancelSoundOnEnd":false,
                "cancelVoiceOnEnd":false
            });
            if (this.naruto_language == "ENG")
            {
                this.self.playVoiceSound(4);
            }
            else
            {
                this.self.playVoiceSound(2);
            };
            this.self.attachEffect("naruto_rasenChargeParticle");
        }

        internal function frame34():*
        {
            SSF2API.playSound("rasengan_sfx1");
        }

        internal function frame40():*
        {
            this.self.attachEffect("naruto_rasenUseParticle");
        }

        internal function frame62():*
        {
            this.self.endAttack();
        }

        internal function frame63():*
        {
            this.xframe = "attack";
            this.hasHit = true;
            if (this.oodama)
            {
                SSF2API.playSound("naruto_bunshin");
                gotoAndPlay("rasenshuriken");
            }
            else
            {
                this.self.fireProjectile("naruto_rasengan");
            };
            this.self.attachEffect("naruto_rasenUseParticle");
        }

        internal function frame71():*
        {
            this.self.attachEffect("naruto_rasenUseParticle");
        }

        internal function frame86():*
        {
            this.self.endAttack();
        }

        internal function frame87():*
        {
            this.xframe = "attack2";
            this.oodama = true;
            this.self.updateAttackBoxStats(1, {"hitStun":15});
            this.self.updateAttackStats({
                "air_ease":2,
                "cancelSoundOnEnd":false,
                "cancelVoiceOnEnd":false
            });
            if (this.hasHit)
            {
                SSF2API.playSound("rasengan_sfx1");
            };
            SSF2API.stopSound(this.sfxStop);
            SSF2API.stopSound(this.sfxStop2);
            if (this.naruto_language == "ENG")
            {
                this.self.playVoiceSound(6);
            }
            else
            {
                this.self.playVoiceSound(5);
            };
        }

        internal function frame89():*
        {
            this.self.attachEffect("naruto_rasenEffect2");
        }

        internal function frame92():*
        {
        }

        internal function frame103():*
        {
            SSF2API.playSound("naruto_sfx_rasenshuriken");
            this.self.fireProjectile("rasenshuriken");
        }

        internal function frame105():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

