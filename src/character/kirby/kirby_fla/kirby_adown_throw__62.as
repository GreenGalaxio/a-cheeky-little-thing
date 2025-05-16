// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_adown_throw__62

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class kirby_adown_throw__62 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var playsound:Number;
        public var audio:Number;

        public function kirby_adown_throw__62()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 6, this.frame7, 8, this.frame9, 10, this.frame11, 12, this.frame13, 14, this.frame15, 16, this.frame17, 18, this.frame19, 20, this.frame21, 22, this.frame23, 24, this.frame25, 26, this.frame27, 28, this.frame29, 30, this.frame31, 32, this.frame33, 37, this.frame38, 39, this.frame40, 44, this.frame45);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame5():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame7():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame11():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame17():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame19():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame21():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame25():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame27():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame29():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame31():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame33():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":75,
                "power":40,
                "hitStun":5,
                "selfHitStun":5,
                "hasEffect":true
            });
            this.self.refreshAttackID();
        }

        internal function frame38():*
        {
            if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
            {
                this.self.playVoiceSound(1);
                this.self.setGlobalVariable("audio", 1);
            };
            if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
            {
                this.self.playVoiceSound(2);
                this.self.setGlobalVariable("audio", 2);
            };
            if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
            {
                this.self.playVoiceSound(3);
                this.self.setGlobalVariable("audio", 3);
            };
            if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
            {
                this.self.playVoiceSound(4);
                this.self.setGlobalVariable("audio", 4);
            };
        }

        internal function frame40():*
        {
            this.self.playAttackSound(2);
            this.self.shakeCamera(10);
        }

        internal function frame45():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

