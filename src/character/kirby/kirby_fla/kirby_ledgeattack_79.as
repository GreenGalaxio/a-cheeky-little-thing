// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_ledgeattack_79

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

    public dynamic class kirby_ledgeattack_79 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var damage:Number;
        public var playsound:Number;
        public var audio:Number;

        public function kirby_ledgeattack_79()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 6, this.frame7, 9, this.frame10, 14, this.frame15, 26, this.frame27, 33, this.frame34, 35, this.frame36, 36, this.frame37, 47, this.frame48);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.damage = 0;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.damage = this.self.getDamage();
                if (this.damage >= 100)
                {
                    gotoAndPlay("heavy");
                };
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame5():*
        {
            this.self.setYSpeed(-7);
        }

        internal function frame7():*
        {
            this.self.setXSpeed(8, false);
            this.self.setYSpeed(-3);
        }

        internal function frame10():*
        {
            this.self.setXSpeed(4, false);
            this.self.setYSpeed(5);
        }

        internal function frame15():*
        {
            this.self.playAttackSound(1);
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

        internal function frame27():*
        {
            this.self.endAttack();
        }

        internal function frame34():*
        {
            this.self.setXSpeed(5, false);
            this.self.setYSpeed(-2);
        }

        internal function frame36():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":10,
                "effectSound":"brawl_kick_l"
            });
        }

        internal function frame37():*
        {
            this.self.playAttackSound(1);
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

        internal function frame48():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

